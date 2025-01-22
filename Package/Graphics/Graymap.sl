Graymap : [Object] { | contents |

	asPgm { :self :maxDepth |
		let [rowCount, columnCount] = self.contents.shape;
		let header = [
			'P2',
			'% %'.format([columnCount, rowCount]),
			maxDepth.printString
		];
		let rows = self.contents.collect { :each |
			each.collect { :level |
				level.betweenAnd(0, 1).if {
					(level * maxDepth).rounded.printString
				} {
					self.error('asPgm: not (0,1) matrix')
				}
			}.join(' ')
		};
		(header ++ rows ++ ['']).unlines
	}

	draw { :self |
		let pngFileName = '/tmp/graymap.png';
		self.writePng(pngFileName);
		system.systemCommand('chromium', [pngFileName])
	}

	height { :self |
		self.contents.size
	}

	width { :self |
		self.contents.first.size
	}

	writePgm { :self :fileName |
		fileName.writeTextFile(self.asPgm(255))
	}

	writePng { :self :fileName |
		let pgmFileName = '/tmp/graymap.pgm';
		self.writePgm(pgmFileName);
		system.systemCommand('convert', [pgmFileName, '-transparent', 'white', '-strip', fileName])
	}

}

+List {

	Graymap { :self |
		self.isMatrix.if {
			newGraymap().initializeSlots(self)
		} {
			self.error('Graymap: not matrix')
		}
	}

}
