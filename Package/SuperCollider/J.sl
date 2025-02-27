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

	maxSizeAtDepth { :self :depth |
		let maxSize = 0;
		(depth = 1).if {
			self.size
		} {
			self.do { :each |
				let size = (each.isCollection).if {
					each.maxSizeAtDepth(depth - 1)
				} {
					1
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
		(depth <= 0).if {
			(levels <= 1).if {
				[self]
			} {
				[self.bubble(depth, levels - 1)]
			}
		} {
			self.collect { :each |
				each.bubble(depth - 1, levels)
			}
		}
	}

	shapeIndicesDo { :self :aBlock:/1 |
		self.collect { :each |
			1.to(each)
		}.tuplesDo(aBlock:/1)
	}

	shapeIndices { :self |
		self.collect { :each |
			1.to(each)
		}.tuples
	}

	slice { :self :cuts |
		(cuts.size = 0).if {
			self.copy
		} {
			let firstCut = cuts.first;
			let answer = firstCut.ifNil {
				self.copy
			} {
				self.atAll(firstCut.asCollection)
			};
			(cuts.size = 1).if {
				answer.unbubble(0, 1)
			} {
				cuts := cuts.allButFirst;
				answer.collect { :each |
					each.isCollection.if {
						each.slice(cuts)
					} {
						each
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
			self.collect { :each |
				each.unbubble(depth - 1, 1)
			}
		}
	}

}
