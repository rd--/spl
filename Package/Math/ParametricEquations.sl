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

	catenaryCurve { :a |
		{ :theta |
			[
				theta,
				a * (theta / a).cosh
			]
		}
	}

	cleliaCurve { :r :c |
		{ :theta |
			[
				r * theta.cos * (c * theta).cos,
				r * theta.cos * (c * theta).sin,
				r * theta.sin
			]
		}
	}

	cochleoid { :a |
		{ :theta |
			(theta = 0).if {
				[1, 0]
			} {
				let r = (a * theta.sin) / theta;
				[r, theta].fromPolarCoordinates
			}
		}
	}

	epicycloid { :a :b |
		epitrochoid(a, b, b)
	}

	epitrochoid { :a :b :h |
		{ :theta |
			let p = a + b;
			let q = p / b;
			[
				(p * theta.cos) - (h * (q * theta).cos),
				(p * theta.sin) - (h * (q * theta).sin)
			]
		}
	}

	foliumOfDescartes { :a |
		{ :theta |
			let r = (3 * a * theta.sin * theta.cos) / (theta.sin.cubed + theta.cos.cubed);
			[r, theta].fromPolarCoordinates
		}
	}

	hippopede { :a :b |
		{ :theta |
			let r = 2 * (a - (b * (theta.sin ^ 2))).sqrt.real;
			[r, theta].fromPolarCoordinates
		}
	}

	hypocycloid { :a :b |
		hypotrochoid(a, b, b)
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

	rhodonea { :a :n |
		{ :theta |
			let r = a * (n * theta).cos;
			[r, theta].fromPolarCoordinates
		}
	}

	serpentineCurve { :a :b |
		{ :theta |
			[
				a * theta.cotangent,
				b * theta.sin * theta.cos
			]
		}
	}

	superellipseCurve { :a :b :n |
		{ :t |
			let m = 2 / n;
			let c = t.cos;
			let s = t.sin;
			let x = (c.abs ^ m) * a * c.sign;
			let y = (s.abs ^ m) * b * s.sign;
			[x, y]
		}
	}

	superformulaCurve { :a :b :m :n1 :n2 :n3 |
		{ :u |
			let p = ((m * u / 4).cos / a).abs ^ n2;
			let q = ((m * u / 4).sin / b).abs ^ n3;
			let r = (p + q) ^ (-1 / n1);
			let x = r * u.cos;
			let y = r * u.sin;
			[x, y]
		}
	}

	trisectrixOfMaclaurin { :a |
		{ :theta |
			let r = (a / 2) * ((4 * theta.cos) - theta.secant);
			[r, theta].fromPolarCoordinates
		}
	}

}
