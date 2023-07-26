@Stream { (* collection, atEnd contents next nextPut *)

	any { :self :numberOfElements |
		self.next(numberOfElements)
	}

	atEnd { :self |
		self.subclassResponsibility('Stream>>atEnd')
	}

	contents { :self |
		self.subclassResponsibility('Stream>>contents')
	}

	do { :self :aBlock:/1 |
		{
			self.atEnd
		}.whileFalse {
			aBlock(self.next)
		}
	}

	isBinary { :self |
		self.collection.isByteArray
	}

	isStream { :self |
		true
	}

	next { :self |
		self.subclassResponsibility('Stream>>next')
	}

	nextInto { :self :aCollection |
		self.nextIntoStartingAt(aCollection.size, aCollection, 1)
	}

	nextIntoStartingAt { :self :n :aCollection :startIndex |
		| count = self.readIntoStartingAtCount(aCollection, startIndex, n); |
		(count = n).if {
			aCollection
		} {
			aCollection.copyFromTo(1, startIndex + count - 1)
		}
	}

	nextMatchFor { :self :anObject |
		anObject = self.next
	}

	nextPut { :self :anObject |
		self.subclassResponsibility('Stream>>nextPut')
	}

	nextPutAll { :self :aCollection |
		aCollection.do { :each |
			self.nextPut(each)
		};
		aCollection
	}

	nextSatisfy { :self :aBlock:/1 |
		withReturn {
			self.do { :each |
				aBlock(each).ifTrue {
					each.return
				}
			};
			'Stream>>nextSatisfy: no satisfactory element'.error
		}
	}

	readIntoStartingAtCount { :self :aCollection :startIndex :n |
		withReturn {
			0.upTo(n - 1).do { :i |
				| obj |
				obj := self.next.ifNil {
					i.return
				};
				aCollection[startIndex + i] := obj
			};
			n
		}
	}

	take { :self :maxNumberOfElements |
		| answer = []; |
		withReturn {
			maxNumberOfElements.timesRepeat {
				self.atEnd.ifTrue {
					answer.return
				};
				answer.addLast(self.next)
			};
			answer
		}
	}

	upToEnd { :self |
		| answer = []; |
		{
			self.atEnd
		}.whileFalse {
			elements.addLast(self.next)
		};
		answer
	}

}

+@Object {

	isStream { :self |
		false
	}

	putOn { :self :aStream |
		aStream.nextPut(self)
	}

}

+@SequenceableCollection {

	putOn { :self :aStream |
		aStream.nextPutAll(self)
	}

}

