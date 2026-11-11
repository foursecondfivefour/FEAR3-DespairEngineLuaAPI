# FEAR3-DespairEngineLuaAPI
I managed to extract and decompile luasense.lua, which turns out to be the complete Lua 5.1 API skeleton and documentation for Day 1 Studios' Despair Engine.
Even though the function bodies are empty stubs (since the actual C++ runtime executes them), the bytecode still contains all the original developer comments, parameter names, and internal tool names.
Here are some of the coolest things inside:
• Internal Dev Tool Names: The bytecode reveals the names of the proprietary editors used to build the game, including Forge (the main object/template editor), Bling (particle/VFX editor), Burmester (curve editor), ChopShop (cutscene/audio/subtitle tool), Facade (material/flow editor), and FontMaker.
• Cut/Unused Mechanics & Systems: There are full API namespaces for Possession (timers, delays, vision modes), Tethering (co-op leash mechanics, breadcrumbs, safe radius overrides), Generative Scares (an ambient tension system that tracks player stress and even has a probability slider for "fake" scares), and Contractions (the game mode's dynamic fog and wave settings).
• Debug & Telemetry: It includes hooks for an internal DataMiner telemetry system, Perforce source control integration directly inside the editors, and debug commands like GameDebugDump.
• Fun Dev Notes: Some of the original developer comments are still intact, like a note on SetCrouch saying "Unused. Somebody please delete me." or SaveAs noting "yes this is exactly the same as SaveAs... (but shouldn't be)".
If anyone is into reverse-engineering, modding, or just preserving game dev history from the 360/PS3 era, this is a goldmine of how the Despair Engine was structured under the hood.
