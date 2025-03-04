+SmallFloat{

	deJongAttractor { :a :b :c :d |
		{ :v |
			let [x, y] = v;
			[
				(a * y).sin - (b * x).cos,
				(c * x).sin - (d * y).cos
			]
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

	martinMap { :a :b :c |
		{ :v |
			let [x, y] = v;
			[
				y - (x.sign * (b * x - c).abs.sqrt),
				a - x
			]
		}
	}

}
