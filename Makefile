all: image coords draw

image: makeNew.sh
	./makeNew.sh

coords: Coordgen.go 
	echo -n "obtaining coordinates... "
	go run CoordGen.go 
