AsciiString : [Object, Store, Equal, Iterable, Indexable, Collection, Sequence] {

	| byteArray |

	AsciiString { :self |
		self
	}

	asHexString { :self |
		self.byteArray.base16Encode.AsciiString
	}

	atIfAbsent { :self :anInteger :ifAbsent/0 |
		self.byteArray.atIfAbsent(anInteger, ifAbsent/0).asCharacter
	}

	[ByteArray, asciiStringToByteArray] { :self |
		self.byteArray.copy
	}

	codePoints { :self |
		self.byteArray.List
	}

	do { :self :aBlock/1 |
		self.byteArray.do { :each |
			aBlock(each.asCharacter)
		}
	}

	indices { :self |
		1.to(self.byteArray.size)
	}

	[List, asciiStringToList] { :self |
		let answer = List(self.size);
		self.withIndexDo { :each :index |
			answer[index] := each.asCharacter
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
		AsciiString/1
	}

	storeString { :self |
		'AsciiString(%)'.format([self.byteArray.asciiString.storeString])
	}

}

+ByteArray {

	[uncheckedAsciiString, uncheckedByteArrayToAsciiString] { :self |
		newAsciiString().initializeSlots(self)
	}

}

+@Integer {

	AsciiString { :self |
		ByteArray(self).uncheckedAsciiString
	}

}

+String {

	AsciiString { :self |
		self.asciiByteArray.uncheckedAsciiString
	}

}
