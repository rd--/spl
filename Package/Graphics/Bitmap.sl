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
		let pngFileName = '/tmp/bitmap.png';
		self.writePng(pngFileName);
		system.systemCommand('chromium', [pngFileName])
	}

	height { :self |
		self.contents.size
	}

	width { :self |
		self.contents.first.size
	}

	writePbm { :self :fileName |
		fileName.writeTextFile(self.asPbm)
	}

	writePng { :self :fileName |
		let pbmFileName = '/tmp/bitmap.pbm';
		pbmFileName.writeTextFile(self.asPbm);
		system.systemCommand('convert', [pbmFileName, '-transparent', 'white', '-strip', fileName])
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
