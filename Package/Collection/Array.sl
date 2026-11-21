/* Requires: Function List Range */

+List {

	FloatMatrix { :self |
		self.isMatrix.if {
			Float(self)
		} {
			self.error('FloatMatrix')
		}
	}

	FloatVector { :self |
		self.isVector.if {
			Float(self)
		} {
			self.error('FloatVector')
		}
	}

	IntegerVector { :self |
		self.isVector.if {
			Integer(self)
		} {
			self.error('IntegerVector')
		}
	}

	arrayDepth { :self |
		self.dimensions.size
	}

	arrayFlatten { :self |
		self.isArray.if {
			let [r, c, i, j] = self.shape.take(4L);
			let n = r * i;
			let m = c * j;
			let p = 1L;
			let answer = List(n, nil);
			1L.toDo(r) { :w |
				1L.toDo(i) { :x |
					let row = List(m, nil);
					let q = 1L;
					answer[p] := row;
					p := p + 1L;
					1L.toDo(c) { :y |
						1L.toDo(j) { :z |
							row[q] := self[w][y][x][z];
							q := q + 1L
						}
					}
				}
			};
			answer
		} {
			self.error('List>>arrayFlatten: not array')
		}
	}

	assertIsOfShape { :self :shape |
		self.assert {
			self.shape = shape
		}
	}

	centerArray { :self :operand :x |
		operand.size.caseOf(
			[
				1L -> {
					self.centerList(operand[1L], x)
				},
				2L -> {
					self.centerMatrix(operand, x)
				}
			]
		)
	}

	coordinateBoundingBoxArray { :bounds :steps :offset |
		let [m, n] = bounds.shape;
		bounds.transpose.coordinateBoundsArray(steps, offset)
	}

	coordinateBoundingBoxArray { :bounds :steps |
		bounds.coordinateBoundingBoxArray(steps, [0L])
	}

	coordinateBoundsArray { :rangeList :stepList :offset |
		(rangeList +.each offset).withCollect(stepList) { :range :step |
			let [l, r] = range;
			[l, l + step .. r]
		}.tuplesArray
	}

	coordinateBoundsArray { :rangeList :stepList |
		coordinateBoundsArray(rangeList, stepList, [0L])
	}

	coordinateBoundsList { :rangeList :stepList :offset |
		(rangeList +.each offset).withCollect(stepList) { :range :step |
			let [l, r] = range;
			[l, l + step .. r]
		}.tuples
	}

	dimensions { :self :anInteger |
		(anInteger < 1L).if {
			[]
		} {
			let answer = [];
			answer.add!(self.size);
			(
				self.isNotEmpty & {
					self.allSatisfy(isSequence/1)
				}
			).ifTrue {
				let k = self.anyOne.size;
				self.allSatisfy { :each |
					each.size = k
				}.ifTrue {
					answer.addAll!(
						self.anyOne.dimensions(anInteger - 1L)
					)
				}
			};
			answer
		}
	}

	dimensions { :self |
		self.dimensions(Infinity)
	}

	flipLeftRight { :self |
		self.isVector.if {
			self.reverse
		} {
			self.isMatrix.if {
				self.collect(reverse/1)
			} {
				self.collect(flipLeftRight/1)
			}
		}
	}

	impliedShape { :self |
		self.isVector.if {
			self
		} {
			let answer = [self.size];
			1L.toDo(self.depth - 2L) { :i |
				answer.add!(
					self.level([i]).collect { :each |
						each.nest.size
					}.max
				)
			};
			answer
		}
	}

	irregularIota { :a :zero |
		irregularIotaArray(
			Integer(a),
			Integer(zero)
		).normalArray
		.deepDeleteMissing
	}

	irregularIota { :a |
		a.irregularIota(1L)
	}

	irregularIotaArray { :a :zero |
		a
		.irregularShapeIndices
		.withIndexCollect { :i :j |
			i -> (j - 1L + zero)
		}.SparseArray(
			a.irregularShapeBoundingShape,
			nil
		)
	}

	irregularShape { :a |
		let b = [a.size] ++ 1L.toCollect(a.depth - 2L) { :i |
			a.atLevelCollect([i], size/1)
		};
		b.atLevelCollect([0L .. b.depth - 2L]) { :c |
			c.isList.if {
				c.findRepeat
			} {
				c
			}
		}
	}

	irregularShapeBoundingShape { :a |
		let n = a[1L];
		let m = a.allButFirst.collect(deepMax/1);
		[n] ++ m
	}

	irregularShapeIndices { :a |
		let b = a.drop;
		a.irregularShapeBoundingShape
		.shapeIndices.select { :i |
			let j = i.dropLast;
			j.prefixes.withIndexCollect { :k :y |
				let z = b.at(y).atPathWrap(k);
				i[y + 1L] <= z
			}.allTrue
		}
	}

	isArray { :self :depth :aFunction/1 |
		let rho = self.shapeOrNil;
		rho.isNotNil & {
			rho.size = depth & {
				self.deepAllSatisfy(aFunction/1)
			}
		}
	}

	isArray { :self :depth |
		let rho = self.shapeOrNil;
		rho.isNotNil & {
			rho.size = depth
		}
	}

	isArray { :self |
		self.shapeOrNil.isNotNil
	}

	isCommensurate { :self :other |
		self.shape = other.shape & {
			self.elementType = other.elementType
		}
	}

	isCostasArray { :self |
		self.isPermutationList & {
			self
			.triangularDifferenceTable
			.allSatisfy(isDuplicateFree/1)
		}
	}

	isFloatMatrix { :self |
		self.arrayDepth = 2L & {
			self.deepAllSatisfy(isFloat/1)
		}
	}

	isFloatVector { :self |
		self.allSatisfy(isFloat/1)
	}

	isMatrix { :self :aFunction/1 |
		self.isArray(2L, aFunction/1)
	}

	isMatrix { :self |
		self.arrayDepth = 2L
	}

	isVector { :self :aFunction/1 |
		self.allSatisfy { :each |
			each.isList.not & {
				aFunction(each)
			}
		}
	}

	isVector { :self |
		self.noneSatisfy(isList/1)
	}

	ones { :self |
		[1L].reshape(self)
	}

	padLeft { :self :aList :anObject |
		self.padRight(aList.negate, anObject)
	}

	padLeft { :self |
		self.padLeft(self.impliedShape, 0L)
	}

	padRight { :self :shape :anObject |
		shape.includes(0L).if {
			[]
		} {
			let length = shape[1L].abs;
			let affixSize = (length - self.size).max(0L);
			let affix = List(affixSize, anObject);
			let prefix = (length < self.size).if { self.first(length) } { self };
			let result = shape[1L].isNegative.if { affix ++ prefix } { prefix ++ affix };
			(shape.size = 1L).if {
				result
			} {
				let nextShape = shape.allButFirst;
				result.collect { :each |
					padRight(each.nest, nextShape, anObject)
				}
			}
		}
	}

	padRight { :self |
		self.padRight(self.impliedShape, 0L)
	}

	rank { :self |
		self.shape.size
	}

	rankUnchecked { :self |
		(
			self.isEmpty | {
				self[1L].isList.not
			}
		).if {
			1L
		} {
			1L + self[1L].rankUnchecked
		}
	}

	ravel { :self |
		self.flatten
	}

	recycle { :self :shape |
		let result = 1L.to(shape[1L]).collect { :i |
			self.atWrap(i)
		};
		(shape.size = 1L).if {
			result
		} {
			let nextShape = shape.allButFirst;
			result.collect { :each |
				recycle(each.nest, nextShape)
			}
		}
	}

	recycle { :self |
		self.recycle(self.impliedShape)
	}

	replaceSubarray { :self :indices :subarray |
		let shape = subarray.shape;
		(shape = indices.collect(size/1)).if {
			let i = indices.tuples;
			let j = shape.collect { :n |
				[1L .. n]
			}.tuples;
			i.withDo(j) { :p :q |
				self.atPathPut!(p, subarray.atPath(q))
			}
		} {
			self.error('List>>replaceSubarray: index mismatch')
		}
	}

	reshapeList { :self :shape |
		self.assertIsOfSize(shape.product);
		shape.allButFirst.reverseDo { :n |
			self := self.clump(n)
		};
		self
	}

	shape { :self |
		let answer = self.shapeOrNil;
		answer.ifNil {
			self.error('shape: irregular arrays do not have shape')
		};
		answer
	}

	shapeOrNil { :self |
		(self.size = 0L).if {
			[0L]
		} {
			let type = self.typeName;
			let elementTypes = self.elementTypes;
			elementTypes.allSatisfy { :each |
				each = type
			}.if {
				let elementShapes = self.collect(shape/1);
				(elementShapes.nub(=).size = 1L).if {
					[self.size] ++ elementShapes.first
				} {
					nil
				}
			} {
				elementTypes.includes(type).if {
					nil
				} {
					[self.size]
				}
			}
		}
	}

	shapeUnchecked { :self |
		self.isEmpty.if {
			[0L]
		} {
			let leftmost = self[1L];
			leftmost.isList.if {
				[self.size] ++ leftmost.shapeUnchecked
			} {
				[self.size]
			}
		}
	}

	shiftDimensions { :self :anInteger |
		self.reshape(
			self.shape.rotateLeft(anInteger)
		)
	}

	subarray { :self :indices |
		let k = indices.size;
		let i = indices[1L];
		let a = self.atAll(i);
		(k = 1L).if {
			a
		} {
			let j = indices.allButFirst;
			a.collect { :each |
				each.subarray(j)
			}
		}
	}

	tensorProduct { :self |
		self.isEmpty.if {
			1L
		} {
			self.foldRight(outerProduct/2)
		}
	}

	transposeTriangle { :a |
		let k = a.size;
		1L.toCollect(k) { :c |
			1L.toCollect(k - c + 1L) { :r |
				a[r][c]
			}
		}
	}

	zeroes { :self |
		[0L].reshape(self)
	}

}

