package main

import (
	"fmt"
	"image"
	"image/png"
	"io"
	"os"
	"strings"
)

func gracefulExit(message string) {
	/**
	 * Gracefully exits the application in case of error.
	 * @param {string} message - error message to display
	 */
	fmt.Println(message)
	os.Exit(1)
}

func main() {
	fmt.Println("Obtaining coordinates... ")
	
	// If the user does not provide an image file, exit the application
	if len(os.Args) == 1 {
		gracefulExit("Please provide an image file.")
	}

	arg := os.Args[1] // Image file name that needs to be processed

	// Register .png image format in the image handler
	image.RegisterFormat("png", "png", png.Decode, png.DecodeConfig)

	// Open the provided image file if it exists
	file, err := os.Open(arg)
	if err != nil {
		gracefulExit("No such image file!")
	}

	defer file.Close()

	// Create array of white pixel coordinates, if possible
	coordinates, err := getCoordinates(file)
	if err != nil {
		gracefulExit("Unable to retrieve coordinates of image.")
	}

	// Write coordinates to file, if possible
	err = writeCoordinates(coordinates, arg)
	if err != nil {
		gracefulExit("Couldn't write to file!")
	} else {
		fmt.Println("Success!")
	}
}

func getCoordinates(file io.Reader) ([]Coordinate, error) {
	/**
	 * Creates an array of Coordinate structs based on a specific condition.
	 * @param {io.Reader} file - the image file
	 * @returns {[]Coordinate, error} - array of coordinates and error message
	 */
	img, _, err := image.Decode(file) // Try to decode the image
	if err != nil {
		return nil, err
	}

	bounds := img.Bounds()             // Get the bounds of the image
	w, h := bounds.Max.X, bounds.Max.Y // Get the width and height of the image

	var coordinates []Coordinate
	for y := 0; y < h; y++ {
		for x := 0; x < w; x++ {
			/* If the RGBA value of the pixel is (65535, 65535, 65535, 65535), create coordinate
			 * and append it to the array of coordinates */
			if r, g, b, _ := img.At(x, y).RGBA(); r == 65535 && g == 65535 && b == 65535 {
				coord := Coordinate{x, y}
				coordinates = append(coordinates, coord)
			}
		}
	}

	return coordinates, nil
}

func writeCoordinates(coords []Coordinate, name string) error {
	/**
	 * Writes the coordinates to a file.
	 * @param {[]Coordinate} coords - the array of coordinates
	 * @param {string} name - the input file name
	 * @returns {error}
	 */
	outputName := getOutputName(name)
	file, err := os.Create(outputName) // Re-create the file at every execution
	if err != nil {
		return err
	}

	defer file.Close()

	output := ""
	for _, coord := range coords {
		// Add each coordinate to a string in this format: "XPos,YPos", followed by newline
		output += fmt.Sprintf("%d,%d\n", coord.XPos, coord.YPos)
	}

	// Write the generated string to file
	_, err = io.Copy(file, strings.NewReader(output))
	if err != nil {
		return err
	}

	return nil
}

func getOutputName(input string) string {
	/**
	 * Creates the name of the output file from the input file
	 * @param {string} source - the image file name provided as an argument
	 * @returns {string}
	 */
	s := strings.Split(input, ".")
	outputName := s[0] + ".coords.txt"
	return outputName
}

// Coordinate - represents the X-Y coordinates of a single pixel
type Coordinate struct {
	XPos int
	YPos int
}
