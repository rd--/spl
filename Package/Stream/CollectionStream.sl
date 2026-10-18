/* Requires: Stream */

CollectionStream : [Object, Copy, Equal, Do, Collect, Iterator, Stream] {

	| collection positionIndex readLimit |

	back! { :self |
		(self.position = 0).ifTrue {
			self.error('back!: cannot go back')
		};
		self.skip!(-1);
		self.peek
	}

	contents { :self |
		self.collection.copyFromTo(1, self.readLimit)
	}

	isAtEnd { :self |
		self.positionIndex >= self.readLimit
	}

	isEmpty { :self |
		self.isAtEnd & {
			self.position = 0
		}
	}

	isValidReadPosition { :self :anInteger |
		anInteger.isBetween(0, self.readLimit)
	}

	last { :self |
		self.collection.at(self.position)
	}

	next { :self |
		self.isAtEnd.if {
			nil
		} {
			self.position!(self.position + 1);
			self.collection[self.position]
		}
	}

	next { :self :anInteger |
		let endPosition = self.position + anInteger;
		(endPosition > self.readLimit).if {
			self.error('CollectionStream>>next: not enough items in stream')
		} {
			let answer = self.collection.copyFromTo(self.position + 1, endPosition);
			self.position!(endPosition);
			answer
		}
	}

	nextMatchAll { :self :aCollection |
		withReturn { :return/1 |
			let savedPosition = self.position;
			aCollection.do { :each |
				(self.next = each).ifFalse {
					self.position!(savedPosition);
					false.return
				}
			};
			true
		}
	}

	peek { :self |
		self.isAtEnd.if {
			nil
		} {
			let nextObject = self.next;
			self.position!(self.position - 1);
			nextObject
		}
	}

	peekFor { :self :anObject |
		withReturn { :return/1 |
			self.isAtEnd.ifTrue {
				false.return
			};
			(self.next = anObject).ifTrue {
				true.return
			};
			self.position!(self.position - 1);
			false
		}
	}

	position { :self |
		self.positionIndex
	}

	position! { :self :anInteger |
		self.isValidReadPosition(anInteger).if {
			self.positionIndex := anInteger
		} {
			self.positionError
		}
	}

	positionError { :self |
		self.error('positionError: position out of bounds')
	}

	reset! { :self |
		self.position!(0)
	}

	setFromTo! { :self :newStart :newStop |
		self.position!(newStart - 1);
		self.readLimit := newStop
	}

	setToEnd! { :self |
		self.position!(self.readLimit)
	}

	size { :self |
		self.readLimit
	}

	skip! { :self :anInteger |
		self.position!(self.position + anInteger)
	}

	skipTo! { :self :anObject |
		withReturn { :return/1 |
			{
				self.isAtEnd
			}.whileFalse {
				(self.next = anObject).ifTrue {
					true.return
				}
			};
			false
		}
	}

	upTo { :self :anObject |
		let start = self.position + 1;
		let end = self.collection.indexOfStartingAtBy(anObject, start, isEqual/2);
		(
			end = 0 | {
				end > self.readLimit
			}
		).if {
			self.upToEnd
		} {
			self.position!(end);
			self.collection.copyFromTo(start, end - 1)
		}
	}

	upToEnd { :self |
		let start = 1 + self.position;
		self.position!(self.readLimit);
		self.collection.copyFromTo(start, self.position)
	}

	upToPosition { :self :anInteger |
		self.next(anInteger - self.position)
	}

}

+[List, Range] {

	[CollectionStream] { :self |
		newCollectionStream()
		.initializeSlots(
			self,
			0,
			self.size
		)
	}

	[Iterator, Stream] { :self |
		CollectionStream(self)
	}

}
