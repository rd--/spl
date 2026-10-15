AsciiString : [Object, Store, Equal, Do, At, Put, New, Collect, FiniteCollection, Sequence] {

	| byteArray |

	AsciiString { :self |
		self
	}

	atIfAbsent { :self :anInteger :ifAbsent/0 |
		self.byteArray.atIfAbsent(anInteger, ifAbsent/0).Character
	}

	[ByteArray, asciiStringToByteArray] { :self |
		self.byteArray.copy
	}

	codePoints { :self |
		self.byteArray.List
	}

	do { :self :aBlock/1 |
		self.byteArray.do { :each |
			aBlock(each.Character)
		}
	}

	hexString { :self |
		AsciiString(
			self.byteArray.base16Encode
		)
	}

	indices { :self |
		1.to(self.byteArray.size)
	}

	[List, asciiStringToList] { :self |
		let answer = List(self.size, nil);
		self.withIndexDo { :each :index |
			answer[index] := each.Character
		};
		answer
	}

	put! { :self :anInteger :aCharacter |
		self.byteArray.put!(anInteger, aCharacter.codePoint)
	}

	size { :self |
		self.byteArray.size
	}

	species { :self |
		zeroAsciiString/1
	}

	storeString { :self |
		'AsciiString(%)'.format(
			[
				self.byteArray.asciiString.storeString
			]
		)
	}

}

+ByteArray {

	[uncheckedAsciiString, uncheckedByteArrayToAsciiString] { :self |
		newAsciiString().initializeSlots(self)
	}

}

+@Integer {

	zeroAsciiString { :self |
		ByteArray(self, 0).uncheckedAsciiString
	}

}

+String {

	AsciiString { :self |
		self.asciiByteArray.uncheckedAsciiString
	}

}
