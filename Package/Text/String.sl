/* Requires: Character List */

String! : [Object, Comparable, Json, Iterable, Indexable, Character] {

	= { :self :anObject |
		self == anObject
	}

	~ { :self :anObject |
		self.isCharacter.if {
			anObject.isCharacter & {
				self.asCharacter = anObject.asCharacter
			}
		} {
			self == anObject
		}
	}

	++ { :self :anObject |
		self.basicAppendString(anObject.asString)
	}

	< { :self :operand |
		self.codePoint < operand.codePoint
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
		self.caseOf([
			'english' -> {
				[
					'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j'
					'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't'
					'u' 'v' 'w' 'x' 'y' 'z'
				]
			},
			'greek' -> {
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
			[open, self, close].unwords
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

	asciiList { :self |
		self.asciiByteArray.asList
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
		self.asciiByteArray.base16Encode
	}

	asList { :self |
		self.characters
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
		IdentitySet(self.characters)
	}

	asSet { :self |
		Set(self.characters)
	}

	asString { :self |
		self
	}

	asUpperCase { :self |
		<primitive: return _self.toUpperCase(); >
	}

	atIfAbsent { :self :index :ifAbsent:/0 |
		/* Note: index is in Utf-16 code units, not characters */
		self.includesIndex(index).if {
			let codePoint = self.codePointAt(index);
			codePoint.ifNil {
				ifAbsent()
			} {
				codePoint.isUtf16SurrogateCodePoint.if {
					self.error('String>>at: code point is lone surrogate')
				} {
					codePoint.fromCodePoint
				}
			}
		} {
			ifAbsent()
		}
	}

	atAll { :self :indices |
		self.characters.atAll(indices).stringCatenate
	}

	basicAppendString { :self :aString |
		<primitive: return _self + _aString;>
	}

	basicCopyFromTo { :self :start :end |
		<primitive: return _self.substring(_start - 1, _end);>
	}

	basicAt { :self :index |
		self.codePointAt(index).fromCodePoint
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

	beginsWithAny { :self :aCollection |
		aCollection.anySatisfy { :prefix |
			self.beginsWith(prefix)
		}
	}

	capitalize { :self |
		<primitive: return _self[0].toUpperCase() + _self.slice(1);>
	}

	characterCounts { :self |
		self
		.characters
		.asIdentityMultiset
		.associations
		.sort(|>=, value:/1)
	}

	characterCounts { :self :n |
		self
		.characters
		.partition(n, 1)
		.collect(stringJoin:/1)
		.asIdentityMultiset
		.associations
		.sort(|>=, value:/1)
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

	compare { :self :operand |
		<primitive:
		if(typeof _operand == 'string') {
			const n = _self.localeCompare(_operand);
			if(n < 0) {
				return -1;
			} else if(n == 0) {
				return 0;
			} else {
				return 1;
			}
		};
		>
		self.error('String>>compare: non string operand')
	}

	characters { :self |
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
		].stringCatenate
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

	difference { :self :operand |
		self.characters.difference(
			operand.characters
		).stringJoin
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

	first { :self :anInteger |
		self.copyFromTo(1, 1 + anInteger - 1)
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
			parts.riffle(arguments.collect(asString:/1)).stringCatenate
		} {
			self.error('format: incorrect number of arguments')
		}
	}

	fromRomanNumeral { :self |
		(self = 'N').if {
			0
		} {
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
	}

	includes { :self :aCharacter |
		self.characterList.includes(aCharacter.asCharacter)
	}

	includesBy { :self :aCharacter :aBlock:/2 |
		self.characterList.includesBy(aCharacter.asCharacter, aBlock:/2)
	}

	includesIndex { :self :index |
		index.isInteger & {
			index.betweenAnd(1, self.size)
		}
	}

	includesSubsequence { :self :aString |
		self.characters.includesSubsequence(aString.characters)
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
				(index != 0).ifTrue {
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

	isAscii { :self |
		self.utf8ByteArray.allSatisfy(isAsciiCodePoint:/1)
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

	isImmediate { :unused |
		true
	}

	isImmediateType { :self |
		['Nil', 'Boolean', 'Block', 'SmallFloat', 'LargeInteger', 'String']
		.includes(self)
	}

	isLiteral { :unused |
		true
	}

	isLowerCase { :self |
		<primitive: return /^[a-z]+$/.test(_self);>
	}

	isNotEmpty { :self |
		self.isEmpty.not
	}

	isPalindrome { :self |
		self.contents.isPalindrome
	}

	isPrintableAscii { :self |
		self.utf8ByteArray.allSatisfy { :each |
			each.betweenAnd(32, 126)
		}
	}

	isSameAs { :self :aString |
		(self = aString).if {
			true
		} {
			self.asLowerCase = aString.asLowerCase
		}
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

	letterCounts { :self |
		self
		.characters
		.select(isLetter:/1)
		.asIdentityMultiset
		.associations
		.sort(|>=, value:/1)
	}

	letterCounts { :self :n |
		self
		.characters
		.select(isLetter:/1)
		.partition(n, 1)
		.collect(stringJoin:/1)
		.asIdentityMultiset
		.associations
		.sort(|>=, value:/1)
	}

	letterNumber { :self :aString |
		aString.alphabet.indexOf(
			self.asLowerCase
		)
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
		self
		.characters
		.longestCommonSubsequence(aString.characters)
		.stringCatenate
	}

	longestCommonSubstringList { :self :aString |
		self
		.characters
		.longestCommonSubstringList(aString.characters)
		.collect { :each |
			each.stringCatenate
		}
	}

	longestCommonSubstring { :self :aString |
		self.characters.longestCommonSubstring(aString.characters).stringCatenate
	}

	longestIncreasingSubsequence { :self |
		self.characters.longestIncreasingSubsequence.stringCatenate
	}

	nub { :self |
		let seen = [];
		self.select { :each |
			seen.ifAbsentAdd(each)
		}
	}

	nubSieve { :self |
		self.characters.nubSieve
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
				(index != 0).ifTrue {
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
		self.characters.aBlock.stringCatenate
	}

	padLeft { :self :aList :aString |
		<primitive: return _self.padStart(_aList[0], _aString);>
	}


	padRight { :self :aList :aString |
		<primitive: return _self.padEnd(_aList[0], _aString);>
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

	parseJson { :self :elseClause |
		<primitive:
		let answer = null;
		try {
			answer = JSON.parse(_self);
		} catch (_unused) {
			return _elseClause();
		};
		return answer;
		>
	}

	parseJson { :self |
		<primitive: return JSON.parse(_self);>
	}

	partition { :self :n :d |
		let k = self.size;
		let p = [];
		let i = 1;
		let j = n;
		{ j <= k }.whileTrue {
			p.add(self.copyFromTo(i, j));
			i := i + d;
			j := j + d
		};
		p
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

	repeat { :self :n |
		(self # n).stringCatenate
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

	reverse { :self |
		self.onCharacters(reverse:/1)
	}

	rotateLeft { :self :anInteger |
		let k = self.size;
		let n = anInteger % k;
		(n = 0).if {
			self
		} {
			self.allButFirst(n) ++ self.first(n)
		}
	}

	select { :self :aBlock:/1 |
		let list = [];
		self.do { :each |
			aBlock(each).ifTrue {
				list.add(each)
			}
		};
		list.stringCatenate
	}

	sentences { :self |
		<primitive: return sl.stringToSentences(_self);>
	}

	shallowCopy { :self |
		self
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

	stringLength { :self |
		self.size
	}

	stringReverse { :self |
		self.reverse
	}

	take { :self :anInteger |
		self.copyFromTo(1, anInteger.min(self.size))
	}

	toCharacterCode { :self :encoding |
		encoding.caseOf([
			'Ascii' -> { self.asciiList },
			'Utf8' -> { self.utf8List },
			'Utf16' -> { self.utf16List }
		])
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
		[self.indefiniteArticle, self].unwords
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

+SmallFloat {

	fromCharacterCode { :self :encoding |
		[self].fromCharacterCode(encoding)
	}

	fromCodePoint { :self |
		<primitive:
		return String.fromCodePoint(_self);
		>
	}

	isAsciiCodePoint { :self |
		self.betweenAnd(0, 127)
	}

	isUtf16SurrogateCodePoint { :self |
		/* 0xD800 = 55296, 0xDfFF = 57343 */
		self.betweenAnd(55296, 57343)
	}

}

+List {

	basicStringIntercalate { :self :aString |
		<primitive: return _self.join(_aString);>
	}

	camelCase { :self |
		[self.first] ++ self.allButFirst.collect(capitalize:/1)
	}

	commaSeparated { :self |
		self.stringIntercalate(', ')
	}

	deleteStopWords { :self |
		let stopWords = system.englishStopWords;
		self.reject { :each |
			stopWords.includes(each.asLowerCase)
		}
	}

	fromCharacterCode { :self :encoding |
		self.allSatisfy(isSmallFloat:/1).if {
			encoding.caseOf([
				'Ascii' -> { self.asciiString },
				'Utf8' -> { self.utf8String },
				'Utf16' -> { self.utf16String }
			])
		} {
			self.collect { :each |
				each.fromCharacterCode(encoding)
			}
		}
	}

	isPrintableAscii { :self |
		self.collect(isPrintableAscii:/1)
	}

	letterNumber { :self :aString |
		self.collect { :each |
			each.letterNumber(aString)
		}
	}

	stringCatenate { :self |
		self.stringIntercalate('')
	}

	stringIntercalate { :self :aString |
		(self.allSatisfy(isString:/1) && aString.isString).if {
			self.basicStringIntercalate(aString)
		} {
			self.error('List>>stringIntercalate: non-string arguments')
		}
	}

	stringJoin { :self :aString |
		self.flatten.collect(asString:/1).basicStringIntercalate(aString.asString)
	}

	stringJoin { :self |
		self.stringJoin('')
	}

	stringLength { :self |
		self.collect(stringLength:/1)
	}

	stringReverse { :self |
		self.collect(stringReverse:/1)
	}

	pascalCase { :self |
		self.collect(capitalize:/1)
	}

	removeDiacritics { :self |
		self.collect(removeDiacritics:/1)
	}

	toCharacterCode { :self :encoding |
		self.collect { :each |
			each.toCharacterCode(encoding)
		}
	}

	unlines { :self |
		self.stringIntercalate('\n')
	}

	unwords { :self |
		self.stringIntercalate(' ')
	}

}

+List {

	burrowsWheelerMatrix { :self |
		(1 .. self.size).collect { :each |
			self.rotateLeft(each)
		}.lexicographicSort
	}

	burrowsWheelerTransform { :self |
		self.burrowsWheelerMatrix.collect(last:/1)
	}

	inverseBurrowWheelerTransform { :self :eot |
		let k = self.size;
		let table = List(k, List());
		k.timesRepeat {
			(1 .. k).do { :i |
				table[i] := [self[i]] ++ table[i]
			};
			table.lexicographicSort
		};
		table.detect { :each |
			each.last = eot
		}.copyFromTo(2, k - 1)
	}

}

+String {

	burrowsWheelerTransform { :self :delimiters |
		let [p, q] = delimiters;
		let c = [p] ++ self.characters ++ [q];
		c.burrowsWheelerTransform.stringJoin
	}

	inverseBurrowWheelerTransform { :self :eot |
		self.characters.inverseBurrowWheelerTransform(eot).stringJoin
	}

}

+String {

	porterStemmer { :self |
		/* https://github.com/words/stemmer */
		<primitive:
		const step2list = {
			ational: 'ate',
			tional: 'tion',
			enci: 'ence',
			anci: 'ance',
			izer: 'ize',
			bli: 'ble',
			alli: 'al',
			entli: 'ent',
			eli: 'e',
			ousli: 'ous',
			ization: 'ize',
			ation: 'ate',
			ator: 'ate',
			alism: 'al',
			iveness: 'ive',
			fulness: 'ful',
			ousness: 'ous',
			aliti: 'al',
			iviti: 'ive',
			biliti: 'ble',
			logi: 'log'
		};
		const step3list = {
			icate: 'ic',
			ative: '',
			alize: 'al',
			iciti: 'ic',
			ical: 'ic',
			ful: '',
			ness: ''
		};
		const consonant = '[^aeiou]';
		const vowel = '[aeiouy]';
		const consonants = '(' + consonant + '[^aeiouy]*)';
		const vowels = '(' + vowel + '[aeiou]*)';
		const gt0 = new RegExp('^' + consonants + '?' + vowels + consonants);
		const eq1 = new RegExp(
			'^' + consonants + '?' + vowels + consonants + vowels + '?$'
		);
		const gt1 = new RegExp('^' + consonants + '?(' + vowels + consonants + '){2,}');
		const vowelInStem = new RegExp('^' + consonants + '?' + vowel);
		const consonantLike = new RegExp('^' + consonants + vowel + '[^aeiouwxy]$');
		const sfxLl = /ll$/;
		const sfxE = /^(.+?)e$/;
		const sfxY = /^(.+?)y$/;
		const sfxIon = /^(.+?(s|t))(ion)$/;
		const sfxEdOrIng = /^(.+?)(ed|ing)$/;
		const sfxAtOrBlOrIz = /(at|bl|iz)$/;
		const sfxEED = /^(.+?)eed$/;
		const sfxS = /^.+?[^s]s$/;
		const sfxSsesOrIes = /^.+?(ss|i)es$/;
		const sfxMultiConsonantLike = /([^aeiouylsz])\1$/;
		const step2 = /^(.+?)(ational|tional|enci|anci|izer|bli|alli|entli|eli|ousli|ization|ation|ator|alism|iveness|fulness|ousness|aliti|iviti|biliti|logi)$/;
		const step3 = /^(.+?)(icate|ative|alize|iciti|ical|ful|ness)$/;
		const step4 = /^(.+?)(al|ance|ence|er|ic|able|ible|ant|ement|ment|ent|ou|ism|ate|iti|ous|ive|ize)$/;
		let result = String(_self).toLowerCase();
		if (result.length < 3) {
			return result;
		}
		let firstCharacterWasLowerCaseY = false;
		if (
			result.codePointAt(0) === 121
		) {
			firstCharacterWasLowerCaseY = true;
			result = 'Y' + result.slice(1);
		}
		if (sfxSsesOrIes.test(result)) {
			result = result.slice(0, -2);
		} else if (sfxS.test(result)) {
			result = result.slice(0, -1);
		}
		let match = null;
		if ((match = sfxEED.exec(result))) {
			if (gt0.test(match[1])) {
				result = result.slice(0, -1);
			}
		} else if ((match = sfxEdOrIng.exec(result)) && vowelInStem.test(match[1])) {
			result = match[1];
			if (sfxAtOrBlOrIz.test(result)) {
				result += 'e';
			} else if (sfxMultiConsonantLike.test(result)) {
				result = result.slice(0, -1);
			} else if (consonantLike.test(result)) {
				result += 'e';
			}
		}
		if ((match = sfxY.exec(result)) && vowelInStem.test(match[1])) {
			result = match[1] + 'i';
		}
		if ((match = step2.exec(result)) && gt0.test(match[1])) {
			result = match[1] + step2list[match[2]];
		}
		if ((match = step3.exec(result)) && gt0.test(match[1])) {
			result = match[1] + step3list[match[2]];
		}
		if ((match = step4.exec(result))) {
			if (gt1.test(match[1])) {
				result = match[1];
			}
		} else if ((match = sfxIon.exec(result)) && gt1.test(match[1])) {
			result = match[1];
		}
		if (
			(match = sfxE.exec(result)) &&
			(gt1.test(match[1]) || (eq1.test(match[1]) && !consonantLike.test(match[1])))
		) {
			result = match[1];
		}
		if (sfxLl.test(result) && gt1.test(result)) {
			result = result.slice(0, -1);
		}
		if (firstCharacterWasLowerCaseY) {
			result = 'y' + result.slice(1)
		}
		return result;
		>
	}

}

+List {

	porterStemmer { :self |
		self.collect(porterStemmer:/1)
	}

}
