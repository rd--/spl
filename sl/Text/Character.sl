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

	characterRange { :self :aCharacter |
		self.codePoint.characterRange(aCharacter.codePoint)
	}

	digitValue { :self |
		let integerValue = self.asCodePoint;
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

	isAlphaNumeric { :self |
		self.isDigit | {
			self.isLetter
		}
	}

	isAscii { :self |
		self.codePoint < 128
	}

	isBlank { :self |
		self.isSpace | {
			self.isTab
		}
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

	morseCode { :self |
		system.morseCodeTable[self.characterString]
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

	isSameAs { :self :aCharacter |
		(self == aCharacter).if {
			true
		} {
			self.asLowerCase == aCharacter.asLowerCase
		}
	}

	printString { :self |
		self.characterString.printString
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

+@Cache {

	morseCodeTable { :self |
		self.cached('morseCodeTable') {
			(
				a: '.-', i: '..', r: '.-.',
				b: '-...', j: '.---', s: '...',
				c: '-.-.', k: '-.-', t: '-',
				d: '-..', l: '.-..', u: '..-',
				e: '.', m: '--', v: '...-',
				é: '..-..', n: '-.', w: '.--',
				f: '..-.', o: '---', x: '-..-',
				g: '--.', p: '.--.', y: '-.--',
				h: '....', q: '--.-', z: '--..',
				'1': '.----', '6': '-....',
				'2': '..---', '7': '--...',
				'3': '...--', '8': '---..',
				'4': '....-', '9': '----.',
				'5': '.....', '0': '-----'
			)
		}
	}

}
