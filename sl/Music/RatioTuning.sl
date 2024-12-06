/* Requires: Cache Fraction Tuning */

RatioTuning : [Object, Cache, Tuning] { | name description asRatios octave cache |

	= { :self :anObject |
		anObject.isRatioTuning & {
			self.equalByAtNamedSlots(
				anObject,
				['name' 'description' 'asRatios' 'octave'],
				=
			)
		}
	}

	asCents { :self |
		self.asRatios.collect { :each |
			each.asFloat.log2 * 1200
		}
	}

	asFractions { :self |
		self.asRatios
	}

	asIntegers { :self |
		(self.asRatios / self.asRatios.reduce(gcd:/2)).collect(asInteger:/1)
	}

	intervalMatrix { :self |
		let n = self.asRatios;
		n.withIndexCollect { :p :i |
			n.rotatedLeft(i - 1).collect { :q |
				(q / p).octaveReduced(self.octave)
			}
		}
	}

	isConstantStructure { :self |
		let m = self.intervalMatrix;
		let t = m.transposed;
		let i = m.flatten.nub.reject(isOne:/1);
		i.collect { :each |
			t.collect { :c |
				c.includes(each)
			}.boole.sum
		}.allSatisfy { :k |
			k = 1
		}
	}

	isPythagorean { :self |
		self.limit = 3
	}

	isRational { :self |
		self.asRatios.allSatisfy(isFraction:/1)
	}

	limit { :self |
		self.cached('limit') {
			self.asRatios.primeLimit.max
		}
	}

	limit { :self :anInteger |
		anInteger.isInteger.ifTrue {
			self.cache['limit'] := anInteger
		};
		self
	}

	size { :self |
		self.asRatios.size
	}

	storeString { :self |
		[
			'RatioTuning(',
			[
				self.name,
				self.description,
				self.asRatios,
				self.octave
			].collect(storeString:/1).join(', '),
			')'
		].join('')
	}

}

+String {

	IntegerTuning { :self :description :integers :octave |
		let ratios = integers.collect { :each |
			Fraction(each, integers.first)
		};
		RatioTuning(self, description, ratios, octave)
	}

	RatioTuning { :self :description :ratiosOrIntegers :octave |
		let ratios = ratiosOrIntegers;
		ratios.allSatisfy(isSmallInteger:/1).ifTrue {
			ratios := ratios.collect { :each |
				Fraction(each, ratios.first)
			}
		};
		newRatioTuning().initializeSlots(self, description, ratios, octave, Record())
	}

	RatioTuning { :name :description :ratiosOrIntegers :octave :limit |
		RatioTuning(name, description, ratiosOrIntegers, octave).limit(limit)
	}

}

+List {

	asRatioTuning { :self |
		RatioTuning(
			'Unnamed tuning',
			'Undescribed tuning',
			self,
			2/1
		)
	}

}

+Record {

	asRatioTuning { :self |
		RatioTuning(
			self['name'],
			self['description'],
			self['tuning'],
			self.atIfAbsent('octave') {
				2/1
			},
			self['limit']
		)
	}

}
