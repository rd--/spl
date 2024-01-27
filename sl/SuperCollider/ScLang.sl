+@Collection {

	AmpDb { :self |
		self.collect(AmpDb:/1)
	}

	atExtending { :self :index |
		self.error('atExtending: not a sequence')
	}

	DbAmp { :self |
		self.collect(DbAmp:/1)
	}

	extendTo { :self :size |
		self.error('extendTo: not a sequence')
	}

	MidiCps { :self |
		self.collect(MidiCps:/1)
	}

	normalize { :self |
		let min = self.min;
		let max = self.max;
		let mul = 1 / (max - min);
		let add = 0 - (mul * min);
		self.collect { :each |
			each * mul + add
		}
	}

	powersetBitwise { :self |
		(0 .. 1.bitShift(self.size) - 1).collect { :each |
			let index = 0;
			self.select { :elem |
				index := index + 1;
				each.bitAt(index) = 1
			}
		}
	}

	sizeForExtending { :self |
		self.error('sizeForExtending: not a sequence')
	}

}

+@Magnitude {

	exclusivelyBetweenAnd { :self :lo :hi |
		lo < self & {
			self < hi
		}
	}

	inclusivelyBetweenAnd { :self :lo :hi |
		lo <= self & {
			self <= hi
		}
	}

}

+@Number {

	ampComp { :freq :root :exp |
		(root / freq) ^ exp
	}

	AmpDb { :self |
		self.log10 * 20
	}

	blend { :self :other :blendFrac |
		self + (blendFrac * (other - self))
	}

	coin { :self |
		system.nextRandomFloat < self
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
					let grow = curve.exp;
					let a = inMax - inMin / (1.0 - grow);
					let b = inMin + a;
					((b - self) / a).log * (outMax - outMin) / curve + outMin
				}
			}
		}
	}

	DbAmp { :self |
		10 ^ (self * 0.05)
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
				(outMax / outMin) ^ ((self / inMin).log / (inMax / inMin).log) * outMin
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
		1.nextRandomFloat.linExpFromTo(self, upperBound)
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
		(self >= lo).and {
			self < hi
		}.if {
			self
		} {
			let x = self - lo;
			let range = hi - lo;
			let twiceRange = range + range;
			let c = x - (twiceRange * (x / twiceRange).floor);
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
					let grow = curve.exp;
					let a = outMax - outMin / (1.0 - grow);
					let b = outMin + a;
					let scaled = (self - inMin) / (inMax - inMin);
					b - (a * (grow ^ scaled))
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
				(outMax / outMin) ^ ((self - inMin) / (inMax - inMin)) * outMin
			}
		}
	}

	linExpFromTo { :self :lo :hi |
		lo * ((hi / lo).log * self).exp
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

	MidiCps { :self |
		440 * (2 ^ ((self - 69) * (1 / 12)))
	}

	MidiRatio { :self |
		2.0 ^ (self * (1 / 12))
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
		base ^ (self.log / base.log).ceiling
	}

	OctCps { :self |
		440 * (2 ^ (self - 4.75))
	}

	previousPowerOf { :self :base |
		base ^ ((self.log / base.log).ceiling - 1)
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
		let answer = [];
		0.toDo(numDigits - 1) { :i |
			answer.addFirst(self.bitShiftRight(i).bitAnd(1))
		};
		answer
	}

	asDigits { :self :base :numDigits |
		let answer = [];
		let num = self;
		numDigits.timesRepeat {
			answer.addFirst(num % base);
			num := num // base
		};
		answer
	}

	asDigits { :self :base |
		self.asDigits(base, (self.log / base.log + 0.0000000001).asInteger + 1)
	}

	do { :self :aBlock:/1 |
		{- Spl is one-indexed -}
		1.toDo(self, aBlock:/1);
		self
	}

	hammingWindow { :self |
		let answer = Array(self);
		answer.hammingWindow;
		answer
	}

	hanningWindow { :self |
		let answer = Array(self);
		answer.hanningWindow;
		answer
	}

	sineTable { :self :amplitudes :phases |
		let answer = Array(self, 0);
		answer.sineFill(amplitudes, phases);
		answer
	}

	welchWindow { :self |
		let answer = Array(self);
		answer.welchWindow;
		answer
	}

}

