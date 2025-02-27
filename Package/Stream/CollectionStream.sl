/* Requires: PositionableStream Stream */

CollectionStream : [Object, Iterator, Stream, PositionableStream] { | collection positionIndex readLimit |

	atEnd { :self |
		self.position >= self.readLimit
	}

	contents { :self |
		self.collection.copyFromTo(1, self.readLimit)
	}

	isBinary { :self |
		self.collection.isByteArray
	}

	next { :self |
		(self.position >= self.readLimit).if {
			nil
		} {
			self.position := self.position + 1;
			self.collection[self.position]
		}
	}

	next { :self :anInteger |
		let endPosition = self.position + anInteger;
		(endPosition > self.readLimit).if {
			self.error('CollectionStream>>next: not enough items in stream')
		} {
			let answer = self.collection.copyFromTo(self.position + 1, endPosition);
			self.position := endPosition;
			answer
		}
	}

	position { :self :anInteger |
		self.validReadPosition(anInteger).if {
			self.positionIndex := anInteger
		} {
			self.positionError
		}
	}

	setFromTo { :self :newStart :newStop |
		self.position := newStart - 1;
		self.readLimit := newStop
	}

	setToEnd { :self |
		self.position := self.readLimit
	}

	size { :self |
		self.readLimit
	}

	upTo { :self :anObject |
		let start = self.position + 1;
		let end = self.collection.indexOfStartingAtBy(anObject, start, =);
		(end = 0 | {
			end > self.readLimit
		}).if {
			self.upToEnd
		} {
			self.position := end;
			self.collection.copyFromTo(start, end - 1)
		}
	}

	upToEnd { :self |
		let start = 1 + self.position;
		self.position := self.readLimit;
		self.collection.copyFromTo(start, self.position)
	}

	validReadPosition { :self :anInteger |
		anInteger.betweenAnd(0, self.readLimit)
	}

}

+[List, Range] {

	asIterator { :self |
		self.asStream
	}

	asStream { :self |
		newCollectionStream().initializeSlots(self, 0, self.size)
	}

}
