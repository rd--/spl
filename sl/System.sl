@Blob {

	arrayBuffer { :self |
		<primitive: return _self.arrayBuffer();>
	}

	isEmpty { :self |
		self.size = 0
	}

	slice { :self :start :end :contentType |
		<primitive: return _self.slice(_start, _end, _contentType);>
	}

	size { :self |
		<primitive: return _self.size;> (* Read only *)
	}

	text { :self |
		<primitive: return _self.text();>
	}

	type { :self |
		<primitive: return _self.type;> (* Read only *)
	}

}

Blob : [Object, Blob] {

}

+Array {

	Blob { :self |
		<primitive: return new Blob(_self);>
	}

	Blob { :self :options |
		<primitive: return new Blob(_self, _options);>
	}

}

+[ByteArray, Float64Array] {

	Blob { :self |
		[self].Blob
	}

}

File : [Object, Blob] {

	lastModified { :self |
		<primitive: return _self.lastModified;> (* Read only *)
	}

	name { :self |
		<primitive: return _self.name;> (* Read only *)
	}

}

LibraryItem : [Object] { | name url mimeType parser useLocalStorage value |

	key { :self |
		'sl/library/' ++ self.url.hostname ++ self.url.pathname
	}

	readLocalStorage { :self |
		| text = system.window.localStorage[self.key]; |
		self.mimeType.caseOfOtherwise([
			'application/json' -> {
				self.parser . (text.parseJson)
			},
			'text/plain' -> {
				self.parser . (text)
			}
		]) {
			self.error('readLocalStorage: unsupported mimeType')
		}
	}

	require { :self |
		('LibraryItem>>require' ++ self.name).postLine;
		Promise { :resolve:/1 :reject:/1 |
			self.value.ifNotNil {
				self.value.resolve
			} {
				system.window.localStorage.includesIndex(self.key).if {
					self.value := self.readLocalStorage;
					self.value.resolve
				} {
					system.window.fetchMimeType(self.url, self.mimeType, ()).then { :answer |
						self.useLocalStorage.ifTrue {
							self.writeLocalStorage(answer)
						};
						self.value := self.parser . (answer);
						self.value.resolve
					}
				}
			}
		}
	}

	writeLocalStorage { :self :anObject |
		self.mimeType.caseOfOtherwise([
			'application/json' -> {
				system.window.localStorage[self.key] := anObject.json
			},
			'text/plain' -> {
				system.window.localStorage[self.key] := anObject.asString
			}
		]) {
			self.error('writeLocalStorage: unsupported mimeType')
		}
	}

}

+String {

	LibraryItem { :name :url :mimeType :parser |
		newLibraryItem().initializeSlots(name, url.asUrl, mimeType, parser, true, nil)
	}

}

Method : [Object] {

	arity { :self |
		<primitive: return _self.arity;>
	}

	definition { :self |
		'	' ++ self.name ++ ' ' ++ self.sourceCode
	}

	definition { :self :aString |
		[
			'+',
			self.origin.qualifiedName,
			'{ ',
			aString,
			' }'
		].join.evaluate
	}

	name { :self |
		<primitive: return _self.name;>
	}

	origin { :self |
		<primitive: return _self.origin;>
	}

	procedure { :self |
		<primitive: return _self.procedure;>
	}

	pseudoSlotNameArray { :self |
		['name', 'procedure', 'arity', 'sourceCode', 'origin']
	}

	qualifiedName { :self |
		self.name ++ ':/' ++ self.arity
	}

	signature { :self |
		self.origin.qualifiedName ++ '>>' ++ self.qualifiedName
	}

	sourceCode { :self |
		<primitive: return _self.sourceCode;>
	}

}

+String {

	parseQualifiedMethodName { :self |
		| parts = self.splitBy(':/'); |
		(parts.size = 2).if {
			[parts[1], parts[2].parseInteger(10)]
		} {
			self.error('parseQualifiedMethodName')
		}
	}

	parseMethodSignature { :self |
		| parts = self.splitBy('>>'); |
		(parts.size = 2).if {
			parts
		} {
			self.error('parseMethodSignature')
		}
	}

}

