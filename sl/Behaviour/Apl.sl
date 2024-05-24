+@Object {

	catenate { :alpha :beta |
		alpha.nest ++ beta.nest
	}

	link { :p :q |
		p.enclose ++ q.nest
	}

	pair { :p :q |
		p.enclose ++ q.enclose
	}

}

+@Number {

	tally { :self |
		1
	}

}

+@Iterable {

}

+@Integer {

	iota { :self |
		[1 .. self]
	}

}

+@Sequence {

	expand { :self :counts |
		let index = 0;
		let zero = self.first.zero;
		counts.collect { :each |
			(each > 0).if {
				index := index + 1;
				self[index] # each
			} {
				zero # each.abs.max(1)
			}
		}.concatenation
	}

	factorial { :self |
		self.collect(factorial:/1)
	}

	find { :haystack :needle |
		let needleSize = needle.size;
		let haystackSize = haystack.size;
		haystack.indices.collect { :each |
			let endIndex = each + needleSize - 1;
			(endIndex > haystackSize).if {
				0
			} {
				(needle = haystack.copyFromTo(each, endIndex)).asInteger
			}
		}
	}

	gradeDown { :self |
		self.sortedWithIndices.collect(value:/1).reversed
	}

	gradeUp { :self |
		self.sortedWithIndices.collect(value:/1)
	}

	j { :real :imaginary |
		real.withCollect(imaginary, j:/2)
	}

	laminate { :alpha :beta |
		[alpha, beta].extendToBeOfEqualSize
	}

	membership { :self :aCollection |
		self.collect { :each |
			aCollection.includes(each).asInteger
		}
	}

	partitionApl { :self :aSequence |
		let previous = 0;
		let start = 1;
		let answer = [];
		aSequence.withIndexDo { :each :index |
			(each > previous | { each = 0 & { previous ~= 0 }}).ifTrue {
				(index > start & { previous ~= 0 }).ifTrue {
					answer.add(self.copyFromTo(start, index - 1))
				};
				start := index
			};
			previous := each
		};
		(aSequence.last ~= 0).ifTrue {
			answer.add(self.copyFromTo(start, self.size))
		};
		answer
	}

	ravel { :self |
		self.flatten
	}

	reciprocal { :self |
		self.collect(reciprocal:/1)
	}

	tally { :self |
		self.size
	}

	unique { :self |
		let seen = Set();
		self.select { :each |
			seen.includes(each).if {
				false
			} {
				seen.include(each);
				true
			}
		}
	}

	windowedReduce { :self :windowSize :aBlock:/2 |
		self.partition(windowSize.abs, 1).collect { :each |
			windowSize.isNegative.ifTrue {
				each.reverse
			};
			each.foldRight(aBlock:/2)
		}
	}

}

+String {

	withCollect { :self :aString :aBlock:/2 |
		self.asList.withCollect(aString.asList, aBlock:/2)
	}

	expand { :self :counts |
		self.asList.expand(counts).stringJoin
	}

	find { :haystack :needle |
		haystack.asList.find(needle.asList)
	}

	gradeDown { :self |
		self.asList.gradeDown
	}

	gradeUp { :self |
		self.asList.gradeUp
	}

	membership { :self :aString |
		self.asList.membership(aString.asList)
	}

	partitionApl { :self :aSequence |
		self.asList.partitionApl(aSequence).collect(stringJoin:/1)
	}

	rank { :self |
		1
	}

	replicateEach { :self :counts |
		self.asList.replicateEach(counts).stringJoin
	}

	shape { :self |
		[self.size]
	}

	tally { :self |
		self.size
	}

	unique { :self |
		self.asList.unique.stringJoin
	}

}

+Block {

	fork { :g:/2 :f:/1 :h:/1 |
		{ :x |
			g(f(x), h(x))
		}
	}

}
