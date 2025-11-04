/* Requires: ByteArray */

BitSet : [Object, Copyable, Equatable, Iterable, Collection, Extensible, Removable] { | capacity bytes tally |

	= { :self :anObject |
		anObject.isBitSet & {
			anObject.size = self.tally & {
				anObject.bytes = self.bytes
			}
		}
	}

	add { :self :anInteger |
		self.assert {
			anInteger.isInteger & {
				self.includes(anInteger).not
			}
		};
		self.setBitAt(anInteger);
		anInteger
	}

	asList { :self |
		self.positionVector
	}

	asString { :self |
		let ascii = ByteArray(self.capacity);
		self.bitsWithIndexDo { :each :index |
			ascii[index + 1] := 48 + each
		};
		ascii.asciiString
	}

	at { :self :anInteger |
		self.bitAt(anInteger)
	}

	atPut { :self :anInteger :aBit |
		self.bitAtPut(anInteger, aBit)
	}

	bitAt { :self :anInteger |
		let byteIndex = anInteger.bitShift(-3) + 1;
		let bitIndex = 0 - anInteger.bitAnd(7);
		self.bytes[byteIndex].bitShift(bitIndex).bitAnd(1)
	}

	bitAtPut { :self :anInteger :aBit |
		aBit.caseOf(
			[
				0 -> { self.clearBitAt(anInteger) },
				1 -> { self.setBitAt(anInteger) }
			]
		);
		aBit
	}

	bitCount { :self |
		let answer = 0;
		self.bitsDo { :each |
			answer := answer + each
		};
		answer
	}

	bitNot { :self |
		self.bitsWithIndexDo { :each :index |
			self[index] := 1 - each
		}
	}

	bitsDo { :self :aBlock:/1 |
		self.indices.do { :index |
			aBlock(self.bitAt(index))
		}
	}

	bitsWithIndexDo { :self :aBlock:/2 |
		self.indices.do { :index |
			aBlock(self.bitAt(index), index)
		}
	}

	bitVector { :self |
		self.contents(bitsDo:/2)
	}

	boxNotation { :self :zeroOne |
		let [zeroCode, oneCode] = zeroOne.collect(codePoint:/1);
		let unicode = List(self.capacity, zeroCode);
		self.bitsWithIndexDo { :each :index |
			(each = 1).ifTrue {
				unicode[index + 1] := oneCode
			}
		};
		unicode.utf16String
	}

	boxNotation { :self |
		self.boxNotation(['◻' '◼'])
	}

	clearBitAt { :self :anInteger |
		let byteIndex = anInteger.bitShift(-3) + 1;
		let value = self.bytes[byteIndex];
		let mask = 1.bitShift(anInteger.bitAnd(7));
		let newValue = value.bitOr(mask) - mask;
		(newValue = value).if {
			false
		} {
			self.bytes[byteIndex] := newValue;
			self.tally := self.tally - 1;
			true
		}
	}

	complement { :self |
		let answer = self.copy;
		answer.bitNot;
		answer
	}

	include { :self :anInteger |
		self.setBitAt(anInteger);
		anInteger
	}

	includes { :self :anInteger |
		self.includesIndex(anInteger).if {
			self.bitAt(anInteger) = 1
		} {
			false
		}
	}

	includesIndex { :self :anInteger |
		anInteger.isInteger & {
			0 <= anInteger & {
				anInteger < self.capacity
			}
		}
	}

	indices { :self |
		0.to(self.capacity - 1)
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

	positionsDo { :self :aBlock:/1 |
		let remainingBits = self.tally;
		let lowBits = system.lowBitPerByteTable;
		1.toDo(self.bytes.size) { :index |
			(1 <= remainingBits).if {
				let byte = self.bytes[index];
				(byte = 0).ifFalse {
					let byteOffset = index.bitShift(3) - 9;
					{
						aBlock(lowBits[byte] + byteOffset);
						remainingBits := remainingBits - 1;
						byte := byte.bitAnd(byte - 1);
						byte = 0
					}.whileFalse
				}
			} {
				self
			}
		}
	}

	positionVector { :self |
		self.contents(positionsDo:/2)
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
			self.tally := self.tally + 1;
			true
		}
	}

	size { :self |
		self.tally
	}

	storeString { :self |
		'BitSet(%, %)'.format(
			[
				self.positionVector.storeString,
				self.capacity
			]
		)
	}

}

+@Integer {

	BitSet { :capacity |
		let byteCount = capacity.min(capacity // 8 + 1);
		newBitSet().initializeSlots(
			capacity,
			ByteArray(byteCount),
			0
		)
	}

}

+@Collection {

	asBitSet { :self :capacity |
		BitSet(self, capacity)
	}

	BitSet { :self |
		self.isBitVector.if {
			let answer = BitSet(self.size);
			self.withIndexDo { :each :index |
				each.isOne.ifTrue {
					answer.add(index - 1)
				}
			};
			answer
		} {
			self.error('BitSet: not bit vector')
		}
	}

	BitSet { :self :capacity |
		let answer = BitSet(capacity);
		answer.addAll(self);
		answer
	}

}

+@Sequenceable {

	asBitSet { :self |
		BitSet(self)
	}

}

+String {

	asBitSet { :self |
		self.parseBitSet
	}

	BitSet { :self |
		self.parseBitSet
	}

	parseBitSet { :self |
		self.isBitVector.if {
			BitSet(self.codePoints - 48)
		} {
			self.error('String>>parseBitSet: not bit vector')
		}
	}

}

+ByteArray {

	asBitSet { :self :capacity |
		(self.size * 8 != capacity).if {
			self.error('ByteArray>>asBitSet: incorrect capacity')
		} {
			newBitSet().initializeSlots(
				capacity,
				self,
				self.bitCount
			)
		}
	}

	asBitSet { :self |
		self.asBitSet(self.size * 8)
	}

}
