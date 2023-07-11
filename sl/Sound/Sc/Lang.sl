Clock : [Object] { | priorityQueue nextEntryTime existingDelay |

	clear { :self |
		self.priorityQueue.clearAndShrink;
		self.existingDelay.ifNotNil {
			self.existingDelay.cancel
		};
		self.nextEntryTime := nil;
		self.existingDelay := nil
	}

	initialize { :self |
		self.initializeSlots(PriorityQueue(), nil, nil)
	}

	recurseEvery { :self :aProcedure:/2 :anObject :delay |
		self.scheduleInjecting(0, anObject) { :currentTime :inputValue |
			| nextDelay = delay.value; |
			(inputValue.notNil & {
				nextDelay.notNil
			}).ifTrue {
				[nextDelay, aProcedure(currentTime, inputValue)]
			}
		}
	}

	repeatEvery { :self :aProcedure:/2 :delay |
		self.schedule(0) { :currentTime |
			| nextDelay = delay.value; |
			nextDelay.ifNotNil {
				aProcedure(currentTime, nextDelay);
				nextDelay
			}
		}
	}

	schedule { :self :deltaTime :aProcedure:/1 |
		|(
			currentTime = system.systemTimeInSeconds,
			scheduledTime = currentTime + deltaTime,
			wakeupTime = self.nextEntryTime
		)|
		self.priorityQueue.push(aProcedure:/1, scheduledTime);
		(wakeupTime = nil | {
			scheduledTime < wakeupTime
		}).ifTrue {
			self.nextEntryTime := scheduledTime;
			self.existingDelay.ifNotNil {
				self.existingDelay.cancel
			};
			self.existingDelay := {
				self.wakeup(scheduledTime)
			}.evaluateAfterMilliseconds(deltaTime * 1000)
		}
	}

	scheduleInjecting { :self :deltaTime :anObject :aProcedure:/2 |
		self.schedule(deltaTime) { :currentTime |
			| reply = aProcedure(currentTime, anObject); |
			reply.ifNotNil {
				self.scheduleInjecting(reply[1], reply[2], aProcedure:/2)
			};
			nil
		}
	}

	wakeup { :self :scheduledTime |
		|(
			currentTime = system.systemTimeInSeconds,
			queue = self.priorityQueue,
			frontOfQueueTime = self.nextEntryTime
		)|
		{
			frontOfQueueTime ~= nil & {
				frontOfQueueTime <= currentTime
			}
		}.whileTrue {
			|(
				activityProcedure:/1 = queue.pop,
				rescheduleAfter = activityProcedure(scheduledTime)
			)|
			rescheduleAfter.ifNotNil {
				self.priorityQueue.push(activityProcedure:/1, scheduledTime + rescheduleAfter)
			};
			frontOfQueueTime := queue.peekPriority
		};
		self.nextEntryTime := frontOfQueueTime;
		frontOfQueueTime.ifNotNil {
			self.existingDelay.ifNotNil {
				self.existingDelay.cancel
			};
			self.existingDelay := {
				self.wakeup(frontOfQueueTime)
			}.evaluateAfterMilliseconds(frontOfQueueTime - currentTime * 1000)
		}
	}

}

+SmallFloat {

	schedule { :self :aProcedure:/2 |
		workspace::clock.schedule(self, aProcedure:/2)
	}

	scheduleInjecting { :self :anObject :aProcedure:/2 |
		workspace::clock.scheduleInjecting(self, anObject, aProcedure:/2)
	}

}

+Procedure {

	schedule { :self:/1 |
		workspace::clock.schedule(0, self:/1)
	}

	scheduleInjecting { :self:/2 :anObject |
		workspace::clock.scheduleInjecting(0, anObject, self:/2)
	}

}

+Void {

	Clock {
		newClock().initialize
	}

}

+Clock {

	collectTexture { :self :aCollection :aProcedure:/1 :delay |
		| end = aCollection.size; |
		self.recurseEvery({ :currentTime :index |
			{
				aProcedure(aCollection[index])
			}.playAt(currentTime + 0.5); (* fixed delay... *)
			(index = end).if {
				nil
			} {
				index + 1
			}
		}, 1, delay.value)
	}

	playEvery { :self :aProcedure:/1 :delay |
		self.repeatEvery({ :currentTime :nextDelay |
			{
				aProcedure(nextDelay)
			}.playAt(currentTime + 0.5) (* fixed delay... *)
		}, delay)
	}

}

+@Collection {

	AmpDb { :self | self.collect(AmpDb:/1) }

	collectTexture { :self :aProcedure:/1 :delay |
		workspace::clock.collectTexture(
			self,
			aProcedure:/1,
			delay
		)
	}

	DbAmp { :self | self.collect(DbAmp:/1) }

	MidiCps { :self | self.collect(MidiCps:/1) }

	normalize { :self |
		| min = self.min, max = self.max, mul = 1 / (max - min), add = 0 - (mul * min); |
		self.collect { :each |
			each * mul + add
		}
	}

}

