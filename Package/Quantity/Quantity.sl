Quantity : [Object, Magnitude] { | magnitude unit |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}


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
		self + anObject.negated
	}

	asSeconds { :self |
		self.isTime.if {
			self.magnitude
		} {
			self.error('asSeconds: not time')
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

	negated { :self |
		Quantity(self.magnitude.negated, self.unit)
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