+[List, Range] {

	arrayPad { :self :z :o |
		self.isVector.if {
			let [m, n] = z;
			let k = self.size;
			1L.to(k + z.sum).collect { :i |
				let d = i - m;
				d.isBetween(1L, k).if {
					self[d]
				} {
					o
				}
			}
		} {
			self.isMatrix.if {
				let [m, n] = z;
				let [a, b] = self.shape;
				let p = m.sum + a;
				let q = n.sum + b;
				{ :i :j |
					let d = i - m[1L];
					let e = j - n[1L];
					(
						d.isBetween(1L, a) & {
							e.isBetween(1L, b)
						}
					).if {
						self[d][e]
					} {
						o
					}
				}.table(1L.to(p), 1L.to(q))
			} {
				self.error('arrayPad')
			}
		}
	}

	arrayReshape { :self :shape :missingValue |
		let m = self.size;
		let n = shape.product;
		(m = n).if {
			self.reshape(shape)
		} {
			(m < n).if {
				(self.flatten ++ List(n - m, missingValue)).reshape(shape)
			} {
				self.error('arrayReshape')
			}
		}
	}

	arrayReshape { :self :shape |
		self.arrayReshape(shape, nil)
	}

	boustrophedonTransform { :self |
		self.boustrophedonTriangle.collect(last/1)
	}

	boustrophedonTriangle { :a |
		let m = a.size;
		let t = 1L.to(m).triangularArray { :i :j |
			a[i]
		};
		1L.to(m).triangularArrayDo(
			{ :k :n |
				(n != 1L).ifTrue {
					t[k][n] := t[k][n - 1L] + t[k - 1L][k - n + 1L]
				}
			},
			0L
		);
		t
	}

	iota { :shape :start :step |
		let count = shape.product;
		let end = start + (count - 1L * step);
		Range(start, end, step).reshape(shape)
	}

	iota { :shape |
		1L.to(shape.product).reshape(shape)
	}

	isVectorOf { :self :elementType |
		self.isVector & {
			self.elementType = elementType
		}
	}

	[reshape, !] { :self :shape |
		let [n] = shape.shape;
		(n = 0L).if {
			self.error('reshape: not vector or empty shape?')
		} {
			self
			.flatten
			.wrapExtend(shape.product)
			.reshapeList(shape)
		}
	}

	reshapeLike { :self :another |
		let index = 1L;
		let items = self.flatten;
		another.deepCollect { :unusedItem |
			let item = items.atWrap(index);
			index := index + 1L;
			item
		}
	}

}

