Matrix : [Object] { | numberOfRows numberOfColumns elementType contents |

	at { :self :i :j |
		self.contents[i, j]
	}

	determinant { :self |
		self.isSquareMatrix.if {
			let size = self.numberOfRows;
			let array = self.contents;
			(size = 2).if {
				(array[1, 1] * array[2, 2]) - (array[1, 2] * array[2, 1])
			} {
				(size = 3).if {
					(array[1, 1] * array[2, 2] * array[3, 3]) +
					(array[1, 2] * array[2, 3] * array[3, 1]) +
					(array[1, 3] * array[2, 1] * array[3, 2]) -
					(array[1, 3] * array[2, 2] * array[3, 1]) -
					(array[1, 2] * array[2, 1] * array[3, 3]) -
					(array[1, 1] * array[2, 3] * array[3, 2])
				} {
					'Matrix>>determinant: not implemented'.error
				}
			}
		} {
			'Matrix>>determinant: not defined at non-square matrices'.error
		}
	}

	diagonal { :self :k |
		let l = self.shape.min - k.abs;
		1:l.collect { :i |
			self[i - k.min(0), i + k.max(0)]
		}
	}

	diagonal { :self |
		self.diagonal(0)
	}

	isColumnVector { :self |
		self.numberOfColumns = 1
	}

	isMatrixOf { :self :elementType |
		self.elementType = elementType
	}

	isRowVector { :self |
		self.numberOfRows = 1
	}

	isSquareMatrix { :self |
		self.numberOfRows = self.numberOfColumns
	}

	linearIndex { :self :i :j |
		(i - 1) * self.numberOfRows + j
	}

	shape { :self |
		[self.numberOfRows, self.numberOfColumns]
	}

	trace { :self :aBlock:/1 |
		let limit = self.shape.min;
		aBlock(
			1:limit.collect { :each |
				self.at(each, each)
			}
		)
	}

	trace { :self |
		self.trace(sum:/1)
	}

}

+@Sequence {

	asMatrix { :self :aBlock:/1 |
		self.isMatrix.if {
			let numberOfRows = self.size;
			let numberOfColumns = self.anyOne.size;
			let elementType = self.anyOne.elementType;
			self.allSatisfy { :each |
				each.elementType = elementType
			}.if {
				newMatrix().initializeSlots(numberOfRows, numberOfColumns, elementType, aBlock(self))
			} {
				self.error('@Sequence>>asMatrix: non-uniform elementType')
			}
		} {
			self.error('@Sequence>>asMatrix: not a matrix')
		}
	}

	asMatrix { :self |
		self.asMatrix(deepCopy:/1)
	}

	determinant { :self |
		self.asMatrix(identity:/1).determinant
	}

	numberOfRows { :self |
		self.isArray.if {
			self.size
		} {
			self.error('@Sequence>>numberOfRows: not an array')
		}
	}

	numberOfColumns { :self |
		self.isArray.if {
			self.anyOne.size
		} {
			self.error('@Sequence>>numberOfColumns: not an array')
		}
	}

}
