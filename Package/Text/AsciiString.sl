AsciiString : [Object, Equatable, Iterable, Indexable, Collection, Sequenceable] { | contents |

	asByteArray { :self |
		self.contents.copy
	}

	asHexString { :self |
		self.contents.base16Encode.asAsciiString
	}

	asList { :self |
		let answer = List(self.size);
		self.withIndexDo { :each :index |
			answer[index] := each.asCharacter
		};
		answer
	}

	atIfAbsent { :self :anInteger :ifAbsent:/0 |
		self.contents.atIfAbsent(anInteger, ifAbsent:/0).asCharacter
	}

	atPut { :self :anInteger :aCharacter |
		self.contents.atPut(anInteger, aCharacter.codePoint)
	}

	do { :self :aBlock:/1 |
		self.contents.do { :each |
			aBlock(each.asCharacter)
		}
	}

	indices { :self |
		1.to(self.contents.size)
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		AsciiString:/1
	}

	storeString { :self |
		self.contents.asciiString.storeString ++ '.asAsciiString'
	}

}

+@Integer {

	AsciiString { :self |
		newAsciiString().initializeSlots(ByteArray(self))
	}

}

+String {

	asAsciiString { :self |
		newAsciiString().initializeSlots(self.asciiByteArray)
	}

}
