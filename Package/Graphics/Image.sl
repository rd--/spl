Image : [Object] { | contents |

	drawing { :self |
		self
	}

	encodePpm { :self :maxDepth |
		let [rowCount, columnCount, pixelCount] = self.contents.shape;
		let header = [
			'P3',
			'% %'.format([columnCount, rowCount]),
			maxDepth.printString
		];
		let rows = self.contents.collect { :each |
			each.collect { :pixel |
				pixel.isValidRgb.if {
					(pixel.first(3) * maxDepth).round.collect(printString:/1).unwords
				} {
					'% % %'.format([maxDepth, maxDepth, maxDepth])
				}
			}.unwords
		};
		(header ++ rows ++ ['']).unlines
	}

	height { :self |
		self.contents.size
	}

	show { :self |
		let pngFileName = '/tmp/image.png';
		self.writePng(pngFileName);
		system.systemCommand('chromium', [pngFileName])
	}

	width { :self |
		self.contents.anyOne.size
	}

	writePpm { :self :fileName |
		system.writeTextFile(
			fileName,
			self.encodePpm(255)
		)
	}

	writePng { :self :fileName |
		let ppmFileName = '/tmp/image.ppm';
		self.writePpm(ppmFileName);
		system.systemCommand('convert', [ppmFileName, '-transparent', 'white', '-strip', fileName])
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

+SmallFloat {

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