+@Magnitude {

	exclusivelyBetween { :self :lo :hi |
		(lo < self) & {
			self < hi
		}
	}

	inclusivelyBetween { :self :lo :hi |
		(lo <= self) & {
			self <= hi
		}
	}

}

+Nil {

	? { :self :anObject |
		anObject
	}

	?? { :self :anObject |
		anObject.value
	}

	~? { :self :anObject |
		nil
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

	CpsMidi { :self |
		(self * (1 / 440)).log2 * 12 + 69
	}

	CpsOct { :self |
		log2(self * (1 / 440)) + 4.75
	}

	Cubed { :self |
		self * self * self
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

	OctCps { :self |
		440 * (2 ** (self - 4.75))
	}

	MulAdd { :self :mul :add |
		self * mul + add
	}

	Neg { :self |
		0 - self
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

+@Integral {

	asBinaryDigits { :self :numDigits |
		| answer = []; |
		(0 .. numDigits - 1).do { :i |
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

}

+@Object {

	? { :self :anObject |
		self
	}

	?? { :self :anObject |
		self
	}

	~? { :self :anObject |
		anObject.value
	}

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

}

+@SequenceableCollection {

	allTuples { :self |
		| answerSize = self.collect(size:/1).product; |
		1.upTo(answerSize).collect { :i |
			| k = i - 1, nextTuple = self.species.new(self.size); |
			self.size.toBy(1, -1).collect { :j |
				| fromSequence = self[j]; |
				nextTuple[j] := fromSequence[k % fromSequence.size + 1];
				k := k // fromSequence.size
			};
			nextTuple
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
		withReturn {
			self.size.do { :index |
				aBlock(self[index]).ifTrue {
					index.return
				}
			}
		}
	}

	differentiate { :self |
		| prev = 0, index = 1, answer = self.species.new(self.size); |
		self.do { :item |
			answer[index] := item - prev;
			prev := item;
			index := index + 1
		};
		answer
	}

	doAdjacentPairs { :self :aProcedure:/2 |
		(2 .. self.size).do { :i |
			aProcedure(self[i - 1], self[i])
		}
	}

	drop { :self :n |
		self.copyFromTo(n + 1, self.size)
	}

	dropLast { :self :n |
		self.copyFromTo(1, self.size - n)
	}

	extendTo { :self :size |
		1.toAsCollect(size, self.species) { :index |
			self.atWrap(index)
		}
	}

	flop { :self |
		self.extendToBeOfEqualSize.transpose
	}

	hammingDistance { :self :other |
		| size = self.size.min(other.size), count = (self.size - other.size).abs; |
		(1 .. size).do { :index |
			(self[index] ~= other[index]).ifTrue {
				count := count + 1
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

	integrate { :self |
		| answer = [], sum = 0; |
		self.do { :item |
			sum := sum + item;
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
			withReturn {
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
			self.size.do { :xIndex |
				| corner = xIndex - 1; |
				matrix[1] := xIndex - 1;
				other.size.do { :yIndex |
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

	pyramid { :self :patternType |
		|(
			answer = [],
			lastIndex = self.size
		)|
		(patternType = 1).ifTrue {
			(1 .. lastIndex).do { :index |
				answer.addAll(self.copyFromTo(1, index))
			}
		};
		(patternType = 6).ifTrue {
			(0 .. lastIndex - 1).do { :index |
				answer.addAll(self.copyFromTo(lastIndex - index, lastIndex))
			}
		};
		self.species.newFrom(answer)
	}

	reshape { :self :shape |
		| size = shape.product, answer = self.flatten.wrapExtend(size); |
		shape.allButFirst.reverseDo { :n |
			answer := answer.clump(n)
		};
		answer
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
				nextIndex := nextIndex + 1
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
		1.upTo(size).do { :index |
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
	** { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, timesTimes:/2) }
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

	overlap { :self:/0 :sustainTime :transitionTime :overlap |
		| period = (sustainTime + (transitionTime * 2)) / overlap; |
		workspace::clock.schedule(0) { :currentTime |
			{
				self().withOverlapEnvelope(sustainTime, transitionTime)
			}.playAt(currentTime + 0.5); (* fixed delay... *)
			period
		}
	}

	playEvery { :self:/1 :delay |
		workspace::clock.playEvery(self:/1, delay)
	}

	recurseEvery { :self:/2 :anObject :delay |
		workspace::clock.recurseEvery(self:/2, anObject, delay)
	}

	xfade { :self :sustainTime :transitionTime |
		self.overlap(sustainTime, transitionTime, 2)
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

}

