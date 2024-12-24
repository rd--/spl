Residue : [Object, Magnitude, Number] { | commonResidue modulus |

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

	adaptToCollectionAndApply { :self :aCollection :aBlock:/2 |
		aCollection.collect { :each |
			each.aBlock(self)
		}
	}

	adaptToIntegerAndApply { :self :anInteger :aBlock:/2 |
		Residue(anInteger, self.modulus).aBlock(self)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aNumber.isSmallInteger.if {
			self.adaptToIntegerAndApply(aNumber, aBlock:/2)
		} {
			self.error('Residue>>adaptToNumberAndApply: not an integer')
		}
	}

	assertIsCompatibleResidue { :self :aResidue |
		(self.modulus = aResidue.modulus).ifFalse {
			self.error('Residue>>assertIsCompatibleResidue')
		}
	}

	binaryOperator { :self :aNumber :aBlock:/2 |
		aNumber.isResidue.if {
			self.assertIsCompatibleResidue(aNumber);
			Residue(self.commonResidue.aBlock(aNumber.commonResidue), self.modulus)
		} {
			aNumber.adaptToResidueAndApply(self, aBlock:/2)
		}
	}

	inverse { :self |
		Residue(self.commonResidue.modularInverse(self.modulus), self.modulus)
	}

	isCloseTo { :self :anObject |
		self = anObject
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

+@Sequence {

	asResidue { :self |
		(self.size = 2).if {
			Residue(self[1], self[2])
		} {
			self.error('@Sequence>>asResidue: size not two')
		}
	}

}

+@Collection {

	adaptToResidueAndApply { :self :aResidue :aBlock:/2 |
		self.collect { :each |
			aResidue.aBlock(each)
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
