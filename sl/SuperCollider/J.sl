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

	deepCollect { :self :depth :aBlock |
		aBlock.numArgs.caseOfOtherwise([
			{ 1 } -> {
				self.deepCollect(depth, { :each :unusedIndex :unusedRank |
					aBlock . (each)
				}, 1, 0)
			},
			{ 3 } -> {
				self.deepCollect(depth, aBlock, 1, 0)
			}
		]) {
			'Collection>>deepCollect: block must have one or three arguments'.error
		}
	}

	deepCollect { :self :depth :aBlock:/3 :index :rank |
		(depth.isNil).if {
			rank +:= 1;
			self.withIndexCollect { :item :itemIndex |
				item.deepCollect(depth, aBlock, itemIndex, rank)
			}
		} {
			(depth <= 0).if {
				aBlock(self, index, rank)
			} {
				depth -:= 1;
				rank +:= 1;
				self.collect { :item |
					item.isCollection.if {
						item.deepCollect(depth, aBlock:/3, index, rank)
					} {
						aBlock(item, index, rank)
					}
				}
			}
		}
	}

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

+@Sequenceable {

	atPath { :self :path |
		path.ifEmpty {
			'Sequenceable>>atPath: empty path'.error
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
			'Sequenceable>>atPathPut: empty path'.error
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

	reshapeLike { :self :another |
		| index = 1, items = self.flattened; |
		another.deepCollect(16r7FFFFFFF) { :unusedItem |
			| item = items.atWrap(index); |
			index +:= 1;
			item
		}
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
			1.to(each)
		}.allTuplesDo(aBlock:/1)
	}

	shapeIndices { :self |
		self.collect { :each |
			1.to(each)
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
					self.atAll(firstCut.asCollection)
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

+Block {

	duplicateShape { :self:/0 :shape |
		| answer = shape.iota; |
		shape.shapeIndicesDo { :index |
			answer.atPathPut(index, self())
		};
		answer
	}

}
