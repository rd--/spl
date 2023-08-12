+@SequenceableCollection {

	atPath { :self :path |
		path.ifEmpty {
			'SequenceableCollection>>atPath: empty path'.error
		} {
			| inner = self[path.first]; |
			(path.size = 1).if {
				inner
			} {
				inner.atPath(path.allButFirst)
			}
		}
	}

	atPathPut { :self :path :anObject |
		path.ifEmpty {
			'SequenceableCollection>>atPathPut: empty path'.error
		} {
			| inner = self.at(path.first); |
			(path.size = 1).if {
				self[path.first] := anObject
			} {
				inner.atPathPut(path.allButFirst, anObject)
			}
		}
	}

	iota { :self |
		(1 .. self.product).reshape(self)
	}

	rank { :self |
		self.ifEmpty {
			1
		} {
			| inner = self.first; |
			(inner.typeOf = self.typeOf).if {
				1 + inner.rank
			} {
				1
			}
		}
	}

	reshape { :self :shape |
		|(
			size = shape.product,
			answer = self.flattened.wrapExtend(size)
		)|
		shape.allButFirst.reverseDo { :n |
			answer := answer.clump(n)
		};
		answer
	}

	shape { :self |
		| inner = self.first; |
		(inner.typeOf = self.typeOf).if {
			[self.size] ++ inner.shape
		} {
			[self.size]
		}
	}

	shapeIndicesDo { :self :aBlock:/1 |
		self.collect { :each |
			1.upTo(each)
		}.allTuplesDo(aBlock:/1)
	}

	shapeIndices { :self |
		self.collect { :each |
			1.upTo(each)
		}.allTuples
	}

}

+Procedure {

	dupShape { :self:/0 :shape |
		| answer = shape.iota; |
		shape.shapeIndicesDo { :index |
			answer.atPathPut(index, self())
		};
		answer
	}

}
