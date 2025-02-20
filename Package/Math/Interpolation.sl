+[SmallFloat, List] {

	bilinearInterpolation { :q11 :q21 :q12 :q22 :mu1 :mu2 |
		linearInterpolation(
			linearInterpolation(q11, q21, mu1),
			linearInterpolation(q12, q22, mu1),
			mu2
		)
	}

	blend { :y1 :y2 :mu |
		y1.blend(y2, mu) { :y1 :y2 :mu |
			y1 + (mu * (y2 - y1))
		}
	}

	blend { :y1 :y2 :mu :aBlock:/3 |
		mu.isSequence.if {
			mu.collect { :each |
				y1.blend(y2, each, aBlock:/3)
			}
		} {
			aBlock(y1, y2, mu)
		}
	}

	catmullRomInterpolation { :y0 :y1 :y2 :y3 :mu |
		let a0 = (-0.5 * y0) + (1.5 * y1) - (1.5 * y2) + (0.5 * y3);
		let a1 = y0 - (2.5 * y1) + (2 * y2) - (0.5 * y3);
		let a2 = (-0.5 * y0) + (0.5 * y2);
		let a3 = y1;
		let mu2 = mu * mu;
		let mu3 = mu2 * mu;
		(a0 * mu3) + (a1 * mu2) + (a2 * mu) + a3
	}

	cosineInterpolation { :y1 :y2 :mu |
		let x = (1 - mu.pi.cos) / 2;
		(y1 * (1 - x)) + (y2 * x)
	}

	cubicInterpolation { :y0 :y1 :y2 :y3 :mu |
		let a0 = y3 - y2 - y0 + y1;
		let a1 = y0 - y1 - a0;
		let a2 = y2 - y0;
		let a3 = y1;
		let mu2 = mu * mu;
		let mu3 = mu2 * mu;
		(a0 * mu3) + (a1 * mu2) + (a2 * mu) + a3
	}

	hermiteInterpolation { :y0 :y1 :y2 :y3 :mu |
		let c0 = y1;
		let c1 = 0.5 * (y2 - y0);
		let c3 = (1.5 * (y1 - y2)) + (0.5 * (y3 - y0));
		let c2 = y0 - y1 + c1 - c3;
		((c3 * mu + c2) * mu + c1) * mu + c0
	}

	hermiteInterpolation { :tension :bias |
		{ :y0 :y1 :y2 :y3 :mu |
			hermiteInterpolation(y0, y1, y2, y3, mu, tension, bias)
		}
	}

	hermiteInterpolation { :y0 :y1 :y2 :y3 :mu :tension :bias |
		let mu2 = mu * mu;
		let mu3 = mu2 * mu;
		let m0 = ((y1 - y0) * (1 + bias) * (1 - tension) / 2) + ((y2 - y1) * (1 - bias) * (1 - tension) / 2);
		let m1 = ((y2 - y1) * (1 + bias) * (1 - tension) / 2) + ((y3 - y2) * (1 - bias) * (1 - tension) / 2);
		let a0 = (2 * mu3) - (3 * mu2) + 1;
		let a1 = mu3 - (2 * mu2) + mu;
		let a2 = mu3 - mu2;
		let a3 = (-2 * mu3) + (3 * mu2);
		(a0 * y1) + (a1 * m0) + (a2 * m1) + (a3 * y2)
	}

	linearInterpolation { :y1 :y2 :mu |
		(y1 * (1 - mu)) + (y2 * mu)
	}

}

