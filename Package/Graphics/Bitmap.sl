Bitmap : [Object] { | contents |

	asPbm { :self |
		let [rowCount, columnCount] = self.contents.shape;
		let header = [
			'P1',
			'% %'.format([columnCount, rowCount])
		];
		let rows = self.contents.collect { :each |
			each.collect { :item |
				item.asBit.printString
			}.join(' ')
		};
		(header ++ rows ++ ['']).unlines
	}

	draw { :self |
		let pbmFileName = '/tmp/bitmap.pbm';
		let pngFileName = '/tmp/bitmap.png';
		let pbmText = self.asPbm;
		pbmFileName.writeTextFile(pbmText);
		system.systemCommand('convert', [pbmFileName, '-transparent', 'white', pngFileName]);
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

	Bitmap { :self |
		self.isMatrix.if {
			newBitmap().initializeSlots(self)
		} {
			self.error('Bitmap: not matrix')
		}
	}

}
