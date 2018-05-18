all: $(shell date +%s).draw

.PRECIOUS: %.svg %.png
%.svg: %.edges.ppm
	potrace --svg $^

%.edges.ppm: %.png
	convert $^ -canny 0x1+10%+30% $@ #I think...

%.png:
	evolvotron_mutate -g | evolvotron_render -s 1024x1024 $@

%.draw: %.svg
	#TODO: implement
	perl draw.pl

clean: clean-images clean-patterns

clean-images:
	rm *.png

clean-patterns:
	rm *.svg
