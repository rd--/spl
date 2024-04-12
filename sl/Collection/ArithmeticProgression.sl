@ArithmeticProgression {

	adaptToCollectionAndApply { :self :aCollection :aBlock:/2 |
		aBlock(aCollection, self.asList)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		self.collect { :each |
			aBlock(aNumber, each)
		}
	}

	asList { :self |
		self.collect(identity:/1)
	}

	at { :self :index |
		self.includesIndex(index).if {
			self.step * (index - 1) + self.start
		} {
			self.errorInvalidIndex('at', index)
		}
	}

	basicAt { :self :index |
		self.step * (index - 1) + self.start
	}

	collect { :self :aBlock:/1 |
		let result = List(self.size);
		let index = 1;
		self.do { :nextValue |
			result[index] := aBlock(nextValue);
			index := index + 1
		};
		result
	}

	copyFromTo { :self :startIndex :endIndex |
		(
			startIndex = 1 & {
				endIndex = self.size
			}
		).if {
			self
		} {
			self[startIndex].toBy(self[endIndex], self.step)
		}
	}

	do { :self :aBlock:/1 |
		let nextValue = self.start;
		let count = self.size;
		let stepSize = self.step;
		{
			count >= 1
		}.whileTrue {
			aBlock(nextValue);
			nextValue := nextValue + stepSize;
			count := count - 1
		};
		self
	}

	emptyError { :self :methodName |
		self.error('@ArithmeticProgression>>' ++ methodName ++ ': empty')
	}

	end { :self |
		self.start + (self.size - 1 * self.step)
	}

	increment { :self |
		self.step
	}

	isArithmeticSeries { :self |
		true
	}

	isArithmeticSeriesBy { :self :anInteger |
		self.step = anInteger
	}

	isEmpty { :self |
		self.size = 0
	}

	isIntegerArithmeticSeries { :self |
		self.start.isInteger & {
			self.step.isInteger
		}
	}

	isNormal { :self |
		self.isEmpty.not & {
			self.start <= self.end
		}
	}

	last { :self |
		self.ifEmpty {
			self.emptyError('@ArithmeticProgression>>last')
		} {
			self.end
		}
	}

	max { :self |
		self.ifEmpty {
			self.emptyError('@ArithmeticProgression>>max')
		} {
			self.start.max(self.end)
		}
	}

	min { :self |
		self.ifEmpty {
			self.emptyError('@ArithmeticProgression>>min')
		} {
			self.start.min(self.end)
		}
	}

	product { :self |
		let a = self.start;
		let d = self.step;
		let n = self.size;
		(d ^ n) * ((a / d + n).gamma / (a / d).gamma)
	}

	reverseDo { :self :aBlock:/1 |
		let each = self.last;
		let predicate = (self.step < 0).if {
			{ self.start >= each }
		} {
			{ self.start <= each }
		};
		predicate.whileTrue {
			aBlock(each);
			each := each - self.step
		}
	}

	size { :self |
		self.typeReponsibility('@ArithmeticProgression>>size')
	}

	start { :self |
		self.typeReponsibility('@ArithmeticProgression>>start')
	}

	step { :self |
		self.typeReponsibility('@ArithmeticProgression>>step')
	}

	sum { :self |
		self.size * ((self.size - 1) * self.step + (self.start * 2)) / 2
	}

	withIndexDo { :self :aBlock:/2 |
		let nextValue = self.start;
		let nextIndex = 1;
		let endIndex = self.size;
		let stepSize = self.step;
		{
			nextIndex <= endIndex
		}.whileTrue {
			aBlock(nextValue, nextIndex);
			nextValue := nextValue + stepSize;
			nextIndex := nextIndex + 1
		};
		self
	}

}

