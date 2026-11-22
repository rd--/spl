/* Requires: FunctionStream */

+@Object {

	lsCons { :anObject :aStream |
		lsCat([lsOnce(anObject), aStream])
	}

	lsConstant { :anObject |
		lsForever(anObject)
	}

	lsForever { :anObject |
		FunctionStream {
			anObject
		} {
		}
	}

	lsOnce { :anObject |
		Stream[anObject]
	}

}

+Function {

	lsUnfold { :aFunction/1 :start |
		let nextItem = start;
		FunctionStream {
			let answer = nextItem;
			nextItem := aFunction(nextItem);
			answer
		} {
			nextItem := start
		}
	}

	lsUnfold { :aFunction/1 :start :length |
		lsUnfold(aFunction/1, start).take(length)
	}

}

+[Integer, @SmallInteger] {

	lsFin { :count :input |
		input.take(count)
	}

}

+@Number {

	lsGeom { :start :grow :length |
		lsUnfold({ :each | each * grow }, start, length)
	}

	lsSeries { :start :step :length |
		lsUnfold({ :each | each + step }, start, length)
	}

}

+List {

	lsAt { :list :indices |
		indices.collect { :each |
			list[each]
		}
	}

	lsAtFold { :list :indices |
		indices.collect { :each |
			list.atFold(each)
		}
	}

	lsAtWrap { :list :indices |
		indices.collect { :each |
			list.atWrap(each)
		}
	}

	lsCat { :list |
		let index = 1;
		list.collect!(lsOnce/1);
		FunctionStream {
			(index > list.size).if {
				nil
			} {
				let nextItem = list[index].next;
				{
					nextItem.isNil & {
						index < list.size
					}
				}.whileTrue {
					index := index + 1;
					nextItem := list[index].next
				};
				nextItem
			}
		} {
			list.do(reset!/1);
			index := 1
		}
	}

	lsCyc { :list |
		lsSeq(list, Infinity)
	}

	lsLace { :list |
		let index = 1;
		list.collect!(lsForever/1);
		FunctionStream {
			let nextItem = list[index].next;
			(index >= list.size).if {
				index := 1
			} {
				index := index + 1
			};
			nextItem
		} {
			list.do(reset!/1);
			index := 1
		}
	}

	lsLace { :list :count |
		lsLace(list).take(count)
	}

	lsPermutations { :list |
		let local = list.copy;
		let nextItem = local;
		FunctionStream {
			let answer = nextItem.copy;
			nextItem := local.nextPermutationLexicographic!;
			answer
		} {
			local := list.copy
		}
	}

	lsRand { :list :randomNumberGenerator |
		FunctionStream {
			list.randomChoice(randomNumberGenerator, [])
		} {
		}
	}

	lsRand { :list :count :randomNumberGenerator |
		lsRand(list, randomNumberGenerator).take(count)
	}

	lsSeq { :list :repeats |
		lsN(lsCat(list), repeats)
	}

	lsSer { :list :count |
		lsTake(lsCyc(list), count)
	}

	lsSwitch { :list :which |
		list.collect!(lsOnce/1);
		which := lsForever(which);
		let index = which.next;
		FunctionStream {
			let nextItem = list[index].next;
			nextItem.ifNil {
				list[index].reset!;
				index := which.next;
				nextItem := list[index].next
			};
			nextItem
		} {
			list.do(reset!/1);
			which.reset!
		}
	}

	lsSwitch1 { :list :which |
		list.collect!(lsForever/1);
		which := lsForever(which);
		FunctionStream {
			list[which.next].next
		} {
			list.do(reset!/1);
			which.reset!
		}
	}

	lsTuple { :list :repeats |
		let count = repeats;
		list.collect!(lsOnce/1);
		FunctionStream {
			(count <= 0).if {
				nil
			} {
				let nextList = list.collect(next/1);
				nextList.anySatisfy(isNil/1).ifTrue {
					count := count - 1;
					list.do(reset!/1);
					nextList := list.collect(next/1)
				};
				nextList
			}
		} {
			list.do(reset!/1);
			count := repeats
		}
	}

	lsWalk { :list :steps |
		lsAtFold(list, lsAccum(lsConstant(steps)))
	}

	lsXRand { :list :randomNumberGenerator |
		lsRemDup(lsRand(list, randomNumberGenerator))
	}

	lsXRand { :list :count :randomNumberGenerator |
		lsXRand(list, randomNumberGenerator).take(count)
	}

}

