@Blob {

	size { :self | <primitive: return _self.size;> } (* Read only *)
	type { :self | <primitive: return _self.type;> } (* Read only *)

	arrayBuffer { :self | <primitive: return _self.arrayBuffer();> }
	slice { :self :start :end :contentType | <primitive: return _self.slice(_start, _end, _contentType);> }
	text { :self | <primitive: return _self.text();> }

}

Blob : [Object, Blob] {

}

+Array {

	Blob { :self | <primitive: return new Blob(_self);> }
	Blob { :self :options | <primitive: return new Blob(_self, _options);> }

}

+[ByteArray, Float64Array] {

	Blob { :self |
		[self].Blob
	}

}

File : [Object, Blob] {

	lastModified { :self | <primitive: return _self.lastModified;> } (* Read only *)
	name { :self | <primitive: return _self.name;> } (* Read only *)

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
			'LibraryItem>>readLocalStorage: unsupported mimeType'.error
		}
	}

	require { :self |
		('LibraryItem>>require' ++ self.name).postLine;
		Promise { :resolve:/1 :reject:/1 |
			self.value.notNil.if {
				self.value.resolve
			} {
				system.window.localStorage.includesKey(self.key).if {
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
			'LibraryItem>>writeLocalStorage: unsupported mimeType'.error
		}
	}

}

+String {

	LibraryItem { :name :url :mimeType :parser |
		newLibraryItem().initializeSlots(name, url.Url, mimeType, parser, true, nil)
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
		].join.eval
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
			('String>>parseQualifiedMethodName: ' ++ self).error
		}
	}

	parseMethodSignature { :self |
		| parts = self.splitBy('>>'); |
		(parts.size = 2).if {
			parts
		} {
			('String>>parseMethodSignature: ' ++ self).error
		}
	}

}

