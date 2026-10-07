/* Requires: Cache Fraction ScalaTuning Tuning */

RatioTuning : [Object, Store, Equal, Cache, Tuning] {

	| name description ratios octave cache |

	cents { :self |
		self.ratios.collect { :each |
			each.log2 * 1200
		}
	}

	equalBy { :self :anObject :aBlock/2 |
		anObject.isRatioTuning & {
			self.equalByAtNamedSlots(
				anObject,
				['name' 'description' 'ratios' 'octave'],
				aBlock/2
			)
		}
	}

	integers { :self |
		(self.ratios / self.ratios.reduce(gcd/2)).collect(Integer/1)
	}

	intervalMatrix { :self |
		let n = self.ratios;
		n.withIndexCollect { :p :i |
			n.rotateLeft(i - 1).collect { :q |
				(q / p).octaveReduce(self.octave)
			}
		}
	}

	isConstantStructure { :self |
		let m = self.intervalMatrix;
		let t = m.transpose;
		let i = m.flatten.nub.reject(isOne/1);
		i.collect { :each |
			t.collect { :c |
				c.includes(each)
			}.boole.sum
		}.allSatisfy { :k |
			k = 1
		}
	}

	isPythagorean { :self |
		self.primeLimit = 3
	}

	isRational { :self |
		self.ratios.allSatisfy(isFraction/1)
	}

	primeLimit { :self |
		self.cached('primeLimit') {
			self.ratios.primeLimit.max
		}
	}

	primeLimit { :self :anInteger |
		anInteger.isInteger.if {
			self.cache['primeLimit'] := anInteger
		} {
			self.error('primeLimit: invalid limit')
		};
		self
	}

	ratiosWithOctave { :self |
		self.ratios ++ [self.octave]
	}

	size { :self |
		self.ratios.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlotsOmitting(['cache'])
	}

}

+String {

	RatioTuning { :self :description :ratiosOrIntegers :octave |
		let ratios = ratiosOrIntegers;
		ratios.anySatisfy(isFraction/1).ifFalse {
			ratios := ratios.collect { :each |
				Fraction(each, ratios.first)
			}
		};
		newRatioTuning().initializeSlots(self, description, ratios, octave, Record())
	}

	RatioTuning { :name :description :ratiosOrIntegers :octave :primeLimit |
		RatioTuning(name, description, ratiosOrIntegers, octave).primeLimit(primeLimit)
	}

}

+List {

	RatioTuning { :self |
		RatioTuning(
			'*Unnamed tuning*',
			'*Undescribed tuning*',
			self,
			2/1
		)
	}

}

+ScalaTuning {

	RatioTuning { :self |
		RatioTuning(
			self.name,
			self.description,
			self.ratios,
			self.octave,
			self.primeLimit
		)
	}

}
