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

	determinant { :self |
		self.asMatrix(identity:/1).determinant
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

}

+@Sequence {

	gaussianElimination { :m :v |
		let n = v.size;
		let a = List(n);
		let answer = List(n, 0);
		m.withIndexDo { :each :i |
			a[i] := each.copy;
			a[i].add(v[i])
		};
		1.toDo(n) { :k |
			let iMax = 1;
			let vMax = -1;
			k.toDo(n) { :i |
				let row = a[i];
				let s = -1;
				let z = nil;
				k.toDo(n) { :j |
					let e = row[j].abs;
					(e > s).ifTrue {
						s := e
					}
				};
				z := row[k].abs / s;
				(z > vMax).ifTrue {
					iMax := i;
					vMax := z
				}
			};
			a[iMax][k].isZero.ifTrue {
				self.error('@Sequence>>gaussianElimination: matrix is singular')
			};
			a.swapWith(k, iMax);
			(k + 1).toDo(n) { :i |
				(k + 1).toDo(n + 1) { :j |
					a[i][j] := a[i][j] - (a[k][j] * a[i][k] / a[k][k])
				};
				a[i][k] := 0
			}
		};
		n.downToDo(1) { :i |
			answer[i] := a[i][n + 1];
			(i + 1).toDo(n) { :j |
				answer[i] := answer[i] - (a[i][j] * answer[j])
			};
			answer[i] := answer[i] / a[i][i]
		};
		answer
	}

	inverse { :self |
		self.asMatrix.inverse
	}

	matrixRank { :self |
		self.rowReduce.count { :each |
			each.allSatisfy { :item |
				item.veryCloseTo(0)
			}.not
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

}
