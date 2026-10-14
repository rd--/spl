/* Requires: BitSet Set */

ResidueSet : [Object, Store, Equal, Do, New, Collect, FiniteCollection, Add, Remove] {

	| commonResidueSet modulus |

	[plus, +] { :self :anInteger |
		ResidueSet(
			self.commonResidueSet + anInteger,
			self.modulus
		)
	}

	[subtract, -] { :self :anInteger |
		ResidueSet(
			self.commonResidueSet - anInteger,
			self.modulus
		)
	}

	[times, *] { :self :anInteger |
		ResidueSet(
			self.commonResidueSet * anInteger,
			self.modulus
		)
	}

	BitSet { :self |
		BitSet(
			self.commonResidueSet,
			self.modulus
		)
	}

	bitString { :self |
		self.BitSet.String
	}

	bitVector { :self |
		let positions = self.commonResidueSet;
		0.to(self.modulus).collect { :each |
			positions.includes(each).boole
		}
	}

	boxNotation { :self |
		self.BitSet.boxNotation
	}

	complement { :self |
		self.BitSet.complement.ResidueSet
	}

	do { :self :aBlock/1 |
		self.commonResidueSet.do(aBlock/1)
	}

	IdentitySet { :self |
		self.commonResidueSet.copy
	}

	include! { :self :anInteger |
		self.commonResidueSet.include!(anInteger % self.modulus)
	}

	List { :self |
		self.positionVector
	}

	positionVector { :self |
		self.commonResidueSet.List.sort
	}

	size { :self |
		self.commonResidueSet.size
	}

	storeString { :self |
		'ResidueSet(%, %)'.format(
			[
				self.positionVector.storeString,
				self.modulus.printString
			]
		)
	}

	species { :self |
		{
			ResidueSet([], self.modulus)
		}
	}

}

+@Integer {

	leastResidueSystem { :modulus |
		ResidueSet(
			0.to(modulus - 1),
			modulus
		)
	}

}

+@FiniteCollection {

	ResidueSet { :self :modulus |
		let r = newResidueSet().initializeSlots(IdentitySet(), modulus);
		r.includeAll!(self % modulus);
		r
	}

}

+BitSet {

	ResidueSet { :self |
		ResidueSet(
			self.positionVector,
			self.capacity
		)
	}

}

+String {

	ResidueSet { :self |
		self.BitSet.ResidueSet
	}

}
