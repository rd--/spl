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

	+ { :self :anObject |
		self.binaryOperator(anObject, +)
	}

	- { :self :anObject |
		self.binaryOperator(anObject, -)
	}

	binaryOperator { :self :anObject :aBlock:/2 |
		self.isCommensurate(anObject).if {
			Quantity(
				aBlock(self.magnitude, anObject.magnitude),
				self.unit
			)
		} {
			self.error('binaryOperator: invalid operand')
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

