@PositionableStream {

	back { :self |
		(self.position = 0).ifTrue { 'CantGoBack'.error };
		self.skip(-1);
		self.peek
	}

	isBinary { :self |
		self.collection.typeOf = 'ByteArray'
	}

	isEmpty { :self |
		self.atEnd & { self.position = 0 }
	}

	last { :self |
		self.collection.at(self.position)
	}

	peek { :self |
		self.atEnd.if {
			nil
		} {
			| nextObject = self.next; |
			self.position := self.position - 1;
			nextObject
		}
	}

	reset { :self |
		self.position := 0
	}

	skip { :self :anInteger |
		self.position := self.position + anInteger
	}

	skipTo { :self :anObject |
		withReturn {
			{ self.atEnd }.whileFalse {
				(self.next = anObject).ifTrue { return(true) }
			};
			false
		}
	}

	upTo { :self :anObject |
		self.withWriteStream { :aStream |
			| element |
			{ self.atEnd | { element := self.next; element = anObject } }.whileFalse {
				aStream.nextPut(element)
			}
		}
	}

	upToEnd { :self |
		self.withWriteStream { :aStream |
			{ self.atEnd }.whileFalse { aStream.nextPut(self.next) }
		}
	}

	upToPosition { :self :anInteger |
		self.next(anInteger - self.position)
	}

	withWriteStream { :self :aBlock:/1 |
		| aStream = WriteStream(self.collection.species.new(100)); |
		aBlock(aStream);
		aStream.contents
	}

}
