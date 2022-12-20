ReadStream : [PositionableStream] { | collection position readLimit |

	atEnd { :self |
		self.position >= self.readLimit
	}

	contents { :self |
		self.collection.copyFromTo(1, self.readLimit)
	}

	next { :self |
		if(self.position >= self.readLimit) {
			nil
		} {
			self.position := self.position + 1;
			self.collection[self.position]
		}
	}

	next { :self :anInteger |
		|
			endPosition = (self.position + anInteger).min(self.readLimit),
			answer = self.collection.copyFromTo(self.position + 1, endPosition);
		|
		self.position := endPosition;
		answer
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
		| start = self.position + 1, end = self.collection.indexOfStartingAt(anObject, start); |
		if(end = 0 | { end > self.readLimit }) {
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

}

+ @SequenceableCollection {

	ReadStream { :self |
		newReadStream(self, 0, self.size)
	}

}

+ Void {

	ReadStream {
		ReadStream([])
	}

}
