(* Require: Cache *)

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
			let n = self, bitCount = 0;
			{ n = 0 }.whileFalse {
				bitCount +:= system.bitCountPerByteTable[n.bitAnd(16rFF) + 1];
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
		let shifted = self, bitNo = 0;
		{ shifted < 65536 }.whileFalse {
			shifted := shifted.bitShiftRight(16);
			bitNo +:= 16
		};
		(shifted < 256).ifFalse {
			shifted := shifted.bitShiftRight(8);
			bitNo +:= 8
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
			let n = self, result = 0,	lastByte = nil;
			{
				lastByte := n.bitAnd(16rFF);
				n = 0
			}.whileTrue {
				result +:= 8;
				n := n.bitShift(-8)
			};
			result + system.lowBitPerByteTable[lastByte]
		}
	}

}

+@Cache {

	bitCountPerByteTable { :self |
		self.cached('bitCountPerByteTable') {
			(0 .. 255).collect { :i |
				let bitCount = 0, n = i;
				{ n = 0 }.whileFalse {
					bitCount +:= 1;
					n := n.bitAnd(n - 1)
				};
				bitCount
			}.asByteArray
		}
	}

	highBitPerByteTable { :self |
		self.cached('highBitPerByteTable') {
			(1 .. 8).injectInto([0]) { :highBits :rank |
				highBits ++ highBits.collect { :each |
					rank
				}
			}.asByteArray
		}
	}

	lowBitPerByteTable { :self |
		self.cached('lowBitPerByteTable') {
			(1 .. 8).injectInto([1]) { :lowBits :unusedRank |
				let prefix = lowBits.copy;
				prefix[1] := lowBits[1] + 1;
				prefix ++ lowBits
			}.allButFirst.asByteArray
		}
	}

}
