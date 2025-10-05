@PlaneAngle {

	asRadians { :self |
		self.radians
	}

	cos { :self |
		self.radians.cos
	}

	degrees { :self |
		self.radians / 1.pi * 180
	}

	dmsList { :self |
		self.degrees.dmsList
	}

	gradians { :self |
		self.radians / 400
	}

	radians { :self |
		self.typeResponsibility('radians')
	}

	sin { :self |
		self.radians.sin
	}

	tan { :self |
		self.radians.tan
	}

	vector { :self |
		self.radians.angleVector
	}

}

+SmallFloat {

	PlaneAngle { :self |
		Quantity(self, 'radians')
	}

}

+@Number {

	asRadians { :self |
		self
	}

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
