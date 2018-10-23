var originalCanvas = document.getElementById('original')
var originalCtx = originalCanvas.getContext('2d')

var canvas = document.getElementById('manipulated')
var ctx = canvas.getContext('2d')

var database = new Array()

var picoColors = ["#000000", "#1d2e52", "#733255", "#3f8150", "#a0583f", "#5e5750", "#c2c3c7", "#fdf1e9", "#e9425b", "#f3a433", "#ffe641", "#71d835", "#4eb0fb", "#7f7a9b", "#ed86ac", "#f7cdae"];

function getPicoColor(color_r, color_g, color_b) {
	//Create an emtyp array for the difference betwwen the colors
	var differenceArray = [];

	//Function to find the smallest value in an array
	Array.min = function(array) {
		return Math.min.apply(Math, array);
	};

	//Convert the HEX color in the array to RGB colors, split them up to R-G-B, then find out the difference between the "color" and the colors in the array
	picoColors.forEach(function(color) {
		var base_color_rgb = hexToRGB(color);
		var picoColors_r = base_color_rgb.split(',')[0];
		var picoColors_g = base_color_rgb.split(',')[1];
		var picoColors_b = base_color_rgb.split(',')[2];

		//Add the difference to the differenceArray
		differenceArray.push(Math.sqrt((color_r - picoColors_r) * (color_r - picoColors_r) + (color_g - picoColors_g) * (color_g - picoColors_g) + (color_b - picoColors_b) * (color_b - picoColors_b)));
	});

	//Get the lowest number from the differenceArray
	var lowest = Array.min(differenceArray);

	//Get the index for that lowest number
	var index = differenceArray.indexOf(lowest);

	//Return the HEX code
	return picoColors[index];
}

//Function to convert HEX to RGB
function hexToRGB(color) {
	var r, g, b;
	if (color.charAt(0) == '#') {
		color = color.substr(1);
	}

	r = color.charAt(0) + color.charAt(1);
	g = color.charAt(2) + color.charAt(3);
	b = color.charAt(4) + color.charAt(5);

	r = parseInt(r, 16);
	g = parseInt(g, 16);
	b = parseInt(b, 16);
	return r + ',' + g + ',' + b;
}

function load() {
	database = new Array() // Start fresh so we can load another image without refreshing the page

	var image = new Image() // This is what we'll pass along to other functions

	var file = document.getElementById('load').files[0]
	var reader = new FileReader()

	reader.onload = function() {
		image.src = reader.result

		image.onload = function() {
			loaded(image)
		}
	}

	if (file) {
		reader.readAsDataURL(file) // Reads the data as a URL
	}
}

function loaded(image) {
	// Resize the canvases to reflect the size of the source image
	originalCanvas.width = image.width
	originalCanvas.height = image.height
	canvas.width = image.width
	canvas.height = image.height
	canvas.style.top = image.height

	if (image.width > window.innerWidth) {
		originalCanvas.style.left = 0
		canvas.style.left = 0
	}

	originalCtx.drawImage(image, 0, 0) // Display the original image in the left canvas
	ctx.drawImage(image, 0, 0) // Display the original image in the right canvas for manipulation and display

	var imageData = originalCtx.getImageData(0, 0, canvas.width, canvas.height) // Get pixel data for the whole canvas

	changeColors(database, imageData)
}

function changeColors(data, container) {
	for (var y = 0; y < canvas.height; y++) {
		for (var x = 0; x < canvas.width; x++) {
			var position = y * 4 * canvas.width + x * 4

			var color = getPicoColor(container.data[position], container.data[position + 1], container.data[position + 2])

			for (var i = 0; i < picoColors.length; i++) {
				if (color == picoColors[i]) {
					if (i > 9) {
						if (i == 10) {
							data.push("A")
						} else if (i == 11) {
							data.push("B")
						} else if (i == 12) {
							data.push("C")
						} else if (i == 13) {
							data.push("D")
						} else if (i == 14) {
							data.push("E")
						} else if (i == 15) {
							data.push("F")
						}
					} else {
						data.push(i)
					}
				}
			}

			var rgbColor = hexToRGB(color).split(",")
			container.data[position] = rgbColor[0]
			container.data[position + 1] = rgbColor[1]
			container.data[position + 2] = rgbColor[2]
		}
	}

	printedData = "-- width: " + container.width + " height: " + container.height + "\n"
	printedData += "image=\"" + data.join("") + "\""

	document.getElementById("encoded").value = printedData
	drawImageData(container)
}

function drawImageData(container) // Run after convert
{
	ctx.putImageData(container, 0, 0) // Put pixel data on canvas
}

function exportImage() {
	var download = document.createElement('a')
	download.href = canvas.toDataURL('images/png')
	download.download = 'pico-encoded.png'
	download.click()
}
