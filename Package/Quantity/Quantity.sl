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

	asDuration { :self |
		(self.unit = 'seconds').if {
			Duration(self.magnitude)
		} {
			self.error('asDuration: not time')
		}
	}

	asDuration { :self |
		(self.unit = 'seconds').if {
			Duration(self.magnitude)
		} {
			self.error('asDuration: not time')
		}
	}

	asFrequency { :self |
		(self.unit = 'hertz').if {
			Frequency(self.magnitude)
		} {
			self.error('asFrequency: not frequency')
		}
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

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+SmallFloat {

	Quantity { :magnitude :unit |
		newQuantity().initializeSlots(magnitude, unit)
	}

}

