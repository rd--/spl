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

JiTuning : [Object] { | name description pitches limit degree |

	cents { :self |
		self.ratios.collect { :each |
			(each.asFloat.RatioMidi * 100).rounded
		}
	}

	initialize { :self :name :description :pitches |
		self.initializeSlots(
			name,
			description,
			pitches,
			self.pitches.collect { :each |
				each.primeFactors.max
			}.max,
			pitches.size
		)
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

	ratios { :self |
		| i1 = self.pitches[1]; |
		self.pitches.collect { :each |
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
		newJiTuning().initialize('', '', self)
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
		self.latticeCoordinates([Point(20, 0), Point(0, 20), Point(4, 3), Point(-3, 4), Point(-1,2)])
	}

}
