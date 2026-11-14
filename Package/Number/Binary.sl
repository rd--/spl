/* Requires: List Float */

@Binary {

	bitAnd { :self :anInteger |
		self.typeResponsibility('@Binary>>bitAnd')
	}

	bitAt { :self :anInteger |
		self.bitShift(1 - anInteger).bitAnd(1)
	}

	bitCount { :self |
		(self < 0).if {
			self.error('@Binary>>bitCount: cannot count bits of negative integers')
		} {
			let n = self;
			let bitCount = 0;
			{
				n = 0
			}.whileFalse {
				let byte = n.bitAnd(16bFF) + 1;
				bitCount := bitCount + system.bitCountPerByteTable[byte];
				n := n.bitShift(-8)
			};
			bitCount
		}
	}

	bitCountOfByte { :self |
		system.bitCountPerByteTable[self + 1]
	}

	bitNot { :self |
		self.typeResponsibility('@Binary>>bitNot')
	}

	bitOr { :self :anInteger |
		self.typeResponsibility('@Binary>>bitOr')
	}

	bitPut { :self :anInteger :value |
		let b = self.bitAt(anInteger);
		(b = value).if {
			self
		} {
			(0 = value).if {
				self.bitAnd(1.bitShift(anInteger - 1).bitNot)
			} {
				(1 = value).if {
					self.bitOr(1.bitShift(anInteger - 1))
				} {
					self.error('@Binary>>bitPut: bit value should be 0 or 1')
				}
			}
		}
	}

	bitReverse { :self :anInteger |
		self.integerDigits(2, anInteger)
		.reverse
		.fromDigits(2)
	}

	bitRotateLeft { :self :shift :k |
		let one = self.one;
		let mask = (one << k) - one;
		((self << shift).bitOr(
			self >> (k - shift))
		).bitAnd(mask)
	}

	bitRotateRight { :self :shift :k |
		let one = self.one;
		let mask = (one << k) - one;
		((self >> shift).bitOr(
			self << (k - shift))
		).bitAnd(mask)
	}

	bitSet { :self :anInteger |
		self.bitOr(
			1.bitShift(anInteger)
		)
	}

	bitShift { :self :anInteger |
		anInteger.isNegative.if {
			self >> anInteger.negate
		} {
			self << anInteger
		}
	}

	[bitShiftLeft, <<] { :self :anInteger |
		self.typeResponsibility('@Binary>>bitShiftLeft')
	}

	[bitShiftRight, >>] { :self :anInteger |
		self.typeResponsibility('@Binary>>bitShiftRight')
	}

	[bitShiftRightUnsigned, >>>] { :self :anInteger |
		self.typeResponsibility('@Binary>>bitShiftRightUnsigned')
		/*
		Float(self).bitShiftRightUnsigned(
			anInteger
		)
		*/
	}

	bitXor { :self :anInteger |
		self.typeResponsibility('@Binary>>bitXor')
	}

	highBit { :self |
		(self < 0).if {
			self.error('@Binary>>highBit is not defined for negative integers')
		} {
			self.promoteBinary.highBitOfPositiveInteger
		}
	}

	highBitOfByte { :self |
		system.highBitPerByteTable[self + 1L]
	}

	highBitOfInteger { :self |
		(self < 0L).if {
			self.negate.highBit
		} {
			self.highBitOfPositiveInteger
		}
	}

	highBitOfPositiveInteger { :self |
		let shifted = self;
		let bitNo = 0L;
		{
			shifted < 65536L /* 2 ^ 16 */
		}.whileFalse {
			shifted := shifted.bitShiftRight(16L);
			bitNo := bitNo + 16L
		};
		(shifted < 256L).ifFalse {
			shifted := shifted.bitShiftRight(8L);
			bitNo := bitNo + 8L
		};
		bitNo + shifted.highBitOfByte
	}

	isBinary { :self |
		true
	}

	lowBit { :self |
		(self = 0).if {
			0
		} {
			let n = self;
			let result = 0;
			let lastByte = nil;
			{
				lastByte := n.bitAnd(16bFF);
				n = 0
			}.whileTrue {
				result := result + 8;
				n := n.bitShift(-8)
			};
			result + system.lowBitPerByteTable[lastByte]
		}
	}

}

+@Cache {

	bitCountPerByteTable { :self |
		self.cached('bitCountPerByteTable') {
			0L.toCollect(255L) { :i |
				let bitCount = 0L;
				let n = i;
				{
					n = 0L
				}.whileFalse {
					bitCount := bitCount + 1L;
					n := n.bitAnd(n - 1L)
				};
				bitCount
			}
		}
	}

	highBitPerByteTable { :self |
		self.cached('highBitPerByteTable') {
			1L.to(8L).injectInto([0L]) { :highBits :rank |
				highBits ++ highBits.collect { :each |
					rank
				}
			}
		}
	}

	lowBitPerByteTable { :self |
		self.cached('lowBitPerByteTable') {
			1L.to(8L).injectInto([1L]) { :lowBits :unusedRank |
				let prefix = lowBits.copy;
				prefix[1L] := lowBits[1L] + 1L;
				prefix ++ lowBits
			}.allButFirst
		}
	}

}

+List {

	xorShift32 { :self |
		let [a, b, c] = self;
		{ :n |
			n := n.bitXor(n.bitShiftLeft(a));
			n := n.bitXor(n.bitShiftRightUnsigned(b));
			n := n.bitXor(n.bitShiftLeft(c));
			n
		}
	}

}

+Float {

	xorShift32 { :n :shape |
		let k = shape.product;
		[13, 17, 5].xorShift32.nestList(n, k).reshape(shape)
	}

}

+@Binary {

	isPowerOfTwo { :self |
		self != 0L & {
			self.promoteBinary.bitAnd(self - 1L) = 0L
		}
	}

	nextPowerOfTwo { :self |
		self.isPowerOfTwo.if {
			self
		} {
			self.isNonNegative.if {
				self.one.bitShiftLeft(self.highBitOfPositiveInteger)
			} {
				self.error('@Binary>>nextPowerOfTwo: non-positive')
			}
		}
	}

	previousPowerOfTwo { :self |
		self.isPowerOfTwo.if {
			self
		} {
			self.isNonNegative.if {
				self.one.bitShiftLeft(
					self.highBitOfPositiveInteger - 1
				)
			} {
				self.error('@Binary>>previousPowerOfTwo: non-positive')
			}
		}
	}

}

+@Binary {

	encodeFloat32 { :self :littleEndian |
		<primitive:
		return sc.encodeFloat32(sl.toFloat(_self), _littleEndian);
		>
	}

	encodeFloat64 { :self :littleEndian |
		<primitive:
		return sc.encodeFloat64(sl.toFloat(_self), _littleEndian);
		>
	}

	encodeInt16 { :self :littleEndian |
		<primitive:
		return sc.encodeInt16(sl.toFloat(_self), _littleEndian);
		>
	}

	encodeInt32 { :self :littleEndian |
		<primitive:
		return sc.encodeInt32(sl.toFloat(_self), _littleEndian);
		>
	}

	encodeInt8 { :self |
		<primitive:
		return sc.encodeInt8(sl.toFloat(_self));
		>
	}

}
