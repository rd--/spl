Image : [Object] { | contents |

	asPpm { :self :maxDepth |
		let [rowCount, columnCount, pixelCount] = self.contents.shape;
		let header = [
			'P3',
			'% %'.format([columnCount, rowCount]),
			maxDepth.printString
		];
		let rows = self.contents.collect { :each |
			each.collect { :pixel |
				pixel.allSatisfy { :channel |
					channel.betweenAnd(0, 1)
				}.if {
					(pixel.first(3) * maxDepth).rounded.collect(printString:/1).join(' ')
				} {
					self.error('asPpm: not (0,1) pixel')
				}
			}.join(' ')
		};
		(header ++ rows ++ ['']).unlines
	}

	draw { :self |
		let pngFileName = '/tmp/image.png';
		self.writePng(pngFileName);
		system.systemCommand('chromium', [pngFileName])
	}

	height { :self |
		self.contents.size
	}

	width { :self |
		self.contents.anyOne.size
	}

	writePpm { :self :fileName |
		fileName.writeTextFile(self.asPpm(255))
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
