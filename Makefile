# Given 'track.lua', prepend a header to create 'track.p8'.
track.p8: track.lua
	@echo 'pico-8 cartridge // http://www.pico-8.com' > track.p8
	@echo 'version 16' >> track.p8
	@echo '__lua__' >> track.p8
	@cat track.lua >> track.p8

# Transpile 'track.ts' to create 'track.lua'.
# track.lua: track.ts
# 	@./node_modules/.bin/tstl -p tsconfig.json

# Remove generated files.
# clean:
# 	@rm track.p8
# 	@rm track.lua

# TODO: add lua block, tstl doesn't support
# TODO: minify with picotool?
# TODO: luacheck
