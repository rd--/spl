NumericArray : [Object, Iterable, Indexable, Collection, Sequenceable] { | contents shape storageType |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	~ { :self :anObject |
		anObject.isNumericArray & {
			(self.shape = anObject.shape) & {
				(self.storageType = anObject.storageType) & {
					self.contents ~ anObject.contents
				}
			}
		}
	}

	arrayDepth { :self |
		self.shape.size
	}

	asList { :self |
		self.normal
	}

	at { :self :i |
		(self.rank = 1).if {
			self.contents.at(i)
		} {
			self.error('NumericArray>>at')
		}
	}

	at { :self :i :j |
		(self.rank = 2).if {
			let [m, n] = self.shape;
			let linearIndex = ((i - 1) * n) + j;
			self.contents.at(linearIndex)
		} {
			self.error('NumericArray>>at')
		}
	}

	atLinear { :self :index |
		self.contents.at(index)
	}

	atPath { :self :cartesianIndex |
		self.contents.at(
			self.shape.linearIndex(cartesianIndex)
		)
	}

	atPut { :self :i :j :x |
		(self.rank = 2).if {
			let [m, n] = self.shape;
			let linearIndex = ((i - 1) * n) + j;
			self.contents.atPut(linearIndex, x)
		} {
			self.error('NumericArray>>atPut')
		}
	}

	collect { :self :aBlock:/1 |
		self.contents.collect(aBlock:/1).asNumericArray(
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

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1)
	}

	elementType { :unused |
		'SmallFloat'
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
		self.contents.keys
	}

	matrixPlot { :self |
		self.normal.matrixPlot
	}

	normal { :self |
		self.contents.asList.reshape(self.shape)
	}

	rank { :self |
		self.shape.size
	}

	ravel { :self |
		self.contents.asList
	}

	size { :self |
		self.shape.first
	}

	storeString { :self |
		'%.asNumericArray(%)'.format([
			self.contents,
			self.shape
		])
	}

	transpose { :self |
		(self.rank = 2).if {
			let [m, n] = self.shape;
			(n = m).if {
				1.toDo(n) { :i |
					(i + 1).toDo(n) { :j |
						let x = self.at(i, j);
						let y = self.at(j, i);
						self.atPut(i, j, y);
						self.atPut(j, i, x)
					}
				}
			}{
				let c = self.contents;
				let k = m * n;
				let visited = BitSet(k);
				let cycle = 0;
				{
					cycle := cycle + 1;
					cycle ~= k
				}.whileTrue {
					(visited[cycle] = 0).ifTrue {
						let a = cycle;
						{
							a := (a = (k - 1)).if {
								k - 1
							} {
								(a * m) % (k - 1)
							};
							c.swapWith(a + 1, cycle + 1);
							visited[a] := 1
						}.doWhileTrue {
							a ~= cycle
						}
					}
				};
				self.shape.reverse
			}
		} {
			self.error('NumericArray>>transpose: not matrix')
		}
	}

	transposed { :self |
		self.isMatrix.if {
			let [m, n] = self.shape;
			let c = self.contents;
			let a = c.species.new(m * n);
			let k = 1;
			1.toDo(n) { :i |
				1.toDo(m) { :j |
					a[k] := c[((j - 1) * n) + i];
					k := k + 1
				}
			};
			a.asNumericArray([n, m])
		} {
			self.error('NumericArray>>transposed: not matrix')
		}
	}

	withCollect { :self :other :aBlock:/2 |
		self.isCommensurate(other).if {
			self.contents.withCollect(other.contents, aBlock:/2).asNumericArray(
				self.shape
			)
		} {
			self.error('NumericArray>>withCollect: unequal shape or storage type')
		}
	}

}

+[List, Range] {

	asNumericArray { :self :storageType |
		let contents = storageType.caseOf([
			'Byte' -> { self.ravel.asByteArray },
			'Float32' -> { self.ravel.asFloat32Array },
			'Float64' -> { self.ravel.asFloat64Array }
		]);
		asNumericArray(contents, self.shape)
	}

	asNumericArray { :self |
		self.asNumericArray('Float64')
	}

}

+[ByteArray, Float32Array, Float64Array] {

	asNumericArray { :self :shape |
		newNumericArray().initializeSlots(
			self,
			shape,
			self.storageType
		)
	}

}
