+[SmallFloat, List] {

	bilinearInterpolation { :q11 :q21 :q12 :q22 :mu1 :mu2 |
		linearInterpolation(
			linearInterpolation(q11, q21, mu1),
			linearInterpolation(q12, q22, mu1),
			mu2
		)
	}

	trilinearInterpolation { :c000 :c100 :c010 :c110 :c001 :c101 :c011 :c111 :mu1 :mu2 :mu3 |
		linearInterpolation(
			bilinearInterpolation(c000, c100, c010, c110, mu1, mu2),
			bilinearInterpolation(c001, c101, c011, c111, mu1, mu2),
			mu3
		)
	}

	blend { :y1 :y2 :mu |
		y1.blend(y2, mu) { :y1 :y2 :mu |
			y1 + (mu * (y2 - y1))
		}
	}

	blend { :y1 :y2 :mu :aBlock:/3 |
		mu.isList.if {
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

+[List, Range] {

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

	dividedDifferences { :m |
		let k = m.size;
		let p = [m.collect(second:/1)];
		let i = 1;
		{
			(k - i) > 0
		}.whileTrue {
			let e = p.size;
			let z = [];
			1.toDo(k - i) { :j |
				let a = p[e][j + 1] - p[e][j];
				let b = m[j + i][1] - m[j][1];
				z.add(a / b)
			};
			p.add(z);
			i := i + 1
		};
		p
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

	interpolation { :self :method |
		let f:/2 = method.namedInterpolatorFunction;
		self.isVector.if {
			let y = self;
			let x = [1 .. y.size];
			f(x, y)
		} {
			let [x, y] = self.transposed;
			f(x, y)
		}
	}

	interpolation { :self |
		self.interpolation('CubicSpline')
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
		aBlock.numArgs.caseOf([
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

	nearestNeighbourInterpolator { :x :y |
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

	volumeInterpolation { :self :aBlock:/11 |
		let [m, n, o] = self.shape;
		{ :x :y :z |
			let i1 = x.integerPart;
			let j1 = y.integerPart;
			let k1 = z.integerPart;
			let i2 = m.min(i1 + 1);
			let j2 = n.min(j1 + 1);
			let k2 = o.min(k1 + 1);
			aBlock(
				self[i1][j1][k1],
				self[i2][j1][k1],
				self[i1][j2][k1],
				self[i2][j2][k1],
				self[i1][j1][k2],
				self[i2][j1][k2],
				self[i1][j2][k2],
				self[i2][j2][k2],
				x.fractionPart,
				y.fractionPart,
				z.fractionPart
			)
		}
	}

}

+List {

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

	volumeResample { :self :shape |
		let [m, n, o] = self.shape;
		let [p, q, r] = shape;
		let i = (1 -- m).discretize(p);
		let j = (1 -- n).discretize(q);
		let k = (1 -- o).discretize(r);
		self.volumeInterpolation(
			trilinearInterpolation:/11
		).table(i, j, k)
	}

}

+SmallFloat {

	inverseSmoothStep { :x |
		0.5 - ((1 - (2 * x)).arcSin / 3).sin
	}

	nevillesAlgorithm { :x :m |
		let k = m.size;
		let p = [m.collect(second:/1)];
		let i = 1;
		{
			(k - i) > 0
		}.whileTrue {
			let e = p.size;
			let z = [];
			1.toDo(k - i) { :j |
				let a = (x - m[j][1]) * p[e][j + 1];
				let b = (x - m[j + i][1]) * p[e][j];
				let c = m[j + i][1] - m[j][1];
				z.add((a - b) / c)
			};
			p.add(z);
			i := i + 1
		};
		p
	}

}

+[SmallFloat, Fraction] {

	smoothStepFunction { :n |
		{ :x |
			let answer = 0;
			0.toDo(n) { :i |
				let p = binomialPascal(n.negated - 1, i);
				let q = binomialPascal(2 * n + 1, n - i);
				let r = x ^ (n + i + 1);
				answer := answer + (p * q * r)
			};
			answer
		}
	}

	smoothStep { :x |
		x * x * (3 - (2 * x))
	}

	smootherStep { :x |
		x * x * x * (x * (6 * x - 15) + 10)
	}

}

+List {

	simpleLinearRegression { :x :y |
		let n = x.size;
		let sx = x.sum;
		let sy = y.sum;
		let sxx = (x * x).sum;
		let syy = (y * y).sum;
		let sxy = (x * y).sum;
		let xx = sxx - (sx * sx / n);
		let yy = syy - (sy * sy / n);
		let xy = sxy - (sx * sy / n);
		(n < 2 | { xx.abs = 0 }).if {
			x.error('List>>simpleLinearRegression: too few points or infinite slope')
		} {
			let b = xy / xx;
			let a = (sy / n) - (b * sx / n);
			let r = (yy.abs = 0).if {
				1
			} {
				xy / (xx * yy).sqrt
			};
			[a, b, r]
		}
	}

	simpleLinearRegression { :self |
		self.isVector.if {
			let x = [1 .. self.size];
			let y = self;
			x.simpleLinearRegression(y)
		} {
			let [x, y] = self.transposed;
			x.simpleLinearRegression(y)
		}
	}

	theilSenEstimator { :x :y |
		(x.size = y.size).if {
			let k = x.size;
			let slope = [];
			let count = 0;
			let m = nil;
			1.toDo(k) { :i |
				let x1 = x[i];
				let y1 = y[i];
				(i + 1).toDo(k) { :j |
					let x2 = x[j];
					let y2 = y[j];
					(x1 ~= x2).ifTrue {
						slope.add(
							(y2 - y1) / (x2 - x1)
						);
						count := count + 1
					}
				}
			};
			m := slope.median;
			count.postLine;
			[
				(1 .. k).collect { :i | y[i] - (m * x[i]) }.median,
				m
			]
                } {
			xList.error('theilSenEstimator: invalid input')
		}
	}

	theilSenEstimator { :self |
		self.isVector.if {
			theilSenEstimator([1 .. self.size], self)
		} {
			let [x, y] = self.transposed;
			theilSenEstimator(x, y)
		}
	}

}

+String {

	namedInterpolatorFunction { :self |
		self.caseOf([
			{ 'Akima' } -> { akimaInterpolator:/2 },
			{ 'CubicSpline' } -> { cubicSplineInterpolator:/2 },
			{ 'Linear' } -> { linearInterpolator:/2 },
			{ 'NearestNeighbour' } -> { nearestNeighbourInterpolator:/2 }
		]) {
			self.error('interpolatorFunction: unknown method')
		}
	}

}

+List {

	savitzkyGolayFilter { :y :m :w |
		uncheckedSavitzkyGolayFilter(y, m, w).asList
	}

	uncheckedSavitzkyGolayFilter { :y :m :w |
		/* https://github.com/mljs/savitzky-golay-generalized */
		<primitive:
		function getHs(h, center, half, derivative) {
			let hs = 0;
			let count = 0;
			for (let i = center - half; i < center + half; i++) {
				if (i >= 0 && i < h.length - 1) {
					hs += h[i + 1] - h[i];
					count++;
				}
			}
			return (hs / count) ** derivative;
		}
		function gramPoly(i, m, k, s) {
			let Grampoly = 0;
			if (k > 0) {
				Grampoly =
				((4 * k - 2) / (k * (2 * m - k + 1))) *
				(i * gramPoly(i, m, k - 1, s) + s * gramPoly(i, m, k - 1, s - 1)) -
				(((k - 1) * (2 * m + k)) / (k * (2 * m - k + 1))) *
				gramPoly(i, m, k - 2, s);
			} else if (k === 0 && s === 0) {
				Grampoly = 1;
			} else {
				Grampoly = 0;
			}
			return Grampoly;
		}
		function genFact(a, b) {
			let gf = 1;
			if (a >= b) {
				for (let j = a - b + 1; j <= a; j++) {
					gf *= j;
				}
			}
			return gf;
		}
		function weight(i, t, m, n, s) {
			let sum = 0;
			for (let k = 0; k <= n; k++) {
				sum +=
				(2 * k + 1) *
				(genFact(2 * m, k) / genFact(2 * m + k + 1, k + 1)) *
				gramPoly(i, m, k, 0) *
				gramPoly(t, m, k, s);
			}
			return sum;
		}
		function fullWeights(m, n, s) {
			const weights = new Array(m);
			const np = Math.floor(m / 2);
			for (let t = -np; t <= np; t++) {
				weights[t + np] = new Float64Array(m);
				for (let j = -np; j <= np; j++) {
					weights[t + np][j + np] = weight(j, t, np, n, s);
				}
			}
			return weights;
		}
		let ys = _y;
		let xs = 1;
		let windowSize = _w;
		let derivative = 0;
		let polynomial = _m;
		const half = Math.floor(windowSize / 2);
		const np = ys.length;
		const ans = new Float64Array(np);
		const weights = fullWeights(windowSize, polynomial, derivative);
		let hs = xs ** derivative;
		let constantH = true;
		for (let i = 0; i < half; i++) {
			const wg1 = weights[half - i - 1];
			const wg2 = weights[half + i + 1];
			let d1 = 0;
			let d2 = 0;
			for (let l = 0; l < windowSize; l++) {
				d1 += wg1[l] * ys[l];
				d2 += wg2[l] * ys[np - windowSize + l];
			}
			if (constantH) {
				ans[half - i - 1] = d1 / hs;
				ans[np - half + i] = d2 / hs;
			} else {
				hs = getHs(xs, half - i - 1, half, derivative);
				ans[half - i - 1] = d1 / hs;
				hs = getHs(xs, np - half + i, half, derivative);
				ans[np - half + i] = d2 / hs;
			}
		}
		const wg = weights[half];
		for (let i = windowSize; i <= np; i++) {
			let d = 0;
			for (let l = 0; l < windowSize; l++) d += wg[l] * ys[l + i - windowSize];
			if (!constantH) {
				hs = getHs(xs, i - half - 1, half, derivative);
			}
			ans[i - half - 1] = d / hs;
		}
		return ans
		>
	}

}

+List{

	bSplineFunctionPrimitive { :p :d :k :w :t |
		<primitive:
		/* https://github.com/thibauts/b-spline/ */
		let t = _t;
		let degree = _d;
		let points = _p;
		let knots = _k
		let weights = _w;
		let n = points.length;
		let d = points[0].length;
		if(degree < 1) {
			throw new Error('degree must be at least 1 (linear)');
		}
		if(degree > (n-1)) {
			throw new Error('degree must be less than or equal to point count - 1');
		}
		if(!weights) {
			weights = [];
			for(let i=0; i<n; i++) {
				weights[i] = 1;
			}
		}
		if(!knots) {
			knots = [];
			for(let i=0; i<n+degree+1; i++) {
				knots[i] = i;
			}
		} else {
			if(knots.length !== n+degree+1) {
				throw new Error('bad knot vector length');
			}
		}
		let domain = [
			degree,
			knots.length-1 - degree
		];
		let low  = knots[domain[0]];
		let high = knots[domain[1]];
		t = t * (high - low) + low;
		if(t < low || t > high) {
			throw new Error('out of bounds');
		}
		let s = domain[0];
		for(; s<domain[1]; s++) {
			if(t >= knots[s] && t <= knots[s+1]) {
				break;
			}
		}
		let v = [];
		for(let i=0; i<n; i++) {
			v[i] = [];
			for(let j=0; j<d; j++) {
				v[i][j] = points[i][j] * weights[i];
			}
			v[i][d] = weights[i];
		}
		for(let l=1; l<=degree+1; l++) {
			for(let i=s; i>s-degree-1+l; i--) {
				let alpha = (t - knots[i]) / (knots[i+degree+1-l] - knots[i]);
				for(let j=0; j<d+1; j++) {
					v[i][j] = (1 - alpha) * v[i-1][j] + alpha * v[i][j];
				}
			}
		}
		let result = [];
		for(let i=0; i<d; i++) {
			result[i] = v[s][i] / v[s][d];
		}
		return result;
		>
	}

	bSplineFunction { :self :d |
		let n = self.size;
		let m = n - d;
		let k = (0 # d) ++ [0 .. m] ++ (m # d);
		{ :t |
			self.bSplineFunctionPrimitive(d, k, nil, t)
		}
	}

}

+List{

	cubicHermiteFunctionPrimitive { :points :tangents :knots :t |
		<primitive:
		/* https://github.com/thibauts/cubic-hermite-spline */
		let points = _points;
		let tangents = _tangents;
		let n = points.length;
		let d = points[0].length;
		let v = new Array(d);
		let knots = _knots;
		let derivative = false;
		let t = _t;
		let i0, i1, scale;
		if(knots) {
			for(let i=0; i<n-1; i++) {
				if(t >= knots[i] && t <= knots[i+1]) {
					break;
				}
			}
			if(i === n-1) {
				throw new Error('out of bounds');
			}
			i0 = i;
			i1 = i + 1;
			let k0 = knots[i0];
			let k1 = knots[i1];
			scale = k1 - k0;
			t = (t - k0) / scale;
		} else {
			t = t * (n - 1);
			i0 = t|0;
			i1 = i0 + 1;
			if(i0 > n-1) {
				throw new Error('out of bounds');
			}
			if(i0 === n-1) {
				i1 = i0;
			}
			scale = i1 - i0;
			t = (t - i0) / scale;
		}
		let h00, h10, h01, h11;
		if(derivative) {
			let t2 = t * t;
			h00 = 6 * t2 - 6 * t;
			h10 = 3 * t2 - 4 * t + 1;
			h01 = - 6 * t2 + 6 * t;
			h11 = 3 * t2 - 2 * t;
		} else {
			let t2 = t * t;
			let it = 1 - t;
			let it2 = it * it;
			let tt = 2 * t;
			h00 = (1 + tt) * it2;
			h10 = t * it2;
			h01 = t2 * (3 - tt);
			h11 = t2 * (t - 1);
		}
		for(let i=0; i<d; i++) {
			v[i] = h00 * points[i0][i] +
			h10 * tangents[i0][i] * scale +
			h01 * points[i1][i] +
			h11 * tangents[i1][i] * scale;
		}
		return v;
		>
	}

	cubicHermiteFunction { :self :tangents |
		{ :t |
			self.cubicHermiteFunctionPrimitive(tangents, nil, t)
		}
	}

}
