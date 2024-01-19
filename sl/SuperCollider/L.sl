BlockStream : [Object, Iterator, Stream] { | onNext onReset |

	next { :self |
		self.onNext.value
	}

	reset { :self |
		self.onReset.value
	}

}

+Block {

	BlockStream { :onNext :onReset |
		newBlockStream().initializeSlots(onNext, onReset)
	}

}

+@Object {

	Lforever { :self |
		BlockStream { self } { }
	}

	Lonce { :self |
		[self].asStream
	}

	Lunfold { :start :step :length |
		let next = start;
		let index = 1;
		BlockStream {
			(index > length).if {
				nil
			} {
				let answer = next;
				next := step.value(next);
				index := index + 1;
				answer
			}
		} {
			next := start;
			index := 1
		}
	}

}

+@Number {

	Lgeom { :start :grow :length |
		Lunfold(start, { :each | each * grow }, length)
	}

	Lseries { :start :step :length |
		Lunfold(start, { :each | each + step }, length)
	}

}

+@Sequenceable {

	Lcat { :list |
		let items = list.collect(Lonce:/1);
		let index = 1;
		BlockStream {
			(index > items.size).if {
				nil
			} {
				let next = items[index].next;
				{
					next.isNil & {
						index < items.size
					}
				}.whileTrue {
					index := index + 1;
					next := items[index].next
				};
				next
			}
		} {
			items.do(reset:/1);
			index := 1
		}
	}

	Lseq { :list :repeats |
		Ln(Lcat(list), repeats)
	}

}

+@Stream {

	Lclutch { :self :latch :initialValue |
		let previous = initialValue;
		BlockStream {
			latch.next.ifTrue {
				previous := self.next
			};
			previous
		} {
			self.reset;
			latch.reset
		}
	}

	Ldup { :self :repeats |
		let repeatsForever = Lforever(repeats);
		let remain = 1;
		let next = nil;
		BlockStream {
			remain := remain - 1;
			(remain <= 0).ifTrue {
				remain := repeatsForever.next;
				next := self.next
			};
			next
		} {
			self.reset;
			repeatsForever.reset;
			remain := 1
		}
	}

	Lforever { :self |
		Ln(self, inf)
	}

	Ln { :self :repeats |
		let repeat = 1;
		BlockStream {
			let next = self.next;
			{
				next.isNil & {
					repeat < repeats
				}
			}.whileTrue {
				self.reset;
				repeat := repeat + 1;
				next := self.next
			};
			next
		} {
			self.reset;
			repeat := 1
		}
	}

	Lonce { :self |
		self
	}

	Ltake { :self :limit |
		let count = 1;
		BlockStream {
			(count > limit).if {
				nil
			} {
				count := count + 1;
				self.next
			}
		} {
			count := 1;
			self.reset
		}
	}

}
