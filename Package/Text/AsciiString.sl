AsciiString : [Object, New, Store, Copy, Equal, Do, At, Indices, Put, Collection, Sequence] {

	| byteArray | <ByteArray>

	[AsciiString, copyAsciiString] { :self |
		self.copy
	}

	[ByteArray, asciiStringToByteArray] { :self |
		self.byteArray.copy
	}

	[List, asciiStringToList] { :self |
		let answer = List(self.size, nil);
		self.withIndexDo { :each :index |
			answer[index] := each.Character
		};
		answer
	}

	atIfAbsent { :self :anInteger :ifAbsent/0 |
		self.byteArray.atIfAbsent(anInteger, ifAbsent/0).Character
	}

	codePoints { :self |
		self.byteArray.List
	}

	do { :self :aFunction/1 |
		self.byteArray.do { :each |
			aFunction(each.Character)
		}
	}

	hexString { :self |
		AsciiString(
			self.byteArray.base16Encode
		)
	}

	postCopy { :self |
		self.byteArray := self.byteArray.copy
	}

	put! { :self :anInteger :aCharacter |
		self.byteArray.put!(anInteger, aCharacter.codePoint)
	}

	size { :self |
		self.byteArray.size
	}

	species { :unused |
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

+[Float, Integer] {

	zeroAsciiString { :self |
		uncheckedAsciiString(
			ByteArray(self, 0)
		)
	}

}

+String {

	[AsciiString, stringToAsciiString] { :self |
		uncheckedAsciiString(
			self.asciiByteArray
		)
	}

}
