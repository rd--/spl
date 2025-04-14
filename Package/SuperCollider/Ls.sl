/* Requires: BlockStream */

+@Object {

	LsCons { :anObject :aStream |
		LsCat([LsOnce(anObject), aStream])
	}

	LsConstant { :anObject |
		LsForever(anObject)
	}

	LsForever { :anObject |
		BlockStream {
			anObject
		} {
		}
	}

	LsOnce { :anObject |
		[anObject].asStream
	}

}

+Block {

	LsUnfold { :aBlock:/1 :start |
		let next = start;
		BlockStream {
			let answer = next;
			next := aBlock(next);
			answer
		} {
			next := start
		}
	}

	LsUnfold { :aBlock:/1 :start :length |
		LsUnfold(aBlock:/1, start).take(length)
	}

}

+@Integer {

	LsFin { :count :input |
		input.take(count)
	}

}

+@Number {

	LsGeom { :start :grow :length |
		LsUnfold({ :each | each * grow }, start, length)
	}

	LsSeries { :start :step :length |
		LsUnfold({ :each | each + step }, start, length)
	}

}

+List {

	LsAt { :list :indices |
		indices.collect { :each |
			list[each]
		}
	}

	LsAtFold { :list :indices |
		indices.collect { :each |
			list.atFold(each)
		}
	}

	LsAtWrap { :list :indices |
		indices.collect { :each |
			list.atWrap(each)
		}
	}

	LsCat { :list |
		let index = 1;
		list.replace(LsOnce:/1);
		BlockStream {
			(index > list.size).if {
				nil
			} {
				let next = list[index].next;
				{
					next.isNil & {
						index < list.size
					}
				}.whileTrue {
					index := index + 1;
					next := list[index].next
				};
				next
			}
		} {
			list.do(reset:/1);
			index := 1
		}
	}

	LsCyc { :list |
		LsSeq(list, Infinity)
	}

	LsLace { :list |
		let index = 1;
		list.replace(LsForever:/1);
		BlockStream {
			let next = list[index].next;
			(index >= list.size).if {
				index := 1
			} {
				index := index + 1
			};
			next
		} {
			list.do(reset:/1);
			index := 1
		}
	}

	LsLace { :list :count |
		LsLace(list).take(count)
	}

	LsPermutations { :list |
		let local = list.copy;
		let next = local;
		BlockStream {
			let answer = next.copy;
			next := local.nextPermutationLexicographic;
			answer
		} {
			local := list.copy
		}
	}

	LsRand { :list :randomNumberGenerator |
		BlockStream {
			list.randomChoice(randomNumberGenerator, [])
		} {
		}
	}

	LsRand { :list :count :randomNumberGenerator |
		LsRand(list, randomNumberGenerator).take(count)
	}

	LsSeq { :list :repeats |
		LsN(LsCat(list), repeats)
	}

	LsSer { :list :count |
		LsTake(LsCyc(list), count)
	}

	LsSwitch { :list :which |
		let index = nil;
		list.replace(LsOnce:/1);
		which := LsForever(which);
		index := which.next;
		BlockStream {
			let next = list[index].next;
			next.ifNil {
				list[index].reset;
				index := which.next;
				next := list[index].next
			};
			next
		} {
			list.do(reset:/1);
			which.reset
		}
	}

	LsSwitch1 { :list :which |
		list.replace(LsForever:/1);
		which := LsForever(which);
		BlockStream {
			list[which.next].next
		} {
			list.do(reset:/1);
			which.reset
		}
	}

	LsTuple { :list :repeats |
		let count = repeats;
		list.replace(LsOnce:/1);
		BlockStream {
			(count <= 0).if {
				nil
			} {
				let next = list.collect(next:/1);
				next.anySatisfy(isNil:/1).ifTrue {
					count := count - 1;
					list.do(reset:/1);
					next := list.collect(next:/1)
				};
				next
			}
		} {
			list.do(reset:/1);
			count := repeats
		}
	}

	LsWalk { :list :steps |
		LsAtFold(list, LsAccum(LsConstant(steps)))
	}

	LsXRand { :list :randomNumberGenerator |
		LsRemDup(LsRand(list, randomNumberGenerator))
	}

	LsXRand { :list :count :randomNumberGenerator |
		LsXRand(list, randomNumberGenerator).take(count)
	}

}

