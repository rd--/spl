/* Requires: Fraction RatioTuning */

+Fraction {

	tuningLatticePrimes { :self :includeOctave |
		let answer = Set();
		answer.includeAll(self.numerator.primeFactors);
		answer.includeAll(self.denominator.primeFactors);
		includeOctave.ifFalse {
			answer.without(2)
		};
		answer.asList.sort
	}

	tuningLatticeVector { :self :primes |
		primes.includesAll(
			self.tuningLatticePrimes(primes.includes(2))
		).if {
			let pf1 = self.numerator.primeFactors;
			let pf2 = self.denominator.primeFactors.negate;
			let pf3 = pf1 ++ pf2;
			primes.collect { :each |
				pf3.occurrencesOf(each) - pf3.occurrencesOf(each.negate)
			}
		} {
			self.error('Fraction>>tuningLatticeVector: incomplete primes')
		}
	}

	tuningLatticeVectorString { :self :primes |
		primes.includesAll(
			self.tuningLatticePrimes(primes.includes(2))
		).if {
			self.tuningLatticeVector(primes).collect { :each |
				each.asString.padLeft([2], ' ')
			}.unwords
		} {
			'*'
		}
	}

}

+List {

	tuningLatticeDistance { :self :aList |
		(self - aList).abs.sum
	}

}

+SmallFloat {

	gradyTuningLatticeCoordinates { :self |
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

	wilsonTuningLatticeCoordinates { :self |
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

	tuningLatticeEdges { :self :vertexCoordinates |
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

	tuningLatticeGraph { :self :primes :unitVector |
		let primesList = self.tuningLatticeVertexCoordinates(primes);
		let edgeList = self.tuningLatticeEdges(primesList);
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

	tuningLatticeGraph { :self |
		self.tuningLatticeGraph(
			self.tuningLatticeDerivedPrimesVector(
				[3 5 7 11 13 17 19 23]
			),
			1.gradyTuningLatticeCoordinates
		)
	}

	tuningLatticePrimes { :self :includeOctave |
		let answer = Set();
		self.asRatios.do { :each |
			answer.includeAll(each.tuningLatticePrimes(includeOctave))
		};
		answer.asList.sort
	}

	tuningLatticeDerivedPrimesVector { :self :primes |
		let upperLimit = primes.last;
		(self.primeLimit <= upperLimit).if {
			primes
		} {
			let tuningPrimes = self.tuningLatticePrimes(false);
			(tuningPrimes.size <= primes.size).if {
				tuningPrimes
			} {
				nil
			}
		}
	}

	tuningLatticeVertexCoordinates { :self :primes |
		self.asRatios.collect { :each |
			each.tuningLatticeVector(primes)
		}
	}

}
