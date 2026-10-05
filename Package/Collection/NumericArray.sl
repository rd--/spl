NumericArray : [Object, Store, Equal, Compare, Iterable, Indexable, Collection, Sequence] { | array shape storageType |

	arrayDepth { :self |
		self.shape.size
	}

	atIfAbsent { :self :i :ifAbsent/0 |
		(self.rank = 1).if {
			self.array.atIfAbsent(i, ifAbsent/0)
		} {
			self.error('NumericArray>>atIfAbsent: rank not one')
		}
	}

	atLinear { :self :index |
		self.array.at(index)
	}

	atPath { :self :cartesianIndex |
		self.array.at(
			self.shape.linearIndex(cartesianIndex)
		)
	}

	atPathPut! { :self :cartesianIndex :x |
		self.array.put!(
			self.shape.linearIndex(cartesianIndex),
			x
		)
	}

	collect { :self :aBlock/1 |
		NumericArray(
			self.array.collect(aBlock/1),
			self.shape
		)
	}

	deepIndices { :self |
		self.shape.shapeIndices
	}

	depth { :self |
		self.rank + 1
	}

	dimensions { :self |
		self.shape
	}

	dimensions { :self :anInteger |
		self.shape.take(anInteger)
	}

	do { :self :aBlock/1 |
		self.array.do(aBlock/1)
	}

	elementType { :unused |
		'SmallFloat'
	}

	equalBy { :self :anObject :aBlock/2 |
		anObject.isNumericArray & {
			(self.shape = anObject.shape) & {
				(self.storageType = anObject.storageType) & {
					aBlock(self.array, anObject.array)
				}
			}
		}
	}

	isArray { :unused |
		true
	}

	isCommensurate { :self :other |
		self.shape = other.shape & {
			self.storageType = other.storageType
		}
	}

	isMatrix { :self |
		self.rank = 2
	}

	isSquareMatrix { :self |
		(self.rank = 2) & {
			let [n, m] = self.shape;
			n = m
		}
	}

	linearIndices { :self |
		self.array.keys
	}

	[List, normal] { :self |
		self.array.List.reshape(self.shape)
	}

	matrixPlot { :self |
		self.normal.matrixPlot
	}

	rank { :self |
		self.shape.size
	}

	ravel { :self |
		self.array.List
	}

	size { :self |
		self.shape.first
	}

	storeString { :self |
		self.storeStringAsInitializeSlotsOmitting(['storageType'])
	}

	transpose! { :self |
		(self.rank = 2).if {
			let [m, n] = self.shape;
			(n = m).if {
				1.toDo(n) { :i |
					(i + 1).toDo(n) { :j |
						let x = self.atPath([i, j]);
						let y = self.atPath([j, i]);
						self.atPathPut!([i, j], y);
						self.atPathPut!([j, i], x)
					}
				}
			}{
				let c = self.array;
				let k = m * n;
				let visited = BitSet(k);
				let cycle = 0;
				{
					cycle := cycle + 1;
					cycle != k
				}.whileTrue {
					(visited[cycle] = 0).ifTrue {
						let a = cycle;
						{
							a := (a = (k - 1)).if {
								k - 1
							} {
								(a * m) % (k - 1)
							};
							c.swapWith!(a + 1, cycle + 1);
							visited[a] := 1
						}.doWhileTrue {
							a != cycle
						}
					}
				};
				self.shape.reverse!
			}
		} {
			self.error('NumericArray>>transpose!: not matrix')
		}
	}

	transpose { :self |
		self.isMatrix.if {
			let [m, n] = self.shape;
			let c = self.array;
			let a = c.species.new(m * n);
			let k = 1;
			1.toDo(n) { :i |
				1.toDo(m) { :j |
					a[k] := c[((j - 1) * n) + i];
					k := k + 1
				}
			};
			NumericArray(a, [n, m])
		} {
			self.error('NumericArray>>transpose: not matrix')
		}
	}

	withCollect { :self :other :aBlock/2 |
		self.isCommensurate(other).if {
			NumericArray(
				self.array.withCollect(other.array, aBlock/2),
				self.shape
			)
		} {
			self.error('NumericArray>>withCollect: unequal shape or storage type')
		}
	}

}

+[List, Range] {

	NumericArray { :self :storageType |
		let array = storageType.caseOf(
			[
				'Byte' -> { self.ravel.ByteArray },
				'Float32' -> { self.ravel.Float32Array },
				'Float64' -> { self.ravel.Float64Array }
			]
		);
		NumericArray(array, self.shape)
	}

	NumericArray { :self |
		NumericArray(self, 'Float64')
	}

}

+[ByteArray, Float32Array, Float64Array] {

	NumericArray { :self :shape |
		newNumericArray().initializeSlots(
			self,
			shape,
			self.storageType
		)
	}

}
