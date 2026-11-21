Residue : [Object, Store, Equal, Compare, Number] {

	| commonResidue modulus | <Integer>

	< { :self :aNumber |
		self.commonResidue < self.assertIsCompatibleOperand(aNumber).commonResidue
	}

	adaptToIntegerAndApply { :self :anInteger :aFunction/2 |
		aFunction(
			Residue(
				Integer(anInteger),
				self.modulus
			),
			self
		)
	}

	adaptToNumberAndApply { :self :aNumber :aFunction/2 |
		aNumber.isIntegerValuedNumber.if {
			self.adaptToIntegerAndApply(
				Integer(aNumber),
				aFunction/2
			)
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

	binaryOperator { :self :aNumber :aFunction/2 |
		aNumber.isResidue.if {
			Residue(
				aFunction(
					self.commonResidue,
					self.assertIsCompatibleOperand(aNumber).commonResidue
				),
				self.modulus
			)
		} {
			aNumber.adaptToResidueAndApply(self, aFunction/2)
		}
	}

	[divide, /] { :self :aNumber |
		self * aNumber.inverse
	}

	inverse { :self |
		Residue(
			self.commonResidue.modularInverse(self.modulus),
			self.modulus
		)
	}

	isClose { :self :anObject |
		self = anObject
	}

	isExact { :unused |
		true
	}

	isIntegerValuedNumber { :unused |
		true
	}

	[plus, +] { :self :aNumber |
		self.binaryOperator(aNumber, plus/2)
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
		self.storeStringLiteral
	}

	storeStringLiteral { :self |
		self.commonResidue.concisePrintString
		++ 'Z'
		++ self.modulus.concisePrintString
	}

	[subtract, -] { :self :aNumber |
		self.binaryOperator(aNumber, subtract/2)
	}

	[times, *] { :self :aNumber |
		self.binaryOperator(aNumber, times/2)
	}

}

+Integer {

	Residue { :n :m |
		m.isInteger.if {
			uncheckedResidue(n % m, m)
		} {
			m.adaptToIntegerAndApply(n, Residue/2)
		}
	}

}

+@Sequence {

	Residue { :self :operand |
		operand.adaptToCollectionAndApply(self, Residue/2)
	}

}

+List {

	[Residue, listToResidue] { :self |
		self.atVectorOrElementwise { :r |
			let [n, m] = Integer(r);
			Residue(n, m)
		}
	}

}

+@Collection {

	adaptToResidueAndApply { :self :aResidue :aFunction/2 |
		self.collect { :each |
			aFunction(aResidue, each)
		}
	}

}

+@Number {

	adaptToResidueAndApply { :self :aResidue :aFunction/2 |
		self.isIntegerValuedNumber.if {
			aFunction(
				aResidue,
				Residue(Integer(self), aResidue.modulus)
			)
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
