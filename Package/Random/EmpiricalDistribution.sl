EmpiricalDistribution : [Object, ProbabilityDistribution] { | m k |

	cdf { :self |
		let m = self.m;
		let k = self.k;
		let a = m.associations.sortOn(key:/1);
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
		let m = self.m;
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
		self.m.keys.max
	}

	min { :self |
		self.m.keys.min
	}

	/*
	randomVariate { :self :rng :shape |
		let m = self.m;
		let f:/1 = self.inverseCdf;
		{
			f(rng.nextRandomFloat)
		} ! shape
	}
	*/

	randomVariate { :self :rng :shape |
		let m = self.m;
		let e = m.keys;
		let w = m.values;
		rng.randomWeightedChoice(e, w, shape)
	}

}


+List {

	EmpiricalDistribution { :d |
		let m = Map();
		d.do { :each |
			let e = m.atIfAbsent(each) { 0 };
			m[each] := e + 1
		};
		[m.size, d.size].postLine;
		newEmpiricalDistribution().initializeSlots(m, d.size)
	}

}

+Map {

	EmpiricalDistribution { :self |
		newEmpiricalDistribution().initializeSlots(self, self.values.sum)
	}

}
