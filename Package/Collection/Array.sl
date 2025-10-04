+List {

	arrayDepth { :self |
		self.dimensions.size
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
			self.error('List>>arrayFlatten: not array')
		}
	}

	arrayPad { :self :z :o |
		self.isVector.if {
			let [m, n] = z;
			let k = self.size;
			(1 .. k + z.sum).collect { :i |
				let d = i - m;
				d.betweenAnd(1, k).if {
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
					let d = i - m[1];
					let e = j - n[1];
					(
						d.betweenAnd(1, a) & {
							e.betweenAnd(1, b)
						}
					).if {
						self[d][e]
					} {
						o
					}
				}.table(1:p, 1:q)
			} {
				self.error('arrayPad')
			}
		}
	}

	coordinateBoundingBoxArray { :bounds :steps :offset |
		let [m, n] = bounds.shape;
		bounds.transpose.coordinateBoundsArray(steps, offset)
	}

	coordinateBoundingBoxArray { :bounds :steps |
		bounds.coordinateBoundingBoxArray(steps, [0])
	}

	coordinateBoundsArray { :rangeList :stepList :offset |
		(rangeList +.each offset).withCollect(stepList) { :range :step |
			let [l, r] = range;
			[l, l + step .. r]
		}.tuplesArray
	}

	coordinateBoundsArray { :rangeList :stepList |
		coordinateBoundsArray(rangeList, stepList, [0])
	}

	coordinateBoundsList { :rangeList :stepList :offset |
		(rangeList +.each offset).withCollect(stepList) { :range :step |
			let [l, r] = range;
			[l, l + step .. r]
		}.tuples
	}

	dimensions { :self :anInteger |
		(anInteger < 1).if {
			[]
		} {
			let answer = [];
			answer.add(self.size);
			(self.isNotEmpty & { self.allSatisfy(isSequenceable:/1) }).ifTrue {
				let k = self.anyOne.size;
				self.allSatisfy { :each |
					each.size = k
				}.ifTrue {
					answer.addAll(self.anyOne.dimensions(anInteger - 1))
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
				self.collect(reverse:/1)
			} {
				self.collect(flipLeftRight:/1)
			}
		}
	}

	impliedShape { :self |
		self.isVector.if {
			self
		} {
			let answer = [self.size];
			1.toDo(self.depth - 2) { :i |
				answer.add(
					self.level([i]).collect { :each |
						each.nest.size
					}.max
				)
			};
			answer
		}
	}

	isArray { :self :depth :aBlock:/1 |
		let rho = self.shapeOrNil;
		rho.isNotNil & {
			rho.size = depth & {
				self.deepAllSatisfy(aBlock:/1)
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

	isMatrix { :self :aBlock:/1 |
		self.isArray(2, aBlock:/1)
	}

	isMatrix { :self |
		self.arrayDepth = 2
	}

	isSmallFloatMatrix { :self |
		self.arrayDepth = 2 & {
			self.deepAllSatisfy(isSmallFloat:/1)
		}
	}

	isSmallFloatVector { :self |
		self.allSatisfy(isSmallFloat:/1)
	}

	isVector { :self :aBlock:/1 |
		self.allSatisfy { :each |
			each.isList.not & {
				aBlock(each)
			}
		}
	}

	isVector { :self |
		self.noneSatisfy(isList:/1)
	}

	padLeft { :self :aList :anObject |
		self.padRight(aList.negate, anObject)
	}

	padLeft { :self |
		self.padLeft(self.impliedShape, 0)
	}

	padRight { :self :shape :anObject |
		let affix = anObject # (shape[1].abs - self.size);
		let next = shape[1].isNegative.if { affix ++ self } { self ++ affix };
		(shape.size = 1).if {
			next
		} {
			let nextShape = shape.allButFirst;
			next.collect { :each |
				padRight(each.nest, nextShape, anObject)
			}
		}
	}

	padRight { :self |
		self.padRight(self.impliedShape, 0)
	}

	rank { :self |
		self.shape.size
	}

	rankUnchecked { :self |
		(self.isEmpty | { self[1].isList.not }).if {
			1
		} {
			1 + self[1].rankUnchecked
		}
	}

	ravel { :self |
		self.flatten
	}

	recycle { :self :shape |
		let next = 1.to(shape[1]).collect { :i |
			self.atWrap(i)
		};
		(shape.size = 1).if {
			next
		} {
			let nextShape = shape.allButFirst;
			next.collect { :each |
				recycle(each.nest, nextShape)
			}
		}
	}

	recycle { :self |
		self.recycle(self.impliedShape)
	}

	replaceSubarray { :self :indices :subarray |
		let shape = subarray.shape;
		(shape = indices.collect(size:/1)).if {
			let i = indices.tuples;
			let j = shape.collect { :n | [1 .. n] }.tuples;
			i.withDo(j) { :p :q |
				self.atPathPut(p, subarray.atPath(q))
			}
		} {
			self.error('List>>replaceSubarray: index mismatch')
		}
	}

	reshapeList { :self :shape |
		shape.allButFirst.reverseDo { :n |
			self := self.clump(n)
		};
		self
	}

	shapeOrNil { :self |
		(self.size = 0).if {
			[0]
		} {
			let type = self.typeOf;
			let elementTypes = self.elementTypes;
			elementTypes.allSatisfy { :each |
				each = type
			}.if {
				let elementShapes = self.collect(shape:/1);
				(elementShapes.nub.size = 1).if {
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

	shape { :self |
		self.shapeOrNil.ifNil {
			self.error('shape: irregular arrays do not have shape')
		} { :answer |
			answer
		}
	}

	shapeUnchecked { :self |
		self.isEmpty.if {
			[0]
		} {
			let leftmost = self[1];
			leftmost.isList.if {
				[self.size] ++ leftmost.shapeUnchecked
			} {
				[self.size]
			}
		}
	}

	subarray { :self :indices |
		let k = indices.size;
		let i = indices[1];
		let a = self.atAll(i);
		(k = 1).if {
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
			1
		} {
			self.foldRight(outerProduct:/2)
		}
	}

	zeros { :self |
		[0].reshape(self)
	}

}

+[List, Range] {

	iota { :shape :start :step |
		let count = shape.product;
		let end = start + (count - 1 * step);
		Range(start, end, step).reshape(shape)
	}

	iota { :shape |
		(1 .. shape.product).reshape(shape)
	}

	isVectorOf { :self :elementType |
		self.isVector & {
			self.elementType = elementType
		}
	}

	reshape { :self :shape |
		shape.ifEmpty {
			self.error('reshape: empty shape?')
		} {
			self
			.flatten
			.wrapExtend(shape.product)
			.reshapeList(shape)
		}
	}

	reshapeLike { :self :another |
		let index = 1;
		let items = self.flatten;
		another.deepCollect { :unusedItem |
			let item = items.atWrap(index);
			index := index + 1;
			item
		}
	}

}

+@Integer {

	iota { :count :start :step |
		let end = start + (count - 1 * step);
		Range(start, end, step).asList
	}

	iota { :count |
		Range(1, count, 1).asList
	}

	mooreNeighborhood { :dimensions :range |
		let size = range * 2 + 1;
		let length = (size ^ dimensions) - 1;
		let neighbors = [];
		0.toDo(length - 1) { :i |
			let neighbor = List(dimensions);
			let index = (i < (length / 2)).if { i } { i + 1 };
			neighbors.add(neighbor);
			1.toDo(dimensions) { :d |
				let value = index % (size ^ d);
				neighbor[d] := value / (size ^ (d - 1)) - range;
				index := index - value
			}
		};
		neighbors
	}

	vonNeumannNeighborhood { :dimensions :range |
		let size = range * 2 + 1;
		let iterations = size ^ dimensions;
		let center = (iterations - 1) / 2;
		let neighbors = [];
		0.toDo(iterations - 1) { :i |
			(i = center).ifFalse {
				let neighbor = List(dimensions);
				let distance = 0;
				let remaining = i;
				0.toDo(dimensions - 1) { :d |
					let remainder = remaining % (size ^ (d + 1));
					let value = remainder / (size ^ d) - range;
					neighbor[d + 1] := value;
					distance := distance + value.abs;
					remaining :=  remaining - remainder
				};
				(distance <= range).ifTrue {
					neighbors.add(neighbor)
				}
			}
		};
		neighbors
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

+Range {

	arrayDepth { :unused |
		1
	}

	dimensions { :self :k |
		(k = 0).if {
			[]
		} {
			[self.size]
		}
	}

	dimensions { :self |
		[self.size]
	}

	rank { :self |
		1
	}

	shape { :self |
		[self.size]
	}

}

+@Object {

	arrayDepth { :self |
		0
	}

	dimensions { :self |
		[]
	}

	rank { :self |
		0
	}

	shape { :self |
		[]
	}

}
