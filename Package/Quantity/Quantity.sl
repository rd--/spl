Quantity : [Object, Copy, Store, Equal, Compare, Frequency, Length, Mass, PlaneAngle, Time] {

	| magnitude unit |

	Frequency { :self |
		Frequency(self.inHertz)
	}

	Time { :self |
		Time(self.inSeconds)
	}

	[Times, *] { :self :anObject |
		anObject.isNumber.if {
			Quantity(
				self.magnitude * anObject,
				self.unit
			)
		} {
			self.error('*: invalid operand')
		}
	}	[divide, /] { :self :anObject |
		self * anObject.reciprocal
	}

	inHertz { :self |
		self.unit.caseOf(
			[
				'second' -> { 1 / self.magnitude },
				'hertz' -> { self.magnitude }
			]
		) {
			self.error('not time or frequency')
		}
	}

	inKilograms { :self |
		(self.unit = 'kilogram').if {
			self.magnitude
		} {
			self.error('inKilograms: not mass')
		}
	}

	inMetres { :self |
		(self.unit = 'metre').if {
			self.magnitude
		} {
			self.error('inMetres: not length')
		}
	}

	inRadians { :self |
		(self.unit = 'radians').if {
			self.magnitude
		} {
			self.error('inRadians: not plane angle')
		}
	}

	[inSeconds, quantityInSeconds] { :self |
		self.unit.caseOf(
			[
				'second' -> { self.magnitude },
				'hertz' -> { 1 / self.magnitude }
			]
		) {
			self.error('not time or frequency')
		}
	}

	isAngle { :self |
		self.unit = 'radians'
	}

	isCommensurate { :self :anObject |
		anObject.isQuantity & {
			self.unit = anObject.unit
		}
	}

	isEqualBy { :self :anObject :aBlock/2 |
		anObject.isQuantity & {
			self.unit = anObject.unit & {
				aBlock(self.magnitude, anObject.magnitude)
			}
		}
	}

	isFrequency { :self |
		self.unit = 'hertz'
	}

	isLength { :self |
		self.unit = 'metre'
	}

	[isLess, <] { :self :anObject |
		self.isCommensurate(anObject).if {
			isLessOn(self, anObject, magnitude/1)
		} {
			self.error('less: invalid operand')
		}
	}

	isMass { :self |
		self.unit = 'kilogram'
	}

	isPlaneAngle { :self |
		self.unit = 'radians'
	}

	isTime { :self |
		self.unit = 'second'
	}

	[negate, -] { :self |
		Quantity(self.magnitude.negate, self.unit)
	}

	[plus, +] { :self :anObject |
		self.isCommensurate(anObject).if {
			Quantity(
				self.magnitude + anObject.magnitude,
				self.unit
			)
		} {
			self.error('+: invalid operand')
		}
	}

	[subtract, -] { :self :anObject |
		self + anObject.negate
	}

}

+SmallFloat {

	Quantity { :magnitude :unit |
		newQuantity().initializeSlots(magnitude, unit)
	}

}

+SmallFloat {

	hertz { :self |
		Quantity(self, 'hertz') /* Hz */
	}

	kilograms { :self |
		Quantity(self, 'kilogram') /* kg */
	}

	metres { :self |
		Quantity(self, 'metre') /* m */
	}

	radians { :self |
		Quantity(self, 'radians') /* rad */
	}

	seconds { :self |
		Quantity(self, 'second') /* s */
	}

}

+@Collect {

	magnitude { :self |
		self.collect(magnitude/1)
	}

	unit { :self |
		self.collect(unit/1)
	}

}
