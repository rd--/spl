Graymap : [Object] { | contents |

	asPgm { :self :maxDepth |
		let [rowCount, columnCount] = self.contents.shape;
		let header = [
			'P2',
			'% %'.format([columnCount, rowCount]),
			maxDepth.printString
		];
		let rows = self.contents.collect { :each |
			each.collect { :item |
				item.betweenAnd(0, 1).if {
					(item * maxDepth).rounded.printString
				} {
					self.error('asPgm: not (0,1) matrix')
				}
			}.join(' ')
		};
		(header ++ rows ++ ['']).unlines
	}

	draw { :self |
		let pgmFileName = '/tmp/graymap.pgm';
		let pngFileName = '/tmp/graymap.png';
		let pgmText = self.asPgm(255);
		pgmFileName.writeTextFile(pgmText);
		system.systemCommand('convert', [pgmFileName, '-transparent', 'white', pngFileName]);
		system.systemCommand('chromium', [pngFileName])
	}

	height { :self |
		self.contents.size
	}

	width { :self |
		self.contents.first.size
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
