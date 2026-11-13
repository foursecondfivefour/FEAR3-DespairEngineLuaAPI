"""Lossless Lua 5.1 chunk reader/writer for size_t portability (no execution)."""
import struct


class Chunk:
    def __init__(self, data):
        self.data = data
        self.pos = 12
        self.header = data[:12]
        if len(data) < 12 or data[:6] != b'\x1bLua\x51\x00':
            raise ValueError('Expected a standard Lua 5.1 chunk')
        _, _, endian, self.int_size, self.size_t, self.ins_size, self.num_size, self.integral = data[4:12]
        if endian not in (0, 1) or self.int_size != 4 or self.ins_size != 4:
            raise ValueError('Unsupported Lua chunk layout')
        self.order = 'little' if endian else 'big'
        self.root = self.proto()
        if self.pos != len(data):
            raise ValueError(f'Trailing data at {self.pos}/{len(data)}')

    def take(self, count):
        if count < 0 or self.pos + count > len(self.data):
            raise ValueError('Truncated or invalid chunk')
        value = self.data[self.pos:self.pos + count]
        self.pos += count
        return value

    def uint(self, width=4):
        return int.from_bytes(self.take(width), self.order)

    def string(self):
        size = self.uint(self.size_t)
        value = self.take(size)
        if size and value[-1] != 0:
            raise ValueError('Invalid Lua string terminator')
        return value

    def proto(self):
        p = {'source': self.string(), 'lines': self.take(8), 'flags': self.take(4)}
        p['code'] = self.take(self.uint() * self.ins_size)
        p['constants'] = []
        for _ in range(self.uint()):
            tag = self.uint(1)
            if tag == 0:
                value = b''
            elif tag == 1:
                value = self.take(1)
            elif tag == 3:
                value = self.take(self.num_size)
            elif tag == 4:
                value = self.string()
            else:
                raise ValueError(f'Unknown constant type {tag}')
            p['constants'].append((tag, value))
        p['children'] = [self.proto() for _ in range(self.uint())]
        p['lineinfo'] = self.take(self.uint() * self.int_size)
        p['locals'] = [(self.string(), self.take(8)) for _ in range(self.uint())]
        p['upvalues'] = [self.string() for _ in range(self.uint())]
        return p

    def encode(self, size_t=None):
        size_t = self.size_t if size_t is None else size_t
        header = bytearray(self.header)
        header[8] = size_t
        out = bytearray(header)
        def uint(value, width=4):
            out.extend(value.to_bytes(width, self.order))
        def string(value):
            uint(len(value), size_t)
            out.extend(value)
        def proto(p):
            string(p['source'])
            out.extend(p['lines'])
            out.extend(p['flags'])
            uint(len(p['code']) // self.ins_size)
            out.extend(p['code'])
            uint(len(p['constants']))
            for tag, value in p['constants']:
                uint(tag, 1)
                if tag == 4:
                    string(value)
                else:
                    out.extend(value)
            uint(len(p['children']))
            for child in p['children']:
                proto(child)
            uint(len(p['lineinfo']) // self.int_size)
            out.extend(p['lineinfo'])
            uint(len(p['locals']))
            for name, scope in p['locals']:
                string(name)
                out.extend(scope)
            uint(len(p['upvalues']))
            for name in p['upvalues']:
                string(name)
        proto(self.root)
        return bytes(out)

    def statistics(self):
        counts = {'prototypes': 0, 'instructions': 0, 'locals': 0, 'upvalue_names': 0}
        def visit(p):
            counts['prototypes'] += 1
            counts['instructions'] += len(p['code']) // self.ins_size
            counts['locals'] += len(p['locals'])
            counts['upvalue_names'] += len(p['upvalues'])
            for child in p['children']:
                visit(child)
        visit(self.root)
        return counts
