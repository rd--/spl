Superellipse : [Object] { | center a b n |

	area { :self |
		4 * self.a * self.b * (((1 + (1 / self.n)).gamma ^ 2) / (1 + (2 / self.n)).gamma)
	}

	at { :self :theta |
		superellipseFunction(self.a, self.b, self.n).value(theta) + self.center
	}

	atAll { :self :theta |
		theta.collect(
			superellipseFunction(self.a, self.b, self.n)
		) + [self.center]
	}

}

+List {

	Superellipse { :center :a :b :n |
		newSuperellipse().initializeSlots(center, a, b, n)
	}

}

+SmallFloat {

	superellipseFunction { :a :b :n |
		{ :t |
			let m = 2 / n;
			let c = t.cos;
			let s = t.sin;
			let x = (c.abs ^ m) * a * c.sign;
			let y = (s.abs ^ m) * b * s.sign;
			[x, y]
		}
	}

	superformulaFunction { :a :b :m :n1 :n2 :n3 |
		{ :u |
			let p = ((m * u / 4).cos / a).abs ^ n2;
			let q = ((m * u / 4).sin / b).abs ^ n3;
			let r = (p + q) ^ (-1 / n1);
			let x = r * u.cos;
			let y = r * u.sin;
			[x, y]
		}
	}

}
