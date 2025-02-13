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

	asList { :self |
		self.contents
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

	ravel { :self |
		self.contents.ravel
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

+List {

	adjugate { :self |
		self.inverse * self.determinant
	}

	antidiagonal { :self :k |
		let m = self.assertIsMatrix('@Sequence>>antidiagonal');
		let l = m.shape.min - k.abs;
		(l .. 1).collect { :i |
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
			answer[k - each + 1][each] := self[k - each + 1]
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

	arrayRules { :self :zero |
		let [m, n] = self.shape;
		let answer = [];
		1.toDo(m) { :i |
			1.toDo(n) { :j |
				let e = self[i][j];
				(e = zero).ifFalse {
					answer.add([i, j] -> e)
				}
			}
		};
		answer
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

	blockDiagonalMatrix { :d |
		let n = d.size;
		let s = d.collect(shape:/1);
		let answer = [];
		1.toDo(n) { :i |
			1.toDo(d[i].size) { :j |
				answer.add(
					1:n.collect { :k |
						(i = k).if {
							d[i][j]
						} {
							(0 # s[k][2])
						}
					}.concatenation
				)
			}
		};
		answer
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

	circulantMatrix { :self |
		(1 .. self.size).collect { :i |
			self.rotatedRight(i)
		}
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
					let beta = r.dot(ap).negated / p.dot(ap);
					p := r + (beta * p)
				}
			};
			x
		}
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
		let w = self.negated / self.last;
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
		}.table(1:n, 1:n)
	}

	frobeniusNorm { :self |
		self.flatten.collect(squared:/1).sum.sqrt
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

	gramMatrix { :self |
		self.dot(self.transposed)
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
				let [a, b, c, d] = self.contents.concatenation;
				let r = 1 / ((a * d) - (b * c));
				let m = [[d, b.-], [c.-, a]];
				r * m
			} {
				let m = self.contents;
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
					self[i][j].isVeryCloseTo(0)
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
			self.collect(size:/1).asIdentitySet.size = 1
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
			self.transposed.dot(self).isVeryCloseTo(q.identityMatrix)
		} {
			self.dot(self.transposed).isVeryCloseTo(p.identityMatrix)
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
			(1 .. m).collect { :i |
				self[i][anInteger]
			}
		} {
			self.error('@Sequence>>matrixColumn: illegal index')
		}
	}

	matrixColumns { :self :aList |
		let [m, n] = self.shape;
		aList.allSatisfy { :each |
			each.betweenAnd(1, n)
		}.if {
			(1 .. m).collect { :i |
				aList.collect { :j |
					self[i][j]
				}
			}
		} {
			self.error('@Sequence>>matrixColumns: illegal index')
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
		self.matrixPrintString(4)
	}

	matrixPrintString { :self :decimalPlaces |
		let [m, n] = self.shape;
		let print:/1 = self.isIntegerMatrix.if {
			printString:/1
		} {
			{ :n |
				n.printStringShowingDecimalPlaces(decimalPlaces)
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
				item.isVeryCloseTo(0)
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

	minor { :self :i :j |
		let [m, n] = self.shape;
		self.submatrix([1 .. m].without(i), [1 .. n].without(j)).determinant
	}

	minors { :self |
		let [m, n] = self.shape;
		{ :i :j |
			let r = m - i + 1;
			let c = n - j + 1;
			self.submatrix([1 .. m].without(r), [1 .. n].without(c)).determinant
		}.table(1:m, 1:n)
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

	orthogonalize { :self |
		self.gramSchmidtProcess
	}

	permanent { :self |
		self.asMatrix.permanent
	}

	pseudoInverse { :self |
		let [m, n] = self.shape;
		(m < n).if {
			self.gramMatrix.inverse.dot(self.transposed)
		} {
			self.transposed.dot(self.gramMatrix.inverse)
		}
	}

	qrDecomposition { :self |
		let [m, n] = self.shape;
		let qr = self.deepCopy;
		let q = m.zeroMatrix(n);
		let r = m.zeroMatrix(n);
		1.toDo(n) { :k |
			let norm = 0;
			k.toDo(m) { :i |
				norm := norm.hypotenuse(qr[i][k])
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

	resultant { :p :q |
		p.sylvesterMatrix(q).determinant
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

	rowConcatenation { :self |
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
			e := s.deepCopy.upperTriangularize(1).concatenation.norm;
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
					u[i][n] := u[i][n].negated
				}
			}
		};
		[u, s, v]
	}

	singularValueDecomposition { :a |
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
					let t = zeta.sign / (zeta.abs + (1 + zeta.squared).sqrt);
					let cs = 1 / (1 + t.squared).sqrt;
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
		u := u.conjugateTranspose; /* not sorted! */
		v := v.conjugateTranspose; /* not sorted! */
		[u, s, v]
	}

	singularValueDecompositionGolubReinsch { :self |
		<primitive:
		let a = _self
		/* https://github.com/danilosalvati/svd-js */
		// Define default parameters
		let withu = true
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

	submatrix { :self :r :c |
		{ :i :j |
			self[i][j]
		}.table(r, c)
	}

	sylvesterMatrix { :p :q |
		let m = p.size - 1;
		let n = q.size - 1;
		let d = m + n;
		let x = d - m - 1;
		let y = d - n - 1;
		let a = p.reversed ++ (0 # x);
		let b = q.reversed ++ (0 # y);
		[
			0:x.collect { :i | a.rotatedRight(i) },
			0:y.collect { :i | b.rotatedRight(i) }
		].concatenation
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
		let omega = 1.e ^ (2.pi * 0J1 / n);
		let l = (0 .. n - 1);
		{ :i :j |
			m * (omega ^ (i * j))
		}.table(l, l)
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

	hilbertMatrix { :m :n |
		{ :i :j |
			1 / (i + j - 1)
		}.table(1:m, 1:n)
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
			[self.cos, self.sin.negated],
			[self.sin, self.cos]
		]
	}

	spiralMatrix { :n |
		let [dx, dy] = [1, 0];
		let [x, y] = [1, 1];
		let answer = { nil ! n } ! n;
		1.toDo(n ^ 2) { :i |
			let [nx, ny] = [x + dx, y + dy];
			answer[x][y] := i;
			[
				{ 1 <= nx },
				{ nx <= n },
				{ 1 <= ny },
				{ ny <= n },
				{ answer[nx][ny] = nil }
			].&.if {
				[x, y] := [nx, ny]
			} {
				[dx, dy] := [dy.-, dx];
				[x, y] := [x + dx, y + dy]
			}
		};
		answer
	}

	ulamSpiralMatrix { :n |
		[1 .. n ^ 2].permute(
			[
				[n ^ 2 + 1] / 2,
				{ :j :i |
					-1 ^ j * i # j
				}.table(1:n, [-1, n])
			].flatten.take(n ^ 2).accumulate
		).partition(n)
	}

}

+Block {

	arrayReduce { :self:/1 :anArray :anInteger |
		(anInteger = 1).if {
			anArray.collect(self:/1)
		} {
			(anInteger = 2).if {
				anArray.columnsCollect(self:/1)
			} {
				self.error('Block>>arrayReduce: not implemented')
			}
		}
	}

}
