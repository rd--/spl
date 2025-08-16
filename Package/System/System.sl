System! : [Object, Cache, RandomNumberGenerator] {

	= { :self :anObject |
		self == anObject
	}

	absoluteTime { :unused |
		<primitive: return Date.now() / 1000;>
	}

	basicNextRandomFloat { :self |
		<primitive: return Math.random();>
	}

	byteOrdering { :self |
		self.isLittleEndian.if {
			-1
		} {
			1
		}
	}

	cache { :self |
		<primitive: return _self.cache;>
	}

	caches { :self |
		<primitive: return _self.window.caches;>
	}

	consoleClear { :unused |
		<primitive:
		console.clear;
		return null;
		>
	}

	consoleError { :unused :message |
		<primitive:
		console.error(_message);
		return null;
		>
	}

	consoleNotification { :unused :message |
		<primitive:
		console.log(_message);
		return null;
		>
	}

	consoleWarning { :unused :message |
		<primitive:
		console.warn(_message);
		return null;
		>
	}

	evaluateOrSignalError { :unused :aString |
		<primitive: return sl.evaluateForSignalling('*Interactive*', _aString);>
	}

	evaluateNotifying { :self :aString :aBlock:/1 |
		{
			self.evaluateOrSignalError(aString)
		}.ifError { :err |
			aBlock(err)
		}
	}

	evaluate { :self :aString |
		self.evaluateNotifying(aString) { :err |
			self.consoleError(err)
		}
	}

	homeDirectory { :self |
		self.environmentVariable('HOME').ifNil {
			self.error('homeDirectory: not set')
		}
	}

	isBigEndian { :unused |
		1.unsigned32BitWordList[1] = 16r3FF00000
	}

	isLittleEndian { :self |
		self.isBigEndian.not
	}

	loadFile { :unused :fileName |
		<primitive: evaluateFile(_fileName);>
	}

	loadUrl { :unused :url |
		<primitive: evaluateUrl(_url);>
	}

	localStorage { :self |
		<primitive: return _self.window.localStorage;>
	}

	localTimeZoneOffsetInMinutes { :unused |
		<primitive:
		const aDate = new Date(0);
		return aDate.getTimezoneOffset();
		>
	}

	methodDictionary { :self |
		<primitive: return _self.methodDictionary;>
	}

	operatorCharacters { :self |
		self.cached('operatorCharacters') {
			'&*^@$=!>-<#%+?\\/~|'.contents
		}
	}

	operatorNameTable { :self |
		let table = self.punctuationCharacterNameTable;
		self.cached('operatorNameTable') {
			[
				'& * ^ @ $ = ! > - < # % + ? \\ / ~ |'
				'&& @* @> == !^ !> !+ !~ >= >> >~ -> - <= <! <- << <~ ++ \\\\ // ~= ~~ ||'
				'>>> <=> +++'
			].collect(words:/1).++.collect { :each |
				each -> each.operatorTokenName(table)
			}.asRecord
		}
	}

	packageDictionary { :self |
		<primitive: return _self.packageDictionary;>
	}

	postLine { :self :aString |
		self.consoleNotification(aString)
	}

	preference { :self :path :defaultValue |
		self.preferencesReadPath(path.splitBy('/'), defaultValue)
	}

	preferences { :self |
		self.cached('preferences') {
			()
		}
	}

	preferencesRead { :self :key |
		<primitive: return sl.preferencesRead(_preferences_1(_self), _key);>
	}

	preferencesReadPath { :self :path :defaultValue |
		path.isEmpty.if {
			self.error('System>>preferencesReadPath: empty path')
		} {
			let item = self.preferencesRead(path[1]);
			let index = 2;
			{
				item.notNil & {
					index <= path.size
				}
			}.whileTrue {
				item := item.atIfAbsent(path[index]) { nil };
				index := index + 1
			};
			item ? {
				defaultValue
			}
		}
	}

	pseudoSlotNameList { :unused |
		[
			'cache',
			'methodDictionary',
			'traitDictionary',
			'typeDictionary',
			'packageDictionary',
			'window',
			'library', /* Package */
			'transcript' /* Package */
		]
	}

	punctuationCharacterNameTable { :unused |
		<primitive: return sl.punctuationCharacterNameTable;>
	}

	punctuationCharacters { :unused |
		<primitive: return sl.punctuationCharacters.split('');>
	}

	nextRandomFloat { :self |
		self.randomNumberGenerator.next
	}

	randomByteArray { :unused :anInteger |
		<primitive:
		let bytes = new Uint8Array(_anInteger);
		crypto.getRandomValues(bytes);
		return bytes;
		>
	}

	randomNumberGenerator { :self |
		self.cached('randomNumberGenerator') {
			Sfc32(self.absoluteTime)
		}
	}

	seedRandom { :self :anInteger |
		self.randomNumberGenerator.initialize(anInteger)
	}

	sessionStorage { :self |
		self.window.sessionStorage
	}

	smallFloatEpsilon { :unused |
		<primitive: return Number.EPSILON;>
	}

	smallFloatMax { :unused |
		<primitive: return Number.MAX_VALUE;>
	}

	smallFloatMin { :unused |
		<primitive: return Number.MIN_VALUE;>
	}

	splDirectory { :self |
		self.environmentVariable('SPL_DIR').ifNil {
			self.error('splDirectory: not set')
		}
	}

	splFileName { :self :aString |
		'%/%'.format([
			self.splDirectory,
			aString
		])
	}

	splUrl { :self :aString |
		('https://rohandrape.net/sw/spl/' ++ aString).asUrl
	}

	timing { :self :aBlock:/0 |
		let beginTime = self.sessionTime;
		let answer = aBlock();
		let endTime = self.sessionTime;
		[endTime - beginTime, answer]
	}

	traitDictionary { :self |
		<primitive: return _self.traitDictionary;>
	}

	typeDictionary { :self |
		<primitive: return _self.typeDictionary;>
	}

	sessionTimeInMilliseconds { :unused |
		<primitive: return performance.now();>
	}

	sessionTime { :unused |
		<primitive: return performance.now() / 1000;>
	}

	uniqueId { :self |
		let answer = self.cached('uniqueId') {
			1
		};
		self.cache['uniqueId'] := answer + 1;
		answer
	}

	uniqueId { :self :anInteger |
		self.cache['uniqueId'] := anInteger
	}

	unixTimeInMilliseconds { :unused |
		<primitive: return Date.now();>
	}

	window { :self |
		<primitive: return _self.window;>
	}

	workspace { :self |
		self.cached('workspace') {
			Record()
		}
	}

}

