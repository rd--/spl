@PositionableStream {

	back! { :self |
		(self.position = 0).ifTrue {
			self.error('@PositionableStream>>back!: cannot go back')
		};
		self.skip!(-1);
		self.peek
	}

	isAtEnd { :self |
		self.typeResponsibility('@PositionableStream>>isAtEnd')
	}

	isEmpty { :self |
		self.isAtEnd & {
			self.position = 0
		}
	}

	last { :self |
		self.collection.at(self.position)
	}

	nextMatchAll { :self :aCollection |
		withReturn { :return/1 |
			let savedPosition = self.position;
			aCollection.do { :each |
				(self.next = each).ifFalse {
					self.position!(savedPosition);
					false.return
				}
			};
			true
		}
	}

	peek { :self |
		self.isAtEnd.if {
			nil
		} {
			let nextObject = self.next;
			self.position!(self.position - 1);
			nextObject
		}
	}

	peekFor { :self :anObject |
		withReturn { :return/1 |
			self.isAtEnd.ifTrue {
				false.return
			};
			(self.next = anObject).ifTrue {
				true.return
			};
			self.position!(self.position - 1);
			false
		}
	}

	position { :self |
		self.positionIndex
	}

	position! { :self :anInteger |
		anInteger.isNegative.if {
			self.positionError
		} {
			self.positionIndex := anInteger
		}
	}

	positionError { :self |
		self.error('@PositionableStream>>positionError: position out of bounds')
	}

	reset! { :self |
		self.position!(0)
	}

	skip! { :self :anInteger |
		self.position!(self.position + anInteger)
	}

	skipTo! { :self :anObject |
		withReturn { :return/1 |
			{
				self.isAtEnd
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
			let element = nil;
			{
				self.isAtEnd | {
					element := self.next;
					element = anObject
				}
			}.whileFalse {
				aStream.add!(element)
			}
		}
	}

	upToEnd { :self |
		self.withWriteStream { :aStream |
			{
				self.isAtEnd
			}.whileFalse {
				aStream.add!(self.next)
			}
		}
	}

	upToPosition { :self :anInteger |
		self.next(anInteger - self.position)
	}

	withWriteStream { :self :aBlock/1 |
		let aStream = WriteStream(self.collection.new(100));
		aBlock(aStream);
		aStream.contents
	}

}
