all: image coords draw

image: makeNew.sh
	@./makeNew.sh

coords: CoordGen.go
	@go run CoordGen.go $(shell find * -maxdepth 1 -name '*.edges.png' | sort -t_ -nk2,2 | tail -n1)

draw:
	@#TODO: implement, complain about it for the moment.
	@echo "sorry, drawing is currently not implemented. Hope you got some pretty pictures!"

clean-images:
	@-rm *.png

clean-coords:
	@-rm *.txt

clean-all: clean-images clean-coords
