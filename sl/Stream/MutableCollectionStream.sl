{- Requires: PositionableStream Stream WriteStream -}

MutableCollectionStream : [Object, Iterator, Stream, PositionableStream, WriteStream] { | collection positionIndex writeLimit |

	contents { :self |
		self.collection.copyFromTo(1, self.position)
	}

	isBinary { :self |
		self.collection.isByteArray
	}

	growTo { :self :anInteger |
		let oldSize = self.collection.size;
		let newSize = anInteger + oldSize.quotient(4).max(20);
		let newCollection = self.collection.species.new(newSize);
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
			let newEnd = self.position + aCollection.size;
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

}

+@Arrayed {

	asWriteStream { :self |
		newMutableCollectionStream().initializeSlots(self, 0, self.size)
	}

}
