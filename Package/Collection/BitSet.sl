/* Requires: ByteArray */

BitSet : [Object, Copy, Store, Equal, Do, Collection, Add, Remove] {

	| bytes capacity tally |

	[List, bitSetToList] { :self |
		self.positionVector
	}

	String { :self |
		let ascii = ByteArray(self.capacity, 0L);
		self.bitsWithIndexDo { :each :index |
			ascii[index + 1L] := 48L + each
		};
		ascii.asciiString
	}

	add! { :self :anInteger |
		self.assert {
			anInteger.isIntegerValuedNumber & {
				self.includes(anInteger).not
			}
		};
		self.setBitAt(anInteger);
		anInteger
	}

	[bitAt, at] { :self :anInteger |
		let byteIndex = anInteger.bitShift(-3L) + 1L;
		let bitIndex = 0L - anInteger.bitAnd(7L);
		self.bytes[byteIndex].bitShift(bitIndex).bitAnd(1L)
	}

	bitCount { :self |
		let answer = 0L;
		self.bitsDo { :each |
			answer := answer + each
		};
		answer
	}

	bitNot { :self |
		self.bitsWithIndexDo { :each :index |
			self[index] := 1L - each
		}
	}

	[bitPut!, put!] { :self :anInteger :aBit |
		aBit.caseOf(
			[
				0L -> { self.clearBitAt(anInteger) },
				1L -> { self.setBitAt(anInteger) }
			]
		);
		aBit
	}

	bitVector { :self |
		self.items(bitsDo/2)
	}

	bitsDo { :self :aBlock/1 |
		self.indices.do { :index |
			aBlock(self.bitAt(index))
		}
	}

	bitsWithIndexDo { :self :aBlock/2 |
		self.indices.do { :index |
			aBlock(self.bitAt(index), index)
		}
	}

	boxNotation { :self :zeroOne |
		let [zeroCode, oneCode] = zeroOne.collect(codePoint/1);
		let unicode = List(self.capacity, zeroCode);
		self.bitsWithIndexDo { :each :index |
			(each = 1L).ifTrue {
				unicode[index + 1L] := oneCode
			}
		};
		unicode.utf16String
	}

	boxNotation { :self |
		self.boxNotation(['◻' '◼'])
	}

	clearBitAt { :self :anInteger |
		let byteIndex = anInteger.bitShift(-3L) + 1L;
		let value = self.bytes[byteIndex];
		let mask = 1L.bitShift(anInteger.bitAnd(7L));
		let newValue = value.bitOr(mask) - mask;
		(newValue = value).if {
			false
		} {
			self.bytes[byteIndex] := newValue;
			self.tally := self.tally - 1L;
			true
		}
	}

	complement { :self |
		let answer = self.copy;
		answer.bitNot;
		answer
	}

	include! { :self :anInteger |
		self.setBitAt(anInteger);
		anInteger
	}

	includes { :self :anInteger |
		self.includesIndex(anInteger).if {
			self.bitAt(anInteger) = 1L
		} {
			false
		}
	}

	includesIndex { :self :anInteger |
		anInteger.isIntegerValuedNumber & {
			0L <= anInteger & {
				anInteger < self.capacity
			}
		}
	}

	indices { :self |
		0L.to(self.capacity - 1L)
	}

	isEmpty { :self |
		self.tally = 0L
	}

	[isEqual, =] { :self :anObject |
		anObject.isBitSet & {
			anObject.size = self.tally & {
				anObject.bytes = self.bytes
			}
		}
	}

	occurrencesOf { :self :anObject |
		self.includes(anObject).boole
	}

	positionVector { :self |
		self.items(positionsDo/2)
	}

	positionsDo { :self :aBlock/1 |
		let remainingBits = self.tally;
		let lowBits = system.lowBitPerByteTable;
		1L.toDo(self.bytes.size) { :index |
			(1L <= remainingBits).if {
				let byte = self.bytes[index];
				(byte = 0L).ifFalse {
					let byteOffset = index.bitShift(3L) - 9L;
					{
						aBlock(lowBits[byte] + byteOffset);
						remainingBits := remainingBits - 1L;
						byte := byte.bitAnd(byte - 1L);
						byte = 0L
					}.whileFalse
				}
			} {
				self
			}
		}
	}

	postCopy { :self |
		self.bytes := self.bytes.copy
	}

	removeAll! { :self |
		(tally > 0L).if {
			self.bytes.atAllPut!(0L);
			self.tally := 0L
		};
		nil
	}

	removeIfAbsent! { :self :anInteger :absentBlock/0 |
		self.clearBitAt(anInteger).if {
			anInteger
		} {
			absentBlock()
		}
	}

	setBitAt { :self :anInteger |
		let index = anInteger.bitShift(-3L) + 1L;
		let value = self.bytes[index];
		let newValue = 1L.bitShift(anInteger.bitAnd(7L)).bitOr(value);
		(newValue = value).if {
			false
		} {
			self.bytes[index] := newValue;
			self.tally := self.tally + 1L;
			true
		}
	}

	size { :self |
		self.tally
	}

	storeString { :self |
		'BitSet(%, %)'.format(
			[
				self.positionVector.concisePrintString,
				self.capacity
			]
		)
	}

}

+@Integer {

	BitSet { :capacity |
		let byteCount = capacity.min(capacity // 8L + 1L);
		newBitSet().initializeSlots(
			ByteArray(byteCount, 0L),
                        capacity,
			0L
		)
	}

}

+@Collection {

	BitSet { :self |
		self.isBitVector.if {
			let answer = BitSet(self.size);
			self.withIndexDo { :each :index |
				each.isOne.ifTrue {
					answer.add!(index - 1L)
				}
			};
			answer
		} {
			self.error('BitSet: not bit vector')
		}
	}

	BitSet { :self :capacity |
		let answer = BitSet(capacity);
		answer.addAll!(self);
		answer
	}

}

+String {

	BitSet { :self |
		self.parseBitSet
	}

	parseBitSet { :self |
		self.isBitVector.if {
			BitSet(self.codePoints - 48L)
		} {
			self.error('String>>parseBitSet: not bit vector')
		}
	}

}

+ByteArray {

	BitSet { :self :capacity |
		(self.size * 8L != capacity).if {
			self.error('ByteArray>>BitSet: incorrect capacity')
		} {
			newBitSet().initializeSlots(
				self,
				capacity,
				self.bitCount
			)
		}
	}

	BitSet { :self |
		BitSet(self, self.size * 8L)
	}

}
