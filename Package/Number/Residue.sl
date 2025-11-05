Residue : [Object, Equatable, Comparable, Magnitude, Number] { | commonResidue modulus |

	+ { :self :aNumber |
		self.binaryOperator(aNumber, +)
	}

	- { :self :aNumber |
		self.binaryOperator(aNumber, -)
	}

	* { :self :aNumber |
		self.binaryOperator(aNumber, *)
	}

	/ { :self :aNumber |
		self * aNumber.inverse
	}

	< { :self :aNumber |
		self.commonResidue < self.assertIsCompatibleOperand(aNumber).commonResidue
	}

	adaptToIntegerAndApply { :self :anInteger :aBlock:/2 |
		aBlock(
			Residue(anInteger, self.modulus),
			self
		)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aNumber.isSmallInteger.if {
			self.adaptToIntegerAndApply(aNumber, aBlock:/2)
		} {
			self.error('Residue>>adaptToNumberAndApply: not an integer')
		}
	}

	assertIsCompatibleOperand { :self :operand |
		(
			operand.isResidue & {
				self.modulus = operand.modulus
			}
		).ifFalse {
			self.error('Residue>>assertIsCompatibleResidue')
		};
		operand
	}

	binaryOperator { :self :aNumber :aBlock:/2 |
		aNumber.isResidue.if {
			Residue(
				aBlock(
					self.commonResidue,
					self.assertIsCompatibleOperand(aNumber).commonResidue
				),
				self.modulus
			)
		} {
			aNumber.adaptToResidueAndApply(self, aBlock:/2)
		}
	}

	inverse { :self |
		Residue(
			self.commonResidue.modularInverse(self.modulus),
			self.modulus
		)
	}

	isCloseTo { :self :anObject |
		self = anObject
	}

	isExact { :unused |
		true
	}

	isInteger { :unused |
		true
	}

	positiveResidue { :self |
		let n = self.commonResidue;
		n.isZero.if {
			self.modulus
		} {
			n
		}
	}

	storeString { :self |
		self.commonResidue.storeString ++ 'Z' ++ self.modulus.storeString
	}

}

+@Integer {

	Residue { :i :m |
		newResidue().initializeSlots(i % m, m)
	}

}

+List {

	asResidue { :self |
		(self.size = 2).if {
			Residue(self[1], self[2])
		} {
			self.error('List>>asResidue: size not two')
		}
	}

}

+@Collection {

	adaptToResidueAndApply { :self :aResidue :aBlock:/2 |
		self.collect { :each |
			aBlock(aResidue, each)
		}
	}

}

+@Number {

	adaptToResidueAndApply { :self :aResidue :aBlock:/2 |
		self.isInteger.if {
			aBlock(aResidue, Residue(self, aResidue.modulus))
		} {
			self.error('@Number>>adaptToResidueAndApply: not integer')
		}
	}

}

+List {

	isCommonResidueVector { :self :n |
		self.allSatisfy { :each |
			each.isNonNegativeInteger & {
				each < n
			}
		}
	}

}
