all: image coords draw

image: makeNew.sh
	./makeNew.sh

coords: CoordGen.go 
	#not working yet, need some way of finding out what file was just made.
	echo -n "obtaining coordinates... "
	go run CoordGen.go 

draw:
	#TODO: implement, complain about it for the moment.
	echo "sorry, drawing is currently not implemented. Hope you got some pretty pictures!"

clean-images:
	-rm *.png

clean-coords:
	-rm *.txt