+Block {

	once { :self |
		let cache = system.cached('onceCache') {
			WeakMap()
		};
		cache.atIfAbsentPut(self) {
			self.value
		}
	}

	once { :self :where :key |
		where.cached(key, self)
	}

}

+Block {

	repeatedTiming { :self:/0 :interval |
		let timeList = [];
		let currentTime = system.sessionTime;
		let endTime = currentTime + interval;
		let answer = self();
		{
			let previousTime = currentTime;
			currentTime := system.sessionTime;
			timeList.add(currentTime - previousTime);
			currentTime < endTime
		}.whileTrue {
			self()
		};
		[
			timeList.trimmedMean([0.25 0.25]),
			answer
		]
	}

	timing { :self:/0 |
		system.timing(self:/0)
	}

}

+[SmallFloat, String] {

	seedRandom { :self |
		system.seedRandom(self)
	}

}

+String {

	isOperatorCharacter { :self |
		<primitive: return sl.isOperatorCharacter(_self);>
	}

	isOperatorToken { :self |
		<primitive: return sl.isOperatorToken(_self);>
	}

	isPunctuationCharacter { :self |
		<primitive: return sl.isPunctuationCharacter(_self);>
	}

	isPunctuationToken { :self |
		<primitive: return sl.isPunctuationToken(_self);>
	}

	isSyntaxCharacter { :self |
		<primitive: return sl.isSyntaxCharacter(_self);>
	}

	isSyntaxToken { :self |
		<primitive: return sl.isSyntaxToken(_self);>
	}

	operatorNameToken { :self |
		valueWithReturn { :return:/1 |
			system.operatorNameTable.associationsDo { :each |
				(each.value = self).ifTrue {
					each.key.return
				}
			};
			nil
		}
	}

	operatorTokenName { :self :table |
		self.isOperatorToken.if {
			self.punctuationTokenName(table)
		} {
			self.error('operatorTokenName: not operator token')
		}
	}

	operatorTokenName { :self |
		self.operatorTokenName(system.punctuationCharacterNameTable)
	}

	punctuationTokenName { :self :table |
		self.contents.collect { :letter |
			table[letter]
		}.camelCase.stringCatenate
	}

	punctuationTokenName { :self |
		self.punctuationTokenName(system.punctuationCharacterNameTable)
	}

	splParseExpression { :self |
		let tree = self.splParseTree;
		let f = { :e |
			let o = e.first;
			let p = e.allButFirst;
			o.caseOf(
				[
					'Apply' -> {
						SymbolicExpression(f(p[1]), p.allButFirst.collect(f:/1))
					},
					'Arguments' -> {
						SymbolicExpression('𝓐', p.collect(f:/1))
					},
					'Assignment' -> {
						SymbolicExpression('←', p.collect(f:/1))
					},
					'Block' -> {
						SymbolicExpression('𝜆', p.collect(f:/1))
					},
					'Identifier' -> {
						Symbol(p[1])
					},
					'LargeInteger' -> {
						p[1].allButLast.parseLargeInteger
					},
					'Let' -> {
						SymbolicExpression('≔', p.collect(f:/1))
					},
					'List' -> {
						SymbolicExpression('𝓛', p.collect(f:/1))
					},
					'Operator' -> {
						Symbol(p[1])
					},
					'Program' -> {
						SymbolicExpression('𝒫', p.collect(f:/1))
					},
					'ReservedIdentifier' -> {
						p[1].caseOf(
							[
								'false' -> { false },
								'nil' -> { nil },
								'true' -> { true }
							]
						)
					},
					'SmallFloat' -> {
						p[1].parseNumber
					},
					'SmallInteger' -> {
						p[1].parseSmallInteger(10)
					}
				]
			) {
				self.error('String>>splParseExpression: ' ++ o)
			}
		};
		f(tree)
	}

	splParseTree { :self |
		<primitive: return sl.rewriteSlToAst(_self);>
	}

	splSimplify { :self |
		<primitive: return sl.rewriteSlToCore(_self);>
	}

}
