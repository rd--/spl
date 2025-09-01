SparseArray : [Object, Iterable, Indexable, Collection, Sequenceable] { | contents shape unspecifiedValue |

	arrayDepth { :self |
		self.rank
	}

	arrayRules { :self |
		let shape = self.shape;
		let answer = [];
		self.contents.withIndexDo { :each :i |
			answer.add(shape.cartesianIndex(i) -> each)
		};
		answer
	}

	at { :self :i |
		let shape = self.shape;
		(shape.size = 1).if {
			self.atLinear(self.shape.linearIndex([i]))
		} {
			let answer = [];
			self.contents.keysAndValuesDo { :key :value |
				let c = shape.cartesianIndex(key);
				(c[1] = i).ifTrue {
					answer.add(c.allButFirst -> value)
				}
			};
			SparseArray(answer, shape.allButFirst, self.unspecifiedValue)
		}
	}

	at { :self :i :j |
		self.at(i).at(j)
	}

	atLinear { :self :linearIndex |
		let map = self.contents;
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

	collect { :self :aBlock:/1 |
		SparseArray(
			self.contents.collect(aBlock:/1),
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

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1)
	}

	isMatrix { :self |
		self.rank = 2
	}

	linearIndices { :self |
		self.contents.keys
	}

	nonZeroPositions { :self |
		let rho = self.shape;
		self.contents.keys.collect { :each |
			rho.cartesianIndex(each)
		}
	}

	nonZeroValues { :self |
		self.contents.values
	}

	normal { :self |
		let map = self.contents;
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
		(1 .. n).collect { :i |
			self.atLinear(i)
		}
	}

	size { :self |
		self.shape.first
	}

	specifiedElementCount { :self |
		self.contents.size
	}

	storeString { :self |
		'SparseArray(%, %, %)'.format([
			self.arrayRules,
			self.shape,
			self.unspecifiedValue
		])
	}

	withCollect { :self :other :aBlock:/2 |
		(
			self.rank != other.rank | {
				self.unspecifiedValue != other.unspecifiedValue
			}
		).if {
			self.error('withCollect: unequal rank or unspecified value')
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

	withDeepIndexDo { :self :elementAndIndexBlock:/2 |
		self.contents.keysAndValuesDo { :key :value |
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
			map.atPut(
				linearIndex,
				each.value
			)
		};
		SparseArray(map, shape, unspecifiedValue)
	}

	SparseArray { :self |
		let shape = self.collect(key:/1).max;
		SparseArray(self, shape, 0)
	}

	sparseIdentityMatrix { :self |
		let [m, n] = self;
		let k = m.min(n);
		SparseArray(
			(1 .. k).collect { :i |
				[i i] -> 1
			},
			[m n],
			0
		)
	}

}
