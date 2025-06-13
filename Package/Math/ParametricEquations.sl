+@Number {

	botanicCurve { :c :d |
		{ :theta |
			let r = 1 + (d * (c * theta).sin);
			[r, theta].fromPolarCoordinates
		}
	}

	butterflyCurve { :t |
		let a = t.cos.exp;
		let b = 2 * (4 * t).cos;
		let c = (t / 12).sin ^ 5;
		[t.sin, t.cos] * (a - b - c)
	}

	epitrochoid { :b :a :h |
		{ :theta |
			let p = a + b;
			let q = p / b;
			[
				(p * theta.cos) - (h * (q * theta).cos),
				(p * theta.sin) - (h * (q * theta).sin)
			]
		}
	}

	hippopede { :a :b |
		{ :theta |
			let r = 2 * (a - (b * (theta.sin ^ 2))).sqrt.real;
			[r, theta].fromPolarCoordinates
		}
	}

	hypotrochoid { :a :b :h |
		let c = a - b;
		let d = c / b;
		{ :t |
			[
				(c * t.cos) + (h * (t * d).cos),
				(c * t.sin) - (h * (t * d).sin)
			]
		}
	}

	lissajousCurve { :delta :a :b |
		{ :t |
			let x = ((a * t) + delta).sin;
			let y = (b * t).sin;
			[x, y]
		}
	}

}
