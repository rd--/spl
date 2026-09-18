Quantity : [Object, Store, Equal, Compare, Frequency, Length, Mass, PlaneAngle, Time] { | magnitude unit |

	[divide, /] { :self :anObject |
		self * anObject.reciprocal
	}

	equalBy { :self :anObject :aBlock/2 |
		anObject.isQuantity & {
			self.unit = anObject.unit & {
				aBlock(self.magnitude, anObject.magnitude)
			}
		}
	}

	inHertz { :self |
		(self.unit = 'hertz').if {
			self.magnitude
		} {
			(self.unit = 'seconds').if {
				1 / self.magnitude
			} {
				self.error('hertz: not time or frequency')
			}
		}
	}

	inKilograms { :self |
		(self.unit = 'kilograms').if {
			self.magnitude
		} {
			self.error('inKilograms: not mass')
		}
	}

	inMetres { :self |
		(self.unit = 'metres').if {
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

	inSeconds { :self |
		(self.unit = 'seconds').if {
			self.magnitude
		} {
			self.error('inSeconds: not time')
		}
	}

	isCommensurate { :self :anObject |
		anObject.isQuantity & {
			self.unit = anObject.unit
		}
	}

	isAngle { :self |
		self.unit = 'radians'
	}

	isFrequency { :self |
		self.unit = 'hertz'
	}

	isLength { :self |
		self.unit = 'metres'
	}

	isPlaneAngle { :self |
		self.unit = 'radians'
	}

	isMass { :self |
		self.unit = 'kilograms'
	}

	isTime { :self |
		self.unit = 'seconds'
	}


	[less, <] { :self :anObject |
		self.isCommensurate(anObject).if {
			self.magnitude < anObject.magnitude
		} {
			self.error('<: invalid operand')
		}
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

	[times, *] { :self :anObject |
		anObject.isNumber.if {
			Quantity(
				self.magnitude * anObject,
				self.unit
			)
		} {
			self.error('*: invalid operand')
		}
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
		Quantity(self, 'kilograms') /* kg */
	}

	metres { :self |
		Quantity(self, 'metres') /* m */
	}

	radians { :self |
		Quantity(self, 'radians') /* rad */
	}

	seconds { :self |
		Quantity(self, 'seconds') /* s */
	}

}

+@Collection {

	magnitude { :self |
		self.collect(magnitude/1)
	}

	unit { :self |
		self.collect(unit/1)
	}

}
