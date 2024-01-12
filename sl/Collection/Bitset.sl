Bitset : [Object, Iterable, Collection, Extensible, Removable] { | bytes tally |

	= { :self :anObject |
		anObject.isBitset & {
			anObject.size = self.tally & {
				anObject.bytes = self.bytes
			}
		}
	}

	add { :self :anInteger |
		self.setBitAt(anInteger);
		anInteger
	}


	at { :self :anInteger |
		self.bitAt(anInteger)
	}

	atPut { :self :anInteger :aBit |
		self.bitAtPut(anInteger, aBit)
	}

	bitAt { :self :anInteger |
		self.bytes[anInteger.bitShift(-3) + 1].bitShift(0 - anInteger.bitAnd(7)).bitAnd(1)
	}

	bitAtPut { :self :anInteger :aBit |
		aBit.caseOf([
			{ 0 } -> { self.clearBitAt(anInteger) },
			{ 1 } -> { self.setBitAt(anInteger) }
		]);
		aBit
	}

	capacity { :self |
		self.bytes.size * 8
	}

	clearBitAt { :self :anInteger |
		let index = anInteger.bitShift(-3) + 1;
		let value = self.bytes[index];
		let mask = 1.bitShift(anInteger.bitAnd(7));
		let newValue = value.bitOr(mask) - mask;
		(newValue = value).if {
			false
		} {
			self.bytes[index] := newValue;
			self.tally -:= 1;
			true
		}
	}

	do { :self :aBlock:/1 |
		let remainingBits = self.tally;
		let lowBits = system.lowBitPerByteTable;
		1.upToDo(self.bytes.size) { :index |
			(1 <= remainingBits).if {
				let byte = self.bytes[index];
				(byte = 0).ifFalse {
					let byteOffset = index.bitShift(3) - 9;
					{
						aBlock(lowBits[byte] + byteOffset);
						remainingBits -:= 1;
						byte := byte.bitAnd(byte - 1);
						byte = 0
					}.whileFalse
				}
			} {
				self
			}
		}
	}

	includes { :self :anInteger |
		anInteger.isInteger & {
			-1 < anInteger & {
				anInteger < self.capacity & {
					self.bitAt(anInteger) = 1
				}
			}
		}
	}

	isEmpty { :self |
		self.tally = 0
	}

	occurrencesOf { :self :anObject |
		self.includes(anObject).if {
			1
		} {
			0
		}
	}

	postCopy { :self |
		self.bytes := self.bytes.copy
	}

	removeIfAbsent { :self :anInteger :absentBlock:/0 |
		self.clearBitAt(anInteger).if {
			anInteger
		} {
			absentBlock()
		}
	}

	removeAll { :self |
		(tally > 0).if {
			self.bytes.atAllPut(0);
			self.tally := 0
		};
		self
	}

	setBitAt { :self :anInteger |
		let index = anInteger.bitShift(-3) + 1;
		let value = self.bytes[index];
		let newValue = 1.bitShift(anInteger.bitAnd(7)).bitOr(value);
		(newValue = value).if {
			false
		} {
			self.bytes[index] := newValue;
			self.tally +:= 1;
			true
		}
	}

	size { :self |
		self.tally
	}

}

+SmallFloat {

	Bitset { :capacity |
		newBitset().initializeSlots(
			ByteArray(capacity // 8),
			0
		)
	}

}

+@Collection {

	asBitset { :self |
		let answer = Bitset(self.max.roundUpTo(8));
		answer.addAll(self);
		answer
	}

}
