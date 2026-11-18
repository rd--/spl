+Float {

	bakersMap { :a :b |
		let alpha = 0.5;
		let beta = 1.0 - alpha;
		{ :v |
			let [x, y] = v;
			(y < alpha).if {
				[a * x, y / alpha] % 1.0
			} {
				[(1.0 - b) + (b * x), (y - alpha) / beta] % 1.0
			}
		}
	}

	bakersMap { :c |
		bakersMap(c, c)
	}

	circleMap { :k :omega |
		let a = k / 2.0.pi;
		{ :theta |
			(theta + omega - (a * (2.0.pi * theta).sin)) % 1.0
		}
	}

	cuspMap { :x |
		1.0 - (2.0 * x.abs.sqrt)
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
			(beta * x) % 1.0
		}
	}

	gaussIteratedMap { :alpha :beta |
		{ :x |
			(-alpha * x.square).exp + beta
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
				y + 1.0 - (a * x * x),
				b * x
			]
		}
	}

	ikedaMap { :u |
		{ :v |
			let [x, y] = v;
			let t = 0.4 - (6.0 / (1.0 + x.square + y.square));
			[
				1 + (u * ((x * t.cos) - (y * t.sin))),
				u * ((x * t.sin) + (y * t.cos))
			]
		}
	}

	katsuraFukudaMap { :k |
		{ :x |
			let a = 4.0 * x * (1.0 - x) * (1.0 - (k.square * x));
			let b = (1.0 - (k.square * x.square)).square;
			a / b
		}
	}

	logisticMap { :r |
		{ :x |
			r * x * (1.0 - x)
		}
	}

	loziMap { :a :b |
		{ :v |
			let [x, y] = v;
			[
				1.0 - (a * x.abs) + y,
				b * x
			]
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
			(x + (u * x.square)) % 1.0
		}
	}

	rulkovMap { :alpha :mu :sigma |
		{ :v |
			let [x, y] = v;
			[
				(alpha / (1.0 + x.square)) + y,
				y - (mu * (x - sigma))
			]
		}
	}

	rulkovNonlinearFunction { :alpha |
		{ :x :y |
			(x <= 0.0).if {
				alpha / (1.0 - x) + y
			} {
				(x < (alpha + y)).if {
					alpha + y
				} {
					-1.0
				}
			}
		}
	}

	standardMap { :k |
		{ :v |
			let [p, theta] = v;
			let pPrime = (p + (k * theta.sin)) % 2.0.pi;
			[pPrime, (theta + pPrime) % 2.0.pi]
		}
	}

	tentMap { :mu |
		{ :x |
			(x < 0.5).if {
				mu * x
			} {
				mu * (1.0 - x)
			}
		}
	}

}

+List {

	gingerbreadmanMap { :v |
		let [x, y] = v;
		[
			1.0 - y + x.abs,
			x
		]
	}

}

+String {

	rulkovMap { :k :a :b :c |
		k.caseOf(
			[
				'A' -> { rulkovMapA(a, b, c) },
				'B' -> { rulkovMapB(a, b, c) }
			]
		)
	}

}
