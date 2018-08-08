# Given 'track.lua', prepend a header to create 'track_test.p8'.
track_test.p8: track.lua
	@echo 'pico-8 cartridge // http://www.pico-8.com' > track_test.p8
	@echo 'version 16' >> track_test.p8
	@echo '__lua__' >> track_test.p8
	@cat track.lua >> track_test.p8

# Remove generated files.
clean:
	@rm track_test.p8
