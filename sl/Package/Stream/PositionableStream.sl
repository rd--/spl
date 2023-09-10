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
		valueWithReturn { :return:/1 |
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
			self.position -:= 1;
			nextObject
		}
	}

	peekFor { :self :anObject |
		valueWithReturn { :return:/1 |
			self.atEnd.ifTrue {
				false.return
			};
			(self.next = anObject).ifTrue {
				true.return
			};
			self.position -:= 1;
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
		self.position +:= anInteger
	}

	skipTo { :self :anObject |
		valueWithReturn { :return:/1 |
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
