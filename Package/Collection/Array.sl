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

	rank { :self |
		self.shape.size
	}

	ravel { :self |
		self.flatten
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
