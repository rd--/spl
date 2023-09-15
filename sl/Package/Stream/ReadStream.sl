(* Requires: Stream-PositionableStream Stream-Stream *)

ReadStream : [Object, Stream, PositionableStream] { | collection positionIndex readLimit |

	atEnd { :self |
		self.position >= self.readLimit
	}

	contents { :self |
		self.collection.copyFromTo(1, self.readLimit)
	}

	next { :self |
		(self.position >= self.readLimit).if {
			nil
		} {
			self.position +:= 1;
			self.collection[self.position]
		}
	}

	next { :self :anInteger |
		|(
			endPosition = (self.position + anInteger).min(self.readLimit),
			answer = self.collection.copyFromTo(self.position + 1, endPosition)
		)|
		self.position := endPosition;
		answer
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
		|(
			start = self.position + 1,
			end = self.collection.indexOfStartingAt(anObject, start)
		)|
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
		| start = 1 + self.position; |
		self.position := self.readLimit;
		self.collection.copyFromTo(start, self.position)
	}

	validReadPosition { :self :anInteger |
		(anInteger >= 0) & {
			anInteger <= self.readLimit
		}
	}

}

+@SequenceableCollection {

	ReadStream { :self |
		newReadStream().initializeSlots(self, 0, self.size)
	}

}

+Void {

	ReadStream {
		ReadStream([])
	}

}