System : [Object, Indexable, Random, SystemCache] {

	= { :self :anObject |
		self == anObject
	}

	addAllTraitMethodsTo { :self :aCollection |
		system.traitDictionary.values.do { :trait |
			trait.methodDictionary.values.do { :method |
				aCollection.add(method)
			}
		}
	}

	addAllTypeMethodsTo { :self :aCollection |
		system.typeDictionary.values.do { :trait |
			trait.methodDictionary.values.do { :method |
				aCollection.add(method)
			}
		}
	}

	addLibraryItem { :self :libraryItem |
		self.library.includesIndex(libraryItem.name).if {
			('System>>addLibraryItem: item exists: ' ++ libraryItem.name).postLine
		} {
			self.library[libraryItem.name] := libraryItem
		}
	}

	allMethods { :self |
		| answer = []; |
		system.addAllTraitMethodsTo(answer);
		system.addAllTypeMethodsTo(answer);
		answer
	}

	at { :self :index |
		self.globalDictionary.at(index)
	}

	atPut { :self :key :anObject |
		self.globalDictionary.atPut(key, anObject)
	}

	cache { :self |
		<primitive: return _self.cache;>
	}

	consoleClear { :self |
		<primitive: console.clear;>
	}

	consoleError { :self :message |
		<primitive: console.error(_message);>
	}

	consoleLog { :self :message |
		<primitive: console.log(_message);>
	}

	consoleWarn { :self :message |
		<primitive: console.warn(_message);>
	}

	doesTraitImplementMethod { :self :traitName :methodName |
		self.traitLookup(traitName).methodDictionary.anySatisfy { :each |
			each.name = methodName
		}
	}

	doesTypeImplementMethod { :self :typeName :methodName |
		self.typeLookup(typeName).methodDictionary.anySatisfy { :each |
			each.name = methodName
		}
	}

	globalDictionary { :self |
		<primitive: return _self.globalDictionary;>
	}

	indices { :self |
		self.globalDictionary.indices
	}

	isMethodName { :self :aString |
		self.methodDictionary.indices.includes(aString)
	}

	isTraitName { :self :aString |
		self.traitDictionary.includesIndex(aString)
	}

	isTraitOrTypeName { :self :aString |
		self.isTraitName(aString) | {
			self.isTypeName(aString)
		}
	}

	isTypeName { :self :aString |
		self.typeDictionary.includesIndex(aString)
	}

	library { :self |
		<primitive: return _self.library;>
	}

	methodArities { :self :methodName |
		(* Arities methodName is implemented for. *)
		self.methodDictionary[methodName].indices
	}

	methodArray { :self |
		self.allMethods
	}

	methodDictionary { :self |
		<primitive: return _self.methodDictionary;>
	}

	methodDo { :self :aProcedure:/1 |
		self.traitDictionary.do { :aTrait |
			aTrait.methodDictionary.do { :aMethod |
				aMethod.aProcedure
			}
		};
		self.typeDictionary.do { :aType |
			aType.methodDictionary.do { :aMethod |
				aMethod.aProcedure
			}
		}
	}

	methodImplementations { :self :methodName |
		(* Implementations of methodName. *)
		self.isMethodName(methodName).if {
			|(
				answer = Set(),
				table = self.methodDictionary[methodName]
			)|
			table.do { :dictionary |
				dictionary.do { :method |
					answer.add(method)
				}
			};
			answer.Array
		} {
			('methodImplementations: not a methodName: ' ++ methodName).error
		}
	}

	methodImplementors { :self :methodName |
		system.methodImplementations(methodName).collect(origin:/1)
	}

	methodLookupAtSignature { :self :signature |
		| [qualifiedOriginName, qualifiedMethodName] = signature.parseMethodSignature; |
		qualifiedOriginName.isQualifiedTraitName.if {
			self.traitDictionary[
				qualifiedOriginName.parseQualifiedTraitName
			].methodDictionary[
				qualifiedMethodName
			]
		} {
			self.typeDictionary[
				qualifiedOriginName
			].methodDictionary[
				qualifiedMethodName
			]
		}
	}

	methodLookupAtType { :self :methodName :arity :typeName |
		self.methodDictionary[methodName][arity][typeName]
	}

	methodPrintString { :self :methodName |
		(* Print string of implementations of methodName. *)
		| answer = []; |
		self.methodImplementations(methodName).do { :method |
			answer.add(
				[
					'+ ',
					method.origin.qualifiedName,
					' {\n\t',
					method.name,
					' ',
					method.sourceCode,
					'\n}'
				].join
			)
		};
		answer
	}

	methodSignatures { :self :methodName |
		(* Signatures of each implementation of methodName. *)
		self.methodImplementations(methodName).collect(signature:/1)
	}

	methodSourceCodeSearch { :self :aString |
		| answer = []; |
		self.methodDo { :aMethod |
			aMethod.sourceCode.includesSubstring(aString).ifTrue {
				answer.add(aMethod)
			}
		};
		answer
	}

	methodTraits { :self :qualifiedMethodName |
		self.traitDictionary.select { :each |
			each.methodDictionary.indices.includes(qualifiedMethodName)
		}.indices
	}

	methodTypes { :self :qualifiedMethodName |
		self.typeDictionary.select { :each |
			each.methodDictionary.indices.includes(qualifiedMethodName)
		}.indices
	}

	millisecondsToRun { :self :aProcedure:/0 |
		| beginTime = self.systemTimeInMilliseconds; |
		aProcedure();
		self.systemTimeInMilliseconds - beginTime
	}

	multipleArityMethodList { :self |
		self.methodDictionary.indices.select { :methodName |
			self.methodArities(methodName).size > 1
		}
	}

	nextUniqueId { :self |
		<primitive: return _self.nextUniqueId;>
	}

	nextUniqueId { :self :aNumber |
		<primitive: return _self.nextUniqueId = _aNumber;>
	}

	onlyZeroArityMethodList { :self |
		(* Methods implemented by typeName. *)
		self.methodDictionary.indices.select { :methodName |
			self.methodArities(methodName) = [0]
		}
	}

	operatorNameTable { :self |
		<primitive: return sl.operatorNameTable;>
	}

	pseudoSlotNameArray { :self |
		[
			'cache',
			'globalDictionary',
			'methodDictionary',
			'traitDictionary',
			'typeDictionary',
			'nextUniqueId',
			'window',
			'library',
			'transcript'
		]
	}

	randomFloat { :self |
		<primitive: return Math.random();>
	}

	requireLibraryItem { :self :name |
		system.library.includesIndex(name).if {
			system.library[name].require
		} {
			('System>>requireLibraryItem: does not exist: ' ++ name).postLine
		}
	}

	requireLibraryItems { :self :names |
		name.collect { :each |
			system.requireLibraryItem(each)
		}.Promise
	}

	traitDictionary { :self |
		<primitive: return _self.traitDictionary;>
	}

	traitLookup { :self :traitName |
		self.isTraitName(traitName).if {
			self.traitDictionary[traitName]
		} {
			self.error('trait: not a trait: ' ++ traitName)
		}
	}

	traitMethods { :self :traitName |
		self.traitLookup(traitName).methodDictionary.values
	}

	traitOrType { :self :traitOrTypeName |
		self.isTypeName(traitOrTypeName).if {
			self.typeDictionary[traitOrTypeName]
		} {
			self.isTraitName(traitOrTypeName).if {
				self.traitDictionary[traitOrTypeName]
			} {
				self.error('traitOrType: not a trait or type: ' ++ traitOrTypeName)
			}
		}
	}

	traitTypes { :self :traitName |
		self.isTraitName(traitName).if {
			self.typesImplementingTrait(traitName)
		} {
			self.error('traitTypes: not a trait: ' ++ traitName)
		}
	}

	transcript { :self |
		(* lazy initialiser, should probably initialise on system start *)
		<primitive:
		if(_self.transcript == null) {
			_self.transcript = _Transcript_0();
		}
		return _self.transcript;
		>
	}

	typeDictionary { :self |
		<primitive: return _self.typeDictionary;>
	}

	typeDirectMethodDictionary { :self :typeName |
		(* Methods implemented directly at typeName. *)
		self.typeLookup(typeName).methodDictionary
	}

	typeInheritedMethodDictionary { :self :typeName |
		(* Methods inherited from Traits at typeName (most specific only). *)
		| answer = (); |
		self.typeLookup(typeName).traitNameArray.do { :traitName |
			self.traitLookup(traitName).methodDictionary.valuesDo { :method |
				answer[method.qualifiedName] := method
			}
		};
		answer
	}

	typeLookup { :self :typeName |
		self.isTypeName(typeName).if {
			self.typeDictionary[typeName]
		} {
			self.error('typeLookup: not a type: ' ++ typeName)
		}
	}

	typeMethodDictionary { :self :typeName |
		self.typeInheritedMethodDictionary(typeName) ++ self.typeDirectMethodDictionary(typeName)
	}

	typeTraits { :self :typeName |
		self.typeLookup(typeName).traitNameArray
	}

	typesImplementingTrait { :self :traitName |
		system.typeDictionary.select { :each |
			each.traitNameArray.includes(traitName)
		}.indices
	}

	systemTimeInMilliseconds { :self |
		<primitive: return performance.now();>
	}

	systemTimeInSeconds { :self |
		<primitive: return performance.now() * 0.001;>
	}

	uncategorisedMethods { :self |
		system.methodDictionary.indices.collect { :each |
			each -> system.categoryDictionary.categoryOf('method', each)
		}.select { :each |
			each.value = '*Uncategorized*'
		}.collect(key:/1)
	}

	uniqueId { :self |
		| answer = self.nextUniqueId; |
		self.nextUniqueId := answer + 1;
		answer
	}

	unixTimeInMilliseconds { :self |
		<primitive: return Date.now();>
	}

	window { :self |
		<primitive: return _self.window;>
	}

}

