{- Requires: Array -}

String! : [Object, Json, Iterable] {

	= { :self :anObject |
		self == anObject
	}

	< { :self :anObject |
		<primitive: return _self < _anObject;>
	}

	<= { :self :anObject |
		<primitive: return _self <= _anObject;>
	}

	> { :self :anObject |
		<primitive: return _anObject < _self;>
	}

	>= { :self :anObject |
		<primitive: return _anObject <= _self;>
	}

	++ { :self :anObject |
		self.appendString(anObject.asString)
	}

	appendString { :self :aString |
		<primitive: return _self + _aString;>
	}

	asAscii { :self |
		self.characterArray.select(isAscii:/1).joinCharacters
	}

	asBracketedComment { :self :open :close |
		self.includesSubstring(open).or {
			self.includesSubstring(close)
		}.if {
			self.error('asBracketedComment: includes comment brackets')
		} {
			[open, ' ', self, ' ', close].join
		}
	}

	asciiByteArray { :self |
		let answer = self.utf8ByteArray;
		answer.allSatisfy(isAsciiCodePoint:/1).if {
			answer
		} {
			self.error('asciiByteArray: non-ascii character')
		}
	}

	asciiValue { :self |
		(self.size = 1).if {
			self.asciiByteArray.first
		} {
			self.error('asciiValue: not single character')
		}
	}

	asHex { :self |
		self.asciiByteArray.hex
	}

	asHsComment { :self |
		self.asBracketedComment('{-', '-}')
	}

	asLowercase { :self |
		<primitive: return _self.toLowerCase(); >
	}

	asMlComment { :self |
		self.asBracketedComment('(*', '*)')
	}

	assertIsString { :self |
		self
	}

	asString { :self |
		self
	}

	asUppercase { :self |
		<primitive: return _self.toUpperCase(); >
	}

	at { :self :index |
		{- Note: index is in Utf-16 code units, not characters -}
		let codePoint = self.codePointAt(index);
		codePoint.ifNil {
			self.error('at: invalid index')
		} {
			codePoint.isUtf16SurrogateCode.if {
				self.error('at: code point is lone surrogate')
			} {
				codePoint.asCharacter
			}
		}
	}

	basicAt { :self :index |
		self.codePointAt(index).asCharacter
	}

	basicReplaceString { :self :stringToFind :stringToReplaceWith |
		<primitive: return _self.replace(_stringToFind, _stringToReplaceWith);>
	}

	basicReplaceStringAll { :self :stringToFind :stringToReplaceWith |
		<primitive: return _self.replaceAll(_stringToFind, _stringToReplaceWith);>
	}

	beginsWith { :self :aString |
		<primitive:
		if(typeof _aString == 'string') {
			return _self.startsWith(_aString);
		}
		>
		self.error('beginsWith: non string operand')
	}

	capitalized { :self |
		<primitive: return _self[0].toUpperCase() + _self.slice(1);>
	}

	characterArray { :self |
		self.collectInto(identity:/1, [])
	}

	codePoint { :self |
		self.isSingleCharacter.if {
			self.codePointAt(1)
		} {
			self.error('codePoint: not single character string')
		}
	}

	codePointAt { :self :index |
		<primitive: return _self.codePointAt(_index - 1);>
	}

	codePointArray { :self |
		self.collectInto(codePoint:/1, [])
	}

	collectInto { :self :aBlock:/1 :aCollection |
		self.primitiveCollectInto({ :each |
			aBlock(each.asCharacter)
		}, [])
	}

	contractTo { :self :smallSize |
		(self.size <= smallSize).if {
			self
		} {
			(smallSize < 5).if {
				self.copyFromTo(1, smallSize)
			} {
				let leftSize = smallSize - 2 // 2;
				self.copyReplaceFromToWith(
					leftSize + 1,
					self.size - (smallSize - leftSize - 3),
					'...'
				)
			}
		}
	}

	copyFromTo { :self :start :end |
		<primitive: return _self.substring(_start - 1, _end);>
	}

	copyReplaceFromToWith { :self :start :stop :replacement |
		[
			self.copyFromTo(1, start - 1),
			replacement,
			self.copyFromTo(stop + 1, self.size)
		].join
	}

	countCharacters { :self |
		let answer = 0;
		self.do { :each |
			answer := answer + 1
		};
		answer
	}

	countUtf16CodeUnits { :self |
		<primitive: return _self.length;>
	}

	do { :self :aBlock:/1 |
		self.primitiveDo { :each |
			aBlock(each.asCharacter)
		}
	}

	endsWith { :self :aString |
		<primitive:
		if(typeof _aString == 'string') {
			return _self.endsWith(_aString);
		}
		>
		self.error('endsWith: non string operand')
	}

	findLastOccurrenceOfStringStartingAt { :self :subString :start |
		let last = self.findStringStartingAt(subString, start);
		(last = 0).if {
			0
		} {
			| answer |
			{
				last > 0
			}.whileTrue {
				answer := last;
				last := self.findStringStartingAt(subString, last + 1)
			};
			answer
		}
	}

	findPreviousOccurrenceOfStringStartingAt { :self :subString :start |
		<primitive: return _self.lastIndexOf(_subString, _start - 1) + 1;>
	}

	findStringStartingAt { :self :aString :aNumber |
		<primitive: return _self.indexOf(_aString, _aNumber - 1) + 1;>
	}

	findString { :self :aString |
		<primitive: return _self.indexOf(_aString) + 1;>
	}

	first { :self |
		self[1]
	}

	firstBracketedCommentIfAbsent { :self :open :close :aBlock:/0 |
		let start = self.findString(open);
		let end = self.findString(close);
		(start = 0 | {
			end = 0
		}).if {
			aBlock()
		} {
			self.copyFromTo(start + open.size, end - 1)
		}
	}

	firstBracketedComment { :self :open :close |
		self.firstBracketedCommentIfAbsent(open, close) {
			self.error('firstBracketedComment: no comment found')
		}
	}

	firstHsCommentIfAbsent { :self :aBlock:/0 |
		self.firstBracketedCommentIfAbsent('{-', '-}', aBlock:/0)
	}

	firstHsComment { :self |
		self.firstHsCommentIfAbsent {
			self.error('firstHsComment: no comment found')
		}
	}

	firstMlCommentIfAbsent { :self :aBlock:/0 |
		self.firstBracketedCommentIfAbsent('(*', '*)', aBlock:/0)
	}

	firstMlComment { :self |
		self.firstMlCommentIfAbsent {
			self.error('firstMlComment: no comment found')
		}
	}

	includes { :self :aCharacter |
		self.characterArray.includes(aCharacter)
	}

	indefiniteArticle { :self |
		self.first.isVowel.if {
			'an '
		} {
			'a '
		}
	}

	indices { :self |
		1.to(self.size)
	}

	indicesOf { :self :aString |
		aString.isString.if {
			let answer = [];
			let index = 1;
			let end = self.size;
			{
				index.betweenAnd(1, end)
			}.whileTrue {
				index := self.findStringStartingAt(aString, index);
				(index ~= 0).ifTrue {
					answer.add(index);
					index := index + 1
				}
			};
			answer
		} {
			self.error('indicesOf: not a string: ' ++ aString)
		}
	}

	includesSubstring { :self :aString |
		<primitive: return _self.includes(_aString);>
	}

	isAsciiString { :self |
		self.allSatisfy(isAscii:/1)
	}

	isInBasicMultilingualPlane { :self |
		self.countUtf16CodeUnits = self.countCharacters
	}

	isEmpty { :self |
		self.size = 0
	}

	isLowercase { :self |
		<primitive: return /^[a-z]+$/.test(_self);>
	}

	isSequenceable { :self |
		true
	}

	isSingleCharacter { :self |
		self.size = 1 | {
			self.size = 2 & {
				self.codePointAt(2).isUtf16SurrogateCode
			}
		}
	}

	isUppercase { :self |
		<primitive: return /^[A-Z]+$/.test(_self);>
	}

	isWellFormed { :self |
		<primitive: return _self.isWellFormed();>
	}

	last { :self |
		self[self.size]
	}

	last { :self :count |
		self.copyFromTo(self.size - count + 1, self.size)
	}

	lines { :self |
		<primitive: return _self.split(/\r?\n/);>
	}

	markdownToHtml { :self |
		<primitive:
		const reader = new commonmark.Parser({smart: true});
		const writer = new commonmark.HtmlRenderer();
		return writer.render(reader.parse(_self));
		>
	}

	notEmpty { :self |
		self.isEmpty.not
	}

	occurrencesOf { :self :aString |
		aString.isString.if {
			let index = 1;
			let end = self.size;
			let tally = 0;
			{
				index.betweenAnd(1, end)
			}.whileTrue {
				index := self.findStringStartingAt(aString, index);
				(index ~= 0).ifTrue {
					tally := tally + 1;
					index := index + 1
				}
			};
			tally
		} {
			self.error('occurrencesOf: not a string: ' ++ aString)
		}
	}

	padLeft { :self :anInteger :aString |
		<primitive: return _self.padStart(_anInteger, _aString);>
	}


	padRight { :self :anInteger :aString |
		<primitive: return _self.padEnd(_anInteger, _aString);>
	}

	paragraphs { :self |
		<primitive: return _self.split('\n\n');>
	}

	parseBacktickQuotedString { :self |
		self
	}

	parseDoubleQuotedString { :self |
		self
	}

	parseJson { :self |
		<primitive: return JSON.parse(_self);>
	}

	postLine { :self |
		system.postLine(self)
	}

	primitiveCollectInto { :self :aBlock:/1 :aCollection |
		self.primitiveDo { :each |
			aCollection.add(aBlock(each))
		};
		aCollection
	}

	primitiveDo { :self :aBlock:/1 |
		<primitive:
		for (const each of _self) {
			_aBlock_1(each);
		};
		return _self;
		>
	}

	pseudoSlotNameArray { :self |
		['size']
	}

	replaceString { :self :stringToFind :stringToReplaceWith |
		stringToFind.assertIsString;
		stringToReplaceWith.assertIsString;
		self.basicReplaceString(stringToFind, stringToReplaceWith)
	}

	replaceStringAll { :self :stringToFind :stringToReplaceWith |
		stringToFind.assertIsString;
		stringToReplaceWith.assertIsString;
		self.basicReplaceStringAll(stringToFind, stringToReplaceWith)
	}

	romanNumber { :self |
		let value = 0;
		let v1 = 0;
		let v2 = 0;
		let letters = 'IVXLCDM'.asciiByteArray;
		self.asciiByteArray.reverseDo { :each |
			v1 := [1, 5, 10, 50, 100, 500, 1000].at(letters.indexOf(each));
			(v1 >= v2).if {
				value := value + v1
			} {
				value := value - v1
			};
			v2 := v1
		};
		value
	}

	sameAs { :self :aString |
		(self = aString).if {
			true
		} {
			self.asLowercase = aString.asLowercase
		}
	}

	shallowCopy { :self |
		self
	}

	size { :self |
		self.countUtf16CodeUnits
	}

	split { :self |
		self.stringArray
	}

	splitBy { :self :aString |
		<primitive: return _self.split(_aString);>
	}

	splitByLimitedTo { :self :aString :count |
		<primitive: return _self.split(_aString, _count);>
	}

	storeString { :self |
		<primitive: return `'${_self}'`;>
	}

	stringArray { :self |
		self.primitiveCollectInto(identity:/1, [])
	}

	toLowercase { :self |
		<primitive: return _self.toLowerCase();>
	}

	toUppercase { :self |
		<primitive: return _self.toUpperCase();>
	}

	truncateTo { :self :smallSize |
		(self.size <= smallSize).if {
			self
		} {
			self.copyFromTo(1, smallSize)
		}
	}

	utf8ByteArray { :self |
		<primitive: return new TextEncoder().encode(_self.normalize('NFC'));>
	}

	utf16Array { :self |
		let answer = [];
		1.toDo(self.countUtf16CodeUnits) { :index |
			answer.add(self.utf16CodePointAt(index))
		};
		answer
	}

	utf16CodePointAt { :self :index |
		<primitive: return _self.charCodeAt(_index - 1);>
	}

	whiteSpaceDelimitedWordAtIndex { :self :index |
		let previousSpaceIndex = self.findPreviousOccurrenceOfStringStartingAt(' ', index - 1);
		let nextSpaceIndex = self.findStringStartingAt(' ', index);
		let begin = (previousSpaceIndex < 1).if { 1 } { previousSpaceIndex + 1 };
		let end = (nextSpaceIndex < 1).if { self.length } { nextSpaceIndex };
		self.copyFromTo(begin, end - 1)
	}

	withBlanksTrimmed { :self |
		<primitive: return _self.trim();>
	}

	withIndefiniteArticle { :self |
		self.indefiniteArticle ++ self
	}

	withoutLeadingBlanks { :self |
		<primitive: return _self.trimStart();>
	}

	withoutQuoting { :self |
		(self.size < 2).if {
			self
		} {
			let quote = self.first;
			(
				quote = self.last & {
					[34, 39, 96].includes(quote.codePoint)
				}
			).if {
				self.copyFromTo(2, self.size - 1)
			} {
				self
			}
		}
	}

	withoutTrailingBlanks { :self |
		<primitive: return _self.trimEnd();>
	}

	words { :self |
		self.splitBy(' ')
	}

	{- ImmutableSequenceable -}
	allButFirst { :self | self.allButFirst(1) }
	allButFirst { :self :n | self.copyFromTo(n + 1, self.size) }

}

+@Object {

	postLine { :self |
		self.printString.postLine;
		self
	}

}

+@Integer {

	isAsciiCodePoint { :self |
		self.betweenAnd(0, 127)
	}

	isUtf16SurrogateCode { :self |
		{- 0xD800 = 55296, 0xDfFF = 57343 -}
		self.betweenAnd(55296, 57343)
	}

}

+@Sequenceable {

	camelCase { :self |
		[self.first] ++ self.allButFirst.collect(capitalized:/1)
	}

	join { :self |
		self.joinSeparatedBy('')
	}

	joinCharacters { :self |
		self.collect(string:/1).joinSeparatedBy('')
	}

	joinSeparatedBy { :self :aString |
		self.collect(asString:/1).joinStringsSeparatedBy(aString)
	}

	pascalCase { :self |
		self.collect(capitalized:/1)
	}

	unlines { :self |
		self.joinSeparatedBy('\n')
	}

	unwords { :self |
		self.joinSeparatedBy(' ')
	}

}

+Array {

	joinStringsSeparatedBy { :self :aString |
		<primitive: return _self.join(_aString);>
	}

}
