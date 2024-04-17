Ascii : [Object, Iterable, Indexable, Collection, Sequence] { | contents |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	asByteArray { :self |
		self.contents.copy
	}

	asHex { :self |
		self.contents.hex.asAscii
	}

	asList { :self |
		let answer = List(self.size);
		self.withIndexDo { :each :index |
			answer[index] := each.asCharacter
		};
		answer
	}

	at { :self :anInteger |
		self.contents.at(anInteger).asCharacter
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
		(1 .. self.contents.size)
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		Ascii:/1
	}

	storeString { :self |
		self.contents.asciiString.storeString ++ '.asAscii'
	}

}

+@Integer {

	Ascii { :self |
		newAscii().initializeSlots(ByteArray(self))
	}

}

+String {

	asAscii { :self |
		newAscii().initializeSlots(self.asciiByteArray)
	}

}

