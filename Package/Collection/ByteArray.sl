ByteArray! : [Object, New, Copy, Store, Equal, Compare, Do, At, Indices, Put, Collect, Collection, Sequence, PrimitiveArray] {

	[String, utf8String] { :self |
		<primitive: return new TextDecoder('utf-8').decode(_self).normalize('NFC');>
	}

	asciiString { :self |
		<primitive: return new TextDecoder('ascii').decode(_self);>
	}

	base16Encode { :self |
		let map = '0123456789ABCDEF'.asciiByteArray;
		let array = ByteArray(self.size * 2, 0);
		let index = 1;
		self.do { :each |
			array[index] := map[each.bitShiftRight(4) + 1];
			array[index + 1] := map[each.bitAnd(15) + 1];
			index := index + 2
		};
		array.asciiString
	}

	base64Encode { :self |
		<primitive:
		const binaryString = Array.from(_self, function(x) {
			return String.fromCodePoint(x)
		}).join('');
		return btoa(binaryString);
		>
	}

	bitCount { :self |
		let answer = 0;
		self.do { :each |
			answer := answer + each.bitCount
		};
		answer
	}

	crc16 { :self |
		let table = [
			16b0000 16bC0C1 16bC181 16b0140 16bC301 16b03C0 16b0280 16bC241
			16bC601 16b06C0 16b0780 16bC741 16b0500 16bC5C1 16bC481 16b0440
			16bCC01 16b0CC0 16b0D80 16bCD41 16b0F00 16bCFC1 16bCE81 16b0E40
			16b0A00 16bCAC1 16bCB81 16b0B40 16bC901 16b09C0 16b0880 16bC841
			16bD801 16b18C0 16b1980 16bD941 16b1B00 16bDBC1 16bDA81 16b1A40
			16b1E00 16bDEC1 16bDF81 16b1F40 16bDD01 16b1DC0 16b1C80 16bDC41
			16b1400 16bD4C1 16bD581 16b1540 16bD701 16b17C0 16b1680 16bD641
			16bD201 16b12C0 16b1380 16bD341 16b1100 16bD1C1 16bD081 16b1040
			16bF001 16b30C0 16b3180 16bF141 16b3300 16bF3C1 16bF281 16b3240
			16b3600 16bF6C1 16bF781 16b3740 16bF501 16b35C0 16b3480 16bF441
			16b3C00 16bFCC1 16bFD81 16b3D40 16bFF01 16b3FC0 16b3E80 16bFE41
			16bFA01 16b3AC0 16b3B80 16bFB41 16b3900 16bF9C1 16bF881 16b3840
			16b2800 16bE8C1 16bE981 16b2940 16bEB01 16b2BC0 16b2A80 16bEA41
			16bEE01 16b2EC0 16b2F80 16bEF41 16b2D00 16bEDC1 16bEC81 16b2C40
			16bE401 16b24C0 16b2580 16bE541 16b2700 16bE7C1 16bE681 16b2640
			16b2200 16bE2C1 16bE381 16b2340 16bE101 16b21C0 16b2080 16bE041
			16bA001 16b60C0 16b6180 16bA141 16b6300 16bA3C1 16bA281 16b6240
			16b6600 16bA6C1 16bA781 16b6740 16bA501 16b65C0 16b6480 16bA441
			16b6C00 16bACC1 16bAD81 16b6D40 16bAF01 16b6FC0 16b6E80 16bAE41
			16bAA01 16b6AC0 16b6B80 16bAB41 16b6900 16bA9C1 16bA881 16b6840
			16b7800 16bB8C1 16bB981 16b7940 16bBB01 16b7BC0 16b7A80 16bBA41
			16bBE01 16b7EC0 16b7F80 16bBF41 16b7D00 16bBDC1 16bBC81 16b7C40
			16bB401 16b74C0 16b7580 16bB541 16b7700 16bB7C1 16bB681 16b7640
			16b7200 16bB2C1 16bB381 16b7340 16bB101 16b71C0 16b7080 16bB041
			16b5000 16b90C1 16b9181 16b5140 16b9301 16b53C0 16b5280 16b9241
			16b9601 16b56C0 16b5780 16b9741 16b5500 16b95C1 16b9481 16b5440
			16b9C01 16b5CC0 16b5D80 16b9D41 16b5F00 16b9FC1 16b9E81 16b5E40
			16b5A00 16b9AC1 16b9B81 16b5B40 16b9901 16b59C0 16b5880 16b9841
			16b8801 16b48C0 16b4980 16b8941 16b4B00 16b8BC1 16b8A81 16b4A40
			16b4E00 16b8EC1 16b8F81 16b4F40 16b8D01 16b4DC0 16b4C80 16b8C41
			16b4400 16b84C1 16b8581 16b4540 16b8701 16b47C0 16b4680 16b8641
			16b8201 16b42C0 16b4380 16b8341 16b4100 16b81C1 16b8081 16b4040
		];
		let crc = 0;
		self.indicesDo { :index |
			let octet = self[index];
			let tableIndex = crc.bitXor(octet).bitAnd(16bFF) + 1;
			crc := crc.bitShiftRight(8).bitXor(table[tableIndex])
		};
		crc
	}

	fnv1aHash { :self |
		let fnvPrime = 16777619L; /* 16b01000193 */
		let fnvOffsetBasis = 2166136261L; /* 16b811C9DC5 */
		let hash = fnvOffsetBasis;
		self.do { :each |
			hash := hash.bitXor(each) * fnvPrime;
			hash := 4294967295L.bitAnd(hash) /* 16bFFFFFFFF */
		};
		hash.normalInteger
	}

	put! { :self :anInteger :aByte |
		<primitive:
		if(Number.isInteger(_anInteger) && sl.isByte(_aByte)) {
			_self[_anInteger - 1] = _aByte;
			return _aByte;
		}>
		self.error('put!: index not an integer or value not a byte')
	}

	shallowCopy { :self |
		<primitive: return new Uint8Array(_self);>
	}

	species { :self |
		zeroByteArray/1
	}

	storageType { :self |
		'Byte'
	}

	utf16String { :self |
		<primitive: return new TextDecoder('utf-16').decode(_self).normalize('NFC');>
	}

}

