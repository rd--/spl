/* Requires: Cache Fraction Tuning */

RatioTuning : [Object, Cache, Tuning] { | name description ratios octave cache |

	= { :self :anObject |
		anObject.isRatioTuning & {
			self.equalByAtNamedSlots(
				anObject,
				['name' 'description' 'ratios' 'octave'],
				=
			)
		}
	}

	asCents { :self |
		self.ratios.collect { :each |
			each.asFloat.log2 * 1200
		}
	}

	asFractions { :self |
		self.ratios
	}

	asIntegers { :self |
		(self.ratios / self.ratios.reduce(gcd:/2)).collect(asInteger:/1)
	}

	asRatios { :self |
		self.ratios
	}

	intervalMatrix { :self |
		let n = self.ratios;
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
		self.primeLimit = 3
	}

	isRational { :self |
		self.ratios.allSatisfy(isFraction:/1)
	}

	limit { :self |
		self.primeLimit
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

	size { :self |
		self.ratios.size
	}

	storeString { :self |
		[
			'RatioTuning(',
			[
				self.name,
				self.description,
				self.ratios,
				self.octave
			].collect(storeString:/1).join(', '),
			')'
		].join('')
	}

}

+String {

	RatioTuning { :self :description :ratiosOrIntegers :octave |
		let ratios = ratiosOrIntegers;
		ratios.allSatisfy(isSmallInteger:/1).ifTrue {
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

	asRatioTuning { :self |
		RatioTuning(
			'*Unnamed tuning*',
			'*Undescribed tuning*',
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
