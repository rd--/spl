Quantity : [Object, Equatable, Comparable, Magnitude] { | magnitude unit |

	< { :self :anObject |
		self.isCommensurate(anObject).if {
			self.magnitude < anObject.magnitude
		} {
			self.error('<: invalid operand')
		}
	}

	* { :self :anObject |
		anObject.isNumber.if {
			Quantity(
				self.magnitude * anObject,
				self.unit
			)
		} {
			self.error('*: invalid operand')
		}
	}

	/ { :self :anObject |
		self * anObject.reciprocal
	}

	+ { :self :anObject |
		self.isCommensurate(anObject).if {
			Quantity(
				self.magnitude + anObject.magnitude,
				self.unit
			)
		} {
			self.error('+: invalid operand')
		}
	}

	- { :self :anObject |
		self + anObject.negate
	}

	hertz { :self |
		(self.unit = 'hertz').if {
			self.magnitude
		} {
			self.error('hertz: not frequency')
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

	isMass { :self |
		self.unit = 'kilograms'
	}

	isTime { :self |
		self.unit = 'seconds'
	}

	kilograms { :self |
		(self.unit = 'kilograms').if {
			self.magnitude
		} {
			self.error('kilograms: not mass')
		}
	}

	metres { :self |
		(self.unit = 'metres').if {
			self.magnitude
		} {
			self.error('metres: not length')
		}
	}

	negate { :self |
		Quantity(self.magnitude.negate, self.unit)
	}

	radians { :self |
		(self.unit = 'radians').if {
			self.magnitude
		} {
			self.error('radians: not plane angle')
		}
	}

	seconds { :self |
		(self.unit = 'seconds').if {
			self.magnitude
		} {
			self.error('seconds: not time')
		}
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
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

