EmpiricalDistribution : [Object, ProbabilityDistribution] { | contents k |

	cdf { :self |
		let k = self.k;
		let a = self.contents.sortedElements;
		let n = a.size;
		{ :x |
			let i = 1;
			let z = 0;
			{
				i <= n & {
					a[i].key <= x
				}
			}.whileTrue {
				z := z + a[i].value;
				i := i + 1
			};
			z / k
		}
	}

	inverseCdf { :self |
		let max = self.max;
		let min = self.min;
		let f:/1 = self.cdf;
		{ :p |
			(p = 0).if {
				min
			} {
				(p = 1).if {
					max
				} {
					let high = 2;
					let low = 0 - high;
					let i = 16;
					{
						f(low) > p
					}.whileTrue {
						low := low + low
					};
					{
						f(high) < p
					}.whileTrue {
						high := high + high
					};
					{
						i ~= 0
					}.whileTrue {
						let mid = (high + low) / 2;
						(f(mid) >= p).if {
							high := mid
						} {
							low := mid
						};
						i := i - 1
					};
					(high + low) / 2
				}
			}
		}
	}

	max { :self |
		self.contents.max
	}

	min { :self |
		self.contents.min
	}

	/*
	randomVariate { :self :rng :shape |
		let f:/1 = self.inverseCdf;
		{
			f(rng.nextRandomFloat)
		} ! shape
	}
	*/

	randomVariate { :self :r :shape |
		self.contents.randomChoice(r, shape)
	}

}


+List {

	EmpiricalDistribution { :d |
		newEmpiricalDistribution().initializeSlots(d.asIdentityBag, d.size)
	}

}

+Map {

	EmpiricalDistribution { :self |
		let b = IdentityBag(self);
		newEmpiricalDistribution().initializeSlots(
			b,
			b.sum
		)
	}

}
