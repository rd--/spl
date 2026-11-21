+@Object {

	bubble { :self :depth :levels |
		(levels <= 1L).if {
			[self]
		} {
			[self.bubble(depth, levels - 1L)]
		}
	}

	unbubble { :self :depth :levels |
		self
	}

}

+@Collection {

	maxSizeAtDepth { :self :depth |
		let maxSize = 0L;
		(depth = 1L).if {
			self.size
		} {
			self.do { :each |
				let size = (each.isCollection).if {
					each.maxSizeAtDepth(depth - 1L)
				} {
					1L
				};
				(size > maxSize).ifTrue {
					maxSize := size
				}
			};
			maxSize
		}
	}

}

+List {

	bubble { :self :depth :levels |
		(depth <= 0L).if {
			(levels <= 1L).if {
				[self]
			} {
				[self.bubble(depth, levels - 1L)]
			}
		} {
			self.collect { :each |
				each.bubble(depth - 1L, levels)
			}
		}
	}

	shapeIndices { :self |
		self.collect { :each |
			1L.to(each)
		}.tuples
	}

	shapeIndicesDo { :self :aFunction/1 |
		self.collect { :each |
			1L.to(each)
		}.tuplesDo(aFunction/1)
	}

	slice { :self :cuts |
		(cuts.size = 0L).if {
			self.copy
		} {
			let firstCut = cuts.first;
			let answer = firstCut.ifNil {
				self.copy
			} {
				self.atAll(firstCut.nest)
			};
			(cuts.size = 1L).if {
				answer.unbubble(0L, 1L)
			} {
				cuts := cuts.allButFirst;
				answer.collect { :each |
					each.isCollection.if {
						each.slice(cuts)
					} {
						each
					}
				}.unbubble(0L, 1L)
			}
		}
	}

	unbubble { :self :depth :levels |
		(depth <= 0L).if {
			(self.size > 1L).if {
				self
			} {
				(levels <= 1L).if {
					self.first
				} {
					self.first.unbubble(depth, levels - 1L)
				}
			}
		} {
			self.collect { :each |
				each.unbubble(depth - 1L, 1L)
			}
		}
	}

}
