@Binary {

	<< { :self :anInteger |
		self.typeResponsibility('@Binary>>shiftLeft')
	}

	>> { :self :anInteger |
		self.typeResponsibility('@Binary>>shiftRight')
	}

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
			| n = self, bitCount = 0; |
			{ n = 0 }.whileFalse {
				bitCount := bitCount + system.bitCountPerByteTable[n.bitAnd(16rFF) + 1];
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

	bitXor { :self :anInteger |
		self.typeResponsibility('@Binary>>bitXor')
	}

	bitShift { :self :anInteger |
		anInteger.negative.if {
			self >> anInteger.negated
		} {
			self << anInteger
		}
	}

	bitShiftLeft { :self :anInteger |
		self << anInteger
	}

	bitShiftRight { :self :anInteger |
		self >> anInteger
	}

	highBit { :self |
		(self < 0).if {
			self.error('@Binary>>highBit is not defined for negative integers')
		} {
			self.highBitOfPositiveReceiver
		}
	}

	highBitOfByte { :self |
		system.highBitPerByteTable[self + 1]
	}

	highBitOfMagnitude { :self |
		(self < 0).if {
			self.negated.highBit
		} {
			self.highBitOfPositiveReceiver
		}
	}

	highBitOfPositiveReceiver { :self |
		| shifted = self, bitNo = 0; |
		{ shifted < 65536 }.whileFalse {
			shifted := shifted.bitShiftRight(16);
			bitNo := bitNo + 16
		};
		(shifted < 256).ifFalse {
			shifted := shifted.bitShiftRight(8);
			bitNo := bitNo + 8
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
			| n = self, result = 0,	lastByte = nil; |
			{
				lastByte := n.bitAnd(16rFF);
				n = 0
			}.whileTrue {
				result := result + 8;
				n := n.bitShift(-8)
			};
			result + system.lowBitPerByteTable[lastByte]
		}
	}

}

+@Integral {

	asLargerPowerOfTwo { :self |
		self.isPowerOfTwo.if {
			self
		} {
			self.positive.if {
				1.bitShiftLeft(self.highBitOfPositiveReceiver)
			} {
				self.error('@Integral>>asLargerPowerOfTwo: non-positive')
			}
		}
	}

	asPowerOfTwo { :self |
		self.asSmallerPowerOfTwo
	}

	asSmallerPowerOfTwo { :self |
		self.isPowerOfTwo.if {
			self
		} {
			self.positive.if {
				1.bitShiftLeft(self.highBitOfPositiveReceiver - 1)
			} {
				self.error('@Integral>>asSmallerPowerOfTwo: non-positive')
			}
		}
	}

	isPowerOfTwo { :self |
		(self ~= 0) & {
			self.bitAnd(self - 1) = 0
		}
	}

}

+@Integral {

	digitAt { :self :n |
		(n = 1).if {
			(self < 0).if {
				-256 - self.bitAnd(255)
			} {
				self.bitAnd(255)
			}
		} {
			(self < 0).if {
				(-256 - self.bitShift(-8) + 1).digitAt(n - 1)
			} {
				self.bitShift(8 - n.bitShift(3)).bitAnd(255)
			}
		}
	}

	digitLength { :self |
		| value = self, length = 1; |
		(value < -255).ifTrue {
			length := 2;
			value := (-256 - self.bitShift(-8)) + 1
		};
		{ value > 255 }.whileTrue {
			value := value.bitShift(-8);
			length := length + 1
		};
		length
	}

}

+@SystemCache {

	bitCountPerByteTable { :self |
		{
			(0 .. 255).collect { :i |
				| bitCount = 0, n = i; |
				{ n = 0 }.whileFalse {
					bitCount := bitCount + 1;
					n := n.bitAnd(n - 1)
				};
				bitCount
			}.ByteArray
		}.once(self, 'bitCountPerByteTable')
	}

	highBitPerByteTable { :self |
		{
			(1 .. 8).injectInto([0]) { :highBits :rank |
				highBits ++ highBits.collect { :each |
					rank
				}
			}.ByteArray
		}.once(self, 'highBitPerByteTable')
	}

	lowBitPerByteTable { :self |
		{
			(1 .. 8).injectInto([1]) { :lowBits :unusedRank |
				| prefix = lowBits.copy; |
				prefix[1] := lowBits[1] + 1;
				prefix ++ lowBits
			}.allButFirst.ByteArray
		}.once(self, 'lowBitPerByteTable')
	}

}
