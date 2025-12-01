Greymap : [Object] { | contents |

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
		let pngFileName = '/tmp/greymap.png';
		self.writePng(pngFileName);
		system.systemCommand('chromium', [pngFileName])
	}

	width { :self |
		self.contents.numberOfColumns
	}

	writePgm { :self :fileName |
		system.writeTextFile(
			fileName,
			self.asPgm(255)
		)
	}

	writePng { :self :fileName |
		let pgmFileName = '/tmp/greymap.pgm';
		self.writePgm(pgmFileName);
		system.systemCommand('convert', [pgmFileName, '-transparent', 'white', '-strip', fileName])
	}

}

+List {

	asGreymap { :self |
		self.rescale.Greymap
	}

	Greymap { :self |
		self.isMatrix.if {
			newGreymap().initializeSlots(self)
		} {
			self.error('Greymap: not matrix')
		}
	}

}
