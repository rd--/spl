{- Requires: Iterator Stream -}

BlockStream : [Object, Iterator, Stream] { | onNext onReset |

	copy { :self |
		'BlockStream>>copy: not implemented'.error
	}

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

	fixedPointList { :self:/1 :anObject |
		self:/1.fixedPointList(anObject, ~)
	}

	fixedPointList { :self:/1 :anObject :aBlock:/2 |
		let previous = nil;
		self:/1.iterate(anObject).nextUntil { :each |
			let continue = previous.notNil & {
				aBlock(previous, each)
			};
			previous := each;
			continue
		}
	}

	iterate { :self:/1 :anObject |
		let state = anObject;
		BlockStream {
			let next = state;
			state := self(state);
			next
		} {
			state := anObject
		}
	}

	nestList { :self:/1 :anObject :count |
		self:/1.iterate(anObject).next(count + 1)
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

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		self.collect { :each |
			aBlock(aNumber, each)
		}
	}

	adaptToStreamAndApply { :self :aStream :aBlock:/2 |
		let atEnd = false;
		BlockStream {
			atEnd.if {
				nil
			} {
				let p = self.next;
				let q = aStream.next;
				(p.isNil | {
					q.isNil
				}).if {
					atEnd := true;
					nil
				} {
					aBlock(p, q)
				}
			}
		} {
			self.reset;
			aStream.reset;
			atEnd := false
		}
	}

	collect { :self :aBlock:/1 |
		BlockStream {
			let next = self.next;
			next.isNil.if {
				nil
			} {
				aBlock(next)
			}
		} {
			self.reset
		}
	}

	drop { :input :count |
		input.next(count);
		BlockStream {
			input.next
		} {
			input.reset;
			input.next(count)
		}
	}

	duplicateEach { :input :repeats |
		let remain = 1;
		let next = nil;
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

	randomFloat { :self |
		self.collect(randomFloat:/1)
	}

	randomFloat { :lhs :rhs |
		rhs.adaptToStreamAndApply(lhs, randomFloat:/2)
	}

	reject { :self :aBlock:/1 |
		self.select { :each |
			aBlock(each).not
		}
	}

	removeSuccesiveDuplicates { :self |
		let previous = nil;
		self.reject { :each |
			(each = previous).if {
				true
			} {
				previous := each;
				false
			}
		}
	}

	repeat { :self :repeats |
		let repeat = 1;
		BlockStream {
			let next = self.next;
			(next.isNil & {
				repeat < repeats
			}).ifTrue {
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

	scan { :input :aBlock:/2 |
		let z1 = input.next;
		BlockStream {
			let z2 = input.next;
			z1.isNil.if {
				nil
			} {
				let answer = z1;
				z2.isNil.if {
					z1 := nil
				} {
					z1 := aBlock(z1, z2)
				};
				answer
			}
		} {
			input.reset;
			z1 := input.next
		}
	}

	select { :self :aBlock:/1 |
		BlockStream {
			let next = self.next;
			{
				next.isNil | {
					aBlock(next)
				}
			}.whileFalse {
				next := self.next
			};
			next
		} {
			self.reset
		}
	}

	take { :self :limit |
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

	withAndCollect { :self :aStream :anotherStream :aBlock:/3 |
		BlockStream {
			let selfNext = self.next;
			let aStreamNext = aStream.next;
			let anotherStreamNext = anotherStream.next;
			(selfNext.isNil | {
				aStreamNext.isNil | {
					anotherStreamNext.isNil
				}
			}).if {
				nil
			} {
				aBlock(selfNext, aStreamNext, anotherStreamNext)
			}
		} {
			self.reset;
			aStream.reset;
			anotherStream.reset
		}
	}

	withCollect { :self :aStream :aBlock:/2 |
		BlockStream {
			let selfNext = self.next;
			let aStreamNext = aStream.next;
			(selfNext.isNil | {
				aStreamNext.isNil
			}).if {
				nil
			} {
				aBlock(selfNext, aStreamNext)
			}
		} {
			self.reset;
			aStream.reset
		}
	}

}

+@Number {

	adaptToStreamAndApply { :self :aStream :aBlock:/2 |
		aStream.collect { :each |
			aBlock(each, self)
		}
	}

}
