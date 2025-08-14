+SmallFloat {

	bakersMap { :a :b |
		let alpha = 0.5;
		let beta = 1 - alpha;
		{ :v |
			let [x, y] = v;
			(y < alpha).if {
				[a * x, y / alpha] % 1
			} {
				[(1 - b) + (b * x), (y - alpha) / beta] % 1
			}
		}
	}

	bakersMap { :c |
		bakersMap(c, c)
	}

	circleMap { :k :omega |
		let a = k / 2.pi;
		{ :theta |
			(theta + omega - (a * (2.pi * theta).sin)) % 1
		}
	}

	cuspMap { :x |
		1 - (2 * x.abs.sqrt)
	}

	deJongMap { :a :b :c :d |
		{ :v |
			let [x, y] = v;
			[
				(a * y).sin - (b * x).cos,
				(c * x).sin - (d * y).cos
			]
		}
	}

	duffingMap { :a :b |
		{ :v |
			let [x, y] = v;
			[
				y,
				(a * y) - (b * x) - (y * y * y)
			]
		}
	}

	dyadicMap { :beta |
		{ :x |
			(beta * x) % 1
		}
	}

	henonAreaPreservingMap { :a |
		let s = a.sin;
		let c = a.cos;
		{ :v |
			let [x, y] = v;
			let m = y - (x * x);
			[
				(x * c) - (m * s),
				(x * s) + (m * c)
			]
		}
	}

	henonMap { :a :b |
		{ :v |
			let [x, y] = v;
			[
				y + 1 - (a * x * x),
				b * x
			]
		}
	}

	ikedaMap { :u |
		{ :v |
			let [x, y] = v;
			let t = 0.4 - (6 / (1 + x.squared + y.squared));
			[
				1 + (u * ((x * t.cos) - (y * t.sin))),
				u * ((x * t.sin) + (y * t.cos))
			]
		}
	}


	logisticMap { :r |
		{ :x |
			r * x * (1 - x)
		}
	}

	martinMap { :a :b :c |
		{ :v |
			let [x, y] = v;
			[
				y - (x.sign * (b * x - c).abs.sqrt),
				a - x
			]
		}
	}

	procacciaSchuster { :u |
		{ :x |
			(x + (u * x.squared)) % 1
		}
	}

	standardMap { :k |
		{ :v |
			let [p, theta] = v;
			let pPrime = (p + (k * theta.sin)) % 2.pi;
			[pPrime, (theta + pPrime) % 2.pi]
		}
	}

	tentMap { :mu |
		{ :x |
			(x < 0.5).if {
				mu * x
			} {
				mu * (1 - x)
			}
		}
	}

}
