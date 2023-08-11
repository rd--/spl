+@SequenceableCollection {

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

}

