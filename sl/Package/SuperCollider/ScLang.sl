+@Collection {

	AmpDb { :self |
		self.collect(AmpDb:/1)
	}

	DbAmp { :self |
		self.collect(DbAmp:/1)
	}

	MidiCps { :self |
		self.collect(MidiCps:/1)
	}

	normalize { :self |
		|(
			min = self.min,
			max = self.max,
			mul = 1 / (max - min),
			add = 0 - (mul * min)
		)|
		self.collect { :each |
			each * mul + add
		}
	}

	powersetBitwise { :self |
		(0 .. 1.bitShift(self.size) - 1).collect { :each |
			| i = 0; |
			self.select { :elem |
				i +:= 1;
				each.bitAt(i) = 1
			}
		}
	}

}

+@Magnitude {

	exclusivelyBetweenAnd { :self :lo :hi |
		(lo < self) & {
			self < hi
		}
	}

	inclusivelyBetweenAnd { :self :lo :hi |
		(lo <= self) & {
			self <= hi
		}
	}

}

+@Number {

	ampComp { :freq :root :exp |
		(root / freq) ** exp
	}

	AmpDb { :self |
		self.log10 * 20
	}

	blend { :self :other :blendFrac |
		self + (blendFrac * (other - self))
	}

	coin { :self |
		system.randomFloat < self
	}

	CentsRatio { :self |
		(self / 100).MidiRatio
	}

	CpsMidi { :self |
		(self * (1 / 440)).log2 * 12 + 69
	}

	CpsOct { :self |
		(self * (1 / 440)).log2 + 4.75
	}

	Cubed { :self |
		self * self * self
	}

	curveLin { :self :inMin :inMax :outMin :outMax :curve |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(curve.abs < 0.001).if {
					(self - inMin) / (inMax - inMin) * (outMax - outMin) + outMin
				} {
					|(
						grow = curve.exp,
						a = inMax - inMin / (1.0 - grow),
						b = inMin + a
					)|
					((b - self) / a).log * (outMax - outMin) / curve + outMin
				}
			}
		}
	}

	DbAmp { :self |
		10 ** (self * 0.05)
	}

	DifSqr { :self :aNumber |
		(self * self) - (aNumber * aNumber)
	}

	Distort { :self |
		self / (1 + self.abs)
	}

	expExp { :self :inMin :inMax :outMin :outMax |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(outMax / outMin) ** ((self / inMin).log / (inMax / inMin).log) * outMin
			}
		}
	}

	expLin { :self :inMin :inMax :outMin :outMax |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(self / inMin).log / (inMax / inMin).log * (outMax - outMin) + outMin
			}
		}
	}

	expRand { :self :upperBound |
		1.randomFloat.linExpFromTo(self, upperBound)
	}

	foldOnce { :self :lo :hi |
		(self >= hi).if {
			hi + hi - self
		} {
			(self < lo).if {
				lo + lo - self
			} {
				(self = hi).if {
					lo
				} {
					self
				}
			}
		}
	}

	fold { :self :lo :hi |
		(self >= lo & {
			self < hi
		}).if {
			self
		} {
			|(
				x = self - lo,
				range = hi - lo,
				twiceRange = range + range,
				c = x - (twiceRange * (x / twiceRange).floor)
			)|
			(c >= range).ifTrue {
				c := twiceRange - c
			};
			c + lo
		}
	}

	Hypot { :self :aNumber |
		((self * self) + (aNumber * aNumber)).sqrt
	}

	Hypotx { :self :aNumber |
		self.abs + aNumber.abs - ((2.sqrt - 1) * self.abs.min(aNumber.abs))
	}

	isNegative { :self |
		self.negative
	}

	isPositive { :self |
		self.positive
	}

	linCurve { :self :inMin :inMax :outMin :outMax :curve |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(curve.abs < 0.001).if {
					(self - inMin) / (inMax - inMin) * (outMax - outMin) + outMin
				} {
					|(
						grow = curve.exp,
						a = outMax - outMin / (1.0 - grow),
						b = outMin + a,
						scaled = (self - inMin) / (inMax - inMin)
					)|
					b - (a * (grow ** scaled))
				}
			}
		}
	}

	linExp { :self :inMin :inMax :outMin :outMax |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(outMax / outMin) ** ((self - inMin) / (inMax - inMin)) * outMin
			}
		}
	}

	linLin { :self :inMin :inMax :outMin :outMax |
		(self <= inMin).if {
			outMin
		} {
			(self >= inMax).if {
				outMax
			} {
				(self - inMin) / (inMax - inMin) * (outMax - outMin) + outMin
			}
		}
	}

	linExpFromTo { :self :lo :hi |
		lo * ((hi / lo).log * self).exp
	}

	LinLin { :self :srclo :srchi :dstlo :dsthi |
		|(
			mul = (dsthi - dstlo) / (srchi - srclo),
			add = dstlo - (mul * srclo)
		)|
		MulAdd(self, mul, add)
	}

	MidiCps { :self |
		440 * (2 ** ((self - 69) * (1 / 12)))
	}

	MidiRatio { :self |
		2.0 ** (self * (1 / 12))
	}

	MulAdd { :self :mul :add |
		self * mul + add
	}

	Neg { :self |
		0 - self
	}

	nextPowerOfTwo { :self |
		self.nextPowerOf(2)
	}

	nextPowerOf { :self :base |
		base ** (self.log / base.log).ceiling
	}

	OctCps { :self |
		440 * (2 ** (self - 4.75))
	}

	previousPowerOf { :self :base |
		base ** ((self.log / base.log).ceiling - 1)
	}

	RatioCents { :self |
		self.RatioMidi * 100
	}

	RatioMidi { :self |
		12 * self.log2
	}

	Recip { :self |
		1 / self
	}

	Squared { :self |
		self * self
	}

}