+List {

	akimaInterpolatorCoefficientList { :x :y |
		/* https://github.com/chdh/commons-math-interpolation */
		let n = x.size - 1;
		let differences = List(n);
		let weights = List(n);
		let firstDerivative = List(n + 1);
		let epsilon = 1.smallFloatEpsilon;
		let differentiateThreePoint = { :i :j1 :j2 :j3 |
			let x0 = y[j1];
			let x1 = y[j2];
			let x2 = y[j3];
			let t = x[i] - x[j1];
			let t1 = x[j2] - x[j1];
			let t2 = x[j3] - x[j1];
			let a = (x2 - x0 - (t2 / t1 * (x1 - x0))) / ((t2 * t2) - (t1 * t2));
			let b = (x1 - x0 - (a * t1 * t1)) / t1;
			(2 * a * t) + b
		};
		assertIsValidInterpolatorData(x, y, 5);
		1.toDo(n) { :i |
			differences[i] := (y[i + 1] - y[i]) / (x[i + 1] - x[i])
		};
		2.toDo(n) { :i |
			weights[i] := abs(differences[i] - differences[i - 1])
		};
		3.toDo(n - 1) { :i |
			let wP = weights[i + 1];
			let wM = weights[i - 1];
			(abs(wP) < epsilon & { abs(wM) < epsilon }).if {
				let xv = x[i];
				let xvP = x[i + 1];
				let xvM = x[i - 1];
				firstDerivative[i] := (((xvP - xv) * differences[i - 1]) + (((xv - xvM) * differences[i])) / (xvP - xvM))
			} {
				firstDerivative[i] := ((wP * differences[i - 1]) + (wM * differences[i])) / (wP + wM)
			}
		};
		firstDerivative[1] := differentiateThreePoint(1, 1, 2, 3);
		firstDerivative[2] := differentiateThreePoint(2, 1, 2, 3);
		firstDerivative[n] := differentiateThreePoint(n, n - 1, n, n + 1);
		firstDerivative[n + 1] := differentiateThreePoint(n + 1, n - 1, n, n + 1);
		hermiteInterpolatorCoefficientList(x, y, firstDerivative)
	}

	akimaInterpolator { :x :y |
		let c = x.akimaInterpolatorCoefficientList(y);
		let xCopy = x.copy;
		{ :mu |
			xCopy.evaluateInterpolatorSegment(c, mu)
		}
	}

	assertIsValidInterpolatorData { :x :y :n |
		(x.size ~= y.size).ifTrue {
			x.error('Interpolator: dimension mismatch')
		};
		(x.size < n).ifTrue {
			x.error('Interpolator: number of points is too small')
		};
		x.isStrictlyIncreasing.ifFalse {
			x.error('Interpolator: x not strictly increasing')
		}
	}

	cubicSplineInterpolatorCoefficientList { :x :y |
		/* https://github.com/chdh/commons-math-interpolation */
		let n = x.size - 1;
		let h = List(n);
		let mu = List(n);
		let z = List(n + 1);
		let b = List(n);
		let c = List(n + 1);
		let d = List(n);
		assertIsValidInterpolatorData(x, y, 3);
		1.toDo(n) { :i |
			h[i] := x[i + 1] - x[i]
		};
		mu[1] := 0;
		z[1] := 0;
		2.toDo(n) { :i |
			let g = (2 * (x[i + 1] - x[i - 1])) - (h[i - 1] * mu[i - 1]);
			mu[i] := h[i] / g;
			z[i] := (3 * ((y[i + 1] * h[i - 1]) - (y[i] * (x[i + 1] - x[i - 1])) + (y[i - 1] * h[i])) / (h[i - 1] * h[i]) - (h[i - 1] * z[i - 1])) / g
		};
		z[n + 1] := 0;
		c[n + 1] := 0;
		n.downToDo(1) { :i |
			let dx = h[i];
			let dy = y[i + 1] - y[i];
			c[i] := z[i] - (mu[i] * c[i + 1]);
			b[i] := (dy / dx) - (dx * (c[i + 1] + (2 * c[i])) / 3);
			d[i] := (c[i + 1] - c[i]) / (3 * dx)
		};
		(1 .. n).collect { :i |
			[y[i], b[i], c[i], d[i]].withoutTrailingZeros
		}
	}

	cubicSplineInterpolator { :x :y |
		let c = x.cubicSplineInterpolatorCoefficientList(y);
		let xCopy = x.copy;
		{ :mu |
			xCopy.evaluateInterpolatorSegment(c, mu)
		}
	}

	evaluateInterpolatorSegment { :x :c :mu |
		let k = x.size;
		let i = k.binaryDetectIndex { :each |
			x[each] >= mu
		} - 1;
		i := 1.max(i.min(c.size));
		c[i].evaluateUnivariatePolynomial(mu - x[i])
	}

	hermiteInterpolatorCoefficientList { :x :y :firstDerivative |
		let n = x.size - 1;
		assertIsValidInterpolatorData(x, y, 2);
		(x.size ~= firstDerivative.size).ifTrue {
			x.error('hermiteInterpolatorCoefficientList: firstDerivative list invalid')
		};
		(1 .. n).collect { :i |
			let w = x[i + 1] - x[i];
			let w2 = w * w;
			let yv = y[i];
			let yvP = y[i + 1];
			let fd = firstDerivative[i];
			let fdP = firstDerivative[i + 1];
			[
				yv,
				firstDerivative[i],
				(3 * (yvP - yv) / w - (2 * fd) - fdP) / w,
				(2 * (yv - yvP) / w + fd + fdP) / w2
			].withoutTrailingZeros
		}
	}

	linearInterpolatorCoefficientList { :x :y |
		let n = x.size - 1;
		assertIsValidInterpolatorData(x, y, 2);
		(1 .. n).collect { :i |
			let dx = x[i + 1] - x[i];
			let dy = y[i + 1] - y[i];
			let m = dy / dx;
			[y[i], m].withoutTrailingZeros
		}
	}

	linearInterpolator { :x :y |
		let c = x.linearInterpolatorCoefficientList(y);
		let xCopy = x.copy;
		{ :mu |
			xCopy.evaluateInterpolatorSegment(c, mu)
		}
	}

	listInterpolation { :self :aBlock |
		let k = self.size;
		aBlock.numArgs.caseOfOtherwise([
			3 -> {
				{ :x |
					let i = x.integerPart;
					(i = k).if {
						self.last
					} {
						aBlock . (
							self[i],
							self[i + 1],
							x.fractionPart
						)
					}
				}
			},
			5 -> {
				{ :x |
					let i = x.integerPart;
					(i = k).if {
						self.last
					} {
						aBlock . (
							self[(i - 1).max(1)],
							self[i],
							self[i + 1],
							self[(i + 2).min(k)],
							x.fractionPart
						)
					}
				}
			}
		]) {
			self.error('listInterpolation: not 3- or 5- argument block')
		}
	}

	matrixInterpolation { :self :aBlock:/6 |
		let [m, n] = [self.numberOfRows, self.numberOfColumns];
		{ :x :y |
			let i1 = x.integerPart;
			let j1 = y.integerPart;
			let i2 = m.min(i1 + 1);
			let j2 = n.min(j1 + 1);
			aBlock(
				self[i1][j1],
				self[i2][j1],
				self[i1][j2],
				self[i2][j2],
				x.fractionPart,
				y.fractionPart
			)
		}
	}

	nearestNeighborInterpolator { :x :y |
		let xCopy = x.copy;
		let yCopy = y.copy;
		let n = x.size;
		assertIsValidInterpolatorData(x, y, 1);
		(n = 1).if {
			{ :mu |
				yCopy[1]
			}
		} {
			{ :mu |
				let i = n.binaryDetectIndex { :each |
					xCopy[each] >= mu
				};
				(i <= n & { xCopy[i] = mu }).if {
					yCopy[i]
				} {
					(i = 1).if {
						yCopy[1]
					} {
						(i >= n).if {
							yCopy[n]
						} {
							let d = mu - xCopy[i - 1];
							let w = xCopy[i] - xCopy[i - 1];
							(d + d < w).if {
								yCopy[i - 1]
							} {
								yCopy[i]
							}
						}
					}
				}
			}
		}
	}

}

+@Sequence {

	basicDownsampleSteinarsson { :self :threshold |
		<primitive: return sc.downsampleSteinarsson(_self, _threshold);>
	}

	downsample { :self :anInteger |
		(1, 1 + anInteger .. self.size).collect { :each |
			self[each]
		}
	}

	downsampleSteinarsson { :self :threshold |
		self.isVector.if {
			[self.indices, self].transposed.basicDownsampleSteinarsson(threshold)
		} {
			self.basicDownsampleSteinarsson(threshold)
		}
	}

	matrixResample { :self :shape |
		let [m, n] = [self.numberOfRows, self.numberOfColumns];
		let [p, q] = shape;
		let i = (1 -- m).discretize(p);
		let j = (1 -- n).discretize(q);
		self.matrixInterpolation(
			bilinearInterpolation:/6
		).table(i, j)
	}

	resample { :self :newSize |
		let factor = (self.size - 1) / (newSize - 1).max(1);
		0.to(newSize - 1).collect { :each |
			self.atBlend(1 + (each * factor))
		}
	}

	upsample { :self :anInteger |
		let answer = List(self.size * anInteger, 0);
		0.to(self.size - 1).do { :each |
			answer[(each * anInteger) + 1] := self[each + 1]
		};
		answer
	}

}
