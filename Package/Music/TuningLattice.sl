/* Requires: Bag Fraction RatioTuning */

+Fraction {

	latticePrimes { :self :includeOctave |
		let answer = Set(=);
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
			let pf3 = pf1 ++ pf2;
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
				each.asString.padLeft([2], ' ')
			}.unwords
		} {
			'*'
		}
	}

}

+List {

	latticeDistance { :self :aList |
		(self - aList).abs.sum
	}

}

+SmallFloat {

	gradyLatticeCoordinates { :self |
		[
			40 0;
			0 40;
			13 11;
			-14 18;
			-8 4;
			-5 32;
			7 25;
			20 6
		] / 40 * self
	}

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

	latticeEdges { :self :vertexCoordinates |
		let indices = self.size.iota;
		let answer = [];
		indices.combinationsAtATimeDo(2) { :each |
			let [i, j] = each;
			(vertexCoordinates[i].manhattanDistance(vertexCoordinates[j]) = 1).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	latticeGraph { :self :primes :unitVector |
		let primesList = self.latticeVertexCoordinates(primes);
		let edgeList = self.latticeEdges(primesList);
		let coordinateList = primesList.collect { :each |
			let v = unitVector.first(each.size);
			each.withCollect(v) { :count :unit |
				count * unit
			}.sum
		};
		Graph(
			[1 .. primesList.size],
			edgeList
		).vertexCoordinates(coordinateList)
	}

	latticeGraph { :self |
		self.latticeGraph(
			self.latticeDerivedPrimesVector(
				[3 5 7 11 13 17 19 23]
			),
			1.gradyLatticeCoordinates
		)
	}

	latticePrimes { :self :includeOctave |
		let answer = Set(=);
		self.asRatios.do { :each |
			answer.includeAll(each.latticePrimes(includeOctave))
		};
		answer.asList.sort
	}

	latticeDerivedPrimesVector { :self :primes |
		let upperLimit = primes.last;
		(self.primeLimit <= upperLimit).if {
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

	latticeVertexCoordinates { :self :primes |
		self.asRatios.collect { :each |
			each.latticeVector(primes)
		}
	}

}