@PositionableStream {

	back { :self |
		(self.position = 0).ifTrue {
			'PositionableStream>>back: cannot go back'.error
		};
		self.skip(-1);
		self.peek
	}

	isEmpty { :self |
		self.atEnd & {
			self.position = 0
		}
	}

	last { :self |
		self.collection.at(self.position)
	}

	nextMatchAll { :self :aCollection |
		withReturn {
			| savedPosition = self.position; |
			aCollection.do { :each |
				(self.next = each).ifFalse {
					self.position := savedPosition;
					false.return
				}
			};
			true
		}
	}

	on { :self :aCollection |
		self.collection := aCollection;
		self.position := 0;
		self.isReadStream.if {
			self.readLimit := aCollection.size
		};
		self.reset
	}

	originalContents { :self |
		self.collection
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

	peekFor { :self :anObject |
		withReturn {
			self.atEnd.ifTrue {
				false.return
			};
			(self.next = anObject).ifTrue {
				true.return
			};
			self.position := self.position - 1;
			false
		}
	}

	position { :self |
		self.positionIndex
	}

	position { :self :anInteger |
		anInteger.negative.if {
			self.positionError
		} {
			self.positionIndex := anInteger
		}
	}

	positionError { :self |
		'PositionableStream>>positionError: position out of bounds'.error
	}

	reset { :self |
		self.position := 0
	}

	skip { :self :anInteger |
		self.position := self.position + anInteger
	}

	skipTo { :self :anObject |
		withReturn {
			{
				self.atEnd
			}.whileFalse {
				(self.next = anObject).ifTrue {
					true.return
				}
			};
			false
		}
	}

	upTo { :self :anObject |
		self.withWriteStream { :aStream |
			| element |
			{
				self.atEnd | {
					element := self.next;
					element = anObject
				}
			}.whileFalse {
				aStream.nextPut(element)
			}
		}
	}

	upToEnd { :self |
		self.withWriteStream { :aStream |
			{
				self.atEnd
			}.whileFalse {
				aStream.nextPut(self.next)
			}
		}
	}

	upToPosition { :self :anInteger |
		self.next(anInteger - self.position)
	}

	withWriteStream { :self :aProcedure:/1 |
		| aStream = WriteStream(self.collection.species.new(100)); |
		aProcedure(aStream);
		aStream.contents
	}

}

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
			self.position := self.position + 1;
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

WriteStream : [Object, Stream, PositionableStream] { | collection positionIndex writeLimit |

	contents { :self |
		self.collection.copyFromTo(1, self.position)
	}

	growTo { :self :anInteger |
		|(
			oldSize = self.collection.size,
			newSize = anInteger + oldSize.quotient(4).max(20),
			newCollection = self.collection.species.new(newSize)
		)|
		self.collection := newCollection.replaceFromToWithStartingAt(1, oldSize, collection, 1);
		self.writeLimit := self.collection.size
	}

	nextPut { :self :anObject |
		(self.position >= self.writeLimit).if {
			self.pastEndPut(anObject)
		} {
			self.position := self.position + 1;
			self.collection[self.position] := anObject
		}
	}

	nextPutAll { :self :aCollection |
		(self.collection.typeOf = aCollection.typeOf).if {
			| newEnd = self.position + aCollection.size; |
			(newEnd > self.writeLimit).ifTrue {
				self.growTo(newEnd)
			};
			self.collection.replaceFromToWithStartingAt(self.position + 1, newEnd, aCollection, 1);
			self.position := newEnd
		} {
			1.upToDo(aCollection.size) { :index |
				self.nextPut(aCollection[index])
			}
		};
		aCollection
	}

	pastEndPut { :self :anObject |
		self.collection := self.collection.grownBy(self.collection.size.max(20).min(1000000));
		self.writeLimit := self.collection.size;
		self.position := self.position + 1;
		self.collection[self.position] := anObject;
		anObject
	}

	position { :self :anInteger |
		anInteger.negative.if {
			self.positionError
		} {
			self.positionIndex := anInteger
		}
	}

	reset { :self |
		self.position := 0
	}

	size { :self |
		self.position
	}

	utf8Contents { :self |
		self.contents.utf8String
	}

}

+@ArrayedCollection {

	WriteStream { :self |
		newWriteStream().initializeSlots(self, 0, self.size)
	}

}

+@Object {

	printOn { :self :aStream |
		self.printString.encodeOn(aStream)
	}

	storeOn { :self :aStream |
		self.storeString.encodeOn(aStream)
	}

}

+Procedure {

	asciiStringStreamContents { :self:/1 |
		| stream = AsciiWriteStream(); |
		self(stream);
		stream.contents.asciiString
	}

	utf8StringStreamContents { :self:/1 |
		| stream = Utf8WriteStream(); |
		self(stream);
		stream.contents.utf8String
	}

}

+SmallFloat {

	WriteStream { :self |
		WriteStream(Array(self))
	}

	Utf8WriteStream { :self |
		WriteStream(ByteArray(self))
	}

}

+String {

	encodeOn { :self :aStream |
		aStream.isBinary.if {
			aStream.nextPutAll(self.utf8ByteArray)
		} {
			'String>>encodeOn: not binary stream'.error
		}
	}

}

+Void {

	AsciiWriteStream {
		WriteStream(ByteArray(100))
	}

	WriteStream {
		WriteStream(Array(100))
	}

	Utf8WriteStream {
		WriteStream(ByteArray(100))
	}

}
