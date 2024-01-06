(* Requires: Bag Fraction *)

+Fraction {

	latticePrimes { :self |
		let answer = Set();
		answer.includeAll(self.numerator.primeFactors);
		answer.includeAll(self.denominator.primeFactors);
		answer.without(2).asArray.sort
	}

	latticeVector { :self :primes |
		let pf1 = self.numerator.primeFactors;
		let pf2 = self.denominator.primeFactors.collect(negated:/1);
		let pf3 = (pf1 ++ pf2).asBag;
		primes.collect { :each |
			pf3.occurrencesOf(each) - pf3.occurrencesOf(each.negated)
		}
	}

	latticeVectorString { :self :primes |
		primes.includesAllOf(self.latticePrimes).if {
			self.latticeVector(primes).collect { :each |
				each.asString.padLeft(2, ' ')
			}.joinSeparatedBy(' ')
		} {
			'*'
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
		let indices = [1 .. self.size];
		let answer = [];
		indices.combinationsAtATimeDo(2) { :each |
			let [i, j] = each;
			(vertices[i].latticeDistance(vertices[j]) = 1).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	latticePrimes { :self |
		let answer = Set();
		self.ratios.do { :each |
			answer.includeAll(each.latticePrimes)
		};
		answer.asArray.sort
	}

	latticeVertices { :self :primes |
		self.ratios.collect { :each |
			each.latticeVector(primes)
		}
	}

}
