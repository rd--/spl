+List {

	adjugate { :self |
		self.inverse * self.determinant
	}

	antitranspose { :self |
		let [m, n] = self.shape;
		let answer = [];
		n.downToDo(1) { :i |
			let row = [];
			m.downToDo(1) { :j |
				row.add(self[j][i])
			};
			answer.add(row)
		};
		answer
	}

	arrayRules { :self :zero |
		let shape = self.shape;
		let answer = [];
		self.withDeepIndexDo { :each :index |
			(each = zero).ifFalse {
				answer.add(index -> each)
			}
		};
		(self.atPath(shape) = zero).ifTrue {
			answer.add(shape -> zero)
		};
		answer
	}

	bareissAlgorithm { :m |
		valueWithReturn { :return:/1 |
			let n = m.size;
			let sign = 1;
			let prev = 1;
			1.toDo(n) { :i |
				(m[i][i] = 0).ifTrue {
					let swapTo = nil;
					(i + 1).toDo(n) { :j |
						(m[j][i] != 0).ifTrue {
							swapTo := j
						}
					};
					swapTo.ifNil {
						0.return
					} {
						m.swapRows(i, swapTo);
						sign := sign * -1
					}
				};
				(i + 1).toDo(n) { :j |
					(i + 1).toDo(n) { :k |
						m[j][k] := ((m[j][k] * m[i][i]) - (m[j][i] * m[i][k])) // prev
					}
				};
				prev := m[i][i]
			};
			sign * m[n][n]
		}
	}

	cauchyMatrix { :x :y |
		{ :i :j |
			(x[i] + y[j]) ^ -1
		}.table(
			1.to(x.size),
			1.to(y.size)
		)
	}

	choleskyBanachiewiczAlgorithm { :a |
		let [m, n] = a.shape;
		let l = [m, n].zeroMatrix;
		1.toDo(m) { :i |
			1.toDo(i) { :k |
				let sum = 0;
				1.toDo(k) { :j |
					sum := sum + (l[i][j] * l[k][j])
				};
				l[i][k] := (i = k).if {
					(a[i][i] - sum).sqrt
				} {
					1 / l[k][k] * (a[i][k] - sum)
				}
			}
		};
		l
	}

	choleskyDecomposition { :self |
		self.choleskyBanachiewiczAlgorithm
	}

	conjugateGradientMethod { :a :b :x :epsilon :n |
		valueWithReturn { :return:/1 |
			let r = b - a.dot(x);
			let p = r.copy;
			1.toDo(n) { :i |
				let ap = a.dot(p);
				let alpha = p.dot(r) / p.dot(ap);
				x := x + (alpha * p);
				r := b - a.dot(x);
				((r ^ 2).sum.sqrt < epsilon).if {
					x.return
				} {
					let beta = r.dot(ap).negate / p.dot(ap);
					p := r + (beta * p)
				}
			};
			x
		}
	}

	conjugateTranspose { :self |
		self.transpose.conjugate
	}

	cramersRule { :m :d |
		let k = m.size;
		let divisor = m.determinant;
		let numerators = { m.deepCopy } ! k;
		1.toDo(k) { :i |
			1.toDo(k) { :j |
				numerators[i][j][i] := d[j]
			}
		};
		1.to(k).collect { :i |
			numerators[i].determinant / divisor
		}
	}

	crossCovarianceMatrix { :a :b |
		let [n, p] = a.shape;
		let [m, q] = b.shape;
		let l = List(n, 1);
		{ n = m }.assert;
		(1 / (n - 1)) * (a - (*.outer(l, a.mean))).transpose.dot((a - (*.outer(l, a.mean))).conjugate)
	}

	determinant { :self |
		self.isSquareMatrix.if {
			let size = self.size;
			let array = self;
			(size = 2).if {
				(array[1, 1] * array[2, 2]) - (array[1, 2] * array[2, 1])
			} {
				(size = 3).if {
					(array[1, 1] * array[2, 2] * array[3, 3]) +
					(array[1, 2] * array[2, 3] * array[3, 1]) +
					(array[1, 3] * array[2, 1] * array[3, 2]) -
					(array[1, 3] * array[2, 2] * array[3, 1]) -
					(array[1, 2] * array[2, 1] * array[3, 3]) -
					(array[1, 1] * array[2, 3] * array[3, 2])
				} {
					let answer = 0;
					size.iota.plainChangesDo { :p |
						let sign = p.permutationSymbol;
						let entries = p.withIndexCollect { :i :j |
							array[i][j]
						};
						answer := answer + (entries.product * sign)
					};
					answer
				}
			}
		} {
			self.error('List>>determinant: not defined at non-square matrices')
		}
	}

	dot { :self :aList |
		*.inner(self, aList, +)
	}

	eigenvalues { :m :epsilon :n |
		let x = m.deepCopy;
		let i = 0;
		{
			x.isUpperTriangularMatrix.not & { i < n }
		}.whileTrue {
			let [q, r] = x.qrDecomposition;
			x := r.dot(q);
			i := i + 1
		};
		x.diagonal
	}

	eigenvalues { :m |
		m.eigenvalues(1E-15, 100)
	}

	frobeniusCompanionMatrix { :self |
		let n = self.size - 1;
		let w = self.negate / self.last;
		{ :i :j |
			(i = (j + 1)).if {
				1
			} {
				(j = n).if {
					w[i]
				} {
					0
				}
			}
		}.table(1.to(n), 1.to(n))
	}

	frobeniusNorm { :self |
		self.ravel.collect(square:/1).sum.sqrt
	}

	gaussJordanInverse { :self |
		let [m, n] = self.shape;
		let a = [m, m * 2].zeroMatrix;
		let r = [m, n].zeroMatrix;
		(m != n).ifTrue {
			self.error('List>>gaussJordanInverse: matrix is not square')
		};
		1.toDo(m) { :i |
			a[i].replaceFromToWith(1, m, self[i]);
			a[i][m + i] := 1
		};
		a.reducedRowEchelonForm;
		1.toDo(n) { :i |
			1.toDo(n) { :j |
				(a[i][j] != (i = j).boole).if {
					self.error('List>>gaussJordanInverse: matrix is singular')
				} {
					r[i][j] := a[i][m + j]
				}
			}
		};
		r
	}

	gaussianElimination { :m :v |
		let a = m.deepCopy;
		a.withIndexDo { :each :i |
			each.add(v[i])
		};
		a.reducedRowEchelonForm;
		a.collect(last:/1)
	}

	gaussSeidelMethod { :a :b :x :epsilon :maximumIterations |
		let n = a.size;
		valueWithReturn { :return:/1 |
			maximumIterations.timesRepeat {
				let y = x.copy;
				let p = 0;
				let q = 0;
				1.toDo(n) { :i |
					let sum = 0;
					1.toDo(n) { :j |
						(j = i).ifFalse {
							sum := sum + (a[i][j] * x[j])
						}
					};
					x[i] := (b[i] - sum) / a[i][i]
				};
				1.toDo(n) { :i |
					p := p + (x[i] - y[i]).abs;
					q := q + y[i].abs
				};
				(q = 0).ifTrue {
					q := 1
				};
				((p / q) < epsilon).ifTrue {
					x.return
				}
			};
			x
		}
	}

	gaussSeidelMethod { :a :b |
		let x = List(a.size, 0);
		let epsilon = 1E-9;
		let maximumIterations = 100;
		a.gaussSeidelMethod(b, x, epsilon, maximumIterations)
	}

	gramMatrix { :self |
		self.dot(self.transpose)
	}

	gramSchmidtProcess { :self |
		let a = self.deepCopy;
		let [n, m] = a.shape;
		1.toDo(n) { :k |
			a[k] := a[k].normalize;
			(k + 1).toDo(n) { :j |
				a[j] := a[j] - (a[j].dot(a[k]) * a[k])
			}
		};
		a
	}

	hadamardProduct { :aMatrix :anotherMatrix |
		(aMatrix.shape = anotherMatrix.shape).if {
			aMatrix * anotherMatrix
		} {
			self.error('List>>hadamardProduct: unequal shapes')
		}
	}

	hankelMatrix { :c |
		let m = c.size;
		let r = [c.last] ++ List(m - 1, 0);
		hankelMatrix(c, r)
	}

	hankelMatrix { :c :r |
		let m = c.size;
		let n = r.size;
		{ :i :j |
			let k = i + j - 1;
			(k <= m).if {
				c[k]
			} {
				r[k - m + 1]
			}
		}.table(1.to(m), 1.to(n))
	}

	hilbertMatrix { :self |
		let [m, n] = self;
		{ :i :j |
			1 / (i + j - 1)
		}.table(1.to(m), 1.to(n))
	}

	heldKarpAlgorithm { :self |
		<primitive:
		const dist = _self;
		const n = dist.length;
		const subsetCount = 1 << n;
		const dp = Array.from({ length: subsetCount }, () => Array(n).fill(Infinity));
		const parent = Array.from({ length: subsetCount }, () => Array(n).fill(-1));
		dp[1][0] = 0;
		for (let mask = 1; mask < subsetCount; mask++) {
			if ((mask & 1) === 0) {
				continue;
			}
			for (let j = 1; j < n; j++) {
				if ((mask & (1 << j)) === 0) {
					continue;
				}
				const prevMask = mask ^ (1 << j);
				for (let k = 0; k < n; k++) {
					if ((prevMask & (1 << k)) === 0) {
						continue;
					}
					const cost = dp[prevMask][k] + dist[k][j];
					if (cost < dp[mask][j]) {
						dp[mask][j] = cost;
						parent[mask][j] = k;
					}
				}
			}
		}
		const fullMask = subsetCount - 1;
		let minCost = Infinity;
		let lastCity = 0;
		for (let j = 1; j < n; j++) {
			const cost = dp[fullMask][j] + dist[j][0];
			if (cost < minCost) {
				minCost = cost;
				lastCity = j;
			}
		}
		const tour = [];
		let mask = fullMask;
		let curr = lastCity;
		while (curr !== 0) {
			tour.push(curr + 1);
			const p = parent[mask][curr];
			mask ^= 1 << curr;
			curr = p;
		}
		tour.push(1);
		tour.reverse();
		tour.push(1);
		return [minCost, tour];
		>
	}

	homogeneousTranslationMatrix { :self |
		let k = self.size + 1;
		let answer = k.identityMatrix;
		1.toDo(self.size) { :i |
			answer[i][k] := self[i]
		};
		answer
	}

	inverse { :self |
		self.isSquareMatrix.if {
			let n = self.numberOfRows;
			(n = 2).if {
				let [a, b, c, d] = self.catenate;
				let r = 1 / ((a * d) - (b * c));
				let m = [[d, b.-], [c.-, a]];
				r * m
			} {
				let m = self;
				let i = n.identityMatrix;
				let e = (m ++.each i).rowReduce;
				e.collect { :each |
					each.drop(n)
				}
			}
		} {
			self.error('Sequence>>inverse: matrix not square')
		}
	}

	isDiagonallyDominantMatrix { :self :aBlock:/2 |
		let [m, n] = self.shape;
		1.to(m).allSatisfy { :i |
			let x = self[i][i].abs;
			let z = 1.to(n).collect { :j |
				(j = i).if { 0 } { self[i][j].abs }
			}.sum;
			aBlock(x, z)
		}
	}

	isDiagonallyDominantMatrix { :self |
		self.isDiagonallyDominantMatrix(>=)
	}

	isLowerTriangularMatrix { :self :k |
		self.isMatrix & {
			let [r, c] = self.shape;
			1.to(r - k).allSatisfy { :i |
				(i + 1 + k).to(c).allSatisfy { :j |
					self[i][j].isVeryCloseTo(0)
				}
			}
		}
	}

	isLowerTriangularMatrix { :self |
		self.isLowerTriangularMatrix(0)
	}

	isNormalMatrix { :self |
		let a = self;
		let b = a.conjugateTranspose;
		a.dot(b) = b.dot(a)
	}

	isOrthogonalMatrix { :self |
		let [p, q] = self.shape;
		(p >= q).if {
			self.transpose.dot(self).isVeryCloseTo(q.identityMatrix)
		} {
			self.dot(self.transpose).isVeryCloseTo(p.identityMatrix)
		}
	}

	isUnitaryMatrix { :self |
		let [p, q] = self.shape;
		(p >= q).if {
			self.conjugateTranspose.dot(self).isVeryCloseTo(q.identityMatrix)
		} {
			self.dot(self.conjugateTranspose).isVeryCloseTo(p.identityMatrix)
		}
	}

	isUpperTriangularMatrix { :self :k |
		self.isMatrix & {
			let [r, c] = self.shape;
			(2 - k).to(r).allSatisfy { :i |
				1.to(i - 1 + k).allSatisfy { :j |
					self[i][j].isVeryCloseTo(0)
				}
			}
		}
	}

	isUpperTriangularMatrix { :self |
		self.isUpperTriangularMatrix(0)
	}

	kuhnMunkresAlgorithm { :self |
		<primitive:
		const C = _self;
		const J = C.length;
		if (J === 0) {
			throw new Error('kuhnMunkresAlgorithm: empty list');
		}
		const W = C[0].length;
		if (J > W) {
			throw new Error('kuhnMunkresAlgorithm: invalid matrix');
		}
		function arrayOf(k, z) {
			const a = Array(k);
			for(let i = 0; i < k; i++) {
				a[i] = z;
			};
			return a;
		}
		const job = arrayOf(W + 1, -1);
		const ys = arrayOf(J, null);
		const yt = arrayOf(W + 1, null);
		const answers = [];
		const inf = Infinity;
		for (let j_cur = 0; j_cur < J; j_cur++) {
			let w_cur = W;
			job[w_cur] = j_cur;
			const min_to = arrayOf(W + 1, inf);
			const prv = arrayOf(W + 1, -1);
			const in_Z = Array(W + 1);
			while (job[w_cur] !== -1) {
				in_Z[w_cur] = true;
				const j = job[w_cur];
				let delta = inf;
				let w_next = null;
				for (let w = 0; w < W; w++) {
					if (!in_Z[w]) {
						const b = C[j][w] - ys[j] - yt[w];
						if (b < min_to[w]) {
							min_to[w] = b;
							prv[w] = w_cur;
						}
						if (min_to[w] < delta) {
							delta = min_to[w];
							w_next = w;
						}
					}
				}
				for (let w = 0; w <= W; w++) {
					if (in_Z[w]) {
						ys[job[w]] += delta;
						yt[w] -= delta;
					} else {
						min_to[w] -= delta;
					}
				}
				w_cur = w_next;
			}
			for (let w = null; w_cur != W; w_cur = w) {
				w = prv[w_cur];
				job[w_cur] = job[w];
			}
			answers.push(-yt[W]);
		}
		for (let i = 0; i < W; i++) {
			job[i] += 1;
		}
		return [answers, job.slice(0, W)];
		>
	}

	kroneckerProduct { :a :b |
		let m = a.size;
		let n = a[1].size;
		let p = b.size;
		let q = b[1].size;
		let r = m * p;
		let c = n * q;
		let answer = { List(c, 0) } ! r;
		1.toDo(m) { :i |
			1.toDo(n) { :j |
				1.toDo(p) { :k |
					1.toDo(q) { :l |
						answer[p * (i - 1) + k][q * (j - 1) + l] := a[i][j] * b[k][l]
					}
				}
			}
		};
		answer
	}

	lowerTriangularize { :self :k |
		let m = self.assertIsMatrix('List>>lowerTriangularize');
		let [r, c] = m.shape;
		1.toDo(r - k) { :i |
			(i + 1 + k).toDo(c) { :j |
				m[i][j] := 0
			}
		};
		m
	}

	lowerTriangularize { :self |
		self.lowerTriangularize(0)
	}

	luDecompositionPivotMatrix { :m |
		let n = m.size;
		let p = n.identityMatrix;
		1.toDo(n) { :i |
			let max = m[i][i];
			let row = i;
			i.toDo(n) { :j |
				let e = m[j][i];
				(e > max).ifTrue {
					max := e;
					row := j
				}
			};
			(i != row).ifTrue {
				p.swapWith(i, row)
			}
		};
		p
	}

	luDecomposition { :self |
		let m = self.assertIsSquareMatrix('List>>luDecomposition');
		let n = self.size;
		let p = m.luDecompositionPivotMatrix;
		let m2 = p.dot(m);
		let l = n.identityMatrix;
		let u = n.identityMatrix;
		1.toDo(n) { :j |
			1.toDo(j) { :i |
				let sum = 0;
				1.toDo(i - 1) { :k |
					sum := sum + (u[k][j] * l[i][k])
				};
				u[i][j] := m2[i][j] - sum
			};
			j.toDo(n) { :i |
				let sum = 0;
				1.toDo(j - 1) { :k |
					sum := sum + (u[k][j] * l[i][k])
				};
				l[i][j] := (m2[i][j] - sum) / u[j][j]
			}
		};
		[l, u, p]
	}

	matchPairs { :self |
		let [_, i] = self.kuhnMunkresAlgorithm;
		let k = i.size;
		[i, 1.to(k)].transpose.select { :each |
			each[1] != 0
		}
	}

	matrixCorrelation { :a :b |
		a.covariance(b) / *.outer(a.standardDeviation, b.standardDeviation)
	}

	matrixPower { :m :p |
		let [a, b] = m.shape;
		(a = b).if {
			let r = [b, a].zeroMatrix;
			p.caseOf(
				[
					0 -> {
						1.toDo(b) { :i |
							1.toDo(a) { :j |
								(i = j).if {
									r[i][j] := 1
								} {
									r[i][j] := 0
								}
							}
						}
					},
					1 -> {
						1.toDo(b) { :i |
							1.toDo(a) { :j |
								r[i][j] := m[i][j]
							}
						}
					}
				]
			) {
				r := m;
				2.toDo(p) { :i |
					r := r.dot(m)
				}
			};
			r
		} {
			m.error('List>>matrixPower: invalid matrix')
		}
	}

	matrixRank { :self |
		self.rowReduce.count { :each |
			each.allSatisfy { :item |
				item.isVeryCloseTo(0)
			}.not
		}
	}

	minor { :self :i :j |
		let [m, n] = self.shape;
		self.submatrix(
			m.iota.without(i),
			n.iota.without(j)
		).determinant
	}

	minors { :self |
		let [m, n] = self.shape;
		{ :i :j |
			let r = m - i + 1;
			let c = n - j + 1;
			self.submatrix(
				m.iota.without(r),
				n.iota.without(c)
			).determinant
		}.table(1.to(m), 1.to(n))
	}

	orthogonalize { :self |
		self.gramSchmidtProcess
	}

	permanent { :self |
		self.isSquareMatrix.if {
			let size = self.numberOfRows;
			let array = self;
			let answer = 0;
			size.iota.plainChangesDo { :p |
				let sign = p.permutationSymbol;
				let entries = p.withIndexCollect { :i :j |
					array[i][j]
				};
				answer := answer + entries.product
			};
			answer
		} {
			self.ifEmpty {
				1
			} {
				self.error('List>>permanent: not defined at non-square matrices')
			}
		}
	}

	pseudoInverse { :self |
		let [u, s, v] = self.singularValueDecomposition;
		let i = s.deepCollect { :x |
			x.isZero.if {
				0
			} {
				1 / x
			}
		};
		v.dot(i).dot(u.transpose)
	}

	qrDecomposition { :self |
		let [m, n] = self.shape;
		let qr = self.deepCopy;
		let q = [m, n].zeroMatrix;
		let r = [m, n].zeroMatrix;
		1.toDo(n) { :k |
			let norm = 0;
			k.toDo(m) { :i |
				norm := norm.hypotenuse(qr[i][k])
			};
			norm.isZero.ifFalse {
				(qr[k][k] < 0).ifTrue {
					norm := norm.negate
				};
				k.toDo(m) { :i |
					qr[i][k] := qr[i][k] / norm
				};
				qr[k][k] := qr[k][k] + 1;
				(k + 1).toDo(n) { :j |
					let s = 0;
					k.toDo(m) { :i |
						s := s + (qr[i][k] * qr[i][j])
					};
					s := s.negate / qr[k][k];
					k.toDo(m) { :i |
						qr[i][j] := qr[i][j] + (s * qr[i][k]);
						(i < j).ifTrue {
							r[i][j] := qr[i][j]
						}
					}
				}
			};
			r[k][k] := norm.negate
		};
		n.toByDo(1, -1) { :k |
			q[k][k] := 1;
			k.toDo(n) { :j |
				qr[k][k].isZero.ifFalse {
					let s = 0;
					k.toDo(m) { :i |
						s := s + (qr[i][k] * q[i][j])
					};
					s := s.negate / qr[k][k];
					k.toDo(m) { :i |
						q[i][j] := q[i][j] + (s * qr[i][k])
					}
				}
			}
		};
		[q, r]
	}

	recurrenceMatrix { :data :dimension :delay :metric |
		let n = data.size - ((dimension - 1) * delay);
		let m = [0].reshape([n n]);
		let [f, g] = metric.caseOf([
			'Manhattan' -> { [abs:/1, sum:/1] },
			'Euclidean' -> { [square:/1, { :x | x.sum.sqrt }] },
			'Supremum' -> { [abs:/1, max:/1] }
		]);
		1.toDo(n) { :i |
			i.toDo(n) { :j |
				let x = 0.to(dimension - 1).collect { :k |
					f.value(data[i + (k * delay)] - data[j + (k * delay)])
				};
				m[i][j] := m[j][i] := g.value(x)
			}
		};
		m
	}

	recurrenceMatrix { :data :dimension :delay :metric :theshold |
		let m = data.recurrenceMatrix(dimension, delay, metric);
		(m < theshold).boole
	}

	reducedRowEchelonForm { :self |
		valueWithReturn { :return:/1 |
			let lead = 1;
			let [m, n] = self.shape;
			let d = nil;
			1.toDo(m) { :r |
				let i = r;
				(lead > n).ifTrue {
					self.return
				};
				{
					self[i][lead].isZero
				}.whileTrue {
					i := i + 1;
					(i > m).ifTrue {
						i := r;
						lead := lead + 1;
						(lead > n).ifTrue {
							self.return
						}
					}
				};
				self.swapWith(i, r);
				d := self[r][lead];
				(d.abs > 1E-10).ifTrue {
					self[r].replace { :each |
						each / d
					}
				};
				1.toDo(m) { :i |
					(i != r).ifTrue {
						let e = self[i][lead];
						1.toDo(n) { :c |
							self[i][c] := self[i][c] - (self[r][c] * e)
						}
					}
				};
				lead := lead + 1
			};
			self
		}
	}

	rowCatenate { :self |
		let n = self.size;
		let k = self.first.size;
		let answer = [];
		1.toDo(k) { :i |
			let row = [];
			1.toDo(n) { :j |
				row.addAll(self[j][i])
			};
			answer.add(row)
		};
		answer
	}

	rowReduce { :self |
		self.deepCopy.reducedRowEchelonForm
	}

	singularValueDecompositionQr { :self :tolerance |
		let a = self;
		let [m, n] = a.shape;
		let loopMax = 100 * m.max(n);
		let loopCount = 0;
		let u = m.identityMatrix;
		let s = a.conjugateTranspose;
		let v = n.identityMatrix;
		let err = Infinity;
		let ss = nil;
		{
			err > tolerance & {
				loopCount < loopMax
			}
		}.whileTrue {
			var q, e, f;
			[q, s] := qrDecomposition(s.conjugateTranspose);
			u := u.dot(q);
			[q, s] := qrDecomposition(s.conjugateTranspose);
			v := v.dot(q);
			e := s.deepCopy.upperTriangularize(1).catenate.norm;
			f := s.diagonal.norm;
			err := (f = 0 || (f = 1)).if {
				0
			} {
				e / f
			};
			loopCount := loopCount + 1
		};
		ss := s.diagonal;
		s := [0].reshape([m, n]);
		1.toDo(ss.size) { :n |
			let ssn = ss[n];
			s[n][n] := ssn.abs;
			(ssn < 0).ifTrue {
				1.toDo(m) { :i |
					u[i][n] := u[i][n].negate
				}
			}
		};
		[u, s, v]
	}

	/*
	singularValueDecomposition { :self |
		let a = self;
		let tol = 1E-4;
		let [n, m] = a.shape;
		let u = a.conjugateTranspose;
		let s = List(n);
		let v = n.identityMatrix;
		let converge = tol + 1;
		{
			converge > tol
		}.whileTrue {
			converge := 0;
			1.toDo(n - 1) { :i |
				(i + 1).toDo(n) { :j |
					let alpha = u[i].sumOfSquares;
					let beta = u[j].sumOfSquares;
					let gamma = (u[i] * u[j]).sum;
					let zeta = (beta - alpha) / (2 * gamma);
					let t = zeta.sign / (zeta.abs + (1 + zeta.square).sqrt);
					let cs = 1 / (1 + t.square).sqrt;
					let sn = cs * t;
					let tmp = nil;
					converge := converge.max(gamma.abs / (alpha * beta).sqrt);
					tmp := u[i];
					u[i] := (cs * tmp) - (sn * u[j]);
					u[j] := (sn * tmp) + (cs * u[j]);
					tmp := v[i];
					v[i] := (cs * tmp) - (sn * v[j]);
					v[j] := (sn * tmp) + (cs * v[j])
				}
			}
		};
		1.toDo(n) { :j |
			s[j] := u[j].norm;
			u[j] := u[j] / s[j]
		};
		s := s.sorted(>).diagonalMatrix;
		u := u.conjugateTranspose;
		v := v.conjugateTranspose;
		[u, s, v]
	}
	*/

	singularValueDecompositionGolubReinsch { :self |
		<primitive:
		let a = _self
		/* https://github.com/danilosalvati/svd-js */
		// Define default parameters
		let withu = true // 'f'
		let withv = true
		let eps = Math.pow(2, -52)
		let tol = 1e-64 / eps
		// Householders reduction to bidiagonal form
		const n = a[0].length
		const m = a.length
		if (m < n) {
			throw new TypeError('Invalid matrix: m < n')
		}
		let i, j, k, l, l1, c, f, g, h, s, x, y, z
		g = 0
		x = 0
		const e = []
		const u = []
		const v = []
		const mOrN = (withu === 'f') ? m : n
		// Initialize u
		for (i = 0; i < m; i++) {
			u[i] = new Array(mOrN).fill(0)
		}
		// Initialize v
		for (i = 0; i < n; i++) {
			v[i] = new Array(n).fill(0)
		}
		// Initialize q
		const q = new Array(n).fill(0)
		// Copy array a in u
		for (i = 0; i < m; i++) {
			for (j = 0; j < n; j++) {
				u[i][j] = a[i][j]
			}
		}
		for (i = 0; i < n; i++) {
			e[i] = g
			s = 0
			l = i + 1
			for (j = i; j < m; j++) {
				s += Math.pow(u[j][i], 2)
			}
			if (s < tol) {
				g = 0
			} else {
				f = u[i][i]
				g = f < 0 ? Math.sqrt(s) : -Math.sqrt(s)
				h = f * g - s
				u[i][i] = f - g
				for (j = l; j < n; j++) {
					s = 0
					for (k = i; k < m; k++) {
						s += u[k][i] * u[k][j]
					}
					f = s / h
					for (k = i; k < m; k++) {
						u[k][j] = u[k][j] + f * u[k][i]
					}
				}
			}
			q[i] = g
			s = 0
			for (j = l; j < n; j++) {
				s += Math.pow(u[i][j], 2)
			}
			if (s < tol) {
				g = 0
			} else {
				f = u[i][i + 1]
				g = f < 0 ? Math.sqrt(s) : -Math.sqrt(s)
				h = f * g - s
				u[i][i + 1] = f - g
				for (j = l; j < n; j++) {
					e[j] = u[i][j] / h
				}
				for (j = l; j < m; j++) {
					s = 0
					for (k = l; k < n; k++) {
						s += u[j][k] * u[i][k]
					}
					for (k = l; k < n; k++) {
						u[j][k] = u[j][k] + s * e[k]
					}
				}
			}
			y = Math.abs(q[i]) + Math.abs(e[i])
			if (y > x) {
				x = y
			}
		}
		// Accumulation of right-hand transformations
		if (withv) {
			for (i = n - 1; i >= 0; i--) {
				if (g !== 0) {
					h = u[i][i + 1] * g
					for (j = l; j < n; j++) {
						v[j][i] = u[i][j] / h
					}
					for (j = l; j < n; j++) {
						s = 0
						for (k = l; k < n; k++) {
							s += u[i][k] * v[k][j]
						}
						for (k = l; k < n; k++) {
							v[k][j] = v[k][j] + s * v[k][i]
						}
					}
				}
				for (j = l; j < n; j++) {
					v[i][j] = 0
					v[j][i] = 0
				}
				v[i][i] = 1
				g = e[i]
				l = i
			}
		}
		// Accumulation of left-hand transformations
		if (withu) {
			if (withu === 'f') {
				for (i = n; i < m; i++) {
					for (j = n; j < m; j++) {
						u[i][j] = 0
					}
					u[i][i] = 1
				}
			}
			for (i = n - 1; i >= 0; i--) {
				l = i + 1
				g = q[i]
				for (j = l; j < mOrN; j++) {
					u[i][j] = 0
				}
				if (g !== 0) {
					h = u[i][i] * g
					for (j = l; j < mOrN; j++) {
						s = 0
						for (k = l; k < m; k++) {
							s += u[k][i] * u[k][j]
						}
						f = s / h
						for (k = i; k < m; k++) {
							u[k][j] = u[k][j] + f * u[k][i]
						}
					}
					for (j = i; j < m; j++) {
						u[j][i] = u[j][i] / g
					}
				} else {
					for (j = i; j < m; j++) {
						u[j][i] = 0
					}
				}
				u[i][i] = u[i][i] + 1
			}
		}
		// Diagonalization of the bidiagonal form
		eps = eps * x
		let testConvergence
		for (k = n - 1; k >= 0; k--) {
			for (let iteration = 0; iteration < 50; iteration++) {
				// test-f-splitting
				testConvergence = false
				for (l = k; l >= 0; l--) {
					if (Math.abs(e[l]) <= eps) {
						testConvergence = true
						break
					}
					if (Math.abs(q[l - 1]) <= eps) {
						break
					}
				}
				if (!testConvergence) { // cancellation of e[l] if l>0
					c = 0
					s = 1
					l1 = l - 1
					for (i = l; i < k + 1; i++) {
						f = s * e[i]
						e[i] = c * e[i]
						if (Math.abs(f) <= eps) {
							break // goto test-f-convergence
						}
						g = q[i]
						q[i] = Math.sqrt(f * f + g * g)
						h = q[i]
						c = g / h
						s = -f / h
						if (withu) {
							for (j = 0; j < m; j++) {
								y = u[j][l1]
								z = u[j][i]
								u[j][l1] = y * c + (z * s)
								u[j][i] = -y * s + (z * c)
							}
						}
					}
				}
				// test f convergence
				z = q[k]
				if (l === k) { // convergence
					if (z < 0) {
						// q[k] is made non-negative
						q[k] = -z
						if (withv) {
							for (j = 0; j < n; j++) {
								v[j][k] = -v[j][k]
							}
						}
					}
					break // break out of iteration loop and move on to next k value
				}
				// Shift from bottom 2x2 minor
				x = q[l]
				y = q[k - 1]
				g = e[k - 1]
				h = e[k]
				f = ((y - z) * (y + z) + (g - h) * (g + h)) / (2 * h * y)
				g = Math.sqrt(f * f + 1)
				f = ((x - z) * (x + z) + h * (y / (f < 0 ? (f - g) : (f + g)) - h)) / x
				// Next QR transformation
				c = 1
				s = 1
				for (i = l + 1; i < k + 1; i++) {
					g = e[i]
					y = q[i]
					h = s * g
					g = c * g
					z = Math.sqrt(f * f + h * h)
					e[i - 1] = z
					c = f / z
					s = h / z
					f = x * c + g * s
					g = -x * s + g * c
					h = y * s
					y = y * c
					if (withv) {
						for (j = 0; j < n; j++) {
							x = v[j][i - 1]
							z = v[j][i]
							v[j][i - 1] = x * c + z * s
							v[j][i] = -x * s + z * c
						}
					}
					z = Math.sqrt(f * f + h * h)
					q[i - 1] = z
					c = f / z
					s = h / z
					f = c * g + s * y
					x = -s * g + c * y
					if (withu) {
						for (j = 0; j < m; j++) {
							y = u[j][i - 1]
							z = u[j][i]
							u[j][i - 1] = y * c + z * s
							u[j][i] = -y * s + z * c
						}
					}
				}
				e[l] = 0
				e[k] = f
				q[k] = x
			}
		}
		// Number below eps should be zero
		for (i = 0; i < n; i++) {
			if (q[i] < eps) q[i] = 0
		}
		return [ u, q, v ]
		>
	}

	singularValueDecomposition { :self |
		let [u, q, v] = self.singularValueDecompositionGolubReinsch;
		let s = q.diagonalMatrix(0, self.shape);
		[u, s, v]
	}

	squareForm { :u |
		let k = u.size;
		let n = (1 + sqrt(1 + (8 * k))) / 2;
		n.isInteger.if {
			let p = u.takeList((n - 1).toBy(0, -1));
			let q = p.collect { :each |
				each.padLeft([n], 0)
			};
			2.toDo(n) { :i |
				1.toDo(i - 1) { :j |
					q[i][j] := q[j][i]
				}
			};
			q
		} {
			u.error('squareForm: invalid vector')
		}
	}

	svd { :self |
		self.singularValueDecomposition
	}

	swapColumns { :self :i :j |
		let [m, n] = self.shape;
		1.toDo(m) { :k |
			let x = self[k][i];
			self[k][i] := self[k][j];
			self[k][j] := x
		};
		self
	}

	swapRows { :self :i :j |
		let [m, n] = self.shape;
		self.swapWith(i, j)
	}

	sylvesterMatrix { :p :q |
		let m = p.size - 1;
		let n = q.size - 1;
		let d = m + n;
		let x = d - m - 1;
		let y = d - n - 1;
		let a = p.reverse ++ List(x, 0);
		let b = q.reverse ++ List(y, 0);
		[
			0.to(x).collect { :i | a.rotateRight(i) },
			0.to(y).collect { :i | b.rotateRight(i) }
		].catenate
	}

	thomasAlgorithm { :a :b :c :d :x :n |
		<primitive:
		let a = _a, b = _b, c = _c, d = _d, x = _x, n = _n;
		for (let i = 1; i < n; i++) {
			let m = a[i] / b[i - 1];
			b[i] -= m * c[i - 1];
			d[i] -= m * d[i - 1];
		}
		x[n - 1] = d[n - 1] / b[n - 1];
		for (let i = n - 2; i >= 0; i--) {
			x[i] = (d[i] - c[i] * x[i + 1]) / b[i];
		};
		return x
		>
	}

	thomasAlgorithm { :a :b :c :d |
		let n = a.size;
		let x = List(n);
		thomasAlgorithm(a, b, c, d, x, n);
		x
	}

	toeplitzMatrix { :c :r |
		{ :i :j |
			(i >= j).if {
				c[i - j + 1]
			} {
				r[j - i + 1]
			}
		}.table(1.to(r.size), 1.to(c.size))
	}

	trace { :self :aBlock:/1 |
		self.isVector.if {
			aBlock(self)
		} {
			self.isArray.if {
				let rank = self.rank;
				let limit = self.shape.min;
				aBlock(
					1.to(limit).collect { :each |
						self.atPath(List(rank, each))
					}
				)
			} {
				self.error('List>>trace: not an Array')
			}
		}
	}

	trace { :self |
		self.trace(sum:/1)
	}

	upperTriangularize { :self :k |
		let m = self.assertIsMatrix('List>>upperTriangularize');
		let [r, c] = m.shape;
		(2 - k).toDo(r) { :i |
			1.toDo(i - 1 + k) { :j |
				m[i][j] := 0
			}
		};
		m
	}

	upperTriangularize { :self |
		self.upperTriangularize(0)
	}

	vandermondeMatrix { :x :k |
		let n = x.size;
		let m = k - 1;
		{ :i :j |
			x[i] ^ j
		}.table(1.to(n), 0.to(m))
	}

	vandermondeMatrix { :x |
		x.vandermondeMatrix(x.size)
	}

}

