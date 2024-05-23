Matrix : [Object] { | numberOfRows numberOfColumns elementType contents |

	at { :self :i :j |
		self.contents[i, j]
	}

	determinant { :self |
		self.isSquareMatrix.if {
			let size = self.numberOfRows;
			let array = self.contents;
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
			self.error('Matrix>>determinant: not defined at non-square matrices')
		}
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
			self.error('Matrix>>inverse: not square or determinant is zero')
		}
	}

	isColumnVector { :self |
		self.numberOfColumns = 1
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

	conjugateTranspose { :self |
		self.transposed.conjugated
	}

	determinant { :self |
		self.asMatrix(identity:/1).determinant
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

	gaussianElimination { :m :v |
		let a = m.deepCopy;
		a.withIndexDo { :each :i |
			each.add(v[i])
		};
		a.reducedRowEchelonForm;
		a.collect(last:/1)
	}

	inverse { :self |
		self.asMatrix.inverse
	}

	isColumnVector { :self |
		self.isMatrix & {
			self.anyOne.size = 1
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

	fourierMatrix { :n |
		let m = 1 / n.sqrt;
		let omega = e ^ (2.pi * 0J1 / n);
		let l = (0 .. n - 1);
		{ :i :j | m * (omega ^ (i * j)) }.table(l, l)
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

}
