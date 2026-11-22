+Float {

	archimedeanSpiral { :a :n |
		{ :theta |
			let r = a * (theta ^ (1.0 / n));
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
			let theta = (2.0 * t) - t.tan;
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
			let theta = t.tan - (2.0 * t);
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
			let r = (2.0 * (a ^ n) * (n * theta).cos).nthRoot(n);
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

	tractrixSpiral { :a |
		{ :t |
			[
				a * cos(t) * cos(t - tan(t)),
				a * cos(t) * sin(t - tan(t))
			]
		}
	}

}

+[Integer, @SmallInteger] {

	diamondSpiral { :self |
		let f = { :n |
			let m = (n + 1L << 3L).integerSquareRoot + 1L >> 1L;
			(m.bitAnd(1L) = 1L).if {
				n - (m.square >> 1)
			} {
				(m.square >> 1L) - n
			}
		};
		0L.toCollect(self - 1L) { :i |
			(i < 1L).if {
				[0L, 0L]
			} {
				let j = (((2L * i - 1L).sqrt + 1L) / 2L).floor;
				let x = f(i);
				let y = f(i - j);
				[x, y]
			}
		}
	}

	squareSpiral { :n :k |
		k.caseOf(
			[
				'Clockwise' -> {
					n.squareSpiral
				},
				'Counterclockwise' -> {
					let m = n - 2;
					let d = 0.toCollect(m) { :i |
						let r = ((4 * i + 1).sqrt.floor.mod(4).pi / 2);
						[r.sin, r.cos.negate].round
					};
					([[0, 0]] ++ d).scanLeft(+)
				},
				'B' -> {
					{ :z |
						let [r, i] = z.realImaginary;
						let w = r.abs.max(i.abs);
						(i = -w).if {
							z + 1
						} {
							(i = w).if {
								z - 1
							} {
								(r = -w).if {
									z - 0J1
								} {
									z + 0J1
								}
							}
						}
					}.nestList(0, n).realImaginary
				},
				'C' -> {
					n.squareSpiralWithFourArms
				}
			]
		)
	}

	squareSpiral { :self |
		let answer = [];
		self.squareSpiralDo { :x :y |
			answer.add!([x, y])
		};
		answer
	}

	squareSpiralDo { :self :f/2 |
		let [x, y, i, j, m, n, c] = [0L, 0L, 0L, 0L, 0L, 0L, 0L];
		0L.toDo(self - 1L) { :k |
			f(x, y);
			(n = 0L).ifTrue {
				c := c + 1L;
				(c > 3L).ifTrue { c := 0L };
				(c = 0L).ifTrue { i := 0L; j := 1L };
				(c = 1L).ifTrue { i := 1L; j := 0L };
				(c = 2L).ifTrue { i := 0L; j := -1L };
				(c = 3L).ifTrue { i := -1L; j := 0L };
				[1L 3L].includes(c).ifTrue { m := m + 1L };
				n := m
			};
			n := n - 1L;
			x := x + i;
			y := y + j
		}
	}

	squareSpiralRank { :x :y :o |
		(y >= x.abs).if {
			4L * y.square - y - x
		} {
			(-x >= y.abs).if {
				4L * x.square - x - y
			} {
				(-y >= x.abs).if {
					(4L * y - 3L) * y + x
				} {
					(4L * x - 3L) * x + y
				}
			}
		} + o
	}

	squareSpiralRank { :x :y |
		squareSpiralRank(x, y, 1L)
	}

	squareSpiralUnrank { :n |
		let m = (n - 1L).integerSquareRoot;
		let k = m.ceilingDivide(2L);
		n := n - 1L - (4L * k.square);
		(n < 0L).if {
			(n < -m).if {
				[k, 3L * k + n]
			} {
				[-k - n, k]
			}
		} {
			(n < m).if {
				[-k, k - n]
			} {
				[n - (3L * k), -k]
			}
		}
	}

	squareSpiralWithFourArms { :self |
		0L.toCollect(self - 1L) { :n |
			let s = n.integerSquareRoot;
			let r = n - s.square;
			(r > s).ifTrue {
				s := s + 1L;
				r := r - (2 * s - 1L)
			};
			(r - s.I) * (1.I ^ s)
		}.realImaginary
	}

	triangularSpiral { :self |
		let x = 0L.to(self - 1L).collect { :n |
			let m = n.sqrt.ceiling;
			(-1L ^ (m + 1L)) * (0L - m.square + m + n)
		};
		let y = 0L.to(self - 1L).collect { :n |
			let m = n.sqrt;
			let a = m * 0.max(2L * (m % 2L) - 2L);
			let b = -2L * m * (m % -1L);
			(a.min(b) + (-m / 2).ceiling).floor
		};
		[x, y].transpose
	}

}

+@Collection {

	squareSpiralUnrank { :self |
		self.collect(squareSpiralUnrank/1)
	}

}

+List {

	squareSpiralRank { :self |
		self.atVectorOrElementwise { :v |
			let [x, y] = v;
			squareSpiralRank(x, y, 1L)
		}
	}

}