+@Integer {

	exchangeMatrix { :self |
		let answer = [self, self].zeroMatrix;
		1.toDo(self) { :each |
			answer[self - each + 1][each] := 1
		};
		answer
	}

	hadamardMatrix { :n |
		(n = 0).if {
			[1]
		} {
			(n = 2).if {
				[1 1; 1 -1]
			} {
				n.isPowerOfTwo.if {
					[1 1; 1 -1].kroneckerProduct((n / 2).hadamardMatrix)
				} {
					n.error('@Integer>>hadamardMatrix: not power of two')
				}
			}
		}
	}

	hankelMatrix { :n |
		n.iota.hankelMatrix
	}

	hilbertMatrix { :self |
		[self, self].hilbertMatrix
	}

	pascalMatrix { :n :l |
		let m = 0.to(n - 1);
		l.caseOf([
			'LowerTriangular' -> { binomial:/2 },
			'UpperTriangular' -> { binomial:/2.swap },
			'Symmetric' -> {
				{ :i :j |
					binomial(i + j, j)
				}
			}
		]).table(m, m)
	}

	pascalMatrix { :n |
		pascalMatrix(n, 'Symmetric')
	}

	walshFunction { :n :m |
		(2 ^ n).walshMatrix.at(m)
	}

	walshMatrix { :n |
		let h = n.hadamardMatrix;
		let z = h.collect(zeroCrossingCount:/1);
		let p = z.ordering;
		h.atAll(p)
	}

}

+@Number {

	reflectionMatrix { :self |
		let n = 2 * self;
		[
			[n.cos, n.sin],
			[n.sin, n.cos.negate]
		]
	}

	rotationMatrix { :self :vector |
		vector.caseOf([
			[1 0 0] -> {
				[
					[1,0,0],
					[0,self.cos,0 - self.sin],
					[0,self.sin,self.cos]
				]
			},
			[0 1 0] -> {
				[
					[self.cos,0,self.sin],
					[0,1,0],
					[0 - self.sin,0,self.cos]
				]
			},
			[0 0 1] -> {
				[
					[self.cos,0 - self.sin,0],
					[self.sin,self.cos,0],
					[0,0,1]
				]
			}
		]) {
			self.error('rotationMatrix: vector not axis aligned')
		}
	}

	rotationMatrix { :self |
		[
			[self.cos, self.sin.negate],
			[self.sin, self.cos]
		]
	}

}
