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

+@Integer {

	iota { :self |
		[1 .. self]
	}

}

+@Sequence {

	&& { :self :other |
		self.withCollect(other, &&)
	}

	|| { :self :other |
		self.withCollect(other, ||)
	}

	drop { :self :count |
		(count.abs >= self.size).if {
			self.species.new
		} {
			(count < 0).if {
				self.dropLast(count.negated)
			} {
				self.dropFirst(count)
			}
		}
	}

	dropFirst { :self :count |
		self.copyFromTo(count + 1, self.size)
	}

	dropLast { :self :count |
		self.copyFromTo(1, self.size - count)
	}

	expand { :self :counts |
		let index = 0;
		let zero = self.first.zero;
		counts.collect { :each |
			(each > 0).if {
				index := index + 1;
				self[index].replicate(each)
			} {
				zero.replicate(each.abs.max(1))
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

	nubSieve { :self |
		let seen = Set();
		self.collect { :each |
			seen.includes(each).if {
				0
			} {
				seen.include(each);
				1
			}
		}
	}

	partition { :self :aSequence |
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


	reciprocal { :self |
		self.collect(reciprocal:/1)
	}

	take { :self :count :fill |
		(count < 0).if {
			self.takeLast(count.negated, fill)
		} {
			self.takeFirst(count, fill)
		}
	}

	takeFirst { :self :count :fill |
		(count > self.size).if {
			self ++ (fill ! (count - self.size))
		} {
			self.copyFromTo(1, count)
		}
	}

	takeLast { :self :count :fill |
		(count > self.size).if {
			(fill ! (count - self.size)) ++ self
		} {
			self.copyFromTo(self.size - count + 1, self.size)
		}
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
		self.slidingWindows(windowSize.abs, 1).collect { :each |
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
		self.asList.expand(counts).join
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

	nubSieve { :self |
		self.asList.nubSieve
	}

	partition { :self :aSequence |
		self.asList.partition(aSequence).collect(join:/1)
	}

	rank { :self |
		1
	}

	replicateEach { :self :counts |
		self.asList.replicateEach(counts).join
	}

	shape { :self |
		[self.size]
	}

	tally { :self |
		self.size
	}

	unique { :self |
		self.asList.unique.join
	}

}
