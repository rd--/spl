/* Requires: Character List */

String! : [Object, Json, Iterable, Character] {

	= { :self :anObject |
		self == anObject
	}

	~ { :self :anObject |
		self.isCharacter.if {
			self.asCharacter = anObject.asCharacter
		} {
			self == anObject
		}
	}

	<=> { :self :aString |
		<primitive:
		if(typeof _aString == 'string') {
			const n = _self.localeCompare(_aString);
			if(n < 0) {
				return -1;
			} else if(n == 0) {
				return 0;
			} else {
				return 1;
			}
		};
		>
		self.error('String>><=>: non string operand')
	}

	< { :self :aString |
		self <=> aString = -1
	}

	<= { :self :aString |
		self <=> aString <= 0
	}

	> { :self :aString |
		self <=> aString = 1
	}

	>= { :self :aString |
		self <=> aString >= 1
	}

	++ { :self :anObject |
		self.basicAppendString(anObject.asString)
	}

	abbreviateTo { :self :anInteger |
		self.truncateTo(anInteger - 8) ++ '... &etc'
	}

	allButFirst { :self |
		self.allButFirst(1)
	}

	allButFirst { :self :n |
		self.copyFromTo(n + 1, self.size)
	}

	allButLast { :self |
		self.allButLast(1)
	}

	allButLast { :self :n |
		let end = self.size - n;
		(end = 0).if {
			''
		} {
			self.copyFromTo(1, end)
		}
	}

	alphabet { :self |
		self.caseOfOtherwise([
			{ 'english' } -> {
				[
					'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j'
					'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't'
					'u' 'v' 'w' 'x' 'y' 'z'
				]
			},
			{ 'greek' } -> {
				[
					'α' 'β' 'γ' 'δ' 'ε' 'ζ' 'η' 'θ' 'ι' 'κ'
					'λ' 'μ' 'ν' 'ξ' 'ο' 'π' 'ρ' 'σ' 'τ' 'υ'
					'φ' 'χ' 'ψ' 'ω'
				]
			}
		]) {
			self.error('String>>alphabet: unknown alphabet')
		}
	}

	asBracketedComment { :self :open :close |
		(self.includesSubstring(open) | {
			self.includesSubstring(close)
		}).if {
			self.error('String>>asBracketedComment: includes comment brackets')
		} {
			[open, self, close].join(' ')
		}
	}

	asCharacter { :self |
		Character(self, self.codePoint)
	}

	asciiByteArray { :self |
		let answer = self.utf8ByteArray;
		answer.allSatisfy(isAsciiCodePoint:/1).if {
			answer
		} {
			self.error('String>>asciiByteArray: non-ascii character')
		}
	}

	asciiValue { :self |
		(self.size = 1).if {
			self.asciiByteArray.first
		} {
			self.error('String>>asciiValue: not single character')
		}
	}

	asCodePoint { :self |
		self.codePoint
	}

	asHaskellComment { :self |
		self.asBracketedComment('{-', '-}')
	}

	asHexString { :self |
		self.asciiByteArray.hexString
	}

	asList { :self |
		self.contents
	}

	asLowerCase { :self |
		<primitive: return _self.toLowerCase();>
	}

	asMlComment { :self |
		self.asBracketedComment('(*', '*)')
	}

	asPliComment { :self |
		self.asBracketedComment('/*', '*/')
	}

	assertIsString { :self |
		self
	}

	asIdentitySet { :self |
		self.contents.asIdentitySet
	}

	asSet { :self :aBlock:/2 |
		self.contents.asSet(aBlock:/2)
	}

	asString { :self |
		self
	}

	asUpperCase { :self |
		<primitive: return _self.toUpperCase(); >
	}

	at { :self :index |
		/* Note: index is in Utf-16 code units, not characters */
		let codePoint = self.codePointAt(index);
		codePoint.ifNil {
			self.error('String>>at: invalid index')
		} {
			codePoint.isUtf16SurrogateCodePoint.if {
				self.error('String>>at: code point is lone surrogate')
			} {
				codePoint.asCharacter
			}
		}
	}

	atAll { :self :indices |
		self.contents.atAll(indices).join('')
	}

	basicAppendString { :self :aString |
		<primitive: return _self + _aString;>
	}

	basicCopyFromTo { :self :start :end |
		<primitive: return _self.substring(_start - 1, _end);>
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
		self.error('String>>beginsWith: non string operand')
	}

	beginsWithAnyOf { :self :aCollection |
		aCollection.anySatisfy { :prefix |
			self.beginsWith(prefix)
		}
	}

	capitalized { :self |
		<primitive: return _self[0].toUpperCase() + _self.slice(1);>
	}

	Character { :self :codePoint |
		self.isCharacter.if {
			system.cache.atIfAbsentPut('characterDictionary') {
				()
			}.atIfAbsentPut(self) {
				newCharacter().initializeSlots(self, codePoint)
			}
		} {
			self.error('String>>Character: not character?')
		}
	}

	characterRange { :self :aString |
		self.asCharacter.characterRange(aString.asCharacter).collect(asString:/1)
	}

	characterString { :self |
		self.isCharacter.if {
			self
		} {
			self.error('String>>characterString: not single character string')
		}
	}

	characterList { :self |
		self.collectInto(identity:/1, [])
	}

	codePoint { :self |
		self.isCharacter.if {
			self.codePointAt(1)
		} {
			self.error('String>>codePoint: not single character string')
		}
	}

	codePointAt { :self :index |
		<primitive: return _self.codePointAt(_index - 1);>
	}

	codePoints { :self |
		self.collectInto(codePoint:/1, [])
	}

	collectInto { :self :aBlock:/1 :aCollection |
		self.primitiveCollectInto({ :each |
			aBlock(each.asCharacter)
		}, [])
	}

	compare { :self :anObject |
		self <=> anObject
	}

	contents { :self |
		self.primitiveCollectInto(identity:/1, [])
	}

	concisePrintString { :self |
		self.contractTo(32)
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
		self.includesIndex(start).ifFalse {
			self.error('copyFromTo: invalid start index')
		};
		self.includesIndex(end).ifFalse {
			self.error('copyFromTo: invalid end index')
		};
		(start > end).if {
			''
		} {
			self.basicCopyFromTo(start, end)
		}
	}

	copyReplaceFromToWith { :self :start :stop :replacement |
		[
			self.copyFromTo(1, start - 1),
			replacement,
			self.copyFromTo(stop + 1, self.size)
		].join('')
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

	deBruijnSequence { :self :anInteger |
		self.contents.deBruijnSequence(anInteger).join('')
	}

	do { :self :aBlock:/1 |
		self.primitiveDo { :each |
			aBlock(each)
		}
	}

	drop { :self :anInteger |
		(anInteger >= self.size).if {
			''
		} {
			self.copyFromTo(anInteger + 1, self.size)
		}
	}

	editDistance { :self :aString |
		self.contents.editDistance(aString.contents)
	}

	endsWith { :self :aString |
		<primitive:
		if(typeof _aString == 'string') {
			return _self.endsWith(_aString);
		}
		>
		self.error('String>>endsWith: non string operand')
	}

	findLastOccurrenceOfStringStartingAt { :self :subString :start |
		let last = self.findStringStartingAt(subString, start);
		(last = 0).if {
			0
		} {
			let answer = nil;
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

	findStringStartingAt { :self :aString :anInteger |
		self.indexOfSubstringStartingAt(aString, anInteger)
	}

	findString { :self :aString |
		self.indexOfSubstring(aString)
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
			self.error('String>>firstBracketedComment: no comment found')
		}
	}

	firstHsCommentIfAbsent { :self :aBlock:/0 |
		self.firstBracketedCommentIfAbsent('{-', '-}', aBlock:/0)
	}

	firstHsComment { :self |
		self.firstHsCommentIfAbsent {
			self.error('String>>firstHsComment: no comment found')
		}
	}

	firstMlCommentIfAbsent { :self :aBlock:/0 |
		self.firstBracketedCommentIfAbsent('(*', '*)', aBlock:/0)
	}

	firstMlComment { :self |
		self.firstMlCommentIfAbsent {
			self.error('String>>firstMlComment: no comment found')
		}
	}

	firstPliCommentIfAbsent { :self :aBlock:/0 |
		self.firstBracketedCommentIfAbsent('/*', '*/', aBlock:/0)
	}

	firstPliComment { :self |
		self.firstPliCommentIfAbsent {
			self.error('String>>firstPliComment: no comment found')
		}
	}

	format { :self :arguments |
		let parts = self.splitBy('%');
		(arguments.size + 1 = parts.size).if {
			parts.riffle(arguments.collect(asString:/1)).stringConcatenation('')
		} {
			self.error('format: incorrect number of arguments')
		}
	}

	hammingDistance { :self :aString |
		self.contents.hammingDistance(aString.contents)
	}

	includes { :self :aCharacter |
		self.characterList.includes(aCharacter.asCharacter)
	}

	includesBy { :self :aCharacter :aBlock:/2 |
		self.characterList.includesBy(aCharacter.asCharacter, aBlock:/2)
	}

	includesIndex { :self :index |
		index.betweenAnd(1, self.size)
	}

	includesSubsequence { :self :aString |
		self.contents.includesSubsequence(aString.contents)
	}

	includesSubstring { :self :aString |
		<primitive: return _self.includes(_aString);>
	}

	indefiniteArticle { :self |
		self.first.isVowel.if {
			'an'
		} {
			'a'
		}
	}

	indexOfSubstringStartingAt { :self :aString :anInteger |
		<primitive: return _self.indexOf(_aString, _anInteger - 1) + 1;>
	}

	indexOfSubstring { :self :aString |
		<primitive: return _self.indexOf(_aString) + 1;>
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
			self.error('String>>indicesOf: not a string: ' ++ aString)
		}
	}

	isAscii { :self |
		self.utf8ByteArray.allSatisfy(isAsciiCodePoint:/1)
	}

	isAllWhiteSpace { :self |
		<primitive: return !/[^\t\n\r ]/.test(_self);>
	}

	isBlankLine { :self |
		self.isEmpty | {
			self.allSatisfy { :each |
				each.isSpace | {
					each.isTab
				}
			}
		}
	}

	isCharacter { :self |
		self.size = 1 | {
			self.size = 2 & {
				self.codePointAt(2).isUtf16SurrogateCodePoint
			}
		}
	}

	isInBasicMultilingualPlane { :self |
		self.countUtf16CodeUnits = self.countCharacters
	}

	isEmpty { :self |
		self.size = 0
	}

	isImmediate { :self |
		true
	}

	isLiteral { :self |
		true
	}

	isLowerCase { :self |
		<primitive: return /^[a-z]+$/.test(_self);>
	}

	isSameAs { :self :aString |
		(self = aString).if {
			true
		} {
			self.asLowerCase = aString.asLowerCase
		}
	}

	isSequence { :self |
		true
	}

	isUpperCase { :self |
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

	lineCount { :self |
		self.isEmpty.if {
			1
		} {
			let answer = self.lineFeedCount + 1;
			self.last.isLineFeed.ifTrue {
				answer := answer - 1
			};
			answer
		}
	}

	lineFeedCount { :self |
		self.count(isLineFeed:/1)
	}

	lines { :self |
		self.isEmpty.if {
			[]
		} {
			self.withoutTrailingLineFeed.splitBy('\n')
		}
	}

	longestCommonSubsequence { :self :aString |
		self.contents.longestCommonSubsequence(aString.contents).join('')
	}

	longestCommonSubstringList { :self :aString |
		self.contents.longestCommonSubstringList(aString.contents).collect { :each |
			each.join('')
		}
	}

	longestCommonSubstring { :self :aString |
		self.contents.longestCommonSubstring(aString.contents).join('')
	}

	longestIncreasingSubsequence { :self |
		self.contents.longestIncreasingSubsequence.join('')
	}

	notEmpty { :self |
		self.isEmpty.not
	}

	nub { :self |
		let seen = [];
		self.select { :each |
			seen.ifAbsentAdd(each)
		}
	}

	nubSieve { :self |
		self.asList.nubSieve
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
			self.error('String>>occurrencesOf: not a string: ' ++ aString)
		}
	}

	onCharacters { :self :aBlock:/1 |
		self.asList.aBlock.join('')
	}

	padLeft { :self :anInteger :aString |
		<primitive: return _self.padStart(_anInteger, _aString);>
	}


	padRight { :self :anInteger :aString |
		<primitive: return _self.padEnd(_anInteger, _aString);>
	}

	paragraphAtIndex { :self :index |
		self[index].isLineFeed.if {
			self.paragraphAtIndex(index - 1)
		} {
			let beforeIndex = self.findPreviousOccurrenceOfStringStartingAt('\n\n', index - 1);
			let afterIndex = self.findStringStartingAt('\n\n', index);
			let start = (beforeIndex < 1).if { 1 } { beforeIndex + 2 };
			let end = (afterIndex < 1).if { self.size } { afterIndex };
			self.copyFromTo(start, end)
		}
	}

	paragraphs { :self |
		<primitive: return _self.split('\n\n');>
	}

	parseJson { :self |
		<primitive: return JSON.parse(_self);>
	}

	postLine { :self |
		system.postLine(self)
	}

	precedes { :self :anObject |
		self < anObject
	}

	precedesOrEqualTo { :self :anObject |
		self <= anObject
	}

	primitiveCollectInto { :self :aBlock:/1 :aCollection |
		self.primitiveDo { :each |
			aCollection.add(aBlock(each))
		};
		aCollection
	}

	primitiveDo { :self :aBlock:/1 |
		<primitive:
		for(const each of _self) {
			_aBlock_1(each);
		};
		return _self;
		>
	}

	pseudoSlotNameList { :self |
		['size']
	}

	removeDiacritics { :self |
		<primitive:
		return _self.normalize("NFKD").replace(/[\u0300-\u036f]/g, '');
		>
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

	reversed { :self |
		self.onCharacters(reversed:/1)
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

	select { :self :aBlock:/1 |
		let list = [];
		self.do { :each |
			aBlock(each).ifTrue {
				list.add(each)
			}
		};
		list.join('')
	}

	sentences { :self |
		<primitive: return sl.stringToSentences(_self);>
	}

	shallowCopy { :self |
		self
	}

	simplifySpl { :self |
		<primitive: return sl.rewriteSlToCore(_self);>
	}

	size { :self |
		self.countUtf16CodeUnits
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

	stringList { :self |
		self.contents
	}

	take { :self :anInteger |
		self.copyFromTo(1, anInteger.min(self.size))
	}

	trim { :self |
		<primitive: return _self.trim();>
	}

	truncateTo { :self :smallSize |
		(self.size <= smallSize).if {
			self
		} {
			self.copyFromTo(1, smallSize)
		}
	}

	unique { :self |
		self ++ system.uniqueId
	}

	utf8ByteArray { :self |
		<primitive:
		return new TextEncoder().encode(_self.normalize('NFC'));
		>
	}

	utf8List { :self |
		self.utf8ByteArray.asList
	}

	utf16List { :self |
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
		self.includesIndex(index).if {
			let previousSpaceIndex = self.findPreviousOccurrenceOfStringStartingAt(' ', index - 1);
			let nextSpaceIndex = self.findStringStartingAt(' ', index);
			let begin = (previousSpaceIndex < 1).if { 1 } { previousSpaceIndex + 1 };
			let end = (nextSpaceIndex < 1).if { self.size } { nextSpaceIndex - 1 };
			(begin > end).if {
				''
			} {
				self.copyFromTo(begin, end)
			}
		} {
			self.error('whiteSpaceDelimitedWordAtIndex: invalid index')
		}
	}

	withBlanksTrimmed { :self |
		self.trim
	}

	withIndefiniteArticle { :self |
		[self.indefiniteArticle, self].join(' ')
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

	withoutTrailingLineFeed { :self |
		self.isEmpty.if {
			self
		} {
			self.last.isLineFeed.if {
				self.allButLast
			} {
				self
			}
		}
	}

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

	isUtf16SurrogateCodePoint { :self |
		/* 0xD800 = 55296, 0xDfFF = 57343 */
		self.betweenAnd(55296, 57343)
	}

}

+@Sequence {

	camelCase { :self |
		[self.first] ++ self.allButFirst.collect(capitalized:/1)
	}

	stringConcatenation { :self :aString |
		(self.allSatisfy(isString:/1) && aString.isString).if {
			self.basicStringJoin(aString)
		} {
			self.error('@Sequence>>stringConcatenation: non-string arguments')
		}
	}

	stringJoin { :self :aString |
		self.flatten.collect(asString:/1).basicStringJoin(aString.asString)
	}

	stringJoin { :self |
		self.stringJoin('')
	}

	joinCharacters { :self |
		self.collect(characterString:/1).join('')
	}

	pascalCase { :self |
		self.collect(capitalized:/1)
	}

	unlines { :self |
		self.join('\n')
	}

	unwords { :self |
		self.join(' ')
	}

}

+List {

	basicStringJoin { :self :aString |
		<primitive: return _self.join(_aString);>
	}

}
