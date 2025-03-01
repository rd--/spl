+List {

	antidiagonal { :self :k |
		let m = self.assertIsMatrix('List>>antidiagonal');
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

	diagonal { :self :k |
		let m = self.assertIsMatrix('List>>diagonal');
		let l = m.shape.min - k.abs;
		1:l.collect { :i |
			m.at(
				i - k.min(0),
				i + k.max(0)
			)
		}
	}

	diagonal { :self |
		self.diagonal(0)
	}

	isColumnVector { :self |
		self.isMatrix & {
			self.anyOne.size = 1
		}
	}

	isDiagonalMatrix { :self :k |
		(self.rank = 2) & {
			self.deepIndices.allSatisfy { :index |
				let [i, j] = index;
				(i + k = j) | {
					self[i][j].isVeryCloseTo(0)
				}
			}
		}
	}

	isDiagonalMatrix { :self |
		self.isDiagonalMatrix(0)
	}

	isIntegerMatrix { :self |
		self.isMatrix & {
			self.allSatisfy { :row |
				row.allSatisfy(isInteger:/1)
			}
		}
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

	columnsCollect { :self :aBlock:/1 |
		let [m, n] = self.shape;
		1:n.collect { :i |
			aBlock(self.matrixColumn(i))
		}
	}

	magicSquareSummary { :self |
		let n = self.size;
		let mu = n * (n * n + 1) / 2;
		let v = 1 # n;
		(
			sum: mu,
			rowSums: self.dot(v),
			columnSums: v.dot(self),
			diagonalSum: self.diagonal.sum,
			anitdiagonalSum: self.antidiagonal.sum,
			rank: self.matrixRank
		)
	}

	matrixColumn { :self :anInteger |
		let [m, n] = self.shape;
		anInteger.betweenAnd(1, n).if {
			(1 .. m).collect { :i |
				self[i][anInteger]
			}
		} {
			self.error('List>>matrixColumn: illegal index')
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
			self.error('List>>matrixColumns: illegal index')
		}
	}

	matrixRow { :self :anInteger |
		let [m, n] = self.shape;
		anInteger.betweenAnd(1, m).if {
			self[anInteger]
		} {
			self.error('List>>matrixRow: illegal index')
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

	matrixRotate { :self :k |
		k.caseOfOtherwise([
			1 -> { self.collect(reversed:/1).transposed },
			2 -> { self.collect(reversed:/1).reversed },
			3 -> { self.transposed.collect(reversed:/1) }
		]) {
			self.error('List>>matrixRotate: k not 1,2,3')
		}
	}

	matrixRotate { :self |
		self.matrixRotate(1)
	}

	numberOfRows { :self |
		self.isArray.if {
			self.size
		} {
			self.error('List>>numberOfRows: not an array')
		}
	}

	numberOfColumns { :self |
		self.isArray.if {
			self.anyOne.size
		} {
			self.error('List>>numberOfColumns: not an array')
		}
	}

	submatrix { :self :r :c |
		{ :i :j |
			self[i][j]
		}.table(r, c)
	}

}

+List {

	antidiagonalMatrix { :self |
		let k = self.size;
		let answer = k.zeroMatrix(k);
		1.toDo(k) { :each |
			answer[k - each + 1][each] := self[k - each + 1]
		};
		answer
	}

	blockDiagonalMatrix { :d |
		let n = d.size;
		let s = d.collect(shape:/1);
		let answer = [];
		1.toDo(n) { :i |
			1.toDo(d[i].size) { :j |
				answer.add(
					1:n.gather { :k |
						(i = k).if {
							d[i][j]
						} {
							0 # s[k][2]
						}
					}
				)
			}
		};
		answer
	}

	circulantMatrix { :self |
		(1 .. self.size).collect { :i |
			self.rotatedRight(i)
		}
	}

	diagonalMatrix { :self :k :shape |
		let [m, n] = shape;
		let r = k.min(0).abs;
		let c = k.max(0);
		let answer = m.zeroMatrix(n);
		1.toDo(self.size) { :each |
			answer[each + r][each + c] := self[each]
		};
		answer
	}

	diagonalMatrix { :self :k |
		let n = self.size + k.abs;
		self.diagonalMatrix(k, [n n])
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

}

+@Integer {

	identityMatrix { :m :n |
		let answer = m.zeroMatrix(n);
		1.toDo(n.min(m)) { :each |
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

	zeroMatrix { :numberOfRows :numberOfColumns |
		1:numberOfRows.collect { :unused |
			List(numberOfColumns, 0)
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

	magicSquare { :self |
		(self < 3).if {
			self.error ('magicSquare: n < 3')
		} {
			let n = self;
			let symmetricSwap = { :m :l |
				let i = l.tuples(2);
				let k = i.size // 2;
				let j = [
					i.take(k),
					i.reversed.take(k)
				].transposed;
				m.swapAllWith(j)
			};
			let columnSwaps = { :m :i :j :c |
				i.withDo(j) { :p :q |
					m.swapPathWith([p c], [q c])
				}
			};
			[
				{ n % 2 = 1 } -> {
					let z = [1 .. n * n];
					let shift = (z - 1 / n).floor;
					let c = (z - shift + ((n - 3) / 2)) % n;
					let r = (z.reversed + (2 * shift)) % n;
					let m = (c * n + r + 1).ordering;
					m.reshape([n n]).transposed
				},
				{ n % 4 = 0 } -> {
					let z = [1 .. n * n];
					let m = z.reshape([n n]);
					m.symmetricSwap([1, 5 .. n] ++ [4, 8  .. n]);
					m.symmetricSwap([2, 6 .. n] ++ [3, 7  .. n]);
					m
				},
				{ n % 4 = 2 } -> {
					let l = n // 2; /* m */
					let z = l.magicSquare;
					let m = [[z, z + (2 * l * l)], [z + (3 * l * l), z + (l * l)]].arrayFlatten;
					let k = (l - 1) // 2;
					let i = [1 .. k] ++ [k + 2 .. l];
					(k > 1).ifTrue {
						let p = [1 .. l];
						let q = [2 .. k] ++ [n - k + 2 .. n];
						m.replaceSubarray([p ++ (p + l), q], m.submatrix((p + l) ++ p, q))
					};
					m.columnSwaps(i, i + l, 1);
					m.columnSwaps([k + 1], [k + 1 + l], k + 1);
					m
				}
			].which
		}
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
