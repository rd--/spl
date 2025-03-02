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

	coordinateBoundsArray { :rangeList :stepList :offset |
		(rangeList +.each offset).withCollect(stepList) { :range :step |
			let [l, r] = range;
			[l, l + step .. r]
		}.tuples
	}

	coordinateBoundsArray { :rangeList :stepList |
		coordinateBoundsArray(rangeList, stepList, [0])
	}

	dimensions { :self :anInteger |
		(anInteger < 1).if {
			[]
		} {
			let answer = [];
			answer.add(self.size);
			self.allSatisfy(isList:/1).ifTrue {
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

	isArray { :self |
		self.shapeOrNil.notNil
	}

	isCommensurate { :self :other |
		self.shape = other.shape & {
			self.elementType = other.elementType
		}
	}

	isMatrix { :self |
		self.dimensions(2).size = 2
	}

	isSmallFloatVector { :self |
		self.isVector & {
			self.elementType = 'SmallFloat'
		}
	}

	isVector { :self |
		self.noneSatisfy(isList:/1)
	}

	padLeft { :self :aList :anObject |
		self.padRight(aList.negated, anObject)
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

	ravel { :self |
		self.flatten
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

	reshape { :self :shape |
		shape.ifEmpty {
			self.error('reshape: empty shape?')
		} {
			let size = shape.product;
			let answer = self.flatten.wrapExtend(size);
			shape.allButFirst.reverseDo { :n |
				answer := answer.clump(n)
			};
			answer
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
