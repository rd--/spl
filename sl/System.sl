@Blob {

	size { :self | <primitive: return _self.size;> } (* read only *)
	type { :self | <primitive: return _self.type;> } (* read only *)

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

	lastModified { :self | <primitive: return _self.lastModified;> } (* read only *)
	name { :self | <primitive: return _self.name;> } (* read only *)

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

	allMethods { :self |
		| answer = OrderedCollection(); |
		system.addAllTraitMethodsTo(answer);
		system.addAllTypeMethodsTo(answer);
		answer
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

	methodArities { :self :methodName |
		(* Arities methodName is implemented for. *)
		self.methodDictionary[methodName].keys
	}

	methodDictionary { :self |
		<primitive: return _self.methodDictionary;>
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

	randomFloat { :self |
		<primitive: return Math.random();>
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

	json { :self |
		<primitive: return _self.json();>
	}

	text { :self |
		<primitive: return _self.text();>
	}

}

Trait : [Object] {

	methodDictionary { :self |
		<primitive: return _self.methodDictionary;>
	}

	name { :self |
		<primitive: return _self.name;>
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

	methodDictionary { :self |
		<primitive: return _self.methodDictionary;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	printString { :self |
		self.qualifiedName
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
	origin { :self | <primitive: return _self.origin;> } (* read only *)
	href { :self | <primitive: return _self.href;> }
	password { :self | <primitive: return _self.password;> }
	pathname { :self | <primitive: return _self.pathname;> }
	port { :self | <primitive: return _self.port;> }
	protocol { :self | <primitive: return _self.protocol;> }
	search { :self | <primitive: return _self.search;> }
	searchParams { :self | <primitive: return _self.searchParams;> } (* read only *)
	username { :self | <primitive: return _self.username;> }

}

+String {

	decodeURI { :self | <primitive: return decodeURI(_self);> }
	decodeURIComponent { :self | <primitive: return decodeURIComponent(_self);> }
	encodeURI { :self | <primitive: return encodeURI(_self);> }
	encodeURIComponent { :self | <primitive: return encodeURIComponent(_self);> }
	revokeObjectURL { :self | <primitive: return URL.revokeObjectURL(_self);> }
	URL { :self | <primitive: return new URL(_self);> }
	URL { :self :base | <primitive: return new URL(_self, _base);> }

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

	fetchString { :self :resource :options |
		self.fetch(resource, options).then { :response |
			response.text
		}
	}

}