+[Float, Integer] {

	antidiagonalArray { :n :f/2 |
		1L.toCollect(n) { :i |
			1L.toCollect(i) { :j |
				f(j, i - j + 1L)
			}
		}
	}

	iota { :count :start :step |
		let end = start + (count - 1L * step);
		List(
			Range(start, end, step)
		)
	}

	iota { :count |
		iota(count, 1L, 1L)
	}

	mooreNeighborhood { :dimensions :range |
		let size = range * 2L + 1L;
		let length = (size ^ dimensions) - 1L;
		let neighbors = [];
		0L.toDo(length - 1L) { :i |
			let neighbor = List(dimensions, nil);
			let index = (i < (length / 2L)).if { i } { i + 1L };
			neighbors.add!(neighbor);
			1L.toDo(dimensions) { :d |
				let value = index % (size ^ d);
				neighbor[d] := value / (size ^ (d - 1L)) - range;
				index := index - value
			}
		};
		neighbors
	}

	vonNeumannNeighborhood { :dimensions :range |
		let size = range * 2L + 1L;
		let iterations = size ^ dimensions;
		let center = (iterations - 1L) // 2L;
		let neighbors = [];
		0L.toDo(iterations - 1L) { :i |
			(i = center).ifFalse {
				let neighbor = List(dimensions, nil);
				let distance = 0L;
				let remaining = i;
				0L.toDo(dimensions - 1L) { :d |
					let remainder = remaining % (size ^ (d + 1L));
					let value = remainder // (size ^ d) - range;
					neighbor[d + 1L] := value;
					distance := distance + value.abs;
					remaining :=  remaining - remainder
				};
				(distance <= range).ifTrue {
					neighbors.add!(neighbor)
				}
			}
		};
		neighbors
	}

}

