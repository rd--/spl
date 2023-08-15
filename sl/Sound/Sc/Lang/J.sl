+@Object {

	bubble { :self :depth :levels |
		(levels <= 1).if {
			[self]
		} {
			[self.bubble(depth, levels - 1)]
		}
	}

	unbubble { :self :depth :levels |
		self
	}

}

+@Collection {

	maxDepth { :self |
		self.maxDepth(1)
	}

	maxDepth { :self :max |
		| answer = max; |
		self.do { :each |
			each.isCollection.ifTrue {
				answer := answer.max(each.maxDepth(max + 1))
			}
		};
		answer
	}

	maxSizeAtDepth { :self :rank |
		| maxSize = 0; |
		(rank = 0).if {
			self.size
		} {
			self.do { :each |
				|(
					size = (each.isCollection).if {
						each.maxSizeAtDepth(rank - 1)
					} {
						1
					}
				)|
				(size > maxSize).ifTrue {
					maxSize := size
				}
			};
			maxSize
		}
	}

}

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

	bubble { :self :depth :levels |
		(depth <= 0).if {
			(levels <= 1).if {
				[self]
			} {
				[self.bubble(depth, levels - 1)]
			}
		} {
			self.collect { :item |
				item.bubble(depth - 1, levels)
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

	slice { :self :cuts |
		(cuts.size = 0).if {
			self.copy
		} {
			|(
				firstCut = cuts.first,
				answer = firstCut.ifNil {
					self.copy
				} {
					self.atAll(firstCut.toArray)
				}
			)|
			(cuts.size = 1).if {
				answer.unbubble(0, 1)
			} {
				cuts := cuts.allButFirst;
				answer.collect { :item |
					item.isCollection.if {
						item.slice(cuts)
					} {
						item
					}
				}.unbubble(0, 1)
			}
		}
	}

	unbubble { :self :depth :levels |
		(depth <= 0).if {
			(self.size > 1).if {
				self
			} {
				(levels <= 1).if {
					self.first
				} {
					self.first.unbubble(depth, levels - 1)
				}
			}
		} {
			self.collect { :item |
				item.unbubble(depth - 1, 1)
			}
		}
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