+@Integer {

	asBinaryDigits { :self :numDigits |
		| answer = []; |
		0.toDo(numDigits - 1) { :i |
			answer.addFirst(self.bitShiftRight(i).bitAnd(1))
		};
		answer
	}

	asDigits { :self :base :numDigits |
		| answer = [], num = self; |
		numDigits.timesRepeat {
			answer.addFirst(num % base);
			num := num // base
		};
		answer
	}

	asDigits { :self :base |
		self.asDigits(base, (self.log / base.log + 0.0000000001).asInteger + 1)
	}

	do { :self :aProcedure:/1 |
		(* Spl is one-indexed *)
		1.toDo(self, aProcedure:/1);
		self
	}

}

+@Object {

	! { :self :anInteger |
		self.dup(anInteger)
	}

	!+ { :self :anInteger |
		(self ! anInteger).sum
	}

	!* { :self :anInteger |
		(self ! anInteger).product
	}

	dup { :self :anInteger |
		self.replicateApplying(anInteger, value:/1)
	}

	instill { :self :index :item :default |
		(index = 1).if {
			item
		} {
			self.toArray.instill(index, item, default)
		}
	}

	obtain { :self :index :default |
		(index = 1).if {
			self
		} {
			default
		}
	}

}

+@Sequenceable {

	allTuples { :self |
		| answer = []; |
		self.allTuplesDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	allTuplesDo { :self :aBlock:/1 |
		|(
			tupleCount = self.collect(size:/1).product,
			tuple = self.species.new(self.size)
		)|
		1.toDo(tupleCount) { :i |
			| k = i - 1; |
			self.size.toByDo(1, -1) { :j |
				| fromSequence = self[j]; |
				tuple[j] := fromSequence[k % fromSequence.size + 1];
				k := k // fromSequence.size
			};
			aBlock(tuple)
		}
	}

	blendAt { :self :index |
		| indexMin = index.roundUpTo(1) - 1; |
		self.clipAt(indexMin).blend(self.clipAt(indexMin + 1), (index - indexMin).abs)
	}

	clipAt { :self :index |
		self[index.clamp(1, self.size)]
	}

	clump { :self :groupSize |
		| answer = [], segment = []; |
		self.do { :item |
			segment.add(item);
			(segment.size >= groupSize).ifTrue {
				answer.add(segment);
				segment := []
			}
		};
		(segment.size > 0).ifTrue {
			answer.add(segment)
		};
		answer
	}

	crossedMultiply { :self :aSequence |
		self.withCrossedCollect(aSequence, times:/2)
	}

	degreeToKey { :self :scale :stepsPerOctave |
		self.collect { :scaleDegree |
			scaleDegree.degreeToKey(scale, stepsPerOctave)
		}
	}

	detectIndex { :self :aBlock:/1 |
		valueWithReturn { :return:/1 |
			1.toDo(self.size) { :index |
				aBlock(self[index]).ifTrue {
					index.return
				}
			};
			nil
		}
	}

	differentiate { :self |
		| prev = 0, index = 1, answer = self.species.new(self.size); |
		self.do { :item |
			answer[index] := item - prev;
			prev := item;
			index +:= 1
		};
		answer
	}

	doAdjacentPairs { :self :aProcedure:/2 |
		2.toDo(self.size) { :i |
			aProcedure(self[i - 1], self[i])
		}
	}

	drop { :self :count |
		(count < 0).if {
			self.dropLast(count.negated)
		} {
			self.copyFromTo(count + 1, self.size)
		}
	}

	dropLast { :self :count |
		self.copyFromTo(1, self.size - count)
	}

	dupEach { :self :anInteger |
		|(
			answerSize = self.size * anInteger,
			answer = Array(answerSize),
			answerIndex = 1
		)|
		(1 .. self.size).do { :selfIndex |
			(1 .. anInteger).do { :unusedCounter |
				answer[answerIndex] := self[selfIndex];
				answerIndex +:= 1
			}
		};
		answer
	}

	extendTo { :self :size |
		1.toAsCollect(size, self.species) { :index |
			self.atWrap(index)
		}
	}

	fill { :self :aBlock:/1 |
		self.fillFromWith((1 .. self.size), aBlock:/1)
	}

	flop { :self |
		self.extendToBeOfEqualSize.transpose
	}

	hammingDistance { :self :other |
		|(
			size = self.size.min(other.size),
			count = (self.size - other.size).abs
		)|
		1.toDo(size) { :index |
			(self[index] ~= other[index]).ifTrue {
				count +:= 1
			}
		};
		count
	}

	indexInBetween { :self :aNumber |
		self.isEmpty.if {
			nil
		} {
			| i = self.indexOfGreaterThan(aNumber); |
			i.ifNil {
				self.size
			} {
				(i = 1).if {
					i
				} {
					| a = self[i - 1], b = self[i], div = b - a; |
					(div = 0).if {
						i
					} {
						((aNumber - a) / div) + i - 1
					}
				}
			}
		}
	}

	indexOfGreaterThan { :self :aMagnitude |
		self.detectIndex { :item |
			item > aMagnitude
		}
	}

	instill { :self :index :item :default |
		| answer = self.copy; |
		(index - self.size).timesRepeat {
			answer.add(default)
		};
		answer[index] := item;
		answer
	}

	integrate { :self |
		| answer = [], sum = 0; |
		self.do { :item |
			sum +:= item;
			answer.add(sum)
		};
		answer
	}

	isSeries { :self |
		self.isSeriesBy(nil)
	}

	isSeriesBy { :self :step |
		(self.size <= 1).if {
			true
		} {
			valueWithReturn { :return:/1 |
				self.doAdjacentPairs { :a :b |
					| diff = b - a; |
					step.ifNil {
						step := diff
					} {
						(step ~= diff).ifTrue {
							false.return
						}
					}
				}
			};
			true
		}
	}


	keep { :self :n |
		self.first(n)
	}

	keepAtMost { :self :n |
		(n > self.size).if {
			self
		} {
			self.keep(n)
		}
	}

	keepLast { :self :n |
		| size = self.size; |
		self.copyFromTo(size - n, size)
	}

	levenshteinDistance { :self :other |
		self.levenshteinDistance(other, equals:/2)
	}

	levenshteinDistance { :self :other :equalityProcedure:/2 |
		(self.isEmpty | {
			other.isEmpty
		}).if {
			self.size
		} {
			| matrix = [0 .. other.size]; |
			1.toDo(self.size) { :xIndex |
				| corner = xIndex - 1; |
				matrix[1] := xIndex - 1;
				1.toDo(other.size) { :yIndex |
					| upper = matrix[yIndex + 1]; |
					matrix[yIndex + 1] := equalityProcedure(self[xIndex], other[yIndex]).if {
						corner
					} {
						[upper, corner, matrix[yIndex]].min + 1
					};
					corner := upper
				}
			};
			matrix[other.size + 1]
		}
	}

	mirror { :self |
		self ++ self.reversed.allButFirst
	}

	normalize { :self :min :max |
		| minItem = self.min, maxItem = self.max; |
		self.collect { :each |
			(each - minItem) / (maxItem - minItem) * (max - min) + min
		}
	}

	normalizeSum { :self |
		self / self.sum
	}

	obtain { :self :index :default |
		(index > self.size).if {
			default
		} {
			self[index]
		}
	}

	order { :self |
		self.sortedWithIndices.collect(value:/1)
	}

	powerset { :self |
		self.ifEmpty {
			[self]
		} {
			| a = self.removeFirst, s = self.powerset; |
			s ++ s.collect { :each |
				[a] ++ each
			}
		}
	}

	pyramid { :self :patternType |
		|(
			answer = [],
			lastIndex = self.size
		)|
		(patternType = 1).ifTrue {
			1.toDo(lastIndex) { :index |
				answer.addAll(self.copyFromTo(1, index))
			}
		};
		(patternType = 6).ifTrue {
			0.toDo(lastIndex - 1) { :index |
				answer.addAll(self.copyFromTo(lastIndex - index, lastIndex))
			}
		};
		self.species.newFrom(answer)
	}

	scramble { :self |
		self.shuffled
	}

	separate { :self :aProcedure:/2 |
		| answer = [], segment = []; |
		self.doAdjacentPairs { :a :b |
			segment.add(a);
			aProcedure(a, b).ifTrue {
				answer.add(segment);
				segment := []
			}
		};
		self.notEmpty.ifTrue {
			segment.add(self.last)
		};
		answer.add(segment);
		answer
	}

	shift { :self :count :item |
		| fill = Array(count.abs, item), remain = self.drop(count.negated); |
		(count < 0).if {
			remain ++ fill
		} {
			fill ++ remain
		}
	}

	similarity { :self :other |
		self.similarity(other, equals:/2)
	}

	similarity { :self :other :equalityProcedure:/2 |
		| maxDistance = self.size.max(other.size); |
		(maxDistance > 0).if {
			1 - (self.levenshteinDistance(other, equalityProcedure:/2) / maxDistance)
		} {
			1
		}
	}

	slide { :self :windowLength :stepSize |
		self.slidingWindows(windowLength, stepSize).concatenation
	}

	slidingWindows { :self :windowLength :stepSize |
		(1, 1 + stepSize .. self.size - windowLength + 1).collect { :index |
			self.copyFromTo(index, index + windowLength - 1)
		}
	}

	stutter { :self :repeatCount |
		self.collect { :each |
			{ each } ! repeatCount
		}.concatenation
	}

	withCrossedCollect { :self :aSequence :aProcedure:/2 |
		(* Apply aProcedure for each of my items with each item of aSequence in turn. *)
		|(
			answer = self.species.new(self.size * aSequence.size),
			nextIndex = 1
		)|
		self.do { :leftItem |
			aSequence.do { :rightItem |
				answer[nextIndex] := aProcedure(leftItem, rightItem);
				nextIndex +:= 1
			}
		};
		answer
	}

	withExtendingCollect { :self :aCollection :aProcedure:/2 |
		| maximumSize = self.size.max(aCollection.size); |
		1.toAsCollect(maximumSize, self.species) { :index |
			aProcedure(self.atWrap(index), aCollection.atWrap(index))
		}
	}

	withExtendingCollectOrAdaptTo { :self :anObject :aProcedure:/2 |
		(anObject.isCollection & {
			anObject.isSequenceable
		}).if {
			self.withExtendingCollect(anObject, aProcedure:/2)
		} {
			anObject.adaptToCollectionAndApply(self, aProcedure:/2)
		}
	}

	withTableCollect { :self :aSequence :aProcedure:/2 |
		self.collect { :each |
			each.aProcedure(aSequence)
		}
	}

	wrapExtend { :self :size |
		| answer = []; |
		1.toDo(size) { :index |
			answer.add(self.atWrap(index))
		};
		answer
	}

	+ { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, plus:/2) }
	- { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, minus:/2) }
	* { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, times:/2) }
	/ { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, dividedBy:/2) }
	< { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, lessThan:/2) }
	> { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, greaterThan:/2) }
	^ { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, raisedTo:/2) }
	% { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, modulo:/2) }

	bitAnd { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, bitAnd:/2) }
	bitOr { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, bitOr:/2) }
	min { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, min:/2) }
	max { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, max:/2) }
	roundTo { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, roundTo:/2) }
	truncateTo { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, truncateTo:/2) }

}

