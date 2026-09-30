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
				y + 1 - (a * x * x),
				b * x
			]
		}
	}

	ikedaMap { :u |
		{ :v |
			let [x, y] = v;
			let t = 0.4 - (6 / (1 + x.square + y.square));
			[
				1 + (u * ((x * t.cos) - (y * t.sin))),
				u * ((x * t.sin) + (y * t.cos))
			]
		}
	}

	katsuraFukudaMap { :k |
		{ :x |
			let a = 4 * x * (1 - x) * (1 - (k.square * x));
			let b = (1 - (k.square * x.square)).square;
			a / b
		}
	}

	logisticMap { :r |
		{ :x |
			r * x * (1 - x)
		}
	}

	loziMap { :a :b |
		{ :v |
			let [x, y] = v;
			[
				1 - (a * x.abs) + y,
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
			(x + (u * x.square)) % 1
		}
	}

	standardMap { :k |
		{ :v |
			let [p, theta] = v;
			let pPrime = (p + (k * theta.sin)) % 2.pi;
			[pPrime, (theta + pPrime) % 2.pi]
		}
	}

	rulkovMap { :alpha :mu :sigma |
		{ :v |
			let [x, y] = v;
			[
				(alpha / (1 + x.square)) + y,
				y - (mu * (x - sigma))
			]
		}
	}

	/*
	rulkovMapB { :alpha :mu :sigma |
		let f/2 = rulkovNonlinearFunction(alpha);
		{ :v |
			let [x, y] = v;
			[
				f(x, y),
				y - (mu * (x - sigma))
			]
		}
	}
	*/

	rulkovNonlinearFunction { :alpha |
		{ :x :y |
			(x <= 0).if {
				alpha / (1 - x) + y
			} {
				(x < (alpha + y)).if {
					alpha + y
				} {
					-1
				}
			}
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

+List {

	gingerbreadmanMap { :v |
		let [x, y] = v;
		[
			1 - y + x.abs,
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
