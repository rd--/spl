AsciiString : [Object, Store, Equal, Iterable, Indexable, Collection, Sequence] { | contents |

	AsciiString { :self |
		self
	}

	[asciiStringToList, asList] { :self |
		let answer = List(self.size);
		self.withIndexDo { :each :index |
			answer[index] := each.asCharacter
		};
		answer
	}

	asHexString { :self |
		self.contents.base16Encode.AsciiString
	}

	atIfAbsent { :self :anInteger :ifAbsent/0 |
		self.contents.atIfAbsent(anInteger, ifAbsent/0).asCharacter
	}

	[ByteArray, asciiStringToByteArray] { :self |
		self.contents.copy
	}

	codePoints { :self |
		self.contents.asList
	}

	do { :self :aBlock/1 |
		self.contents.do { :each |
			aBlock(each.asCharacter)
		}
	}

	indices { :self |
		1.to(self.contents.size)
	}

	put! { :self :anInteger :aCharacter |
		self.contents.put!(anInteger, aCharacter.codePoint)
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		AsciiString/1
	}

	storeString { :self |
		'AsciiString(%)'.format([self.contents.asciiString.storeString])
	}

}

+ByteArray {

	uncheckedAsciiString { :self |
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
