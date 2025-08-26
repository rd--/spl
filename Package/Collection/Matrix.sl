/* Requires: NumericArray */

+[List, NumericArray] {

	isColumnVector { :self |
		self.isMatrix & {
			self.numberOfColumns = 1
		}
	}

	isRowVector { :self |
		self.isMatrix & {
			self.numberOfRows = 1
		}
	}

	isSquareMatrix { :self |
		self.isMatrix & {
			let [m, n] = self.shape;
			m = n
		}
	}

	numberOfRows { :self |
		let [m, _] = self.dimensions(2);
		m
	}

	numberOfColumns { :self |
		let [_, n] = self.dimensions(2);
		n
	}

}

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

	cayleyMengerDeterminant { :self |
		let n = self.size - 1;
		let z = (-1 ^ (n + 1)) / (n.factorial.squared * (2 ^ n));
		(z * self.cayleyMengerMatrix.determinant).abs.sqrt
	}

	cayleyMengerMatrix { :self |
		let m = self.distanceMatrix(
			self,
			squaredEuclideanDistance:/2
		).arrayPad([1 0; 1 0], 1);
		m[1][1] := 0;
		m
	}

	column { :self :anInteger |
		let [m, n] = self.shape;
		anInteger.betweenAnd(1, n).if {
			(1 .. m).collect { :i |
				self[i][anInteger]
			}
		} {
			self.error('List>>column: illegal index')
		}
	}

	columns { :self :aList |
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
			self.error('List>>columns: illegal index')
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
			self.deepAllSatisfy(isInteger:/1)
		}
	}

	isLatinSquare { :self |
		self.isSquareMatrix & {
			let x = self[1];
			(self ++ self.transposed).allSatisfy { :each |
				each.isPermutationOf(x)
			}
		}
	}

	isMatrixOf { :self :elementType |
		(self.arrayDepth >= 2) & {
			self.allSatisfy { :each |
				each.elementType = elementType
			}
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
			aBlock(self.column(i))
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
				each.padLeft([columnWidth], ' ')
			}.stringJoin('   ')
		};
		[
			[m, '×', n].stringJoin,
			'   ',
			text.unlines
		].unlines
	}

	matrixRotate { :self :k |
		k.caseOf([
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

	repeatMatrix { :self :d |
		let k = d.size;
		let m = self;
		1.toDo(k) { :i |
			m := (m ! d[i]).join(i)
		};
		m
	}

	row { :self :anInteger |
		let [m, n] = self.shape;
		anInteger.betweenAnd(1, m).if {
			self[anInteger]
		} {
			self.error('List>>row: illegal index')
		}
	}

	rows { :self :aList |
		let [m, n] = self.shape;
		aList.allSatisfy { :each |
			each.betweenAnd(1, m)
		}.if {
			self.atAll(aList)
		} {
			self.error('List>>rows: illegal index')
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
		let answer = [k, k].zeroMatrix;
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
					1:n.collectCatenate { :k |
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

	condensedDistanceMatrix { :self :aBlock:/2 |
		let k = self.size;
		let answer = [];
		1.toDo(k - 1) { :i |
			let row = [];
			(i + 1).toDo(k) { :j |
				row.add(aBlock(self[i], self[j]))
			};
			answer.add(row)
		};
		answer
	}

	diagonalMatrix { :self :k :shape |
		let [m, n] = shape;
		let r = k.min(0).abs;
		let c = k.max(0);
		let answer = [m, n].zeroMatrix;
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

	gaussianMatrix { :r :sigma |
		let [r1, r2] = r;
		let [sigma1, sigma2] = sigma;
		let p = (-0.5 * [r1.- ..  r1].squared / sigma1.squared).exp;
		let q = (-0.5 * [r2.- ..  r2].squared / sigma2.squared).exp;
		let k = p.outerProduct(q);
		k / k.deepSum
	}

	identityMatrix { :shape |
		let [m, n] = shape;
		let answer = [m, n].zeroMatrix;
		1.toDo(n.min(m)) { :each |
			answer[each][each] := 1
		};
		answer
	}

	singleEntryMatrix { :shape :index :x |
		let m = shape.zeroMatrix;
		m.atPathPut(index, x);
		m
	}

	zeroMatrix { :shape |
		let [m, n] = shape;
		(1 .. m).collect { :unused |
			List(n, 0)
		}
	}

	zigzagIndices { :shape |
		let [r, c] = shape;
		let h = 0;
		let v = 0;
		let o = [];
		let step = { :a :b |
			o.add([v + 1, h + 1]);
			v := v + a;
			h := h + b
		};
		{ v < r & { h < c } }.whileTrue {
			(((h + v) % 2) = 0).if {
				(v = 0).if {
					(h = (c - 1)).if {
						step(1, 0)
					} {
						step(0, 1)
					}
				} {
					(h = (c - 1) & { v < r }).if {
						step(1, 0)
					} {
						step(-1, 1)
					}
				}
			} {
				(v = (r - 1) & { h <= (c - 1) }).if {
					step(0, 1)
				} {
					(h = 0).if {
						(v = (r - 1)).if {
							step(0, 1)
						} {
							step(1, 0)
						}
					} {
						step(1, -1)
					}
				};
				(v = (r - 1) & { h = (c - 1) }).ifTrue {
					step(1, 1)
				}
			}
		};
		o
	}

	zigzagMatrix { :shape |
		let i = 1;
		let answer = shape.zeroMatrix;
		shape.zigzagIndices.do { :each |
			answer.atPathPut(each, i);
			i := i + 1
		};
		answer
	}

	zigzagScan { :m |
		let answer = [];
		m.shape.zigzagIndices.do { :i |
			answer.add(m.atPath(i))
		};
		answer
	}

}

+@Integer {

	identityMatrix { :self |
		[self, self].identityMatrix
	}

	vedicSquare { :self |
		let l = [1 .. self];
		{ :i :j |
			(i * j).positiveResidue(self)
		}.table(l, l)
	}

	zeroMatrix { :self |
		[self self].zeroMatrix
	}

}

+SmallFloat {

	antidiagonalIndicesDo { :k :aBlock:/2 |
		let m = 1;
		let n = 1;
		{
			k > 0
		}.whileTrue {
			aBlock(m, n);
			k := k - 1;
			(n = 1).if {
				n := m + 1;
				m := 1
			} {
				m := m + 1;
				n := n - 1
			}
		}
	}

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

	evoluteSpiralMatrix { :n |
		[1 .. n ^ 2].permute(
			[
				[n ^ 2 + 1] / 2,
				{ :j :i |
					-1 ^ j * i # j
				}.table(1:n, [-1, n])
			].flatten.take(n ^ 2).accumulate
		).partition(n)
	}

	gaussianMatrix { :r :sigma |
		[r r].gaussianMatrix([sigma sigma])
	}

	gaussianMatrix { :r |
		r.gaussianMatrix(r / 2)
	}

	gaussianVector { :r :sigma |
		let k = (-0.5 * [r.- ..  r].squared / sigma.squared).exp;
		k / k.sum
	}

	magicHexagon { :n |
		n.caseOf(
			[
				1 -> { [1] },
				3 -> {
					[
						0  0  3 17 18;
						0 19  7  1 11;
						16  2  5  6  9;
						12  4  8 14  0;
						10 13 15  0  0
					]
				}
			]
		) {
			n.error('magicHexagon')
		}
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
				];
				m.swapAllWith(j.transposed)
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

}
