(* Requires: Bag Fraction *)

+Fraction {

	latticeVector { :self :limit |
		|(
			pf1 = self.numerator.primeFactors,
			pf2 = self.denominator.primeFactors.collect(negated:/1),
			pf3 = (pf1 ++ pf2).Bag
		)|
		[3, 5, 7, 11, 13].select { :each |
			each <= limit
		}.collect { :each |
			pf3.occurrencesOf(each) - pf3.occurrencesOf(each.negated)
		}
	}

	latticeVectorString { :self :limit |
		self.latticeVector(limit).collect { :each |
			each.asString.padLeft(2, ' ')
		}.joinSeparatedBy(' ')
	}

}

+Array {

	latticeCoordinates { :self :unitVector |
		self.withCollect(unitVector.first(self.size)) { :count :unit |
			count * unit
		}.sum
	}

	latticeDistance { :self :anArray |
		(self - anArray).abs.sum
	}

	wilsonLatticeCoordinates { :self |
		self.latticeCoordinates([20@0, 0@20, 4@3, -3@4, -1@2])
	}

}
