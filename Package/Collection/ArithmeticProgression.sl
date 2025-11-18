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

	atIfAbsent { :self :index :ifAbsent:/0 |
		self.includesIndex(index).if {
			self.step * (index - 1) + self.start
		} {
			ifAbsent()
		}
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
			(startIndex > endIndex).if {
				1.to(0)
			} {
				self[startIndex].toBy(self[endIndex], self.step)
			}
		}
	}

	do { :self :aBlock:/1 |
		let nextValue = self.start;
		let count = self.size;
		let stepSize = self.step;
		{
			count > 1
		}.whileTrue {
			aBlock(nextValue);
			nextValue := nextValue + stepSize;
			count := count - 1
		};
		(count > 0).ifTrue {
			aBlock(self.end)
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

	indexOf { :self :aNumber |
		let i = (aNumber - self.start) / self.step + 1;
		self.includesIndex(i).if {
			i
		} {
			0
		}
	}

	isArithmeticProgression { :self :aNumber :aBlock:/2 |
		aBlock(self.step, aNumber)
	}

	isArithmeticProgression { :self |
		true
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
		(d = 1).if {
			(a + n).gamma / a.gamma
		} {
			let m = a / d;
			(d ^ n) * ((m + n).gamma / m.gamma)
		}
	}

	reverseDo { :self :aBlock:/1 |
		let nextValue = self.end;
		let count = self.size;
		let stepSize = self.step.negate;
		{
			count > 1
		}.whileTrue {
			aBlock(nextValue);
			nextValue := nextValue + stepSize;
			count := count - 1
		};
		(count > 0).ifTrue {
			aBlock(self.start)
		};
		self
	}

	size { :self |
		self.typeResponsibility('@ArithmeticProgression>>size')
	}

	start { :self |
		self.typeResponsibility('@ArithmeticProgression>>start')
	}

	step { :self |
		self.typeResponsibility('@ArithmeticProgression>>step')
	}

	sum { :self |
		self.size * ((self.size - 1) * self.step + (self.start * 2)) / 2
	}

	uncheckedAt { :self :index |
		self.step * (index - 1) + self.start
	}

	withIndexDo { :self :aBlock:/2 |
		let nextValue = self.start;
		let nextIndex = 1;
		let endIndex = self.size;
		let stepSize = self.step;
		{
			nextIndex < endIndex
		}.whileTrue {
			aBlock(nextValue, nextIndex);
			nextValue := nextValue + stepSize;
			nextIndex := nextIndex + 1
		};
		aBlock(self.end, endIndex);
		self
	}

}
