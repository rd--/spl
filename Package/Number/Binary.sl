/* Require: Cache */

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

	bitAtPut { :self :anInteger :value |
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
					self.error('@Binary>>bitAtPut: bit value should be 0 or 1')
				}
			}
		}
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
				let byte = n.bitAnd(16rFF) + 1;
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

	bitXor { :self :anInteger |
		self.typeResponsibility('@Binary>>bitXor')
	}

	bitShift { :self :anInteger |
		anInteger.isNegative.if {
			self >> anInteger.negate
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

	bitShiftRightUnsigned { :self :anInteger |
		self >>> anInteger
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
			self.negate.highBit
		} {
			self.highBitOfPositiveReceiver
		}
	}

	highBitOfPositiveReceiver { :self |
		let shifted = self;
		let bitNo = 0;
		{
			shifted < 65536
		}.whileFalse {
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
			let n = self;
			let result = 0;
			let lastByte = nil;
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

+@Cache {

	bitCountPerByteTable { :self |
		self.cached('bitCountPerByteTable') {
			0.toCollect(255) { :i |
				let bitCount = 0;
				let n = i;
				{
					n = 0
				}.whileFalse {
					bitCount := bitCount + 1;
					n := n.bitAnd(n - 1)
				};
				bitCount
			}.asByteArray
		}
	}

	highBitPerByteTable { :self |
		self.cached('highBitPerByteTable') {
			1.to(8).injectInto([0]) { :highBits :rank |
				highBits ++ highBits.collect { :each |
					rank
				}
			}.asByteArray
		}
	}

	lowBitPerByteTable { :self |
		self.cached('lowBitPerByteTable') {
			1.to(8).injectInto([1]) { :lowBits :unusedRank |
				let prefix = lowBits.copy;
				prefix[1] := lowBits[1] + 1;
				prefix ++ lowBits
			}.allButFirst.asByteArray
		}
	}

}
