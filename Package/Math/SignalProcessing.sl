+SmallFloat {

	aWeightingCurve { :x |
		let a = (12194 ^ 2) * (x ^ 4);
		let b = (x ^ 2) + (20.6 ^ 2);
		let c = (x ^ 2) + (107.7 ^ 2);
		let d = (x ^ 2) + (737.9 ^ 2);
		let e = (x ^ 2) + (12194 ^ 2);
		a / (b * (c * d).sqrt * e)
	}

	bWeightingCurve { :x |
		let a = (12194 ^ 2) * (x ^ 3);
		let b = (x ^ 2) + (20.6 ^ 2);
		let c = (x ^ 2) + (158.5 ^ 2);
		let d = (x ^ 2) + (12194 ^ 2);
		a / (b * c.sqrt * d)
	}

}

+List {

	recurrenceFilter { :c :x :y0 |
		let [a, b] = c;
		let [n, m] = [a.size, b.size];
		let y = List(x.size, 0);
		1.toDo(x.size) { :i |
			let p = (0 .. m - 1).collect { :j |
				b.at(j + 1) * x.atIfAbsent(i - j) { 0 }
			}.sum;
			let q = (0 .. n - 1).collect { :j |
				a.at(j + 1) * y.atIfAbsent(i - j) { y0.at(1 - (i - j)) }
			}.sum;
			y[i] := p - q
		};
		y
	}

	recurrenceFilter { :c :x |
		let k = c.at(1).size - 1;
		c.recurrenceFilter(x, 0 # k)
	}

	unwrapPhase { :self :period |
		let discontinuity = period / 2;
		let high = period / 2;
		let low = 0 - high;
		let dd = self.differences;
		let ph = dd.collect { :each |
			(each.abs < discontinuity).if {
				0
			} {
				let a = ((each - low) % period) + low;
				(a = low & { each > 0 }).if {
					high - each
				} {
					a - each
				}
			}
		};
		self + ([0] ++ ph.prefixSum)
	}

}
