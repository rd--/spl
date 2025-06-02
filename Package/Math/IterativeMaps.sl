+SmallFloat {

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
