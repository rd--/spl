Matrix : [Object] { | numberOfRows numberOfColumns elementType contents |

	= { :self :anObject |
		anObject.isMatrix & {
			self.contents = anObject.contents
		}
	}

	~ { :self :anObject |
		anObject.isMatrix & {
			self.contents ~ anObject.contents
		}
	}

	at { :self :i :j |
		self.contents[i, j]
	}

	determinant { :self |
		self.contents.determinant
	}

	diagonal { :self :k |
		let l = self.shape.min - k.abs;
		1:l.collect { :i |
			self[i - k.min(0), i + k.max(0)]
		}
	}

	diagonal { :self |
		self.diagonal(0)
	}

	inverse { :self |
		self.contents.inverse.asMatrix
	}

	isColumnVector { :self |
		self.numberOfColumns = 1
	}

	isIntegerMatrix { :self |
		self.elementType = 'LargeInteger' | {
			self.contents.isIntegerMatrix
		}
	}

	isMatrixOf { :self :elementType |
		self.elementType = elementType
	}

	isRowVector { :self |
		self.numberOfRows = 1
	}

	isSquareMatrix { :self |
		self.numberOfRows = self.numberOfColumns
	}

	linearIndex { :self :i :j |
		(i - 1) * self.numberOfRows + j
	}

	permanent { :self |
		self.isSquareMatrix.if {
			let size = self.numberOfRows;
			let array = self.contents;
			let answer = 0;
			[1 .. size].plainChangesDo { :p |
				let sign = p.permutationSymbol;
				let entries = p.withIndexCollect { :i :j |
					array[i][j]
				};
				answer := answer + entries.product
			};
			answer
		} {
			self.error('Matrix>>permanent: not defined at non-square matrices')
		}
	}

	printString { :self |
		self.contents.matrixPrintString
	}

	shape { :self |
		[self.numberOfRows, self.numberOfColumns]
	}

	trace { :self :aBlock:/1 |
		let limit = self.shape.min;
		aBlock(
			1:limit.collect { :each |
				self.at(each, each)
			}
		)
	}

	trace { :self |
		self.trace(sum:/1)
	}

}

