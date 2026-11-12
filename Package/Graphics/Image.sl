Image : [Object] {

	| imageArray |

	drawing { :self |
		self
	}

	encodePpm { :self :maxDepth |
		let [rowCount, columnCount, pixelCount] = self.imageArray.shape;
		let header = [
			'P3',
			'% %'.format([columnCount, rowCount]),
			maxDepth.integerString
		];
		let rows = self.imageArray.collect { :each |
			each.collect { :pixel |
				let pixelData = pixel.isValidRgb.if {
					(pixel.first(3) * maxDepth).round
				} {
					[maxDepth, maxDepth, maxDepth]
				};
				pixelData.collect(concisePrintString/1).unwords
			}.unwords
		};
		(header ++ rows).unlines
	}

	height { :self |
		self.imageArray.size
	}

	show { :self |
		let pngFileName = '/tmp/image.png';
		self.writePng(pngFileName);
		system.systemCommand('chromium', [pngFileName])
	}

	width { :self |
		self.imageArray.anyOne.size
	}

	writePng { :self :fileName |
		let ppmFileName = '/tmp/image.ppm';
		self.writePpm(ppmFileName);
		system.systemCommand('convert', [ppmFileName, '-transparent', 'white', '-strip', fileName])
	}

	writePpm { :self :fileName |
		system.writeTextFile(
			fileName,
			self.encodePpm(255)
		)
	}

}

+List {

	Image { :self |
		self.isArray.if {
			newImage().initializeSlots(self)
		} {
			self.error('Image: not array')
		}
	}

}

+Float {

	constantImage { :self :shape |
		shape.constantArray(
			[self, self, self]
		).Image
	}

}

+List {

	constantImage { :self :shape |
		shape.constantArray(
			self
		).Image
	}

}

+RgbColour {

	constantImage { :self :shape |
		self.rgb.constantImage(shape)
	}

}
