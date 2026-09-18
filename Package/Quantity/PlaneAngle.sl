@PlaneAngle {

	cos { :self |
		self.inRadians.cos
	}

	dmsList { :self |
		self.inDegrees.dmsList
	}

	inDegrees { :self |
		self.inRadians / 1.pi * 180
	}

	inGradians { :self |
		self.inRadians / 400
	}

	inRadians { :self |
		self.typeResponsibility('inRadians')
	}

	isAcute { :self |
		self.inRadians < 1/2.pi
	}

	isFull { :self |
		self.inRadians.isVeryCloseTo(2.pi)
	}

	isObtuse { :self |
		self.inRadians > 1/2.pi & {
			self.inRadians < 1.pi
		}
	}

	isReflex { :self |
		self.inRadians > 1.pi & {
			self.inRadians < 2.pi
		}
	}

	isRight { :self |
		self.inRadians.isVeryCloseTo(1/2.pi)
	}

	isStraight { :self |
		self.inRadians.isVeryCloseTo(1.pi)
	}

	sin { :self |
		self.inRadians.sin
	}

	tan { :self |
		self.inRadians.tan
	}

	vector { :self |
		self.inRadians.angleVector
	}

}

+SmallFloat {

	PlaneAngle { :self |
		Quantity(self, 'radians')
	}

}

+@Number {

	degrees { :self |
		(self.pi / 180).radians
	}

	dmsList { :self |
		let b = [60 60];
		(self.abs * 60 * 60).mixedRadixEncode(b) * self.sign
	}

	dmsString { :self |
		self.dmsList.dmsString
	}

	gradians { :self |
		(self * 400).radians
	}

}

+List {

	dmsList { :self |
		self.fromDms.dmsList
	}

	dmsString { :self |
		let [d, m, s] = self.dmsList;
		'%°%′%″'.format([
			d.printString,
			m.printString,
			s.printStringToFixed(3)
		])
	}

	fromDms { :self |
		self.numberCompose([1, 1 / 60, 1 / 3600])
	}

}

+@Collection {

	degrees { :self |
		self.collect(degrees/1)
	}

	radians { :self |
		self.collect(radians/1)
	}

}
