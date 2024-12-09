/* Requires: Bag Fraction RatioTuning */

+Fraction {

	latticePrimes { :self :includeOctave |
		let answer = Set();
		answer.includeAll(self.numerator.primeFactors);
		answer.includeAll(self.denominator.primeFactors);
		includeOctave.ifFalse {
			answer.without(2)
		};
		answer.asList.sort
	}

	latticeVector { :self :primes |
		primes.includesAllOf(
			self.latticePrimes(primes.includes(2))
		).if {
			let pf1 = self.numerator.primeFactors;
			let pf2 = self.denominator.primeFactors.negated;
			let pf3 = (pf1 ++ pf2).asBag;
			primes.collect { :each |
				pf3.occurrencesOf(each) - pf3.occurrencesOf(each.negated)
			}
		} {
			self.error('Fraction>>latticeVector: incomplete primes')
		}
	}

	latticeVectorString { :self :primes |
		primes.includesAllOf(
			self.latticePrimes(primes.includes(2))
		).if {
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
		let v = unitVector.first(self.size);
		self.withCollect(v) { :count :unit |
			count * unit
		}.sum
	}

	latticeDistance { :self :aList |
		(self - aList).abs.sum
	}

}

+SmallFloat {

	wilsonLatticeCoordinates { :self |
		[
			20 0;
			0 20;
			4 3;
			-3 4;
			-1 2
		] / 20 * self
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

	latticeGraph { :self :primes :unitVector |
		let primesList = self.latticeVertices(primes);
		let edgeList = self.latticeEdges(primesList);
		let coordinateList = primesList.collect { :each |
			each.latticeCoordinates(unitVector)
		};
		Graph(
			[1 .. primesList.size],
			edgeList
		).vertexLabels(coordinateList)
	}

	latticeGraph { :self |
		self.latticeGraph(
			self.latticePrimesVector([3 5 7 11 13]),
			1.wilsonLatticeCoordinates
		)
	}

	latticePrimes { :self :includeOctave |
		let answer = Set();
		self.asRatios.do { :each |
			answer.includeAll(each.latticePrimes(includeOctave))
		};
		answer.asList.sort
	}

	latticePrimesVector { :self :primes |
		let upperLimit = primes.last;
		(self.limit <= upperLimit).if {
			primes
		} {
			let tuningPrimes = self.latticePrimes(false);
			(tuningPrimes.size <= primes.size).if {
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