+Array {

	clump { :self :groupSize |
		<primitive: return sc.clump(_self, _groupSize);>
	}

	extendToBeOfEqualSize { :self |
		|(
			selfLifted = self.collect(asArray:/1),
			maximumSize = selfLifted.collect(size:/1).detectMax(identity:/1)
		)|
		selfLifted.collect { :each |
			each.extendTo(maximumSize)
		}
	}

}

+Interval {

	MulAdd { :self :mul :add |
		self * mul + add
	}

}

+SmallFloat {

	degreeToKey { :scaleDegree :scale :stepsPerOctave |
		|(
			k = scale.size,
			d = scaleDegree.rounded,
			a = (scaleDegree - d) * 10 * (stepsPerOctave / 12)
		)|
		(stepsPerOctave * (d // k)) + scale[d % k + 1] + a
	}

	geom { :self :start :grow |
		self.geometricSeries(start, grow)
	}

	SoftClip { :self |
		(self.abs <= 0.5).if {
			self
		} {
			(self.abs - 0.25) / self
		}
	}

}

+Procedure {

	<> { :self:/1 :aProcedure:/1 |
		{ :x |
			self(aProcedure(x))
		}
	}

	block { :self:/1 |
		valueWithReturn { :return:/1 |
			self(return:/1)
		}
	}

}

+String {

	+ { :self :aString |
		self ++ ' ' ++ aString
	}

	++? { :self :anObject |
		anObject.ifNil {
			self
		} {
			self ++ anObject.value
		}
	}

	+/+ { :self :aString |
		self ++ '/' ++ aString
	}

	ascii { :self |
		self.asciiByteArray
	}

}
