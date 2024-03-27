{- Requires: BitSet Set -}

ResidueSet : [Object, Iterable, Collection] { | modulus contents |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	+ { :self :anInteger |
		(self.contents + anInteger).asResidueSet(self.modulus)
	}

	- { :self :anInteger |
		(self.contents - anInteger).asResidueSet(self.modulus)
	}

	* { :self :anInteger |
		(self.contents * anInteger).asResidueSet(self.modulus)
	}

	asBitSet { :self |
		self.contents.asBitSet(self.modulus)
	}

	asBitString { :self |
		self.asBitSet.asString
	}

	asList { :self |
		self.contents.asList.sort
	}

	asSet { :self |
		self.contents.copy
	}

	complement { :self |
		self.asBitSet.complement.asResidueSet
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1)
	}

	include { :self :anInteger |
		self.contents.include(anInteger % self.modulus)
	}

	size { :self |
		self.contents.size
	}

	storeString { :self |
		self.asList.storeString ++ '.asResidueSet(' ++ self.modulus.printString ++ ')'
	}

	species { :self |
		{
			ResidueSet(self.modulus)
		}
	}

}

+@Integer {

	leastResidueSystem { :modulus |
		(0 .. modulus - 1).asResidueSet(modulus)
	}

	ResidueSet { :modulus |
		newResidueSet().initializeSlots(modulus, Set())
	}

}

+@Collection {

	asResidueSet { :self :modulus |
		let answer = ResidueSet(modulus);
		answer.includeAll(self % modulus);
		answer
	}

}

+BitSet {

	asResidueSet { :self |
		self.asList.asResidueSet(self.capacity)
	}

}
