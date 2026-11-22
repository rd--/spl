/* Requires: Fraction RatioTuning */

+[Float, Fraction, Integer] {

	tuningLatticePrimes { :self :includeOctave |
		let answer = Set([], =);
		answer.includeAll!(self.numerator.primeFactors);
		answer.includeAll!(self.denominator.primeFactors);
		includeOctave.ifFalse {
			answer.without!(2)
		};
		List(answer).sort!
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
				each.integerString.padLeft([2], ' ')
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

+@Number {

	gradyTuningLatticeCoordinates { :m :n |
		[
			40L 0L;
			0L 40L;
			13L 11L;
			-14L 18L;
			-8L 4L;
			-5L 32L;
			7L 25L;
			20L 6L
		].first(n) / 40L * m
	}

	gradyTuningLatticeCoordinates { :m |
		m.gradyTuningLatticeCoordinates(8L)
	}

	wilsonTuningLatticeCoordinates { :m :n |
		[
			20L 0L;
			0L 20L;
			4L 3L;
			-3L 4L;
			-1L 2L
		].first(n) / 20L * m
	}

	wilsonTuningLatticeCoordinates { :m |
		m.wilsonTuningLatticeCoordinates(5L)
	}

}

+RatioTuning {

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

	tuningLatticeEdges { :self :vertexCoordinates |
		let indices = self.size.iota;
		let answer = [];
		indices.combinationsAtATimeDo(2) { :each |
			let [i, j] = each;
			(vertexCoordinates[i].manhattanDistance(vertexCoordinates[j]) = 1).ifTrue {
				answer.add!(each.copy)
			}
		};
		answer
	}

	tuningLatticeGraph { :self :primes :unitVector |
		let dimensionCount = primes.size;
		let basisVector = unitVector.first(dimensionCount);
		let primesList = self.tuningLatticeVertexCoordinates(primes);
		let edgeList = self.tuningLatticeEdges(primesList);
		let coordinateList = primesList.collect { :each |
			(each * basisVector).sum
		};
		let graph = Graph(
			[1L .. primesList.size],
			edgeList
		);
		graph.vertexCoordinates := coordinateList;
		graph
	}

	tuningLatticeGraph { :self |
		self.tuningLatticeGraph(
			self.tuningLatticeDerivedPrimesVector(
				[3L 5L 7L 11L 13L 17L 19L 23L]
			),
			1.0.gradyTuningLatticeCoordinates
		)
	}

	tuningLatticePrimes { :self :includeOctave |
		let p = Set([], =);
		self.ratios.do { :each |
			p.includeAll!(
				each.tuningLatticePrimes(
					includeOctave
				)
			)
		};
		List(p).sort
	}

	tuningLatticeVertexCoordinates { :self :primes |
		self.ratios.collect { :each |
			each.tuningLatticeVector(primes)
		}
	}

}
