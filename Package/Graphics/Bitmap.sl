Bitmap : [Object] {

	| bitMatrix scale |

	drawing { :self |
		self
	}

	encodePbm { :self |
		let bitMatrix = self.bitMatrix;
		let scale = self.scale;
		let [rowCount, columnCount] = bitMatrix.shape;
		let header = [
			'P1',
			'% %'.format([columnCount * scale, rowCount * scale])
		];
		let rows = bitMatrix.collect { :each |
			each.collect { :item |
				List(scale, item.boole.printString).unwords
			}.unwords
		};
		(header ++ (rows.replicate(scale))).unlines
	}

	height { :self |
		self.bitMatrix.size
	}

	show { :self |
		let pngFileName = '/tmp/bitmap.png';
		self.writePng(pngFileName);
		system.systemCommand('chromium', [pngFileName])
	}

	width { :self |
		self.bitMatrix.first.size
	}

	writePbm { :self :fileName |
		system.writeTextFile(
			fileName,
			self.encodePbm
		)
	}

	writePng { :self :fileName |
		let pbmFileName = '/tmp/bitmap.pbm';
		system.writeTextFile(
			pbmFileName,
			self.encodePbm
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

	Bitmap { :self :scale |
		self.isMatrix.if {
			newBitmap().initializeSlots(self, scale)
		} {
			self.error('Bitmap: not matrix')
		}
	}

	Bitmap { :self |
		Bitmap(self, 1)
	}

}
