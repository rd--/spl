{- Requires: Iterator Stream -}

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


+@Stream {

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

}

+@Number {

	adaptToStreamAndApply { :self :aStream :aBlock:/2 |
		aStream.collect { :each |
			aBlock(each, self)
		}
	}

}