+Block {

	!+ { :self :anInteger |
		(self ! anInteger).Sum
	}

	!* { :self :anInteger |
		(self ! anInteger).product
	}

}

+@Object {

	atExtending { :self :index |
		self
	}

	extendTo { :self :size |
		Array(size, self)
	}

	instill { :self :index :item :default |
		(index = 1).if {
			item
		} {
			self.asCollection.instill(index, item, default)
		}
	}

	obtain { :self :index :default |
		(index = 1).if {
			self
		} {
			default
		}
	}

	sizeForExtending { :self |
		1
	}

}

+@Sequenceable {

	+++ { :self :aMatrix |
		self.withIndexCollect { :each :index |
			each ++ aMatrix.atWrap(index)
		}
	}

	addSine { :self :harmonicNumber :amplitude :initialPhase |
		let size = self.size;
		let frequency = 1 / harmonicNumber;
		let increment = 2 * pi / size * frequency;
		let phase = initialPhase;
		(1 .. size).do { :each |
			self[each] := self[each] + (phase.sin * amplitude);
			phase := phase + increment
		}
	}

	allTuples { :self |
		let answer = [];
		self.allTuplesDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	allTuplesDo { :self :aBlock:/1 |
		let tupleCount = self.collect(size:/1).product;
		let tuple = self.species.new(self.size);
		1.toDo(tupleCount) { :i |
			let k = i - 1;
			self.size.toByDo(1, -1) { :j |
				let fromSequence = self[j];
				tuple[j] := fromSequence[k % fromSequence.size + 1];
				k := k // fromSequence.size
			};
			aBlock(tuple)
		}
	}

	asRandomTable { :self :size |
		let a = (size = self.size).if {
			self
		} {
			self.resamp1(size)
		};
		a := a.integrate.normalize(1, size);
		(1 .. size).collect { :index |
			a.indexInBetween(index) - 1 / size
		}
	}

	asRandomTable { :self |
		self.asRandomTable(self.size)
	}

	asWavetable { :self |
		let size = self.size * 2;
		let answer = self.species.ofSize(size);
		let index = 1;
		(1 .. self.size).do { :each |
			let e1 = self[each];
			let e2 = (each = self.size).if {
				0
			} {
				self[each + 1]
			};
			answer[index] := 2 * e1 - e2;
			answer[index + 1] := e2 - e1;
			index := index + 2
		};
		answer
	}

	atExtending { :self :index |
		self.atWrap(index)
	}

	blendAt { :self :index |
		let indexMin = index.roundUpTo(1) - 1;
		self.clipAt(indexMin).blend(
			self.clipAt(indexMin + 1),
			(index - indexMin).abs
		)
	}

	blendAtAll { :self :indices |
		indices.collect { :each |
			self.blendAt(each)
		}
	}

	clipAt { :self :index |
		self[index.clamp(1, self.size)]
	}

	clipAtAll { :self :indices |
		indices.collect { :each |
			self.clipAt(each)
		}
	}

	clump { :self :groupSize |
		let answer = [];
		let segment = [];
		self.do { :each |
			segment.add(each);
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
		let prev = 0;
		let index = 1;
		let answer = self.species.new(self.size);
		self.do { :each |
			answer[index] := each - prev;
			prev := each;
			index := index + 1
		};
		answer
	}

	doAdjacentPairs { :self :aBlock:/2 |
		2.toDo(self.size) { :i |
			aBlock(self[i - 1], self[i])
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

	extendTo { :self :size |
		1.toAsCollect(size, self.species) { :index |
			self.atWrap(index)
		}
	}

	extendToBeOfEqualSize { :self |
		let size = self.collect(sizeForExtending:/1).max;
		self.collect { :each |
			each.extendTo(size)
		}
	}

	fill { :self :aBlock:/1 |
		self.fillFromWith((1 .. self.size), aBlock:/1)
	}

	flop { :self |
		self.multiChannelExpand
	}

	hammingDistance { :self :other |
		let size = self.size.min(other.size);
		let count = (self.size - other.size).abs;
		1.toDo(size) { :index |
			(self[index] ~= other[index]).ifTrue {
				count := count + 1
			}
		};
		count
	}

	hammingWindow { :self |
		self.atAllPut(0.53836);
		self.addSine(1, 0.46164, -0.5.pi)
	}

	hanningWindow { :self |
		self.atAllPut(0.5);
		self.addSine(1, 0.5, -0.5.pi)
	}

	indexInBetween { :self :aNumber |
		self.isEmpty.if {
			nil
		} {
			let i = self.indexOfGreaterThan(aNumber);
			i.ifNil {
				self.size
			} {
				(i = 1).if {
					i
				} {
					let a = self[i - 1];
					let b = self[i];
					let div = b - a;
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
		self.detectIndex { :each |
			each > aMagnitude
		}
	}

	instill { :self :index :item :default |
		let answer = self.copy;
		(index - self.size).timesRepeat {
			answer.add(default)
		};
		answer[index] := item;
		answer
	}

	integrate { :self |
		let answer = [];
		let sum = 0;
		self.do { :each |
			sum := sum + each;
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
					let diff = b - a;
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
		let size = self.size;
		self.copyFromTo(size - n, size)
	}

	levenshteinDistance { :self :other |
		self.levenshteinDistance(other, =)
	}

	levenshteinDistance { :self :other :equalityBlock:/2 |
		self.isEmpty.or {
			other.isEmpty
		}.if {
			self.size
		} {
			let matrix = [0 .. other.size];
			1.toDo(self.size) { :xIndex |
				let corner = xIndex - 1;
				matrix[1] := xIndex - 1;
				1.toDo(other.size) { :yIndex |
					let upper = matrix[yIndex + 1];
					matrix[yIndex + 1] := equalityBlock(self[xIndex], other[yIndex]).if {
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

	mirror1 { :self |
		self ++ self.reversed.allButFirstAndLast
	}

	mirror2 { :self |
		self ++ self.reversed
	}

	multiChannelExpand { :self |
		let size = self.collect(sizeForExtending:/1).max;
		(1 .. size).collect { :index |
			self.collect { :each |
				each.atExtending(index)
			}
		}
	}

	normalize { :self :min :max |
		let minItem = self.min;
		let maxItem = self.max;
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
			let a = self.removeFirst;
			let s = self.powerset;
			s ++ s.collect { :each |
				[a] ++ each
			}
		}
	}

	pyramid { :self :patternType |
		let answer = [];
		let lastIndex = self.size;
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

	resamp1 { :self :newSize |
		let factor = (self.size - 1) / (newSize - 1).max(1);
		(0 .. newSize - 1).collect { :each |
			self.blendAt(1 + (each * factor))
		}
	}

	scramble { :self |
		self.shuffled
	}

	separate { :self :aBlock:/2 |
		let answer = [];
		let segment = [];
		self.doAdjacentPairs { :a :b |
			segment.add(a);
			aBlock(a, b).ifTrue {
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
		let fill = Array(count.abs, item);
		let remain = self.drop(count.negated);
		(count < 0).if {
			remain ++ fill
		} {
			fill ++ remain
		}
	}

	similarity { :self :other |
		self.similarity(other, =)
	}

	similarity { :self :other :equalityBlock:/2 |
		let maxDistance = self.size.max(other.size);
		(maxDistance > 0).if {
			1 - (self.levenshteinDistance(other, equalityBlock:/2) / maxDistance)
		} {
			1
		}
	}

	sineFill { :self :amplitudes :phases |
		self.atAllPut(0);
		amplitudes.withIndexDo { :each :index |
			self.addSine(index, each, phases.atWrap(index))
		}
	}

	sizeForExtending { :self |
		self.size
	}

	slide { :self :windowSize :stepSize |
		self.slidingWindows(windowSize, stepSize).concatenation
	}

	slidingWindows { :self :windowSize :stepSize |
		(1, 1 + stepSize .. self.size - windowSize + 1).collect { :index |
			self.copyFromTo(index, index + windowSize - 1)
		}
	}

	stutter { :self :repeatCount |
		self.duplicateEach(repeatCount)
	}

	tableRand { :self |
		self.blendAt(1.nextRandomFloat(self.size))
	}

	waveFill { :self :aBlock:/3 :start :end |
		(self.size > 0).ifTrue {
			let index = 1;
			let next = start;
			let size = self.size;
			let step = (end - start) / size;
			{
				i <= size
			}.whileTrue {
				self[index] := aBlock(next, self[index], index);
				next := next + step;
				index := index + 1
			}
		}
	}

	welchWindow { :self |
		self.atAllPut(0);
		self.addSine(0.5, 1, 0)
	}

	withWrappingCollectOrAdaptTo { :self :anObject :aBlock:/2 |
		anObject.isCollection.and {
			anObject.isSequenceable
		}.if {
			self.withWrappingCollect(anObject, aBlock:/2)
		} {
			anObject.adaptToCollectionAndApply(self, aBlock:/2)
		}
	}

	wrapExtend { :self :size |
		let answer = [];
		1.toDo(size) { :index |
			answer.add(self.atWrap(index))
		};
		answer
	}

	+ { :self :aNumber | withWrappingCollectOrAdaptTo(self, aNumber, +) }
	- { :self :aNumber | withWrappingCollectOrAdaptTo(self, aNumber, -) }
	* { :self :aNumber | withWrappingCollectOrAdaptTo(self, aNumber, *) }
	/ { :self :aNumber | withWrappingCollectOrAdaptTo(self, aNumber, /) }
	< { :self :aNumber | withWrappingCollectOrAdaptTo(self, aNumber, <) }
	> { :self :aNumber | withWrappingCollectOrAdaptTo(self, aNumber, >) }
	^ { :self :aNumber | withWrappingCollectOrAdaptTo(self, aNumber, ^) }
	% { :self :aNumber | withWrappingCollectOrAdaptTo(self, aNumber, %) }

	bitAnd { :self :anObject | self.withWrappingCollectOrAdaptTo(anObject, bitAnd:/2) }
	bitOr { :self :anObject | self.withWrappingCollectOrAdaptTo(anObject, bitOr:/2) }
	min { :self :anObject | self.withWrappingCollectOrAdaptTo(anObject, min:/2) }
	max { :self :anObject | self.withWrappingCollectOrAdaptTo(anObject, max:/2) }
	roundTo { :self :anObject | self.withWrappingCollectOrAdaptTo(anObject, roundTo:/2) }
	truncateTo { :self :anObject | self.withWrappingCollectOrAdaptTo(anObject, truncateTo:/2) }

}

+@Dictionary {

	kr { :self |
		self.collect(kr:/1)
	}

	multiChannelExpand { :self |
		let keys = self.keys;
		let values = self.values;
		let size = values.collect(sizeForExtending:/1).max;
		let places = values.multiChannelExpand.collect { :each |
			each.withIndexCollect { :item :index |
				keys[index] -> item
			}
		};
		places.collect(asRecord:/1)
	}

}

+Array {

	clump { :self :groupSize |
		<primitive: return sc.clump(_self, _groupSize);>
	}

}

+Interval {

	MulAdd { :self :mul :add |
		self * mul + add
	}

}

+SmallFloat {

	degreeToKey { :scaleDegree :scale :stepsPerOctave |
		let k = scale.size;
		let d = scaleDegree.rounded;
		let a = (scaleDegree - d) * 10 * (stepsPerOctave / 12);
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

+Block {

	<> { :self:/1 :aBlock:/1 |
		{ :x |
			self(aBlock(x))
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
