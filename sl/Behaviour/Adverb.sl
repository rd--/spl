+@Sequence {

	crossedMultiply { :self :aSequence |
		self.withCrossedCollect(aSequence, *)
	}

	withCrossedCollect { :self :aSequence :aBlock:/2 |
		let answer = self.species.new(self.size * aSequence.size);
		let nextIndex = 1;
		self.do { :leftItem |
			aSequence.do { :rightItem |
				answer[nextIndex] := aBlock(leftItem, rightItem);
				nextIndex := nextIndex + 1
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
		{ :alpha :beta |
			alpha.withCollect(beta, self:/2)
		}
	}

	f { :self:/2 |
		{ :alpha :beta |
			alpha.withFoldingCollect(beta, self:/2)
		}
	}

	s { :self:/2 |
		{ :alpha :beta |
			alpha.withTruncatingCollect(beta, self:/2)
		}
	}

	t { :self:/2 |
		{ :alpha :beta |
			alpha.withTableCollect(beta, self:/2)
		}
	}

	w { :self:/2 |
		{ :alpha :beta |
			alpha.withWrappingCollect(beta, self:/2)
		}
	}

	x { :self:/2 |
		{ :alpha :beta |
			alpha.withCrossedCollect(beta, self:/2)
		}
	}

}
