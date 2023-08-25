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

JiTuning : [Object] { | name description integerPitches limit degree |

	cents { :self |
		self.ratios.collect { :each |
			each.asFloat.log2 * 1200
		}
	}

	calculateDegree { :self |
		self.integerPitches.size
	}

	calculateLimit { :self |
		self.integerPitches.collect { :each |
			(each = 1).if {
				each
			} {
				each.primeFactors.max
			}
		}.max
	}

	degreeError { :self |
		self.error('degreeError')
	}

	initialize { :self :name :description :tuning |
		|(
			integerPitches = tuning.allSatisfy(isInteger:/1).if {
				tuning
			} {
				tuning / tuning.reduce(gcd:/2)
			}
		)|
		self.initializeSlots(
			name,
			description,
			integerPitches,
			nil,
			integerPitches.size
		);
		self.limit := self.calculateLimit;
		self
	}

	initializeFromDictionary { :self :aDictionary |
		self.initializeSlots(
			aDictionary::name,
			aDictionary::description,
			aDictionary::tuning,
			aDictionary::limit,
			aDictionary::degree
		)
	}

	isValid { :self |
		self.degree = self.calculateDegree & {
			self.limit = self.calculateLimit
		}
	}

	latticeVertices { :self |
		self.ratios.collect { :each |
			each.latticeVector(self.limit)
		}
	}

	latticeEdges { :self :vertices |
		| indices = [1 .. self.degree]; |
		[indices, indices].allTuples.select { :each |
			| [i, j] = each; |
			i < j & {
				vertices[i].latticeDistance(vertices[j]) = 1
			}
		}
	}

	limitError { :self |
		self.error('limitError')
	}

	ratios { :self |
		| i1 = self.integerPitches.first; |
		self.integerPitches.collect { :each |
			Fraction(each, i1).normalized
		}
	}

}

+Record {

	JiTuning { :self |
		newJiTuning().initializeFromDictionary(self)
	}

}

+Array {

	JiTuning { :self |
		newJiTuning().initialize(
			'',
			'',
			self
		)
	}

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