+Function {

	arrayReduce { :self/1 :anArray :anInteger |
		(anInteger = 1L).if {
			anArray.collect(self/1)
		} {
			(anInteger = 2L).if {
				anArray.columnsCollect(self/1)
			} {
				self.error('arrayReduce: not implemented', [anInteger])
			}
		}
	}

}

+Range {

	arrayDepth { :unused |
		1L
	}

	dimensions { :self :k |
		(k = 0L).if {
			[]
		} {
			[self.size]
		}
	}

	dimensions { :self |
		[self.size]
	}

	isFloatVector { :self |
		self.elementType = 'Float'
	}

	rank { :self |
		1L
	}

	shape { :self |
		[self.size]
	}

}

+@Object {

	arrayDepth { :self |
		0L
	}

	dimensions { :self |
		[]
	}

	rank { :self |
		0L
	}

	shape { :self |
		[]
	}

}

+Range {

	antidiagonalArray { :self :f/2 |
		let a = self[1L];
		self.collect { :i |
			a.toCollect(i) { :j |
				f(j, i - j + a)
			}
		}
	}

	triangularArray { :self :aFunction/2 :k |
		let a = self[1L];
		self.collect { :n |
			a.to(max(a, n + k)).collect { :m |
				aFunction(n, m)
			}
		}
	}

	triangularArray { :self :aFunction/2 |
		triangularArray(self, aFunction/2, 0L)
	}

	triangularArrayDo { :self :aFunction/2 :k |
		let a = self[1L];
		self.do { :n |
			a.toDo(max(a, n + k)) { :m |
				aFunction(n, m)
			}
		}
	}

}

+List {

	isTriangularArray { :self |
		let k = self.size;
		let l = self.collect(size/1);
		l.hasEqualElements(Range(1L, k, 1L)) | {
			l.hasEqualElements(Range(k, 1L, -1L))
		}
	}

	triangularArray { :self :aFunction/2 |
		let k = self.size;
		1L.to(k).triangularArray { :i :j |
			aFunction(self[i], self[j])
		}
	}

}