+SmallFloat {

	cancel { :self |
		<primitive: clearTimeout(_self); return null;>
	}

}

+Procedure {

	once { :self |
		|(
			cache = system.cache.atIfAbsentPut('onceCache') {
				WeakMap()
			}
		)|
		cache.atIfAbsentPut(self) {
			self.value
		}
	}

	once { :self :where :key |
		where.cache.atIfAbsentPut(key) {
			self.value
		}
	}

}

+@Object {

	respondsTo { :self :aProcedure |
		system.typeMethodDictionary(self.typeOf).anySatisfy { :each |
			each.qualifiedName = aProcedure.name
		}
	}

}

+Procedure {

	benchForMilliseconds { :self:/0 :interval |
		|(
			t0 = system.systemTimeInMilliseconds,
			t1 = nil,
			t2 = t0 + interval,
			count = 1
		)|
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
		| [count, elapsedTime] = self.benchForMilliseconds(aDuration.milliseconds); |
		[
			(count / (elapsedTime / 1000)).roundTo(0.001), ' per second; ',
			((elapsedTime / 1000) / count).roundTo(0.001), ' per count'
		].join
	}

	evaluateAfterMilliseconds { :self:/0 :delayInMilliseconds |
		<primitive:
		if(!sl.isSmallFloat(_delayInMilliseconds)) {
			return Error('evaluateAfterMilliseconds: not a number');
		} else {
			return setTimeout(_self_0, _delayInMilliseconds);
		}
		>
	}

	evaluateAfterMillisecondsWith { :self:/1 :delayInMilliseconds :anObject |
		<primitive:
		if(!sl.isSmallFloat(_delayInMilliseconds)) {
			return Error('evaluateAfterMillisecondsWith: not a number');
		} else {
			return setTimeout(_self_1, _delayInMilliseconds, _anObject);
		}
		>
	}

	evaluateEveryMilliseconds { :self:/0 :delayInMilliseconds |
		<primitive:
		if(!sl.isSmallFloat(_delayInMilliseconds)) {
			return Error('evaluateEveryMilliseconds: not a number');
		} else {
			return setInterval(_self_0, _delayInMilliseconds);
		}
		>
	}

	millisecondsToRun { :self:/0 |
		| startTime = system.systemTimeInMilliseconds; |
		self();
		system.systemTimeInMilliseconds - startTime
	}

}

