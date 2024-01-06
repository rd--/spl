+@Sequenceable {

	crossedMultiply { :self :aSequence |
		self.withCrossedCollect(aSequence, times:/2)
	}

	withCrossedCollect { :self :aSequence :aBlock:/2 |
		let answer = self.species.new(self.size * aSequence.size);
		let nextIndex = 1;
		self.do { :leftItem |
			aSequence.do { :rightItem |
				answer[nextIndex] := aBlock(leftItem, rightItem);
				nextIndex +:= 1
			}
		};
		answer
	}

	withFoldingCollect { :self :aCollection :aBlock:/2 |
		let maximumSize = self.size.max(aCollection.size);
		1.toAsCollect(maximumSize, self.species) { :index |
			aBlock(self.atFold(index), aCollection.atFold(index))
		}
	}

	withTableCollect { :self :aSequence :aBlock:/2 |
		self.collect { :each |
			each.aBlock(aSequence)
		}
	}

	withTruncatingCollect { :self :aSequence :aBlock:/2 |
		(self.size < aSequence.size).if {
			self.withCollect(aSequence.take(self.size), aBlock:/2)
		} {
			self.take(aSequence.size).withCollect(aSequence, aBlock:/2)
		}
	}

	withWrappingCollect { :self :aCollection :aBlock:/2 |
		let maximumSize = self.size.max(aCollection.size);
		1.toAsCollect(maximumSize, self.species) { :index |
			aBlock(self.atWrap(index), aCollection.atWrap(index))
		}
	}

}

+Block {

	e { :self:/2 |
		{ :p :q |
			p.withCollect(q, self:/2)
		}
	}

	f { :self:/2 |
		{ :p :q |
			p.withFoldingCollect(q, self:/2)
		}
	}

	s { :self:/2 |
		{ :p :q |
			p.withTruncatingCollect(q, self:/2)
		}
	}

	t { :self:/2 |
		{ :p :q |
			p.withTableCollect(q, self:/2)
		}
	}

	w { :self:/2 |
		{ :p :q |
			p.withWrappingCollect(q, self:/2)
		}
	}

	x { :self:/2 |
		{ :p :q |
			p.withCrossedCollect(q, self:/2)
		}
	}

}
