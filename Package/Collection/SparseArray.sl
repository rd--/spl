SparseArray : [Object, Store, Equal, Compare, Do, At, Collect, Collection, Sequence] {

	| linearIndexMap shape unspecifiedValue |

	arrayDepth { :self |
		self.rank
	}

	arrayRules { :self |
		let shape = self.shape;
		let answer = [];
		self.linearIndexMap.withIndexDo { :each :i |
			answer.add!(shape.cartesianIndex(i) -> each)
		};
		answer
	}

	at { :self :i |
		let shape = self.shape;
		(shape.size = 1).if {
			self.atLinear(self.shape.linearIndex([i]))
		} {
			let answer = [];
			self.linearIndexMap.keysAndValuesDo { :key :value |
				let c = shape.cartesianIndex(key);
				(c[1] = i).ifTrue {
					answer.add!(c.allButFirst -> value)
				}
			};
			SparseArray(answer, shape.allButFirst, self.unspecifiedValue)
		}
	}

	atLinear { :self :linearIndex |
		let map = self.linearIndexMap;
		map.includesKey(linearIndex).if {
			map.at(linearIndex)
		} {
			self.unspecifiedValue
		}
	}

	atPath { :self :cartesianIndex |
		self.atLinear(
			self.shape.linearIndex(cartesianIndex)
		)
	}

	collect { :self :aBlock/1 |
		SparseArray(
			self.linearIndexMap.collect(aBlock/1),
			self.shape,
			self.unspecifiedValue
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

	do { :self :aBlock/1 |
		self.linearIndexMap.do(aBlock/1)
	}

	isMatrix { :self |
		self.rank = 2
	}

	linearIndices { :self |
		self.linearIndexMap.keys
	}

	matrixPlot { :self |
		self.normal.matrixPlot
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

	normal { :self |
		let map = self.linearIndexMap;
		let zero = self.unspecifiedValue;
		self.shape.iota.deepCollect { :each |
			map.includesKey(each).if {
				map.at(each)
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
		1.to(n).collect { :i |
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
		'SparseArray(%, %, %)'.format([
			self.arrayRules,
			self.shape,
			self.unspecifiedValue
		])
	}

	withCollect { :self :other :aBlock/2 |
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
					i -> aBlock(self.atLinear(i), other.atLinear(i))
				},
				shape,
				self.unspecifiedValue
			)
		}
	}

	withDeepIndexDo { :self :elementAndIndexBlock/2 |
		self.linearIndexMap.keysAndValuesDo { :key :value |
			elementAndIndexBlock(
				self.shape.cartesianIndex(key),
				value
			)
		}
	}

}

+Map {

	SparseArray { :self :shape :unspecifiedValue |
		newSparseArray().initializeSlots(self, shape, unspecifiedValue)
	}

}

+List {

	asSparseArray { :self :unspecifiedValue |
		SparseArray(
			self.arrayRules(unspecifiedValue),
			self.shape,
			unspecifiedValue
		)
	}

	SparseArray { :self :shape :unspecifiedValue |
		let map = Map();
		self.do { :each |
			let index = each.key;
			let linearIndex = index.isNumber.if { index } { shape.linearIndex(index) };
			map.put!(
				linearIndex,
				each.value
			)
		};
		SparseArray(map, shape, unspecifiedValue)
	}

	SparseArray { :self |
		let shape = self.collect(key/1).max;
		SparseArray(self, shape, 0)
	}

	sparseIdentityMatrix { :self |
		let [m, n] = self;
		let k = m.min(n);
		SparseArray(
			1.to(k).collect { :i |
				[i i] -> 1
			},
			[m n],
			0
		)
	}

}
