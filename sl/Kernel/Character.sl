Character : [Object, Magnitude] { | string codePoint |

	= { :self :anObject |
		anObject.isCharacter & {
			self.string = anObject.string
		}
	}

	< { :self :anObject |
		anObject.isCharacter & {
			self.codePoint < anObject.codePoint
		}
	}

	asciiValue { :self |
		(self.codePoint > 127).if {
			self.error('asciiValue: not ascii')
		} {
			self.codePoint
		}
	}

	asInteger { :self |
		self.codePoint
	}

	asLowercase { :self |
		self.string.asLowercase.Character
	}

	asUppercase { :self |
		self.string.asUppercase.Character
	}

	asString { :self |
		self.string
	}

	Character { :self |
		self
	}

	digitValue { :self |
		|(
			integerValue = self.asInteger,
			digitValues = system.cache.atIfAbsentPut('digitValues') {
				| answer = Array(256, -1); |
				0.upToDo(9) { :i |
					answer[48 + i + 1] := i
				};
				10.upToDo(35) { :i |
					answer[55 + i + 1] := i;
					answer[87 + i + 1] := i
				};
				answer
			}
		)|
		digitValues[integerValue + 1]
	}

	isAscii { :self |
		self.codePoint < 128
	}

	printString { :self |
		'$' ++ self.string
	}

	sameAs { :self :aCharacter |
		(self == aCharacter).if {
			true
		} {
			self.asLowercase == aCharacter.asLowercase
		}
	}

	storeString { :self |
		'Character(' ++ self.codePoint ++ ')'
	}

}

+SmallFloat {

	Character { :self |
		<primitive: return _Character_2(String.fromCodePoint(_self), _self);>
	}

	digitValue { :self |
		self.betweenAnd(0, 35).if {
			Character(self + (self < 10).if { 48 } { 55 })
		} {
			self.error('digitValue')
		}
	}

}

+String {

	Character { :self |
		self.Character(self.codePoint)
	}


	Character { :self :codePoint |
		self.isSingleCharacter.if {
			system.cache.atIfAbsentPut('characterDictionary') {
				()
			}.atIfAbsentPut(self) {
				newCharacter().initializeSlots(self, codePoint)
			}
		} {
			self.error('Character: not character')
		}
	}

	Array { :self |
		self.characterArray
	}

}
