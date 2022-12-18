+ @Numeric {

	AmpDb { :self |
		self.log10 * 20
	}

	coin { :self |
		randomFloat() < self
	}

	CpsMidi { :self |
		(self * (1 / 440)).log2 * 12 + 69
	}

	DbAmp { :self |
		10 ** (self * 0.05)
	}

	DifSqr { :self :aNumber |
		(self * self) - (aNumber * aNumber)
	}

	Hypot { :self :aNumber |
		((self * self) + (aNumber * aNumber)).sqrt
	}

	Hypotx { :self :aNumber |
		self.abs + aNumber.abs - ((2.sqrt - 1) * self.abs.min(aNumber.abs))
	}

	expRand { :self :upperBound |
		1.randomFloat.linExpFromTo(self, upperBound)
	}

	foldOnce { :self :lo :hi |
		if(self >= hi) {
			hi + hi - self
		} {
			if(self < lo) {
				lo + lo - self
			} {
				if(self = hi) {
					lo
				} {
					self
				}
			}
		}
	}

	fold { :self :lo :hi |
		if(self >= lo & { self < hi }) {
			self
		} {
			|
				x = self - lo,
				range = hi - lo,
				twiceRange = range + range,
				c = x - (twiceRange * (x / twiceRange).floor);
			|
			(c >= range).ifTrue {
				c := twiceRange - c
			};
			c + lo
		}
	}

	linExpFromTo { :self :lo :hi |
		lo * ((hi / lo).log * self).exp
	}

	LinLin { :self :srclo :srchi :dstlo :dsthi |
		|
			mul = (dsthi - dstlo) / (srchi - srclo),
			add = dstlo - (scale * srclo);
		|
		MulAdd(self, mul, add)
	}

	MidiCps { :self |
		440 * (2 ** ((self - 69) * (1 / 12)))
	}

	MulAdd { :self :mul :add |
		self * mul + add
	}

}

