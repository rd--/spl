+SmallFloat {

	archimedeanSpiral { :a :n |
		{ :theta |
			let r = a * (theta ^ (1 / n));
			[r, theta].fromPolarCoordinates
		}
	}

	eulerSpiral { :theta |
		[theta.fresnelC, theta.fresnelS]
	}

	galileanSpiral { :a :b |
		{ :theta |
			let rho = (b * theta.square) - a;
			[rho theta].fromPolarCoordinates
		}
	}

	hyperbolicSpiral { :a |
		{ :theta |
			let r = a / theta;
			[r, theta].fromPolarCoordinates
		}
	}

	inverseNorwichSpiral { :a |
		{ :t |
			let rho = a * t.cos.square;
			let theta = (2 * t) - t.tan;
			[rho theta].fromPolarCoordinates
		}
	}

	logarithmicSpiral { :a :b |
		{ :theta |
			let r = a * (b * theta).exp;
			[r, theta].fromPolarCoordinates
		}
	}

	norwichSpiral { :a |
		{ :t |
			let rho = a / t.cos.square;
			let theta = t.tan - (2 * t);
			[rho theta].fromPolarCoordinates
		}
	}

	seiffertsSpiral { :m |
		let k = m.sqrt;
		{ :s |
			let rho = jacobiSn(s, m);
			let theta = k * s;
			let z = jacobiCn(s, m);
			[rho theta z].fromCylindricalCoordinates
		}
	}

	sinusoidalSpiral { :n :a |
		{ :theta |
			let r = (2 * (a ^ n) * (n * theta).cos).nthRoot(n);
			[r theta].fromPolarCoordinates
		}
	}

	sphericalSpiral { :a |
		{ :t |
			let c = (t * a).arcTan;
			let d = c.cos;
			let x = t.cos * d;
			let y = t.sin * d;
			let z = c.sin.-;
			[x, y, z]
		}
	}

	squareSpiralDo { :self :f:/2 |
		let [x, y, i, j, m, n, c] = [0, 0, 0, 0, 0, 0, 0];
		0.toDo(self - 1) { :k |
			f(x, y);
			(n = 0).ifTrue {
				c := c + 1;
				(c > 3).ifTrue { c := 0 };
				(c = 0).ifTrue { i := 0; j := 1 };
				(c = 1).ifTrue { i := 1; j := 0 };
				(c = 2).ifTrue { i := 0; j := -1 };
				(c = 3).ifTrue { i := -1; j := 0 };
				[1 3].includes(c).ifTrue { m := m + 1 };
				n := m
			};
			n := n - 1;
			x := x + i;
			y := y + j
		}
	}

	squareSpiral { :self |
		let answer = [];
		self.squareSpiralDo { :x :y |
			answer.add([x, y])
		};
		answer
	}

	tractrixSpiral { :a |
		{ :t |
			[
				a * cos(t) * cos(t - tan(t)),
				a * cos(t) * sin(t - tan(t))
			]
		}
	}

}

