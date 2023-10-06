(* Requires: Bag Fraction *)

+Fraction {

	latticeVector { :self :limit |
		|(
			pf1 = self.numerator.primeFactors,
			pf2 = self.denominator.primeFactors.collect(negated:/1),
			pf3 = (pf1 ++ pf2).Bag
		)|
		limit.primesUpTo.allButFirst.collect { :each |
			pf3.occurrencesOf(each) - pf3.occurrencesOf(each.negated)
		}
	}

	latticeVectorString { :self :limit |
		(self.primeLimit > limit).if {
			'*'
		} {
			self.latticeVector(limit).collect { :each |
				each.asString.padLeft(2, ' ')
			}.joinSeparatedBy(' ')
		}
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

+@Tuning {

	latticeEdges { :self :vertices |
		| indices = [1 .. self.degree], answer = []; |
		indices.combinationsAtATimeDo(2) { :each |
			| [i, j] = each; |
			(vertices[i].latticeDistance(vertices[j]) = 1).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	latticeVertices { :self |
		self.ratios.collect { :each |
			each.latticeVector(self.limit)
		}
	}

}