+String {

	asMethodName { :self |
		self.isOperatorName.if {
			self.operatorMethodName
		} {
			self
		}
	}

	categoryNameParts { :self |
		self.splitBy('/')
	}

	isOperatorName { :self |
		<primitive: return sl.isOperatorName(_self);>
	}

	operatorMethodName { :self |
		<primitive: return sl.operatorMethodName(_self);>
	}

}

Response : [Object] {

	arrayBuffer { :self |
		<primitive: return _self.arrayBuffer();>
	}

	blob { :self |
		<primitive: return _self.blob();>
	}

	byteArray { :self |
		<primitive:
		return _self.arrayBuffer().then(function(b) {
			return new Uint8Array(b);
		});
		>
	}

	mimeType { :self :mimeType |
		mimeType.caseOfOtherwise([
			'application/json' -> {
				self.json
			},
			'application/octet-stream' -> {
				self.byteArray
			},
			'text/plain' -> {
				self.text
			}
		]) { :unused |
			self.error('mimeType: unknown mimeType: ' ++ mimeType)
		}
	}

	json { :self |
		<primitive: return _self.json();>
	}

	text { :self |
		<primitive: return _self.text();>
	}

}


Storage : [Object, Collection, Dictionary] {

	length { :self | <primitive: return _self.length;> }
	key { :self :index | <primitive: return _self.key(_index);> }
	getItem { :self :key | <primitive: return _self.getItem(_key);> }
	setItem { :self :key :value | <primitive: return _self.setItem(_key, _value);> }
	removeAll { :self | <primitive: return _self.clear();> }
	removeItem { :self :key | <primitive: return _self.removeItem(_key);> }

	at { :self :key |
		self.getItem(key)
	}

	atPut { :self :key :value |
		self.setItem(key, value)
	}

	includesIndex { :self :key |
		self[key].notNil
	}

	indices { :self |
		(0 .. self.length - 1).collect { :index |
			self.key(index)
		}
	}

	size { :self |
		self.length
	}

}

