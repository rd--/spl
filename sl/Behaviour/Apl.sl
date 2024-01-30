+@Object {

	bind { :self :aBlock:/2 |
		{ :each |
			aBlock(each, self)
		}
	}

	constant { :self |
		{ :unused |
			self
		}
	}

	enclose { :self |
		[self]
	}

	leftIdentity { :self :anObject |
		self
	}

	link { :p :q |
		p.enclose ++ q.nest
	}

	nest { :self |
		self.isCollection.if {
			self
		} {
			[self]
		}
	}

	pair { :p :q |
		p.enclose ++ q.enclose
	}

	rightIdentity { :self :anObject |
		anObject
	}

}

+Block {

	bind { :self:/2 :anObject |
		{ :each |
			self(anObject, each)
		}
	}

	innerProduct { :self:/2 :aBlock:/2 |
		{ :p :q |
			p.withCollect(q,self:/2).foldRight(aBlock:/2)
		}
	}

	outerProduct { :self:/2 |
		{ :p :q |
			p.collect { :each |
				q.collect { :alpha |
					self(each, alpha)
				}
			}
		}
	}

	over { :f:/2 :g:/1 |
		{ :p :q |
			f(p.g, q.g)
		}
	}

	power { :self:/1 :count |
		{ :each |
			count.timesRepeat {
				each := self(each)
			};
			each
		}
	}

	self { :self:/2 |
		{ :each |
			self(each, each)
		}
	}

	swap { :self:/2 |
		{ :alpha :each |
			self(each, alpha)
		}
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

+@Sequenceable {

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

	take { :self :count |
		(count < 0).if {
			self.takeLast(count.negated)
		} {
			self.takeFirst(count)
		}
	}

	takeFirst { :self :count |
		(count > self.size).if {
			self ++ (self.first.zero ! (count - self.size))
		} {
			self.copyFromTo(1, count)
		}
	}

	takeLast { :self :count |
		(count > self.size).if {
			(self.first.zero ! (count - self.size)) ++ self
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

	expand { :self :counts |
		self.asArray.expand(counts).join
	}

	find { :haystack :needle |
		haystack.asArray.find(needle.asArray)
	}

	gradeDown { :self |
		self.asArray.gradeDown
	}

	gradeUp { :self |
		self.asArray.gradeUp
	}

	membership { :self :aString |
		self.asArray.membership(aString.asArray)
	}

	nubSieve { :self |
		self.asArray.nubSieve
	}

	partition { :self :aSequence |
		self.asArray.partition(aSequence).collect(join:/1)
	}

	rank { :self |
		1
	}

	replicateEach { :self :counts |
		self.asArray.replicateEach(counts).join
	}

	shape { :self |
		[self.size]
	}

	tally { :self |
		self.size
	}

	unique { :self |
		self.asArray.unique.join
	}

}