+@Sequence {

	adjugate { :self |
		self.inverse * self.determinant
	}

	antidiagonal { :self :k |
		let m = self.assertIsMatrix('@Sequence>>antidiagonal');
		let l = m.shape.min - k.abs;
		(1 .. l).collect { :i |
			let r = l - i + 1 - k.min(0);
			let c = i - k.min(0);
			m[r][c]
		}
	}

	antidiagonal { :self |
		self.antidiagonal(0)
	}

	antidiagonalMatrix { :self |
		let k = self.size;
		let answer = k.zeroMatrix(k);
		1.toDo(k) { :each |
			answer[k - each + 1][each] := self[each]
		};
		answer
	}

	arrayFlatten { :self |
		self.isArray.if {
			let [r, c, i, j] = self.shape.take(4);
			let n = r * i;
			let m = c * j;
			let p = 1;
			let answer = List(n);
			1.toDo(r) { :w |
				1.toDo(i) { :x |
					let row = List(m);
					let q = 1;
					answer[p] := row;
					p := p + 1;
					1.toDo(c) { :y |
						1.toDo(j) { :z |
							row[q] := self[w][y][x][z];
							q := q + 1
						}
					}
				}
			};
			answer
		} {
			self.error('@Sequence>>arrayFlatten: not array')
		}
	}

	assertIsMatrix { :self :context |
		self.assert(context) {
			self.isMatrix
		}
	}

	assertIsSquareMatrix { :self :context |
		self.assert(context) {
			self.isSquareMatrix
		}
	}

	asMatrix { :self :aBlock:/1 |
		self.isMatrix.if {
			let numberOfRows = self.size;
			let numberOfColumns = self.anyOne.size;
			let elementType = self.anyOne.elementType;
			self.allSatisfy { :each |
				each.elementType = elementType
			}.if {
				newMatrix().initializeSlots(numberOfRows, numberOfColumns, elementType, aBlock(self))
			} {
				self.error('@Sequence>>asMatrix: non-uniform elementType')
			}
		} {
			self.error('@Sequence>>asMatrix: not a matrix')
		}
	}

	asMatrix { :self |
		self.asMatrix(deepCopy:/1)
	}

	choleskyBanachiewiczAlgorithm { :a |
		let [m, n] = a.shape;
		let l = m.zeroMatrix(n);
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

	conjugateTranspose { :self |
		self.transposed.conjugated
	}

	columnsCollect { :self :aBlock:/1 |
		let [m, n] = self.shape;
		1:n.collect { :i |
			aBlock(self.matrixColumn(i))
		}
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
		1:k.collect { :i |
			numerators[i].determinant / divisor
		}
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
					[1 .. size].plainChangesDo { :p |
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
			self.error('@Sequence>>determinant: not defined at non-square matrices')
		}
	}

	diagonal { :self :k |
		let m = self.assertIsMatrix('@Sequence>>diagonal');
		let l = m.shape.min - k.abs;
		1:l.collect { :i |
			m[i - k.min(0)][i + k.max(0)]
		}
	}

	diagonal { :self |
		self.diagonal(0)
	}

	diagonalMatrix { :self :k |
		let n = self.size + k.abs;
		let r = k.min(0).abs;
		let c = k.max(0);
		let answer = n.zeroMatrix(n);
		1.toDo(self.size) { :each |
			answer[each + r][each + c] := self[each]
		};
		answer
	}

	diagonalMatrix { :self |
		self.diagonalMatrix(0)
	}

	distanceMatrix { :u :v :aBlock:/2 |
		aBlock:/2.table(u, v)
	}

	distanceMatrix { :u :v |
		distanceMatrix(u, v, euclideanDistance:/2)
	}

	distanceMatrix { :u |
		distanceMatrix(u, u)
	}

	dotProduct { :self :aSequence |
		self.isVector.if {
			(aSequence.isVector | { aSequence.isMatrix }).if {
				(self *.e aSequence).sum
			} {
				self.error('@Sequence>>dotProduct: argument not vector or matrix')
			}
		} {
			self.isMatrix.if {
				aSequence.isVector.if {
					self.collect { :each |
						(each *.e aSequence).sum
					}
				} {
					aSequence.isMatrix.if {
						self.collect { :each |
							each.dot(aSequence)
						}
					} {
						self.error('@Sequence>>dotProduct: argument not vector or matrix')
					}
				}
			} {
				self.error('@Sequence>>dotProduct: self not vector or matrix')
			}
		}
	}

	gaussJordanInverse { :self |
		let [m, n] = self.shape;
		let a = m.zeroMatrix(m * 2);
		let r = m.zeroMatrix(n);
		(m ~= n).ifTrue {
			self.error('@Sequence>>gaussJordanInverse: matrix is not square')
		};
		1.toDo(m) { :i |
			a[i].replaceFromToWith(1, m, self[i]);
			a[i][m + i] := 1
		};
		a.reducedRowEchelonForm;
		1.toDo(n) { :i |
			1.toDo(n) { :j |
				(a[i][j] ~= (i = j).boole).if {
					self.error('@Sequence>>gaussJordanInverse: matrix is singular')
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

	inverse { :self |
		(
			self.isSquareMatrix & {
				self.determinant ~= 0
			}
		).if {
			let n = self.numberOfRows;
			(n = 2).if {
				let [a, b, c, d] = self.contents.concatenation;
				let r = 1 / ((a * d) - (b * c));
				let m = [[d, b.-], [c.-, a]];
				r * m
			} {
				let m = self.contents;
				let i = n.identityMatrix;
				(m ++.each i).rowReduce.collect { :each |
					each.drop(n)
				}
			}
		} {
			self.error('Sequence>>inverse: not square matrix or determinant is zero')
		}
	}

	isColumnVector { :self |
		self.isMatrix & {
			self.anyOne.size = 1
		}
	}

	isIntegerMatrix { :self |
		self.isMatrix & {
			self.allSatisfy { :row |
				row.allSatisfy(isInteger:/1)
			}
		}
	}

	isLowerTriangularMatrix { :self :k |
		self.isMatrix & {
			let [r, c] = self.shape;
			1.to(r - k).allSatisfy { :i |
				(i + 1 + k).to(c).allSatisfy { :j |
					self[i][j] = 0
				}
			}
		}
	}

	isLowerTriangularMatrix { :self |
		self.isLowerTriangularMatrix(0)
	}

	isMatrix { :self |
		let type = self.typeOf;
		self.allSatisfy { :each |
			each.typeOf = type & {
				each.isVector
			}
		} & {
			self.collect(size:/1).asSet.size = 1
		}
	}

	isMatrixOf { :self :elementType |
		self.isMatrix & {
			self.allSatisfy { :each |
				each.elementType = elementType
			}
		}
	}

	isOrthogonalMatrix { :self |
		let [p, q] = self.shape;
		(p >= q).if {
			self.transposed.dot(self).veryCloseTo(q.identityMatrix)
		} {
			self.dot(self.transposed).veryCloseTo(p.identityMatrix)
		}
	}

	isRowVector { :self |
		self.isMatrix & {
			self.size = 1
		}
	}

	isSquareMatrix { :self |
		self.isMatrix & {
			self.size = self.anyOne.size
		}
	}

	isSymmetricMatrix { :self |
		self.isSquareMatrix & {
			self = self.transposed
		}
	}

	isUnitaryMatrix { :self |
		let [p, q] = self.shape;
		(p >= q).if {
			self.conjugateTranspose.dot(self).veryCloseTo(q.identityMatrix)
		} {
			self.dot(self.conjugateTranspose).veryCloseTo(p.identityMatrix)
		}
	}

	isUpperTriangularMatrix { :self :k |
		self.isMatrix & {
			let [r, c] = self.shape;
			(2 - k).to(r).allSatisfy { :i |
				1.to(i - 1 + k).allSatisfy { :j |
					self[i][j] = 0
				}
			}
		}
	}

	isUpperTriangularMatrix { :self |
		self.isUpperTriangularMatrix(0)
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
		let m = self.assertIsMatrix('@Sequence>>lowerTriangularize');
		let [r, c] = m.shape;
		1.to(r - k).do { :i |
			(i + 1 + k).to(c).do { :j |
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
			(i ~= row).ifTrue {
				p.swapWith(i, row)
			}
		};
		p
	}

	luDecomposition { :self |
		let m = self.assertIsSquareMatrix('@Sequence>>luDecomposition');
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

	matrixColumn { :self :anInteger |
		let [m, n] = self.shape;
		anInteger.betweenAnd(1, n).if {
			(1 .. m).collect { :each |
				self[each][anInteger]
			}
		} {
			self.error('@Sequence>>matrixColumn: illegal index')
		}
	}

	matrixCorrelation { :a :b |
		a.covariance(b) / *.outer(a.standardDeviation, b.standardDeviation)
	}

	matrixCovariance { :a :b |
		let [n, p] = a.shape;
		let [m, q] = b.shape;
		let l = List(n, 1);
		{ n = m }.assert;
		(1 / (n - 1)) * (a - (*.outer(l, a.mean))).transposed.dot((a - (*.outer(l, a.mean))).conjugated)
	}

	matrixRow { :self :anInteger |
		let [m, n] = self.shape;
		anInteger.betweenAnd(1, m).if {
			self[anInteger]
		} {
			self.error('@Sequence>>matrixRow: illegal index')
		}
	}

	matrixPrintString { :self |
		let [m, n] = self.shape;
		let print:/1 = self.isIntegerMatrix.if {
			printString:/1
		} {
			{ :n |
				n.printStringShowingDecimalPlaces(4)
			}
		};
		let table = self.deepCollect(print:/1);
		let columnWidth = table.flatten.collect(size:/1).max;
		let text = table.collect { :row |
			'   ' ++ row.collect { :each |
				each.padLeft(columnWidth, ' ')
			}.stringJoin('   ')
		};
		[
			[m, '×', n].stringJoin,
			'   ',
			text.unlines
		].unlines
	}

	matrixPower { :m :p |
		let [a, b] = m.shape;
		(a = b).if {
			let r = b.zeroMatrix(a);
			p.caseOfOtherwise([
				0 -> {
					1:b.do { :i |
						1:a.do { :j |
							(i = j).if {
								r[i][j] := 1
							} {
								r[i][j] := 0
							}
						}
					}
				},
				1 -> {
					1:b.do { :i |
						1:a.do { :j |
							r[i][j] := m[i][j]
						}
					}
				}
			]) {
				r := m;
				2:p.do { :i |
					r := r.dot(m)
				}
			};
			r
		} {
			m.error('@Sequence>>matrixPower: invalid matrix')
		}
	}

	matrixRank { :self |
		self.rowReduce.count { :each |
			each.allSatisfy { :item |
				item.veryCloseTo(0)
			}.not
		}
	}

	matrixRotate { :self :k |
		k.caseOfOtherwise([
			1 -> { self.collect(reversed:/1).transposed },
			2 -> { self.collect(reversed:/1).reversed },
			3 -> { self.transposed.collect(reversed:/1) }
		]) {
			self.error('@Sequence>>matrixRotate: k not 1,2,3')
		}
	}

	matrixRotate { :self |
		self.matrixRotate(1)
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

	numberOfRows { :self |
		self.isArray.if {
			self.size
		} {
			self.error('@Sequence>>numberOfRows: not an array')
		}
	}

	numberOfColumns { :self |
		self.isArray.if {
			self.anyOne.size
		} {
			self.error('@Sequence>>numberOfColumns: not an array')
		}
	}

	permanent { :self |
		self.asMatrix.permanent
	}

	qrDecomposition { :self |
		let [m, n] = self.shape;
		let qr = self.deepCopy;
		let q = m.zeroMatrix(n);
		let r = m.zeroMatrix(n);
		1.toDo(n) { :k |
			let norm = 0;
			k.toDo(m) { :i |
				norm := norm.hypot(qr[i][k])
			};
			norm.isZero.ifFalse {
				(qr[k][k] < 0).ifTrue {
					norm := norm.negated
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
					s := s.negated / qr[k][k];
					k.toDo(m) { :i |
						qr[i][j] := qr[i][j] + (s * qr[i][k]);
						(i < j).ifTrue {
							r[i][j] := qr[i][j]
						}
					}
				}
			};
			r[k][k] := norm.negated
		};
		n.toByDo(1, -1) { :k |
			q[k][k] := 1;
			k.toDo(n) { :j |
				qr[k][k].isZero.ifFalse {
					let s = 0;
					k.toDo(m) { :i |
						s := s + (qr[i][k] * q[i][j])
					};
					s := s.negated / qr[k][k];
					k.toDo(m) { :i |
						q[i][j] := q[i][j] + (s * qr[i][k])
					}
				}
			}
		};
		[q, r]
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
					(i ~= r).ifTrue {
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

	rowReduce { :self |
		self.deepCopy.reducedRowEchelonForm
	}

	subMatrix { :self :r :c |
		{ :i :j |
			self[i][j]
		}.table(r, c)
	}

	toeplitzMatrix { :c :r |
		{ :i :j |
			(i >= j).if {
				c[i - j + 1]
			} {
				r[j - i + 1]
			}
		}.table((1 .. r.size), (1 .. c.size))
	}

	trace { :self :aBlock:/1 |
		self.isVector.if {
			aBlock(self)
		} {
			self.isArray.if {
				let rank = self.rank;
				let limit = self.shape.min;
				aBlock(
					1:limit.collect { :each |
						self.atPath(each # rank)
					}
				)
			} {
				self.error('@Sequence>>trace: not an Array')
			}
		}
	}

	trace { :self |
		self.trace(sum:/1)
	}

	upperTriangularize { :self :k |
		let m = self.assertIsMatrix('@Sequence>>upperTriangularize');
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

}

+@Integer {

	exchangeMatrix { :self |
		let answer = self.zeroMatrix(self);
		1:self.do { :each |
			answer[self - each + 1][each] := 1
		};
		answer
	}

	fourierMatrix { :n |
		let m = 1 / n.sqrt;
		let omega = e ^ (2.pi * 0J1 / n);
		let l = (0 .. n - 1);
		{ :i :j | m * (omega ^ (i * j)) }.table(l, l)
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

	hilbertMatrix { :n |
		{ :i :j |
			1 / (i + j - 1)
		}.table(1:n, 1:n)
	}

	identityMatrix { :n :m |
		let answer = n.zeroMatrix(m);
		1.toDo(m.min(n)) { :each |
			answer[each][each] := 1
		};
		answer
	}

	identityMatrix { :self |
		self.identityMatrix(self)
	}

	vedicSquare { :self |
		let l = [1 .. self];
		{ :i :j |
			(i * j).positiveResidue(self)
		}.table(l, l)
	}

	walshMatrix { :n |
		let h = n.hadamardMatrix;
		let z = h.collect(zeroCrossingCount:/1);
		let p = z.ordering;
		h @* p
	}

	zeroMatrix { :self :other |
		1:self.collect { :unused |
			List(other, 0)
		}
	}

}

+@Number {

	boxMatrix { :self |
		let r = self.ceiling;
		let n = r * 2 + 1;
		{ :i :j | 1 }.table(1:n, 1:n)
	}

	crossMatrix { :self |
		let r = self.ceiling;
		let n = r * 2 + 1;
		let c = [r, r];
		{ :i :j |
			([i - 1, j - 1].editDistance(c) <= 1).boole
		}.table(1:n, 1:n)
	}

	diamondMatrix { :self |
		let r = self.ceiling;
		let n = r * 2 + 1;
		let c = [r, r];
		let l = (self + 0.5).abs;
		{ :i :j |
			([i - 1, j - 1].manhattanDistance(c) <= l).boole
		}.table(1:n, 1:n)
	}

	diskMatrix { :self |
		let r = self.ceiling;
		let n = r * 2 + 1;
		let c = [r, r];
		let l = (self + 0.5).abs;
		{ :i :j |
			([i - 1, j - 1].euclideanDistance(c) <= l).boole
		}.table(1:n, 1:n)
	}

	reflectionMatrix { :self |
		let n = 2 * self;
		[
			[n.cos, n.sin],
			[n.sin, n.cos.negated]
		]
	}

	rotationMatrix { :self :vector |
		vector.caseOfOtherwise([
			[1 0 0] -> {
				[[1,0,0],[0,self.cos,0 - self.sin],[0,self.sin,self.cos]]
			},
			[0 1 0] -> {
				[[self.cos,0,self.sin],[0,1,0],[0 - self.sin,0,self.cos]]
			},
			[0 0 1] -> {
				[[self.cos,0 - self.sin,0],[self.sin,self.cos,0],[0,0,1]]
			}
		]) {
			self.error('rotationMatrix: vector not axis aligned')
		}
	}

	rotationMatrix { :self |
		[
			[self.cos, self.sin.negated],
			[self.sin, self.cos]
		]
	}

}
