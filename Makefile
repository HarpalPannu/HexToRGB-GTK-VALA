all:
	valac --pkg gtk+-3.0 HexToRGB.vala -o HexToRGB
clean:
	rm HexToRGB