+@Stream {

	lsAccum { :input |
		lsScan(input, +)
	}

	lsAdjacent { :input :aFunction/2 |
		let previousItem = input.next;
		FunctionStream {
			let nextItem = input.next;
			nextItem.isNil.if {
				nil
			} {
				let answer = aFunction(previousItem, nextItem);
				previousItem := nextItem;
				answer
			}
		} {
			input.reset!;
			previousItem := input.next
		}
	}

	lsClump { :input :size |
		size := lsForever(size);
		FunctionStream {
			let answer = input.nextOrUpToEnd(size.next);
			answer.isEmpty.if {
				nil
			} {
				answer
			}
		} {
			input.reset!;
			size.reset!
		}
	}

	lsClutch { :input :latch :initialValue |
		let previous = initialValue;
		FunctionStream {
			latch.next.Boolean.ifTrue {
				previous := input.next
			};
			previous
		} {
			input.reset!;
			latch.reset!
		}
	}

	lsCollect { :self :aFunction/1 |
		self.collect(aFunction/1)
	}

	lsConstant { :self |
		self
	}

	lsDiff { :input |
		lsAdjacent(input, -.swap)
	}

	lsDrop { :self :anInteger |
		self.drop(anInteger)
	}

	lsDupEach { :input :repeats |
		input.duplicateEach(lsForever(repeats))
	}

	lsFold { :input :aFunction/2 |
		lsLast(lsScan(input, aFunction/2))
	}

	lsForever { :input |
		lsN(input, Infinity)
	}

	lsLast { :input |
		let answer = input.next;
		let nextItem = nil;
		{
			nextItem := input.next;
			nextItem.isNotNil
		}.whileTrue {
			answer := nextItem
		};
		answer
	}

	lsN { :input :repeats |
		input.repeat(repeats)
	}

	lsOnce { :self |
		self
	}

	lsRemDup { :self |
		self.removeSuccesiveDuplicates
	}

	lsScan { :input :aFunction/2 |
		input.scan(aFunction/2)
	}

	lsSlidingWindows { :input :windowSize :stepSize |
		let overlap = (windowSize - stepSize).max(0);
		let require = windowSize - overlap;
		let skipSize = (stepSize - windowSize).max(0);
		let window = input.next(overlap);
		FunctionStream {
			let current = input.nextOrUpToEnd(require);
			(current.size != require).if {
				nil
			} {
				let answer = window ++ current;
				(skipSize > 0).ifTrue {
					input.next(skipSize)
				};
				window.addAll!(current);
				window.removeFirst!(require);
				answer
			}
		} {
			input.reset!;
			window := input.next(overlap)
		}
	}

	lsTake { :input :anInteger |
		input.take(anInteger)
	}

	lsTrace { :input |
		input.collect { :each |
			each.printLine;
			each
		}
	}

	play { :self |
		let absoluteTime = system.absoluteTime;
		let sessionTime = system.sessionTime;
		let timeDifference = absoluteTime - sessionTime;
		{ :currentTime |
			let nextEvent = self.next;
			nextEvent.ifNil {
				nil
			} {
				let dur = nextEvent['dur'];
				let events = nextEvent.multiChannelExpand;
				let packets = events.collectCatenate { :each |
					each.asPatternEventMessages(currentTime + timeDifference)
				};
				packets.do { :each |
					system.scSynth.sendOsc(each)
				};
				dur
			}
		}.schedule
	}

}

+Record {

	asPatternEventMessages { :self :currentTime |
		let latency = 0.2; /* Preferences */
		let instrument = self['instrument'];
		let synthId = 100 + system.uniqueIdentifier; /* Node allocator */
		let addAction = 0;
		let targetNode = 1;
		let sNewMessage = OscMessage(
			'/s_new',
			[
				instrument,
				synthId,
				addAction,
				targetNode
			] ++ self.associations.collectCatenate { :each |
				[
					each.key,
					each.value
				]
			}
		);
		let sNewBundle = OscBundle(currentTime + latency, [sNewMessage]);
		self.includesKey('gate').if {
			let sustain = self['sustain'];
			let releaseTime = currentTime + sustain;
			let nSetMessage = OscMessage('/n_set', [synthId, 'gate', 0]);
			let nSetBundle = OscBundle(releaseTime + latency, [nSetMessage]);
			[sNewBundle, nSetBundle]
		} {
			[sNewBundle]
		}
	}

	lsBind { :self |
		let isAtEnd = false;
		self.collect!(lsConstant/1);
		FunctionStream {
			isAtEnd.if {
				nil
			} {
				let nextList = self.collect(next/1);
				nextList.anySatisfy(isNil/1).if {
					isAtEnd := true;
					nil
				} {
					nextList
				}
			}
		} {
			self.do(reset!/1);
			isAtEnd := false
		}
	}

}

+[@Number, @Stream] {

	lsBeta { :low :high :p1 :p2 :length :randomNumberGenerator |
		low := lsConstant(low);
		high := lsConstant(high);
		p1 := lsConstant(p1);
		p2 := lsConstant(p2);
		FunctionStream {
			let lhs = low.next;
			let rhs = high.next;
			randomNumberGenerator.betaDistribution(p1.next, p2.next) * (rhs - lhs) + lhs
		} {
			low.reset!;
			high.reset!;
			p1.reset!;
			p2.reset!
		}.take(length)
	}

	lsBrown { :low :high :step :length :randomNumberGenerator |
		lsBrownUsing(
			low,
			high,
			step,
			randomNumberGenerator,
			randomReal/3
		).take(length)
	}

	lsBrownUsing { :low :high :step :randomNumberGenerator :aFunction/3 |
		low := lsConstant(low);
		high := lsConstant(high);
		step := lsConstant(step);
		let nextItem = aFunction(randomNumberGenerator, [low.next, high.next], []);
		low.withWithCollect(high, step) { :low :high :step |
			let answer = nextItem;
			nextItem := (nextItem + aFunction(randomNumberGenerator, [step.negate, step], [])).fold(low, high);
			answer
		}
	}

	lsCauchy { :mean :spread :length :randomNumberGenerator |
		mean := lsConstant(mean);
		spread := lsConstant(spread);
		mean.withCollect(
			spread,
			{ :p :q |
				randomNumberGenerator.cauchyDistribution(p, q)
			}
		).take(length)
	}

	lsIBrown { :low :high :step :length :randomNumberGenerator |
		lsBrownUsing(
			low,
			high,
			step,
			randomNumberGenerator,
			randomSmallIntegerExcludingZero/3
		).take(length)
	}

	lsWhite { :low :high :length :randomNumberGenerator |
		lsConstant(low).withCollect(
			lsConstant(high)
		) { :min :max |
			randomNumberGenerator.randomReal([min, max], [])
		}.take(length)
	}

}

+String {

	lsSet { :key :value :input |
		value := lsConstant(value);
		input.withCollect(value) { :each :z |
			each[key] := z;
			each
		}
	}

}
