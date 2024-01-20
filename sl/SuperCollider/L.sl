{- Requires: BlockStream -}

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
		Ltake(Llace(list), count)
	}

	Lrand { :list |
		BlockStream {
			list.atRandom
		} {
		}
	}

	Lrand { :list :count |
		Ltake(Lrand(list), count)
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
		Ltake(Lxrand(list), count)
	}

}

+@Stream {

	* { :lhs :rhs |
		rhs.adaptToStreamAndApply(lhs, *)
	}

	/ { :lhs :rhs |
		rhs.adaptToStreamAndApply(lhs, /)
	}

	+ { :lhs :rhs |
		rhs.adaptToStreamAndApply(lhs, +)
	}

	- { :lhs :rhs |
		rhs.adaptToStreamAndApply(lhs, -)
	}

	Lbinop { :lhs :rhs :aBlock:/2 |
		let atEnd = false;
		BlockStream {
			atEnd.if {
				nil
			} {
				let p = lhs.next;
				let q = rhs.next;
				(
					p.isNil | {
						q.isNil
					}
				).if {
					atEnd := true;
					nil
				} {
					aBlock(p, q)
				}
			}
		} {
			lhs.reset;
			rhs.reset;
			atEnd := false
		}
	}

	Lclump { :input :size |
		size := Lforever(size);
		BlockStream {
			let answer = input.take(size.next);
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

	Ldrop { :input :count |
		input.next(count);
		BlockStream {
			input.next
		} {
			input.reset;
			input.next(count)
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

	Lreject { :input :aBlock:/1 |
		Lselect(input) { :each |
			aBlock(each).not
		}
	}

	Lselect { :input :aBlock:/1 |
		BlockStream {
			let next = input.next;
			{
				next.isNil | {
					aBlock(next)
				}
			}.whileFalse {
				next := input.next
			};
			next
		} {
			input.reset
		}
	}

	Ltake { :input :limit |
		let count = 1;
		BlockStream {
			(count > limit).if {
				nil
			} {
				count := count + 1;
				input.next
			}
		} {
			count := 1;
			input.reset
		}
	}

}
