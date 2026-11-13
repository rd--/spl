@ArithmeticProgression {

	[List, arithmeticProgressionToList] { :self |
		self.collect(identity/1)
	}

	adaptToCollectionAndApply { :self :aCollection :aBlock/2 |
		aBlock(aCollection, List(self))
	}

	adaptToNumberAndApply { :self :aNumber :aBlock/2 |
		self.collect { :each |
			aBlock(aNumber, each)
		}
	}

	approximateProduct { :self |
		let a = self.start;
		let d = self.step;
		let n = self.size;
		(d = 1L).if {
			(a + n).gamma / a.gamma
		} {
			let m = a / d;
			(d ^ n) * ((m + n).gamma / m.gamma)
		}
	}

	atIfAbsent { :self :index :ifAbsent/0 |
		let integerIndex = Integer(index);
		self.includesIndex(index).if {
			self.start + (self.step * (integerIndex - 1L))
		} {
			ifAbsent()
		}
	}

	collect { :self :aBlock/1 |
		let result = List(self.size, nil);
		let index = 1L;
		self.do { :nextValue |
			result[index] := aBlock(nextValue);
			index := index + 1L
		};
		result
	}

	copyFromTo { :self :startIndex :endIndex |
		(
			startIndex = 1L & {
				endIndex = self.size
			}
		).if {
			self
		} {
			(startIndex > endIndex).if {
				1L.to(0L)
			} {
				self[startIndex].toBy(self[endIndex], self.step)
			}
		}
	}

	do { :self :aBlock/1 |
		let nextValue = self.start;
		let count = self.size;
		let stepSize = self.step;
		{
			count > 1L
		}.whileTrue {
			aBlock(nextValue);
			nextValue := nextValue + stepSize;
			count := count - 1L
		};
		(count > 0L).ifTrue {
			aBlock(self.end)
		};
		nil
	}

	emptyError { :self :methodName |
		self.error('@ArithmeticProgression>>emptyError', [methodName])
	}

	end { :self |
		self.start + (self.size - 1L * self.step)
	}

	increment { :self |
		self.step
	}

	indexOf { :self :aNumber |
		let i = (aNumber - self.start) / self.step + 1L;
		self.includesIndex(i).if {
			i
		} {
			0L
		}
	}

	isArithmeticProgression { :self :aNumber :aBlock/2 |
		aBlock(self.step, aNumber)
	}

	isArithmeticProgression { :self |
		true
	}

	isEmpty { :self |
		self.size = 0L
	}

	isIntegerArithmeticSeries { :self |
		self.start.isIntegerValuedNumber & {
			self.step.isIntegerValuedNumber
		}
	}

	isMatrix { :unused |
		false
	}

	isNormal { :self |
		self.isEmpty.not & {
			self.start <= self.end
		}
	}

	isRegularlySpaced { :unused |
		true
	}

	isVector { :unused |
		true
	}

	last { :self |
		self.ifEmpty {
			self.emptyError('@ArithmeticProgression>>last')
		} {
			self.end
		}
	}

	[maximum, max] { :self |
		self.ifEmpty {
			self.emptyError('@ArithmeticProgression>>max')
		};
		self.start.max(self.end)
	}

	[minimum, min] { :self |
		self.ifEmpty {
			self.emptyError('@ArithmeticProgression>>min')
		};
		min(self.start, self.end)
	}

	reverseDo { :self :aBlock/1 |
		let nextValue = self.end;
		let count = self.size;
		let stepSize = self.step.negate;
		{
			count > 1L
		}.whileTrue {
			aBlock(nextValue);
			nextValue := nextValue + stepSize;
			count := count - 1L
		};
		(count > 0L).ifTrue {
			aBlock(self.start)
		};
		nil
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
		let k = self.size;
		let z = k * ((k - 1L) * self.step + (self.start * 2L)) / 2L;
		self.isIntegerArithmeticSeries.if {
			Integer(z)
		} {
			z
		}
	}

	uncheckedAt { :self :index |
		self.step * (index - 1L) + self.start
	}

	withIndexDo { :self :aBlock/2 |
		let nextValue = self.start;
		let nextIndex = 1L;
		let endIndex = self.size;
		let stepSize = self.step;
		{
			nextIndex < endIndex
		}.whileTrue {
			aBlock(nextValue, nextIndex);
			nextValue := nextValue + stepSize;
			nextIndex := nextIndex + 1L
		};
		aBlock(self.end, endIndex);
		nil
	}

}
