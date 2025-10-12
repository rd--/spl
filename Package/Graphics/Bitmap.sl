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
			}.unwords
		};
		(header ++ rows ++ ['']).unlines
	}

	drawing { :self |
		self
	}

	height { :self |
		self.contents.size
	}

	show { :self |
		let pngFileName = '/tmp/bitmap.png';
		self.writePng(pngFileName);
		system.systemCommand('chromium', [pngFileName])
	}

	width { :self |
		self.contents.first.size
	}

	writePbm { :self :fileName |
		system.writeTextFile(
			fileName,
			self.asPbm
		)
	}

	writePng { :self :fileName |
		let pbmFileName = '/tmp/bitmap.pbm';
		system.writeTextFile(
			pbmFileName,
			self.asPbm
		);
		system.systemCommand(
			'convert',
			[
				pbmFileName,
				'-transparent',
				'white',
				'-strip',
				fileName
			]
		)
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
