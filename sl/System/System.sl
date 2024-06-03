System! : [Object, Cache, Indexable, Random] {

	= { :self :anObject |
		self == anObject
	}

	at { :self :index |
		self.globalDictionary[index]
	}

	atPut { :self :key :anObject |
		self.globalDictionary[key] := anObject
	}

	cache { :self |
		<primitive: return _self.cache;>
	}

	consoleClear { :self |
		<primitive:
		console.clear;
		return null;
		>
	}

	consoleError { :self :message |
		<primitive:
		console.error(_message);
		return null;
		>
	}

	consoleNotification { :self :message |
		<primitive:
		console.log(_message);
		return null;
		>
	}

	consoleWarning { :self :message |
		<primitive:
		console.warn(_message);
		return null;
		>
	}

	evaluateOrSignalError { :self :aString |
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
			system.consoleError(err)
		}
	}

	globalDictionary { :self |
		self.cached('globalDictionary') {
			()
		}
	}

	indices { :self |
		self.globalDictionary.indices
	}

	loadFile { :self :fileName |
		<primitive: evaluateFile(_fileName);>
	}

	loadUrl { :self :url |
		<primitive: evaluateUrl(_url);>
	}

	localStorage { :self |
		self.window.localStorage
	}

	localTimeZoneOffsetInMinutes { :self |
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

	nextUniqueId { :self |
		self.cached('nextUniqueId') {
			1
		}
	}

	nextUniqueId { :self :aNumber |
		self.cached::nextUniqueId := aNumber
	}

	operatorCharacterNameTable { :self |
		<primitive: return sl.operatorCharacterNameTable;>
	}

	operatorNameTable { :self |
		let table = self.operatorCharacterNameTable;
		self.cached('operatorNameTable') {
			[
				'+ ++ * - -> / // & && | ||',
				'< << <= <~ <=> > >> >= >~ = == ==>',
				'% ! !~ \\ \\\\ ~ ~~ ~= ~? ? ?? ^'
			].collect(words:/1).++.collect { :each |
				each -> each.stringList.collect { :letter |
					table[letter]
				}.camelCase.stringJoin
			}.asRecord
		}
	}

	packageDictionary { :self |
		<primitive: return _self.packageDictionary;>
	}

	postLine { :self :aString |
		system.consoleNotification(aString)
	}

	preference { :self :path :defaultValue |
		self.preferencesReadPath(path.splitBy('/'), defaultValue)
	}

	preferences { :self |
		self.cached('preferences') {
			()
		}
	}

	preferencesRead { :self :key :defaultValue |
		<primitive: return sl.preferencesRead(_preferences_1(_self), _key, _defaultValue);>
	}

	preferencesReadPath { :self :path :defaultValue |
		path.isEmpty.if {
			self.error('System>>preferencesReadPath: empty path')
		} {
			let item = self.preferencesRead(path[1], nil);
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

	pseudoSlotNameList { :self |
		[
			'cache',
			'methodDictionary',
			'traitDictionary',
			'typeDictionary',
			'packageDictionary',
			'window',
			'library', {- Package -}
			'transcript' {- Package -}
		]
	}

	nextRandomFloat { :self |
		<primitive: return Math.random();>
	}

	nextRandomFloat { :self :count |
		{ system.nextRandomFloat } ! count
	}

	randomByteArray { :self :n |
		<primitive:
		let bytes = new Uint8Array(_n);
		crypto.getRandomValues(bytes);
		return bytes;
		>
	}

	sessionStorage { :self |
		self.window.sessionStorage
	}

	smallFloatEpsilon { :self |
		<primitive: return Number.EPSILON;>
	}

	traitDictionary { :self |
		<primitive: return _self.traitDictionary;>
	}

	typeDictionary { :self |
		<primitive: return _self.typeDictionary;>
	}

	systemTimeInMilliseconds { :self |
		<primitive: return performance.now();>
	}

	systemTimeInSeconds { :self |
		<primitive: return performance.now() * 0.001;>
	}

	uniqueId { :self |
		let answer = self.cached('uniqueId') { 1 };
		self.cache::uniqueId := answer + 1;
		answer
	}

	unixTimeInMilliseconds { :self |
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
