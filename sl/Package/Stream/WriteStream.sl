(* Requires: PositionableStream Stream *)

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
			self.position +:= 1;
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
		self.position +:= 1;
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

+@Arrayed {

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
