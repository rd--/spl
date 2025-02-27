NumericArray : [Object, Iterable, Indexable, Collection, Sequence] { | contents shape storageType |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
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
			self.error('at')
		}
	}

	at { :self :i :j |
		(self.rank = 2).if {
			let [m, n] = self.shape;
			self.contents.at(i * n + j)
		} {
			self.error('at')
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

	elementType { :self |
		'SmallFloat'
	}

	isCommensurate { :self :other |
		self.shape = other.shape & {
			self.storageType = other.storageType
		}
	}

	isMatrix { :self |
		self.rank = 2
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

	withCollect { :self :other :aBlock:/2 |
		self.isCommensurate(other).if {
			self.contents.withCollect(other.contents, aBlock:/2).asNumericArray(
				self.shape
			)
		} {
			self.error('withCollect: unequal shape or storage type')
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
