+@Number {

	archimedeanSpiral { :a :n |
		{ :theta |
			let r = a * (theta ^ (1 / n));
			[r, theta].fromPolarCoordinates
		}
	}

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

	eulerSpiral { :theta |
		[theta.fresnelC, theta.fresnelS]
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

	logarithmicSpiral { :a :b |
		{ :theta |
			let r = a * (b * theta).exp;
			[r, theta].fromPolarCoordinates
		}
	}

	rhodonea { :a :n |
		{ :theta |
			let r = a * (n * theta).cos;
			[r, theta].fromPolarCoordinates
		}
	}

	satelliteCurve { :r :alpha :k |
		{ :theta |
			let x = r * ((alpha.cos * theta.cos * (k * theta).cos) - (theta.sin * (k * theta).sin));
			let y = r * ((alpha.cos * theta.sin * (k * theta).cos) + (theta.cos * (k * theta).sin));
			let z = r * alpha.sin * (k * theta).cos;
			[x, y, z]
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

	sphericalTrochoid { :omega :a :b :d |
		let q = a / b;
		let i = omega.cos;
		let j = omega.sin;
		{ :theta |
			let p = a - (b * i) + (d * i * (q * theta).cos);
			let x = (p * theta.cos) + (d * theta.sin * (q * theta).sin);
			let y = (p * theta.sin) - (d * theta.cos * (q * theta).sin);
			let z = j * (b - (d * (q * theta).cos));
			[x, y, z]
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
