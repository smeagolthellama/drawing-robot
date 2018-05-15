all: $(shell date +%s).svg %.draw

%.svg: %.edges.ppm
	potrace --svg $^

%.edges.ppm: %.png
	convert $^ -canny 0x1+10%+30% $@ #I think...

%.png:
	evolvotron_mutate -g | evolvotron_render -s 1024x1024 $*.png

%.draw: %.svg
	#TODO: implement
