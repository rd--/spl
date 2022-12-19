WriteStream { | collection position writeLimit |

	contents { :self |
		self.collection.copyFromTo(1, self.position)
	}

	growTo { :self :anInteger |
		|
			oldSize = self.collection.size,
			newSize = anInteger + oldSize.quotient(4).max(20),
			grownCollection = self.collection.class.new(newSize);
		|
		self.collection := grownCollection.replaceFromToWithStartingAt(1, oldSize, collection, 1);
		self.writeLimit := self.collection.size
	}

	nextPut { :self :anObject |
		if(self.position >= self.writeLimit) {
			self.pastEndPut(anObject)
		} {
			self.position := self.position + 1;
			self.collection[self.position] := anObject
		}
	}

	nextPutAll { :self :aCollection |
		if(self.collection.class == aCollection.class) {
			| newEnd = self.position + aCollection.size; |
			(newEnd > self.writeLimit).ifTrue { self.growTo(newEnd) };
			self.collection.replaceFromToWithStartingAt(self.position + 1, newEnd, aCollection, 1);
			self.position := newEnd;
		} {
			1.toDo(aCollection.size) { :index |
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

	reset { :self |
		self.position := 0
	}

	size { :self |
		self.position
	}

	utf8Contents { :self |
		self.contents.utf8
	}

}

+ @ArrayedCollection {

	WriteStream { :self |
		WriteStream(self, 0, self.size)
	}

}

+ Number {

	WriteStream { :self |
		WriteStream(Array(self))
	}

	Utf8WriteStream { :self |
		WriteStream(ByteArray(self))
	}

}

+ String {

	encodeOn { :self :aStream |
		aStream.nextPutAll(self.utf8)
	}

	printOn { :self :aStream |
		self.storeOn(aStream)
	}

	storeOn { :self :aStream |
		aStream.nextPutAll(self.printString.utf8)
	}

}

+ Void {

	WriteStream {
		WriteStream(Array(100))
	}

	Utf8WriteStream {
		WriteStream(ByteArray(100))
	}

}