+List {

	asciiString { :self |
		ByteArray(self).asciiString
	}

	utf16String { :self |
		<primitive: return String.fromCodePoint(..._self);>
	}

	utf8String { :self |
		ByteArray(self).utf8String
	}

}

+SmallFloat {

	[ByteArray, constantByteArray] { :n :x |
		x.isByte.ifFalse {
			n.error('ByteArray', [x])
		};
		uncheckedByteArray(n, x)
	}

	uncheckedByteArray { :self :aByte |
		<primitive: return new Uint8Array(_self).fill(_aByte);>
	}

	zeroByteArray { :n |
		ByteArray(n, 0)
	}

}

+List {

	[ByteArray, listToByteArray] { :self |
		self.isEmpty.if {
			ByteArray(0, 0)
		} {
			(
				self.isSmallFloatVector & {
					self.allSatisfy(isByte/1)
				}
			).if {
				self.uncheckedByteArray
			} {
				self.error('List>>ByteArray: invalid')
			}
		}
	}

	uncheckedByteArray { :self |
		<primitive: return new Uint8Array(_self);>
	}

}

+@ArithmeticProgression {

	[ByteArray, arithmeticProgressionToByteArray] { :self |
		ByteArray(self.List)
	}

}

+String {

	[base16Decode, parseBase16] { :self |
		self.base16DecodeInto(
			ByteArray(self.size / 2, 0)
		)
	}

	base16DecodeInto { :self :where |
		<primitive:
		for(let i = 0; i < _self.length; i++) {
			_where[i] = parseInt(_self.substr(i * 2, 2), 16);
		};
		return _where;
		>
	}

	[base64Decode, parseBase64] { :self |
		<primitive:
		const binaryString = atob(_self);
		return Uint8Array.from(binaryString, function(m) {
			return m.codePointAt(0)
		});
		>
	}

	crc16 { :self |
		self.utf8ByteArray.crc16
	}

}