System : [Object] {

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
		self.library.includesKey(libraryItem.name).if {
			('System>>addLibraryItem: item exists: ' ++ libraryItem.name).postLine
		} {
			self.library[libraryItem.name] := libraryItem
		}
	}

	allMethods { :self |
		| answer = OrderedCollection(); |
		system.addAllTraitMethodsTo(answer);
		system.addAllTypeMethodsTo(answer);
		answer.sharedArray
	}

	categoriesOf { :self :entry |
		self.categoryDictionary.keys.select { :each |
			self.categoryDictionary[each].includes(entry)
		}
	}

	categorize { :self :categoryName :entry |
		self.categoryDictionary.includesKey(categoryName).if {
			self.categoryDictionary[categoryName].add(entry)
		} {
			self.categoryDictionary[categoryName] := [entry].IdentitySet
		}
	}

	categorizeAll { :self :categoryName :entryArray |
		| simpleCategtory = categoryName.splitBy('-').first; |
		self.categoryDictionary.includesKey(simpleCategtory).if {
			self.categoryDictionary[simpleCategtory].addAll(entryArray)
		} {
			self.categoryDictionary[simpleCategtory] := entryArray.IdentitySet
		}
	}

	categorizeDictionary { :self :aDictionary |
		aDictionary.keysAndValuesDo { :key :value |
			self.categorizeAll(key, value)
		}
	}

	category { :self :categoryName |
		self.isCategoryName(categoryName).if {
			self.categoryDictionary[categoryName]
		} {
			('System>>category: not a category: ' ++ categoryName).error
		}
	}

	categoryOf { :self :aString |
		| all = self.categoriesOf(aString); |
		all.size.caseOfOtherwise([
			0 -> {
				self.categorize('*Uncategorized*', aString);
				'*Uncategorized*'
			},
			1 -> {
				all[1]
			}
		]) {
			('System>>categoryOf: multiple categories: ' ++ aString).error
		}
	}

	categoryDictionary { :self |
		<primitive: return _self.categoryDictionary;>
	}

	doesTraitImplementMethod { :self :traitName :methodName |
		self.traitMethods(traitName).collect(name:/1).includes(methodName)
	}

	doesTypeImplementMethod { :self :typeName :methodName |
		self.typeMethods(typeName).collect(name:/1).includes(methodName)
	}

	isCategorized { :self :aString |
		self.categoryDictionary.anySatisfy { :each |
			each.includes(aString)
		}
	}

	isCategoryName { :self :aString |
		self.categoryDictionary.includesKey(aString)
	}

	isMethodName { :self :aString |
		self.methodDictionary.keys.includes(aString)
	}

	isTraitName { :self :aString |
		self.traitDictionary.includesKey(aString)
	}

	isTraitOrTypeName { :self :aString |
		self.isTraitName(aString) | {
			self.isTypeName(aString)
		}
	}

	isTypeName { :self :aString |
		self.typeDictionary.includesKey(aString)
	}

	library { :self |
		<primitive: return _self.library;>
	}

	methodArities { :self :methodName |
		(* Arities methodName is implemented for. *)
		self.methodDictionary[methodName].keys
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
			|
				answer = IdentitySet(),
				table = self.methodDictionary[methodName];
			|
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
		| answer = OrderedCollection(); |
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
		| answer = OrderedCollection(); |
		self.methodDo { :aMethod |
			aMethod.sourceCode.includesSubstring(aString).ifTrue {
				answer.add(aMethod)
			}
		};
		answer.sharedArray
	}

	methodTraits { :self :qualifiedMethodName |
		self.traitDictionary.select { :each |
			each.methodDictionary.keys.includes(qualifiedMethodName)
		}.keys
	}

	methodTypes { :self :qualifiedMethodName |
		self.typeDictionary.select { :each |
			each.methodDictionary.keys.includes(qualifiedMethodName)
		}.keys
	}

	multipleArityMethodList { :self |
		self.methodDictionary.keys.select { :methodName |
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
		self.methodDictionary.keys.select { :methodName |
			self.methodArities(methodName) = [0]
		}
	}

	pseudoSlotNameArray { :self |
		[
			'methodDictionary',
			'traitDictionary',
			'typeDictionary',
			'categoryDictionary',
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
		system.library.includesKey(name).if {
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
			('System>>trait: not a trait: ' ++ traitName).error
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
				('System>>traitOrType: not a trait or type: ' ++ traitOrTypeName).error
			}
		}
	}

	traitTypes { :self :traitName |
		self.isTraitName(traitName).if {
			self.typesImplementingTrait(traitName)
		} {
			('traitTypes: not a trait: ' ++ traitName).error
		}
	}

	transcript { :self |
		<primitive: return _self.transcript;>
	}

	typeLookup { :self :typeName |
		self.isTypeName(typeName).if {
			self.typeDictionary[typeName]
		} {
			('type: not a type: ' ++ typeName).error
		}
	}

	typeDictionary { :self |
		<primitive: return _self.typeDictionary;>
	}

	typeMethods { :self :typeName |
		(* Methods implemented directly at typeName, i.e. non-Trait methods. *)
		self.typeLookup(typeName).methodDictionary.values
	}

	typeMethodSet { :self :typeName |
		| type = self.typeLookup(typeName), answer = IdentitySet(); |
		type.traitNameArray.do { :traitName |
			self.traitLookup(traitName).methodDictionary.valuesDo { :method |
				answer.add(method)
			}
		};
		type.methodDictionary.valuesDo { :method |
			answer.add(method)
		};
		answer
	}

	typeTraits { :self :typeName |
		self.typeLookup(typeName).traitNameArray
	}

	typesImplementingTrait { :self :traitName |
		system.typeDictionary.select { :each |
			each.traitNameArray.includes(traitName)
		}.keys
	}

	systemTimeInMilliseconds { :self |
		<primitive: return performance.now();>
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

+@Object {

	respondsTo { :self :aProcedure |
		system.typeMethodSet(self.typeOf).anySatisfy { :each |
			each.qualifiedName = aProcedure.name
		}
	}

}

+Procedure {

	evaluateAfterMilliseconds { :self :delayMilliseconds |
		<primitive: return setTimeout(_self, _delayMilliseconds);>
	}

	evaluateAfterMillisecondsWith { :self :delayMilliseconds :anObject |
		<primitive: return setTimeout(_self, _delayMilliseconds, _anObject);>
	}

	evaluateEveryMilliseconds { :self :delayMilliseconds |
		<primitive: return setInterval(_self, _delayMilliseconds);>
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
			('Response>>mimeType: unknown mimeType: ' ++ mimeType).error
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
	removeItem { :self :key | <primitive: return _self.removeItem(_key);> }
	clear { :self | <primitive: return _self.clear();> }

	at { :self :key |
		self.getItem(key)
	}

	atPut { :self :key :value |
		self.setItem(key, value)
	}

	includesKey { :self :key |
		self[key].notNil
	}

	keys { :self |
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
		self[1] = '@'
	}

	parseQualifiedTraitName { :self |
		self.isQualifiedTraitName.if {
			self.copyFromTo(2, self.size)
		} {
			self
		}
	}

}

Type : [Object] {

	category { :self |
		system.categoryOf(self.name)
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

	hash { :self | <primitive: return _self.hash;> }
	host { :self | <primitive: return _self.host;> }
	hostname { :self | <primitive: return _self.hostname;> }
	href { :self | <primitive: return _self.href;> }
	origin { :self | <primitive: return _self.origin;> } (* Read only *)
	password { :self | <primitive: return _self.password;> }
	pathname { :self | <primitive: return _self.pathname;> }
	port { :self | <primitive: return _self.port;> }
	protocol { :self | <primitive: return _self.protocol;> }
	search { :self | <primitive: return _self.search;> }
	searchParams { :self | <primitive: return _self.searchParams;> } (* Read only *)
	username { :self | <primitive: return _self.username;> }

	Url { :self |
		self
	}

}

+String {

	decodeURI { :self | <primitive: return decodeURI(_self);> }
	decodeURIComponent { :self | <primitive: return decodeURIComponent(_self);> }
	encodeURI { :self | <primitive: return encodeURI(_self);> }
	encodeURIComponent { :self | <primitive: return encodeURIComponent(_self);> }
	revokeObjectURL { :self | <primitive: return URL.revokeObjectURL(_self);> }
	URL { :self | <primitive: return new URL(_self);> }
	URL { :self :base | <primitive: return new URL(_self, _base);> }

	Url { :self |
		self.URL
	}

}

+[File, Blob] {

	createObjectURL { :self | <primitive: return URL.createObjectURL(_self);> }

}

URLSearchParams : [Object] {

	append { :self :name :value | <primitive: return _self.delete(_name, _value);> }
	delete { :self :name | <primitive: return _self.delete(_name);> }
	get { :self :name | <primitive: return _self.get(_name);> }
	has { :self :name | <primitive: return _self.has(_name);> }

}

+[String, StringDictionary] {

	URLSearchParams { :self | <primitive: return new URLSearchParams(_self);> }

}

Window : [Object] {

	alert { :self :aString | <primitive: return _self.alert(_aString);> }
	confirm { :self :aString | <primitive: return _self.confirm(_aString);> }
	fetch { :self :resource | <primitive: return _self.fetch(_resource);> }
	fetch { :self :resource :options | <primitive: return _self.fetch(_resource, _options);> }
	localStorage { :self | <primitive: return _self.localStorage;> }
	location { :self | <primitive: return _self.location;> }
	name { :self | <primitive: return _self.name;> }
	navigator { :self | <primitive: return _self.navigator;> }
	prompt { :self :message :defaultValue | <primitive: return _self.prompt(_message, _defaultValue);> }
	sessionStorage { :self | <primitive: return _self.sessionStorage;> }

	fetchBlob { :self :resource :options |
		self.fetch(resource, options).then { :response |
			response.blob
		}
	}

	fetchByteArray { :self :resource :options |
		self.fetch(resource, options).then { :response |
			response.byteArray
		}
	}

	fetchJson { :self :resource :options |
		self.fetch(resource, options).then { :response |
			response.json
		}
	}

	fetchMimeType { :self :resource :mimeType :options |
		self.fetch(resource, options).then { :response |
			mimeType.caseOfOtherwise([
				'application/json' -> {
					response.json
				},
				'text/plain' -> {
					response.text
				}
			]) { :unused |
				('fetchMimeType: unknown mimeType: ' ++ mimeType).error
			}
		}
	}

	fetchString { :self :resource :options |
		self.fetch(resource, options).then { :response |
			response.text
		}
	}

	pseudoSlotNameArray { :self |
		['localStorage', 'location', 'name', 'navigator', 'sessionStorage']
	}

}
