Character : [Object, Magnitude] { | string codePoint |

	= { :self :anObject |
		anObject.isCharacter & {
			self.string = anObject.string
		}
	}

	< { :self :anObject |
		self.codePoint < anObject.codePoint
	}

	~ { :self :anObject |
		self = anObject | {
			anObject.isString & {
				self.string = anObject
			}
		}
	}

	asciiValue { :self |
		(self.codePoint > 127).if {
			self.error('asciiValue: not ascii')
		} {
			self.codePoint
		}
	}

	asCharacter { :self |
		self
	}

	asCodePoint { :self |
		self.codePoint
	}

	asInteger { :self |
		self.codePoint
	}

	asLowerCase { :self |
		self.string.asLowerCase.asCharacter
	}

	asUpperCase { :self |
		self.string.asUpperCase.asCharacter
	}

	asString { :self |
		self.string
	}

	characterRange { :self :aCharacter |
		self.codePoint.characterRange(aCharacter.codePoint)
	}

	digitValue { :self |
		let integerValue = self.asInteger;
		let digitValues = system.cache.atIfAbsentPut('digitValues') {
			let answer = List(256, -1);
			0.upToDo(9) { :i |
				answer[48 + i + 1] := i
			};
			10.upToDo(35) { :i |
				answer[55 + i + 1] := i;
				answer[87 + i + 1] := i
			};
			answer
		};
		digitValues[integerValue + 1]
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
		self.string.isDigit
	}

	isFormFeed { :self |
		self.codePoint = 12
	}

	isLetter { :self |
		self.string.isLetter
	}

	isLineFeed { :self |
		self.codePoint = 10
	}

	isLowerCaseAscii { :self |
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

	isUpperCaseAscii { :self |
		self.codePoint.betweenAnd(65, 90)
	}

	isTab { :self |
		self.codePoint = 9
	}

	isVowel { :self |
		'AEIOU'.includesSubstring(self.asUpperCase.string)
	}

	printString { :self |
		'$' ++ self.string
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

	asCharacter { :self |
		Character(self, self.codePoint)
	}

	Character { :self :codePoint |
		self.isSingleCharacter.if {
			system.cache.atIfAbsentPut('characterDictionary') {
				()
			}.atIfAbsentPut(self) {
				newCharacter().initializeSlots(self, codePoint)
			}
		} {
			self.error('String>>Character: not character')
		}
	}

	asList { :self |
		self.characters
	}

}
