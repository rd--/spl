/* Requires: PositionableStream Stream WriteStream */

MutableCollectionStream : [Object, Do, Collect, Iterator, Stream, PositionableStream] {

	| collection positionIndex writeLimit |

	add! { :self :anObject |
		(self.position >= self.writeLimit).if {
			self.pastEndAdd!(anObject)
		} {
			self.position!(self.position + 1);
			self.collection[self.position] := anObject
		}
	}

	addAll! { :self :aCollection |
		(self.collection.typeOf = aCollection.typeOf).if {
			let newEnd = self.position + aCollection.size;
			(newEnd > self.writeLimit).ifTrue {
				self.growTo!(newEnd)
			};
			self.collection.replaceFromToWithStartingAt(self.position + 1, newEnd, aCollection, 1);
			self.position!(newEnd)
		} {
			1.toDo(aCollection.size) { :index |
				self.add!(aCollection[index])
			}
		};
		aCollection
	}

	addEncoded! { :self :aString |
		self.isBinary.if {
			self.addAll!(aString.utf8ByteArray)
		} {
			self.error('addEncoded!: not binary stream', [aString])
		}
	}

	contents { :self |
		self.collection.copyFromTo(1, self.position)
	}

	isAtEnd { :self |
		self.position >= self.writeLimit
	}

	isBinary { :self |
		self.collection.isByteArray
	}

	growTo! { :self :anInteger |
		let oldSize = self.collection.size;
		let newSize = anInteger + oldSize.quotient(4).max(20);
		let newCollection = self.collection.new(newSize);
		self.collection := newCollection.replaceFromToWithStartingAt(1, oldSize, self.collection, 1);
		self.writeLimit := self.collection.size
	}

	pastEndAdd! { :self :anObject |
		self.collection := self.collection.growBy(self.collection.size.max(20).min(1000000));
		self.writeLimit := self.collection.size;
		self.position!(self.position + 1);
		self.collection[self.position] := anObject;
		anObject
	}

	position! { :self :anInteger |
		anInteger.isNegative.if {
			self.positionError
		} {
			self.positionIndex := anInteger
		}
	}

	reset! { :self |
		self.position!(0)
	}

	size { :self |
		self.position
	}

}

+@PrimitiveArray {

	WriteStream { :self |
		newMutableCollectionStream().initializeSlots(self, 0, self.size)
	}

}
