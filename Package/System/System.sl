System! : [Object, Cache, Indexable, RandomNumberGenerator] {

	= { :self :anObject |
		self == anObject
	}

	at { :self :index |
		self.globalDictionary[index]
	}

	atPut { :self :key :anObject |
		self.globalDictionary[key] := anObject
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

	globalDictionary { :self |
		self.cached('globalDictionary') {
			()
		}
	}

	homeDirectory { :self |
		self.environmentVariable('HOME').ifNil {
			self.error('homeDirectory: not set')
		}
	}

	indices { :self |
		self.globalDictionary.indices
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

	millisecondsToRun { :self :aBlock:/0 |
		let beginTime = self.systemTimeInMilliseconds;
		aBlock();
		self.systemTimeInMilliseconds - beginTime
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
				each -> each.operatorName(table)
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
			Sfc32(self.unixTimeInMilliseconds)
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

	splDirectory { :self |
		self.environmentVariable('SPL_DIR').ifNil {
			self.error('splDirectory: not set')
		}
	}

	splFile { :self :aString |
		[
			self.splDirectory,
			aString
		].join('/')
	}

	traitDictionary { :self |
		<primitive: return _self.traitDictionary;>
	}

	typeDictionary { :self |
		<primitive: return _self.typeDictionary;>
	}

	systemTimeInMilliseconds { :unused |
		<primitive: return performance.now();>
	}

	systemTimeInSeconds { :unused |
		<primitive: return performance.now() * 0.001;>
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

	benchForMilliseconds { :self:/0 :interval |
		let t0 = system.systemTimeInMilliseconds;
		let t1 = nil;
		let t2 = t0 + interval;
		let count = 1;
		self();
		{
			t1 := system.systemTimeInMilliseconds;
			t1 < t2
		}.whileTrue {
			self();
			count := count + 1
		};
		[count, t1 - t0]
	}


	benchFor { :self :aDuration |
		let [count, elapsedTime] = self.benchForMilliseconds(aDuration.milliseconds);
		[
			(count / (elapsedTime / 1000)).roundTo(0.001), ' per second; ',
			((elapsedTime / 1000) / count).roundTo(0.001), ' per count'
		].stringJoin
	}

	millisecondsToRun { :self:/0 |
		let startTime = system.systemTimeInMilliseconds;
		self();
		system.systemTimeInMilliseconds - startTime
	}

}

+[SmallFloat, String] {

	seedRandom { :self |
		system.seedRandom(self)
	}

}

+String {

	isOperator { :self |
		<primitive: return sl.isOperator(_self);>
	}

	isPunctuationCharacter { :self |
		<primitive: return sl.isPunctuationCharacter(_self);>
	}

	isPunctuationToken { :self |
		<primitive: return sl.isPunctuationToken(_self);>
	}

	operatorName { :self :table |
		self.isOperator.if {
			self.contents.collect { :letter |
				table[letter]
			}.camelCase.join('')
		} {
			self.error('operatorName: not operator')
		}
	}

	operatorName { :self |
		self.operatorName(system.punctuationCharacterNameTable)
	}

	punctuationTokenName { :self :table |
		self.contents.collect { :letter |
			table[letter]
		}.camelCase.join('')
	}

	punctuationTokenName { :self |
		self.punctuationTokenName(system.punctuationCharacterNameTable)
	}

}
