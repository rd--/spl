{- Requires: BlockStream -}

+@Object {

	Lforever { :self |
		BlockStream { self } { }
	}

	Lonce { :self |
		[self].asStream
	}

	Lconstant { :self |
		Lforever(self)
	}

}

+Block {

	Lunfold { :self:/1 :start |
		let next = start;
		BlockStream {
			let answer = next;
			next := self(next);
			answer
		} {
			next := start
		}
	}

	Lunfold { :self:/1 :start :length |
		Lunfold(self:/1, start).take(length)
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
		list.replace(Lonce:/1);
		BlockStream {
			let next = list[index].next;
			next.ifNil {
				list[index].reset;
				next := list[index].next
			};
			(index >= list.size).if {
				index := 1
			} {
				index := index + 1
			};
			next
		} {
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

	Lxrand { :list |
		let previous = nil;
		let next = list.atRandom;
		BlockStream {
			{
				next = previous
			}.whileTrue {
				next := list.atRandom
			};
			previous := next;
			next
		} {
		}
	}

	Lxrand { :list :count |
		Lxrand(list).take(count)
	}

}

+@Stream {

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

	Ldup { :input :repeats |
		let remain = 1;
		let next = nil;
		repeats := Lforever(repeats);
		BlockStream {
			remain := remain - 1;
			(remain <= 0).ifTrue {
				remain := repeats.next;
				next := input.next
			};
			next
		} {
			input.reset;
			repeats.reset;
			remain := 1
		}
	}

	Lforever { :input |
		Ln(input, inf)
	}

	Ln { :input :repeats |
		let repeat = 1;
		BlockStream {
			let next = input.next;
			{
				next.isNil & {
					repeat < repeats
				}
			}.whileTrue {
				input.reset;
				repeat := repeat + 1;
				next := input.next
			};
			next
		} {
			input.reset;
			repeat := 1
		}
	}

	Lonce { :self |
		self
	}

	Lconstant { :self |
		self
	}

}

+@Dictionary {

	Lbind { :self |
		let atEnd = false;
		self.replace(Lconstant:/1);
		self.postLine;
		BlockStream {
			atEnd.if {
				nil
			} {
				let next = self.collect(next:/1);
				next.postLine;
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