+@Stream {

	LsAccum { :input |
		LsScan(input, +)
	}

	LsAdjacent { :input :aBlock:/2 |
		let previous = input.next;
		BlockStream {
			let next = input.next;
			next.isNil.if {
				nil
			} {
				let answer = aBlock(previous, next);
				previous := next;
				answer
			}
		} {
			input.reset;
			previous := input.next
		}
	}

	LsClump { :input :size |
		size := LsForever(size);
		BlockStream {
			let answer = input.nextOrUpToEnd(size.next);
			answer.isEmpty.if {
				nil
			} {
				answer
			}
		} {
			input.reset;
			size.reset
		}
	}

	LsClutch { :input :latch :initialValue |
		let previous = initialValue;
		BlockStream {
			latch.next.asBoolean.ifTrue {
				previous := input.next
			};
			previous
		} {
			input.reset;
			latch.reset
		}
	}

	LsCollect { :self :aBlock:/1 |
		self.collect(aBlock:/1)
	}

	LsConstant { :self |
		self
	}

	LsDiff { :input |
		LsAdjacent(input, -.swap)
	}

	LsDrop { :self :anInteger |
		self.drop(anInteger)
	}

	LsDupEach { :input :repeats |
		input.duplicateEach(LsForever(repeats))
	}

	LsFold { :input :aBlock:/2 |
		LsLast(LsScan(input, aBlock:/2))
	}

	LsForever { :input |
		LsN(input, Infinity)
	}

	LsLast { :input |
		let answer = input.next;
		let next = nil;
		{
			next := input.next;
			next.notNil
		}.whileTrue {
			answer := next
		};
		answer
	}

	LsN { :input :repeats |
		input.repeat(repeats)
	}

	LsOnce { :self |
		self
	}

	LsRemDup { :self |
		self.removeSuccesiveDuplicates
	}

	LsScan { :input :aBlock:/2 |
		input.scan(aBlock:/2)
	}

	LsSlidingWindows { :input :windowSize :stepSize |
		let overlap = (windowSize - stepSize).max(0);
		let require = windowSize - overlap;
		let skip = (stepSize - windowSize).max(0);
		let window = input.next(overlap);
		BlockStream {
			let current = input.nextOrUpToEnd(require);
			(current.size ~= require).if {
				nil
			} {
				let answer = window ++ current;
				(skip > 0).ifTrue {
					input.next(skip)
				};
				window.addAll(current);
				window.removeFirst(require);
				answer
			}
		} {
			input.reset;
			window := input.next(overlap)
		}
	}

	LsTake { :input :anInteger |
		input.take(anInteger)
	}

	LsTrace { :input |
		input.collect { :each |
			each.postLine;
			each
		}
	}

	play { :self |
		let absoluteTime = system.absoluteTime;
		let sessionTime = system.sessionTime;
		let timeDifference = absoluteTime - sessionTime;
		{ :currentTime |
			let next = self.next;
			next.ifNil {
				nil
			} {
				let dur = next['dur'];
				let events = next.multiChannelExpand;
				let packets = events.gather { :each |
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
		let synthId = 100 + system.uniqueId; /* Node allocator */
		let addAction = 0;
		let targetNode = 1;
		let sNewMessage = OscMessage(
			'/s_new',
			[
				instrument,
				synthId,
				addAction,
				targetNode
			] ++ self.associations.gather { :each |
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

	LsBind { :self |
		let atEnd = false;
		self.replace(LsConstant:/1);
		BlockStream {
			atEnd.if {
				nil
			} {
				let next = self.collect(next:/1);
				next.anySatisfy(isNil:/1).if {
					atEnd := true;
					nil
				} {
					next
				}
			}
		} {
			self.do(reset:/1);
			atEnd := false
		}
	}

}

+[@Number, @Stream] {

	LsBeta { :low :high :p1 :p2 :length :randomNumberGenerator |
		low := LsConstant(low);
		high := LsConstant(high);
		p1 := LsConstant(p1);
		p2 := LsConstant(p2);
		BlockStream {
			let lhs = low.next;
			let rhs = high.next;
			randomNumberGenerator.betaDistribution(p1.next, p2.next) * (rhs - lhs) + lhs
		} {
			low.reset;
			high.reset;
			p1.reset;
			p2.reset
		}.take(length)
	}

	LsBrownUsing { :low :high :step :randomNumberGenerator :aBlock:/3 |
		let next = nil;
		low := LsConstant(low);
		high := LsConstant(high);
		step := LsConstant(step);
		next := aBlock(randomNumberGenerator, [low.next, high.next], []);
		low.withAndCollect(high, step) { :low :high :step |
			let answer = next;
			next := (next + aBlock(randomNumberGenerator, [step.negated, step], [])).foldBetweenAnd(low, high);
			answer
		}
	}

	LsBrown { :low :high :step :length :randomNumberGenerator |
		LsBrownUsing(
			low,
			high,
			step,
			randomNumberGenerator,
			randomReal:/3
		).take(length)
	}

	LsCauchy { :mean :spread :length :randomNumberGenerator |
		mean := LsConstant(mean);
		spread := LsConstant(spread);
		mean.withCollect(
			spread,
			{ :p :q |
				randomNumberGenerator.cauchyDistribution(p, q)
			}
		).take(length)
	}

	LsIBrown { :low :high :step :length :randomNumberGenerator |
		LsBrownUsing(
			low,
			high,
			step,
			randomNumberGenerator,
			randomIntegerExcludingZero:/3
		).take(length)
	}

	LsWhite { :low :high :length :randomNumberGenerator |
		LsConstant(low).withCollect(
			LsConstant(high)
		) { :min :max |
			randomNumberGenerator.randomReal([min, max], [])
		}.take(length)
	}

}

+String {

	LsSet { :key :value :input |
		value := LsConstant(value);
		input.withCollect(value) { :each :z |
			each[key] := z;
			each
		}
	}

}
