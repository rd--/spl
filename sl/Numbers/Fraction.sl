Fraction : [Object, Magnitude, Numeric] { | numerator denominator |

	= { :self :aFraction |
		aFraction.isFraction & {
			self.numerator = aFraction.numerator & {
				self.denominator = aFraction.denominator
			}
		}
	}

	reduce { :self |
		|
			x = self.numerator * self.denominator.sign,
			y = self.denominator.abs,
			d = x.gcd(y);
		|
		self.numerator := x // d;
		self.denominator := y // d;
		self
	}

}

+ @Integral {

	Fraction { :self :anInteger |
		newFraction().initializeSlots(self, anInteger).reduce
	}

}
