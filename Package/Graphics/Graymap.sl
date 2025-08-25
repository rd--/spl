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
					(level * maxDepth).round.printString
				} {
					self.error('asPgm: not (0,1) matrix')
				}
			}.unwords
		};
		(header ++ rows ++ ['']).unlines
	}

	drawing { :self |
		self
	}

	height { :self |
		self.contents.numberOfRows
	}

	show { :self |
		let pngFileName = '/tmp/graymap.png';
		self.writePng(pngFileName);
		system.systemCommand('chromium', [pngFileName])
	}

	width { :self |
		self.contents.numberOfColumns
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

	asGraymap { :self |
		self.rescale.Graymap
	}

	Graymap { :self |
		self.isMatrix.if {
			newGraymap().initializeSlots(self)
		} {
			self.error('Graymap: not matrix')
		}
	}

}
