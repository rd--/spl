+Block {

	gradientDescentMethod { :f:/1 :x :alpha :tolerance |
		let gradientOf = { :p |
			let [x, y] = p;
			let a = 2 * (x - 1) * (-1 * y * y).exp;
			let b = 4 * x * (-2 * x * x).exp * y * (y + 2);
			let c = -2 * (x - 1) * (x - 1) * y * (-1 * y * y).exp;
			let d = (-2 * x * x).exp * (y + 2);
			let e = (-2 * x * x).exp * y;
			[a - b, c + d + e]
		};
		let n = x.size;
		let g0 = f(x);
		let fi = gradientOf(x);
		let delG = 0;
		let b = nil;
		1.toDo(n) { :i |
			delG := delG + (fi[i] * fi[i])
		};
		delG := delG.sqrt;
		b := alpha / delG;
		{ delG > tolerance }.whileTrue {
			let g1 = nil;
			1.toDo(n) { :i |
				x[i] := x[i] - (b * fi[i])
			};
			fi := gradientOf(x);
			delG := 0;
			1.toDo(n) { :i |
				delG := delG + (fi[i] * fi[i])
			};
			delG := delG.sqrt;
			b := alpha / delG;
			g1 := f(x);
			(g1 > g0).if {
				alpha := alpha / 2
			} {
				g0 := g1
			}
		};
		x
	}

	nelderMeadMethod { :f:/1 :x0 :parameters |
		/* https://github.com/benfred/fmin */
		<primitive:
		const f = _f_1;
		const x0 = _x0;
		let parameters = _parameters || {};
		function weightedSum(ret, w1, v1, w2, v2) {
			for (let j = 0; j < ret.length; ++j) {
				ret[j] = w1 * v1[j] + w2 * v2[j];
			}
		}
		const maxIterations = parameters.maxIterations || x0.length * 200;
		const nonZeroDelta = parameters.nonZeroDelta || 1.05;
		const zeroDelta = parameters.zeroDelta || 0.001;
		const minErrorDelta = parameters.minErrorDelta || 1e-6;
		const minTolerance = parameters.minTolerance || 1e-5;
		const rho = parameters.rho !== undefined ? parameters.rho : 1;
		const chi = parameters.chi !== undefined ? parameters.chi : 2;
		const psi = parameters.psi !== undefined ? parameters.psi : -0.5;
		const sigma = parameters.sigma !== undefined ? parameters.sigma : 0.5;
		let maxDiff;
		const N = x0.length;
		const simplex = new Array(N + 1);
		simplex[0] = x0;
		simplex[0].fx = f(x0);
		simplex[0].id = 0;
		for (let i = 0; i < N; ++i) {
			const point = x0.slice();
			point[i] = point[i] ? point[i] * nonZeroDelta : zeroDelta;
			simplex[i + 1] = point;
			simplex[i + 1].fx = f(point);
			simplex[i + 1].id = i + 1;
		}
		function updateSimplex(value) {
			for (let i = 0; i < value.length; i++) {
				simplex[N][i] = value[i];
			}
			simplex[N].fx = value.fx;
		}
		const sortOrder = (a, b) => a.fx - b.fx;
		const centroid = x0.slice();
		const reflected = x0.slice();
		const contracted = x0.slice();
		const expanded = x0.slice();
		for (let iteration = 0; iteration < maxIterations; ++iteration) {
			simplex.sort(sortOrder);
			if (parameters.history) {
				const sortedSimplex = simplex.map((x) => {
					const state = x.slice();
					state.fx = x.fx;
					state.id = x.id;
					return state;
				});
				sortedSimplex.sort((a, b) => a.id - b.id);
				parameters.history.push({
					x: simplex[0].slice(),
					fx: simplex[0].fx,
					simplex: sortedSimplex,
				});
			}
			maxDiff = 0;
			for (let i = 0; i < N; ++i) {
				maxDiff = Math.max(maxDiff, Math.abs(simplex[0][i] - simplex[1][i]));
			}
			if (Math.abs(simplex[0].fx - simplex[N].fx) < minErrorDelta && maxDiff < minTolerance) {
				break;
			}
			for (let i = 0; i < N; ++i) {
				centroid[i] = 0;
				for (let j = 0; j < N; ++j) {
					centroid[i] += simplex[j][i];
				}
				centroid[i] /= N;
			}
			const worst = simplex[N];
			weightedSum(reflected, 1 + rho, centroid, -rho, worst);
			reflected.fx = f(reflected);
			if (reflected.fx < simplex[0].fx) {
				weightedSum(expanded, 1 + chi, centroid, -chi, worst);
				expanded.fx = f(expanded);
				if (expanded.fx < reflected.fx) {
					updateSimplex(expanded);
				} else {
					updateSimplex(reflected);
				}
			} else if (reflected.fx >= simplex[N - 1].fx) {
				let shouldReduce = false;
				if (reflected.fx > worst.fx) {
					weightedSum(contracted, 1 + psi, centroid, -psi, worst);
					contracted.fx = f(contracted);
					if (contracted.fx < worst.fx) {
						updateSimplex(contracted);
					} else {
						shouldReduce = true;
					}
				} else {
					weightedSum(contracted, 1 - psi * rho, centroid, psi * rho, worst);
					contracted.fx = f(contracted);
					if (contracted.fx < reflected.fx) {
						updateSimplex(contracted);
					} else {
						shouldReduce = true;
					}
				}
				if (shouldReduce) {
					if (sigma >= 1) {
						break;
					}
					for (let i = 1; i < simplex.length; ++i) {
						weightedSum(simplex[i], 1 - sigma, simplex[0], sigma, simplex[i]);
						simplex[i].fx = f(simplex[i]);
					}
				}
			} else {
				updateSimplex(reflected);
			}
		}
		simplex.sort(sortOrder);
		return { fx: simplex[0].fx, x: simplex[0] };
		>
	}

	nelderMeadMethod { :f:/1 :x0 |
		nelderMeadMethod(f:/1, x0, (:))
	}

}

+SmallFloat {

	ackleyFunction { :a :b :c |
		{ :x |
			let d = x.size;
			let p = -1 * a * exp(-1 * b * sqrt((1 / d) * sum(x * x)));
			let q = -1 * exp((1 / d) * sum(cos(c * x)));
			p + q + a + exp(1)
		}
	}

	himmelblausFunction { :x :y |
		(x.square + y - 11).square + (x + y.square - 7).square
	}

	rosenbrockFunction { :a :b |
		{ :x |
			let n = x.size;
			1.to(n - 1).sum { :i |
				100 * (x[i + 1] - x[i].square).square + (1 - x[i]).square
			}
		}
	}

}

+List {

	goldsteinPriceFunction { :v |
		let [x, y] = v;
		let f1 = x + y + 1;
		let f2 = 19 - (14 * x) + (3 * x.square) - (14 * y) + (6 * x * y) + (3 * y.square);
		let f3 = (2 * x) - (3 * y);
		let f4 = 18 - (32 * x) + (12 * x.square) + (48 * y) - (36 * x * y) + (27 * y.square);
		let f5 = 1 + (f1.square * f2);
		let f6 = 30 + (f3.square * f4);
		f5 * f6
	}

	griewankFunction { :x |
		let n = x.size;
		let i = 1.to(n);
		let a = (x ^ 2).sum / 4000;
		let b = (x / i.sqrt).cos.product;
		a - b + 1
	}

	rastriginFunction { :x |
		let n = x.size;
		let a = 10;
		(a * n) + 1.to(n).sum { :i |
			x[i].square - (a * (2.pi * x[i]).cos)
		}
	}

}
