@Character {

	= { :self :anObject |
		anObject.isCharacter & {
			self.characterString = anObject.characterString
		}
	}

	< { :self :anObject |
		self.codePoint < anObject.codePoint
	}

	asciiValue { :self |
		(self.codePoint > 127).if {
			self.error('asciiValue: not ascii')
		} {
			self.codePoint
		}
	}

	asCodePoint { :self |
		self.codePoint
	}

	asInteger { :self |
		self.codePoint
	}

	characterRange { :self :aCharacter |
		self.codePoint.characterRange(aCharacter.codePoint)
	}

	isAlphaNumeric { :self |
		self.isDigit | {
			self.isLetter
		}
	}

	isAscii { :self |
		self.codePoint < 128
	}

	isCarriageReturn { :self |
		self.codePoint = 13
	}

	isDigit { :self |
		self.codePoint.betweenAnd(48, 57)
	}

	isFormFeed { :self |
		self.codePoint = 12
	}

	isLetter { :self |
		self.isLowerCase | {
			self.isUpperCase
		}
	}

	isLineFeed { :self |
		self.codePoint = 10
	}

	isLowerCase { :self |
		self.codePoint.betweenAnd(97, 122)
	}

	isSeparator { :self |
		[1 9 10 12 13 32].includes(self.codePoint)
	}

	isSpace { :self |
		self.codePoint = 32
	}

	isStartOfHeading { :self |
		self.codePoint = 1
	}

	isUpperCase { :self |
		self.codePoint.betweenAnd(65, 90)
	}

	isTab { :self |
		self.codePoint = 9
	}

	isVowel { :self |
		[65 69 73 79 85].includes(self.asUpperCase.codePoint)
	}

}

Character : [Object, Magnitude, Character] { | characterString codePoint |

	asCharacter { :self |
		self
	}

	asLowerCase { :self |
		self.isUpperCase.if {
			(self.codePoint + 32).asCharacter
		} {
			self
		}
	}

	asUpperCase { :self |
		self.isLowerCase.if {
			(self.codePoint - 32).asCharacter
		} {
			self
		}
	}

	asString { :self |
		self.characterString
	}

	digitValue { :self |
		let integerValue = self.asInteger;
		let digitValues = system.cache.atIfAbsentPut('digitValues') {
			let answer = List(256, -1);
			0.toDo(9) { :i |
				answer[48 + i + 1] := i
			};
			10.toDo(35) { :i |
				answer[55 + i + 1] := i;
				answer[87 + i + 1] := i
			};
			answer
		};
		digitValues[integerValue + 1]
	}

	printString { :self |
		self.characterString.printString
	}

	sameAs { :self :aCharacter |
		(self == aCharacter).if {
			true
		} {
			self.asLowerCase == aCharacter.asLowerCase
		}
	}

	storeString { :self |
		self.codePoint.asString ++ '.asCharacter'
	}

	zero { :self |
		' '.asCharacter
	}

}

+SmallFloat {

	asCharacter { :self |
		<primitive: return _Character_2(String.fromCodePoint(_self), _self);>
	}

	digitValue { :self |
		self.betweenAnd(0, 35).if {
			(
				self + (self < 10).if {
					48
				} {
					55
				}
			).asCharacter
		} {
			self.error('digitValue')
		}
	}

}

+String {

}
