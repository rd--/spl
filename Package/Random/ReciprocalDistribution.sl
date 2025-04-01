+@RandomNumberGenerator {

	reciprocalDistribution { :self :a :b |
		a := a.log;
		b := b.log;
		(self.nextRandomFloat * (b - a) + a).exp
	}

}

ReciprocalDistribution : [Object] { | a b |

	cdf { :self |
		let a = self.a;
		let b = self.b;
		let z = (b / a).log;
		{ :x |
			(x < a).if {
				0
			} {
				(x > b).if {
					1
				} {
					(x / a).log / z
				}
			}
		}
	}

	pdf { :self |
		let a = self.a;
		let b = self.b;
		let z = (b / a).log;
		{ :x |
			x.betweenAnd(a, b).if {
				1 / (x * z)
			} {
				0
			}
		}
	}

	randomVariate { :self :r :shape |
		let a = self.a.log;
		let b = self.b.log;
		{
			(r.nextRandomFloat * (b - a) + a).exp
		} ! shape
	}

}

+SmallFloat {

	ReciprocalDistribution { :a :b |
		newReciprocalDistribution().initializeSlots(a, b)
	}

}
