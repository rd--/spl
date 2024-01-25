{- Requires: BlockStream -}

+@Object {

	Lforever { :anObject |
		BlockStream { anObject } { }
	}

	Lonce { :anObject |
		[anObject].asStream
	}

	Lconstant { :anObject |
		Lforever(anObject)
	}

}

+Block {

	Lunfold { :aBlock:/1 :start |
		let next = start;
		BlockStream {
			let answer = next;
			next := aBlock(next);
			answer
		} {
			next := start
		}
	}

	Lunfold { :aBlock:/1 :start :length |
		Lunfold(aBlock:/1, start).take(length)
	}

}

+@Number {

	Lgeom { :start :grow :length |
		Lunfold({ :each | each * grow }, start, length)
	}

	Lseries { :start :step :length |
		Lunfold({ :each | each + step }, start, length)
	}

}

+@Sequenceable {

	Lat { :list :indices |
		indices.collect { :each | list[each] }
	}

	LatFold { :list :indices |
		indices.collect { :each | list.atFold(each) }
	}

	LatWrap { :list :indices |
		indices.collect { :each | list.atWrap(each) }
	}

	Lcat { :list |
		let index = 1;
		list.replace(Lonce:/1);
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

	Lcyc { :list |
		Lseq(list, inf)
	}

	Llace { :list |
		let index = 1;
		list.replace(Lforever:/1);
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

	Llace { :list :count |
		Llace(list).take(count)
	}

	Lrand { :list |
		BlockStream {
			list.atRandom
		} {
		}
	}

	Lrand { :list :count |
		Lrand(list).take(count)
	}

	Lseq { :list :repeats |
		Ln(Lcat(list), repeats)
	}

	Lswitch { :list :which |
		| index |
		list.replace(Lonce:/1);
		which := Lforever(which);
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

	Lswitch1 { :list :which |
		list.replace(Lforever:/1);
		which := Lforever(which);
		BlockStream {
			list[which.next].next
		} {
			list.do(reset:/1);
			which.reset
		}
	}

	Ltuple { :list :repeats |
		let count = repeats;
		list.replace(Lonce:/1);
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

	Lwalk { :list :steps |
		LatFold(list, Laccum(Lconstant(steps)))
	}

	Lxrand { :list |
		LremDup(Lrand(list))
	}

	Lxrand { :list :count |
		Lxrand(list).take(count)
	}

}

+@Stream {

	Laccum { :input |
		let sum = 0;
		input.collect { :each |
			sum := sum + each;
			sum
		}
	}

	Lclump { :input :size |
		size := Lforever(size);
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

	Lclutch { :input :latch :initialValue |
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

	Lcollect { :self :aBlock:/1 |
		self.collect(aBlock:/1)
	}

	Lconstant { :self |
		self
	}

	LdupEach { :input :repeats |
		input.duplicateEach(Lforever(repeats))
	}

	Lforever { :input |
		Ln(input, inf)
	}

	Ln { :input :repeats |
		input.repeat(repeats)
	}

	Lonce { :self |
		self
	}

	LremDup { :self |
		self.removeSuccesiveDuplicates
	}

	Ltake { :self :anInteger |
		self.take(anInteger)
	}

	play { :self |
		let timeDifference = (system.unixTimeInMilliseconds - system.systemTimeInMilliseconds) / 1000;
		{ :currentTime |
			let next = self.next;
			next.ifNil {
				nil
			} {
				let dur = next::dur;
				let events = next.multiChannelExpand;
				let packets = events.collect { :each |
					each.asPatternEventMessages(currentTime + timeDifference)
				}.concatenation;
				packets.do { :each |
					each.asRecord.postLine;
					system.scSynth.sendOsc(each)
				};
				dur
			}
		}.schedule
	}

}

+@Dictionary {

	asPatternEventMessages { :self :currentTime |
		let latency = 0.2; {- Preferences -}
		let instrument = self::instrument;
		let synthId = 100 + system.uniqueId; {- Node allocator -}
		let addAction = 0;
		let targetNode = 1;
		let sNewMessage = OscMessage(
			'/s_new',
			[
				instrument,
				synthId,
				addAction,
				targetNode
			] ++ self.associations.collect { :each |
				[
					each.key,
					each.value
				]
			}.concatenation
		);
		let sNewBundle = OscBundle(currentTime + latency, [sNewMessage]);
		self.includesKey('gate').if {
			let sustain = self::sustain;
			let releaseTime = currentTime + sustain;
			let nSetMessage = OscMessage('/n_set', [synthId, 'gate', 0]);
			let nSetBundle = OscBundle(releaseTime + latency, [nSetMessage]);
			[sNewBundle, nSetBundle]
		} {
			[sNewBundle]
		}
	}

	Lbind { :self |
		let atEnd = false;
		self.replace(Lconstant:/1);
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

+@[Number, Stream] {

	Lbeta { :low :high :p1 :p2 :length |
		low := Lconstant(low);
		high := Lconstant(high);
		p1 := Lconstant(p1);
		p2 := Lconstant(p2);
		BlockStream {
			randomFloatEularianBetaDistribution(low.next, high.next, p1.next, p2.next)
		} {
			low.reset;
			high.reset;
			p1.reset;
			p2.reset
		}.take(length)
	}

	LbrownUsing { :low :high :step :aBlock:/2 |
		| next |
		low := Lconstant(low);
		high := Lconstant(high);
		step := Lconstant(step);
		next := aBlock(low.next, high.next);
		low.withAndCollect(high, step) { :low :high :step |
			let answer = next;
			next := (next + aBlock(step.negated, step)).foldBetweenAnd(low, high);
			answer
		}
	}

	Lbrown { :low :high :step :length |
		LbrownUsing(low, high, step, randomFloat:/2).take(length)
	}

	Lcauchy { :mean :spread :length |
		mean := Lconstant(mean);
		spread := Lconstant(spread);
		mean.withCollect(spread, randomFloatCauchyDistribution:/2).take(length)
	}

	Librown { :low :high :step :length |
		LbrownUsing(low, high, step, randomIntegerExcludingZero:/2).take(length)
	}

	Lwhite { :low :high :length |
		Lconstant(low).randomFloat(high).take(length)
	}

}
