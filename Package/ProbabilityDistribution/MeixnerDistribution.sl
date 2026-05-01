MeixnerDistribution : [Object, Equatable, ProbabilityDistribution] { | a b m d |

	pdf { :self |
		let a = self.a;
		let b = self.b;
		let m = self.m;
		let d = self.d;
		let p = 2 ^ (-1 + (2 * d));
		let q = (b / 2).cos ^ (2 * d);
		{ :x |
			let r = (x - m).i / a;
			let s = (p * (b * (x - m) / a).exp * q * (d - r).gamma * (d + r).gamma);
			let t = (a.pi * (2 * d).gamma);
			(s / t).real
		}
	}

}

+[SmallFloat, Symbol] {

	MeixnerDistribution { :a :b :m :d |
		newMeixnerDistribution().initializeSlots(a, b, m, d)
	}

}