Trait : [Object] {

	addMethodsTo { :self :aCollection |
		trait.methodDictionary.values.do { :method |
			aCollection.add(method)
		}
	}

	methodArray { :self |
		self.methodDictionary.values
	}

	methodDictionary { :self |
		<primitive: return _self.methodDictionary;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	pseudoSlotNameArray { :self |
		['name', 'methodDictionary']
	}

	printString { :self |
		self.qualifiedName
	}

	qualifiedName { :self |
		'@' ++ self.name
	}

}

+String {

	isQualifiedTraitName { :self |
		self[1] = '@'.Character
	}

	parseQualifiedTraitName { :self |
		self.isQualifiedTraitName.if {
			self.copyFromTo(2, self.size)
		} {
			self
		}
	}

}

TranscriptEntry : [Object] { | category message time |

}

+String {

	TranscriptEntry { :self :message |
		newTranscriptEntry().initializeSlots(self, message, system.unixTimeInMilliseconds)
	}

}

Transcript : [Object] { | entries |

	addError { :self :message |
		self.entries.add(TranscriptEntry('error', message));
		system.consoleError(message)
	}

	addNotification { :self :message |
		self.entries.add(TranscriptEntry('notification', message));
		system.consoleLog(message)
	}

	addWarning { :self :message |
		self.entries.add(TranscriptEntry('warning', message));
		system.consoleWarn(message)
	}

	removeAll { :self |
		system.consoleClear;
		self.entries.removeAll
	}

	errorMessages { :self |
		self.messages('error')
	}

	messages { :self :category |
		self.entries.selectThenCollect { :each |
			each.category = category
		} { :each |
			each.message
		}
	}

	notificationMessages { :self |
		self.messages('notification')
	}

	String { :self |
		self.entries.collect { :each |
			each.category ++ ': ' ++ each.message
		}.unlines
	}

	warningMessages { :self |
		self.messages('warning')
	}

}

+Void {

	Transcript {
		newTranscript().initializeSlots([])
	}

}

Type : [Object] {

	category { :self |
		system.categoryOf('type', self.name)
	}

	methodArray { :self |
		self.methodDictionary.values
	}

	methodDictionary { :self |
		<primitive: return _self.methodDictionary;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	printString { :self |
		self.qualifiedName
	}

	pseudoSlotNameArray { :self |
		['name', 'traitNameArray', 'slotNameArray', 'methodDictionary']
	}

	qualifiedName { :self |
		self.name
	}

	slotNameArray { :self |
		<primitive: return _self.slotNameArray;>
	}

	traitArray { :self |
		self.traitNameArray.collect { :each |
			system.traitLookup(each)
		}
	}

	traitNameArray { :self |
		<primitive: return _self.traitNameArray;>
	}

}


URL : [Object] {

	asUrl { :self |
		self
	}

	fetch { :self |
		<primitive: return fetch(_self);>
	}

	fetchText { :self |
		self.fetch.then { :response |
			response.text
		}
	}

	hash { :self |
		<primitive: return _self.hash;>
	}

	host { :self |
		<primitive: return _self.host;>
	}

	hostname { :self |
		<primitive: return _self.hostname;>
	}

	href { :self |
		<primitive: return _self.href;>
	}

	origin { :self |
		<primitive: return _self.origin;> (* Read only *)
	}

	password { :self |
		<primitive: return _self.password;>
	}

	pathname { :self |
		<primitive: return _self.pathname;>
	}

	port { :self |
		<primitive: return _self.port;>
	}

	protocol { :self |
		<primitive: return _self.protocol;>
	}

	search { :self |
		<primitive: return _self.search;>
	}

	searchParams { :self |
		<primitive: return _self.searchParams;>
	}

	terseGuideSummary { :self |
		self.fetchText.then { :text |
			text.terseGuideSummary
		}
	}

	username { :self |
		<primitive: return _self.username;> (* Read only *)
	}

}

+String {

	asFileUrl { :self |
		('file://' ++ self).asUrl
	}

	asUrl { :self |
		self.URL
	}

	decodeURI { :self |
		<primitive: return decodeURI(_self);>
	}

	decodeURIComponent { :self |
		<primitive: return decodeURIComponent(_self);>
	}

	encodeURI { :self |
		<primitive: return encodeURI(_self);>
	}

	encodeURIComponent { :self |
		<primitive: return encodeURIComponent(_self);>
	}

	revokeObjectURL { :self |
		<primitive: return URL.revokeObjectURL(_self);>
	}

	URL { :self |
		<primitive: return new URL(_self);>
	}

	URL { :self :base |
		<primitive: return new URL(_self, _base);>
	}

}

+[File, Blob] {

	createObjectURL { :self |
		<primitive: return URL.createObjectURL(_self);>
	}

}

URLSearchParams : [Object] {

	append { :self :name :value |
		<primitive: return _self.delete(_name, _value);>
	}

	delete { :self :name |
		<primitive: return _self.delete(_name);>
	}

	get { :self :name |
		<primitive: return _self.get(_name);>
	}

	has { :self :name |
		<primitive: return _self.has(_name);>
	}

}

+[String, Record] {

	URLSearchParams { :self |
		<primitive: return new URLSearchParams(_self);>
	}

}

Window : [Object] {

	alert { :self :aString |
		<primitive: return _self.alert(_aString);>
	}

	confirm { :self :aString |
		<primitive: return _self.confirm(_aString);>
	}

	fetch { :self :resource |
		<primitive: return _self.fetch(_resource);>
	}

	fetch { :self :resource :options |
		<primitive: return _self.fetch(_resource, _options);>
	}

	fetchBlob { :self :resource :options  |
		self.fetch(resource, options).then { :response  |
			response.blob
		}
	}

	fetchByteArray { :self :resource :options  |
		self.fetch(resource, options).then { :response  |
			response.byteArray
		}
	}

	fetchJson { :self :resource :options  |
		self.fetch(resource, options).then { :response  |
			response.json
		}
	}

	fetchMimeType { :self :resource :mimeType :options  |
		self.fetch(resource, options).then { :response  |
			mimeType.caseOfOtherwise([
				'application/json' -> {
					response.json
				},
				'text/plain' -> {
					response.text
				}
			]) { :unused  |
				self.error('fetchMimeType: unknown mimeType: ' ++ mimeType)
			}
		}
	}

	fetchString { :self :resource :options  |
		self.fetch(resource, options).then { :response  |
			response.text
		}
	}

	localStorage { :self |
		<primitive: return _self.localStorage;>
	}

	location { :self |
		<primitive: return _self.location;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	navigator { :self |
		<primitive: return _self.navigator;>
	}

	prompt { :self :message :defaultValue |
		<primitive: return _self.prompt(_message, _defaultValue);>
	}

	pseudoSlotNameArray { :self |
		['localStorage', 'location', 'name', 'navigator', 'sessionStorage']
	}

	sessionStorage { :self |
		<primitive: return _self.sessionStorage;>
	}

}
