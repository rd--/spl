@Character {

	asciiValue { :self |
		let c = self.codePoint;
		(c > 127L).if {
			self.error('asciiValue: not ascii')
		} {
			c
		}
	}

	characterRange { :self :aCharacter |
		self.codePoint.characterRange(
			aCharacter.codePoint
		)
	}

	digitValue { :self |
		let integerValue = self.codePoint;
		system.digitValueTable[integerValue + 1L]
	}

	isAlphaNumeric { :self |
		self.isDigit | {
			self.isLetter
		}
	}

	isApostrophe { :self |
		self.codePoint = 39L
	}

	isAscii { :self |
		self.codePoint < 128L
	}

	isBlank { :self |
		self.isSpace | {
			self.isTab
		}
	}

	isCarriageReturn { :self |
		self.codePoint = 13L
	}

	isDigit { :self |
		self.codePoint.isBetween(48L, 57L)
	}

	isFormFeed { :self |
		self.codePoint = 12L
	}

	isGraveAccent { :self |
		self.codePoint = 96L
	}

	isLetter { :self |
		self.isLowerCase | {
			self.isUpperCase
		}
	}

	isLineFeed { :self |
		self.codePoint = 10L
	}

	isLowerCase { :self |
		self.codePoint.isBetween(97L, 122L)
	}

	isPrintableAscii { :self |
		self.codePoint.isBetween(32L, 126L)
	}

	isPunctuation { :self |
		self.characterString.isPunctuation
	}

	isQuotationMark { :self |
		self.codePoint = 34L
	}

	isReverseSolidus { :self |
		self.codePoint = 92L
	}

	isSeparator { :self |
		[1 9 10 12 13 32].includes(self.codePoint)
	}

	isSpace { :self |
		self.codePoint = 32L
	}

	isStartOfHeading { :self |
		self.codePoint = 1L
	}

	isTab { :self |
		self.codePoint = 9L
	}

	isUpperCase { :self |
		self.codePoint.isBetween(65L, 90L)
	}

	isVowel { :self |
		[65 69 73 79 85].includes(
			self.toUpperCase.codePoint
		)
	}

	morseCode { :self |
		system.morseCodeTable[self.characterString]
	}

}

Character : [Object, Copy, Store, Equal, Compare, Character] {

	| characterString codePoint |

	Character { :self |
		self
	}

	[isEqual, =] { :self :anObject |
		isIdentical(self, anObject)
	}

	[isLess, <] { :self :anObject |
		isLessOn(self, anObject, codePoint/1)
	}

	isSameAs { :self :aCharacter |
		(self == aCharacter).if {
			true
		} {
			self.toLowerCase == aCharacter.toLowerCase
		}
	}

	[isSimilar, ~] { :self :anObject |
		anObject.isCharacter & {
			self.characterString = anObject.characterString
		}
	}

	shallowCopy { :self |
		self
	}

	toLowerCase { :self |
		self.isUpperCase.if {
			Character(self.codePoint + 32L)
		} {
			self
		}
	}

	toUpperCase { :self |
		self.isLowerCase.if {
			Character(self.codePoint - 32L)
		} {
			self
		}
	}

	zero { :self |
		Character' '
	}

}

+@Integer {

	Character { :self |
		Character(
			self.fromCodePoint,
			Integer(self)
		)
	}

	digitCharacter { :self |
		self.isBetween(0L, 35L).if {
			(
				self + (self < 10L).if {
					48L
				} {
					55L
				}
			).fromCodePoint
		} {
			self.error('digitCharacter')
		}
	}

}

+String {

	Character { :self :codePoint |
		self.isCharacter.if {
			system.characterDictionary.atIfAbsentPut!(self) {
				newCharacter().initializeSlots(
					self,
					Integer(codePoint)
				)
			}
		} {
			self.error('String>>Character: not character?')
		}
	}

	Character { :self |
		Character(
			self,
			self.codePoint
		)
	}

}

+@Cache {

	characterDictionary { :self |
		self.cached('characterDictionary') {
			Record()
		}
	}

	digitValueTable { :self |
		self.cache.atIfAbsentPut!('digitValueTable') {
			let answer = List(256L, -1L);
			0L.toDo(9L) { :i |
				answer[48L + i + 1L] := i
			};
			10L.toDo(35L) { :i |
				answer[55L + i + 1L] := i;
				answer[87L + i + 1L] := i
			};
			answer
		}
	}

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

+List {

	equalIgnoringExtraWhitespace { :a :b :f/1 |
		let p = a.size;
		let q = b.size;
		let i = 1L;
		let j = 1L;
		let mismatch = false;
		let isAtEnd = false;
		{
			isAtEnd
		}.whileFalse {
			(
				a[i] = b[j] | {
					f(a[i]) & { f(b[j]) }
				}
			).if {
				i := i + 1L;
				j := j + 1L
			} {
				f(b[j]).if {
					j := j + 1L
				} {
					isAtEnd := true;
					mismatch := true
				}
			};
			(i > p | { j > q }).ifTrue {
				isAtEnd := true
			}
		};
		mismatch.not & { i >= p & { j >= q } }
	}

}
