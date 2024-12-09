/* Requires: Bag Fraction RatioTuning */

+Fraction {

	latticePrimes { :self |
		let answer = Set();
		answer.includeAll(self.numerator.primeFactors);
		answer.includeAll(self.denominator.primeFactors);
		answer.without(2).asList.sort
	}

	latticeVector { :self :primes |
		primes.includesAllOf(self.latticePrimes).if {
			let pf1 = self.numerator.primeFactors;
			let pf2 = self.denominator.primeFactors.collect(negated:/1);
			let pf3 = (pf1 ++ pf2).asBag;
			primes.collect { :each |
				pf3.occurrencesOf(each) - pf3.occurrencesOf(each.negated)
			}
		} {
			self.error('Fraction>>latticeVector: incomplete primes')
		}
	}

	latticeVectorString { :self :primes |
		primes.includesAllOf(self.latticePrimes).if {
			self.latticeVector(primes).collect { :each |
				each.asString.padLeft(2, ' ')
			}.join(' ')
		} {
			'*'
		}
	}

}

+List {

	latticeCoordinates { :self :unitVector |
		self.withCollect(
			unitVector.first(self.size)
		) { :count :unit |
			count * unit
		}.sum
	}

	latticeDistance { :self :aList |
		(self - aList).abs.sum
	}

	wilsonLatticeCoordinates { :self |
		self.latticeCoordinates(
			[
				20 0;
				0 20;
				4 3;
				-3 4;
				-1 2
			] / 20
		)
	}

}

+RatioTuning {

	latticeEdges { :self :vertices |
		let indices = self.size.iota;
		let answer = [];
		indices.combinationsAtATimeDo(2) { :each |
			let [i, j] = each;
			(vertices[i].manhattanDistance(vertices[j]) = 1).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	latticeGraph { :self :primes |
		let primesList = self.latticeVertices(primes);
		let edgeList = self.latticeEdges(primesList);
		let coordinateList = primesList.collect(wilsonLatticeCoordinates:/1);
		Graph([1 .. primesList.size], edgeList).vertexLabels(coordinateList)
	}

	latticeGraph { :self |
		self.latticeGraph(self.latticePrimesVector(5))
	}

	latticePrimes { :self |
		let answer = Set();
		self.asRatios.do { :each |
			answer.includeAll(each.latticePrimes)
		};
		answer.asList.sort
	}

	latticePrimesVector { :self :count |
		let upperLimit = (count + 1).nthPrime;
		(self.limit <= upperLimit).if {
			let vectorLimit = self.limit.min(upperLimit);
			vectorLimit.primesUpTo.allButFirst
		} {
			let tuningPrimes = self.latticePrimes;
			(tuningPrimes.size <= count).if {
				tuningPrimes
			} {
				nil
			}
		}
	}

	latticeVertices { :self :primes |
		self.asRatios.collect { :each |
			each.latticeVector(primes)
		}
	}

}
