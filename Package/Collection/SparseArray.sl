SparseArray : [Object, Store, Equal, Compare, Do, At, Indices, Collection, Sequence] {

	| linearIndexMap shape unspecifiedValue | <Map>

	arrayDepth { :self |
		self.rank
	}

	arrayRules { :self |
		let shape = self.shape;
		let answer = [];
		self.linearIndexMap.withIndexDo { :each :i |
			answer.add!(
				shape.cartesianIndex(i) -> each
			)
		};
		answer
	}

	at { :self :i |
		let shape = self.shape;
		(shape.size = 1L).if {
			self.atLinear(
				self.shape.linearIndex([i])
			)
		} {
			let answer = [];
			self.linearIndexMap.keysAndValuesDo { :key :value |
				let c = shape.cartesianIndex(key);
				(c[1L] = i).ifTrue {
					answer.add!(c.allButFirst -> value)
				}
			};
			SparseArray(answer, shape.allButFirst, self.unspecifiedValue)
		}
	}

	atLinear { :self :linearIndex |
		let map = self.linearIndexMap;
		map.includesKey(linearIndex).if {
			map.at(
				linearIndex
			)
		} {
			self.unspecifiedValue
		}
	}

	atPath { :self :cartesianIndex |
		self.atLinear(
			self.shape.linearIndex(cartesianIndex)
		)
	}

	collect { :self :aFunction/1 |
		SparseArray(
			self.linearIndexMap.collect(aFunction/1),
			self.shape,
			self.unspecifiedValue
		)
	}

	deepIndices { :self |
		self.shape.shapeIndices
	}

	depth { :self |
		self.rank + 1L
	}

	dimensions { :self |
		self.shape
	}

	do { :self :aFunction/1 |
		self.linearIndexMap.do(aFunction/1)
	}

	indices { :self |
		self.shouldNotImplement('indices')
	}

	isMatrix { :self |
		self.rank = 2L
	}

	linearIndices { :self |
		self.linearIndexMap.keys
	}

	matrixPlot { :self |
		self.normalArray.matrixPlot
	}

	nonZeroPositions { :self |
		let rho = self.shape;
		self.linearIndexMap.keys.collect { :each |
			rho.cartesianIndex(each)
		}
	}

	nonZeroValues { :self |
		self.linearIndexMap.values
	}

	normalArray { :self |
		let map = self.linearIndexMap;
		let zero = self.unspecifiedValue;
		self.shape.iota.deepCollect { :each |
			let index = each;
			map.includesKey(index).if {
				map.at(index)
			} {
				zero
			}
		}
	}

	rank { :self |
		self.shape.size
	}

	ravel { :self |
		let n = self.shape.product;
		1L.to(n).collect { :i |
			self.atLinear(i)
		}
	}

	size { :self |
		self.shape.first
	}

	specifiedElementCount { :self |
		self.linearIndexMap.size
	}

	storeString { :self |
		'SparseArray(%, %, %)'.format(
			[
				self.arrayRules,
				self.shape,
				self.unspecifiedValue
			]
		)
	}

	withCollect { :self :other :aFunction/2 |
		(
			self.rank != other.rank | {
				self.unspecifiedValue != other.unspecifiedValue
			}
		).if {
			self.error('collect: unequal rank or unspecified value')
		} {
			let shape = self.shape.max(other.shape);
			let linearIndices = (self.linearIndices ++ other.linearIndices).nub.sort;
			SparseArray(
				linearIndices.collect { :i |
					i -> aFunction(self.atLinear(i), other.atLinear(i))
				},
				shape,
				self.unspecifiedValue
			)
		}
	}

	withDeepIndexDo { :self :elementAndIndexFunction/2 |
		self.linearIndexMap.keysAndValuesDo { :key :value |
			elementAndIndexFunction(
				self.shape.cartesianIndex(key),
				value
			)
		}
	}

}

+Map {

	SparseArray { :self :shape :unspecifiedValue |
		uncheckedSparseArray(
			self,
			shape,
			unspecifiedValue
		)
	}

}

+List {

	SparseArray { :self :shape :unspecifiedValue |
		let map = Map();
		self.do { :each |
			let index = each.key;
			let linearIndex = index.isNumber.if {
				index
			} {
				shape.linearIndex(index)
			};
			map.put!(
				linearIndex,
				each.value
			)
		};
		SparseArray(map, shape, unspecifiedValue)
	}

	SparseArray { :self |
		let shape = self.collect(key/1).max.L;
		SparseArray(self, shape, 0L)
	}

	arrayToSparseArray { :self :unspecifiedValue |
		SparseArray(
			self.arrayRules(unspecifiedValue),
			self.shape,
			unspecifiedValue
		)
	}

	booleanSparseArray { :indices :shape :zeroOne |
		let [a, b] = zeroOne;
		SparseArray(
			indices.collect { :i IntegerVector |
				i -> b
			},
			shape,
			a
		)
	}

	booleanSparseArray { :indices :shape |
		booleanSparseArray(indices, shape, [0L 1L])
	}

	sparseIdentityMatrix { :self |
		let [m, n] = self;
		let k = m.min(n);
		SparseArray(
			1L.to(k).collect { :i |
				[i i] -> 1L
			},
			[m n],
			0L
		)
	}

}
