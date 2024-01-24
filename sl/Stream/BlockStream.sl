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
				p.isNil.or {
					q.isNil
				}.if {
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

}

+@Number {

	adaptToStreamAndApply { :self :aStream :aBlock:/2 |
		aStream.collect { :each |
			aBlock(each, self)
		}
	}

}
