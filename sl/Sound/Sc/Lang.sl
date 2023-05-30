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
			nextDelay.notNil.if {
				aProcedure(currentTime, nextDelay);
				nextDelay
			} {
				nil
			}
		}
	}

	schedule { :self :deltaTime :aProcedure:/1 |
		|
			currentTime = system.systemTimeInSeconds,
			scheduledTime = currentTime + deltaTime,
			wakeupTime = self.nextEntryTime;
		|
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
		|
			currentTime = system.systemTimeInSeconds,
			queue = self.priorityQueue,
			frontOfQueueTime = self.nextEntryTime;
		|
		{
			frontOfQueueTime ~= nil & {
				frontOfQueueTime <= currentTime
			}
		}.whileTrue {
			|
				activityProcedure:/1 = queue.pop,
				rescheduleAfter = activityProcedure(scheduledTime);
			|
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

	abs { :self | self.collect(abs:/1) }
	acos { :self | self.collect(acos:/1) }
	AmpDb { :self | self.collect(AmpDb:/1) }
	asin { :self | self.collect(asin:/1) }
	atan { :self | self.collect(atan:/1) }
	ceiling { :self | self.collect(ceiling:/1) }

	collectTexture { :self :aProcedure:/1 :delay |
		workspace::clock.collectTexture(
			self,
			aProcedure:/1,
			delay
		)
	}

	cos { :self | self.collect(cos:/1) }
	cosh { :self | self.collect(cosh:/1) }
	cubed { :self | self.collect(cubed:/1) }
	DbAmp { :self | self.collect(DbAmp:/1) }
	exp { :self | self.collect(exp:/1) }
	floor { :self | self.collect(floor:/1) }
	fractionPart { :self | self.collect(fractionPart:/1) }
	log { :self | self.collect(log:/1) }
	log10 { :self | self.collect(log10:/1) }
	log2 { :self | self.collect(log2:/1) }
	MidiCps { :self | self.collect(MidiCps:/1) }
	negated { :self | self.collect(negated:/1) }
	rounded { :self | self.collect(rounded:/1) }
	sin { :self | self.collect(sin:/1) }
	sinh { :self | self.collect(sinh:/1) }
	sqrt { :self | self.collect(sqrt:/1) }
	squared { :self | self.collect(squared:/1) }
	tan { :self | self.collect(tan:/1) }
	tanh { :self | self.collect(tanh:/1) }
	truncated { :self | self.collect(truncated:/1) }

}

+@Number {

	ampComp { :freq :root :exp |
		(root / freq) ** exp
	}

	AmpDb { :self |
		self.log10 * 20
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

	Hypot { :self :aNumber |
		((self * self) + (aNumber * aNumber)).sqrt
	}

	Hypotx { :self :aNumber |
		self.abs + aNumber.abs - ((2.sqrt - 1) * self.abs.min(aNumber.abs))
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
			|
				x = self - lo,
				range = hi - lo,
				twiceRange = range + range,
				c = x - (twiceRange * (x / twiceRange).floor);
			|
			(c >= range).ifTrue {
				c := twiceRange - c
			};
			c + lo
		}
	}

	linExpFromTo { :self :lo :hi |
		lo * ((hi / lo).log * self).exp
	}

	LinLin { :self :srclo :srchi :dstlo :dsthi |
		|
			mul = (dsthi - dstlo) / (srchi - srclo),
			add = dstlo - (mul * srclo);
		|
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

}

+@SequenceableCollection {

	allTuples { :self |
		| answerSize = self.collect(size:/1).product; |
		1.to(answerSize).collect { :i |
			| k = i - 1, nextTuple = self.species.new(self.size); |
			self.size.toBy(1, -1).collect { :j |
				| fromSequence = self[j]; |
				nextTuple[j] := fromSequence[k % fromSequence.size + 1];
				k := k // fromSequence.size
			};
			nextTuple
		}
	}

	crossedMultiply { :self :aSequence |
		self.withCrossedCollect(aSequence, times:/2)
	}

	degreeToKey { :self :scale :stepsPerOctave |
		self.collect { :scaleDegree |
			scaleDegree.degreeToKey(scale, stepsPerOctave)
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

	extendTo { :self :size |
		1.toAsCollect(size, self.species) { :index |
			self.atWrap(index)
		}
	}

	flop { :self |
		self.extendToBeOfEqualSize.transpose
	}

	pyramid { :self :patternType |
		|
			answer = OrderedCollection(),
			lastIndex = self.size;
		|
		(patternType = 1).ifTrue {
			(1 .. lastIndex).do { :index |
				answer.addAll(self.copyFromTo(1, index))
			}
		};
		(patternType = 6).ifTrue {
			(0 .. lastIndex - 1).do  { :index |
				answer.addAll(self.copyFromTo(lastIndex - index, lastIndex))
			}
		};
		self.species.newFrom(answer)
	}

	scramble { :self |
		self.shuffled
	}

	stutter { :self :repeatCount |
		(self.collect { :each | { each }.dup(repeatCount) }).concatenation
	}

	withCrossedCollect { :self :aSequence :aProcedure:/2 |
		(* Apply aProcedure for each of my items with each item of aSequence in turn. *)
		|
			answer = self.species.new(self.size * aSequence.size),
			nextIndex = 1;
		|
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
		anObject.isSequenceable.if {
			withExtendingCollect(self, anObject, aProcedure:/2)
		} {
			anObject.adaptToCollectionAndApply(self, aProcedure:/2)
		}
	}

	withTableCollect { :self :aSequence :aProcedure:/2 |
		self.collect { :each |
			each.aProcedure(aSequence)
		}
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
		|
			selfLifted = self.collect(asArray:/1),
			maximumSize = selfLifted.collect(size:/1).detectMax(identity:/1);
		|
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
		|
			k = scale.size,
			d = scaleDegree.rounded,
			a = (scaleDegree - d) * 10 * (stepsPerOctave / 12);
		|
		(stepsPerOctave * (d // k)) + scale[d % k + 1] + a
	}

	geom { :self :start :grow |
		| accum = start; |
		1.to(self).collect { :unusedItem |
			| entry = accum; |
			accum := grow * accum;
			entry
		}
	}

	series { :self :start :step |
		1.to(self).collect { :item |
			(step * (item - 1)) + start
		}
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
