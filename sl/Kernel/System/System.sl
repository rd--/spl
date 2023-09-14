System! : [Object, Cache, Indexable, Random] {

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

	allMethods { :self |
		| answer = []; |
		system.addAllTraitMethodsTo(answer);
		system.addAllTypeMethodsTo(answer);
		answer
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
		self.cached('globalDictionary') {
			()
		}
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

	localStorage { :self |
		self.window.localStorage
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
					answer.include(method)
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
		self.cached('nextUniqueId') {
			1
		}
	}

	nextUniqueId { :self :aNumber |
		self.cached::nextUniqueId := aNumber
	}

	onlyZeroArityMethodList { :self |
		(* Methods implemented by typeName. *)
		self.methodDictionary.indices.select { :methodName |
			self.methodArities(methodName) = [0]
		}
	}

	operatorCharacterNameTable { :self |
		<primitive: return sl.operatorCharacterNameTable;>
	}

	operatorNameTable { :self |
		| table = self.operatorCharacterNameTable; |
		self.cached('operatorNameTable') {
			'+ ++ * - -> / // & && | || < << <= <~ <=> > >> >= >~ = == ==> % ! !~ \\ \\\\ ~ ~~ ~= ? ?? ^'.words.collect { :each |
				each -> each.stringArray.collect { :letter |
					table[letter]
				}.camelCase.join
			}.Record
		}
	}

	packageMethods { :self :packageName |
		| answer = []; |
		self.methodDo { :each |
			(each.packageName = packageName).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	packageTypes { :self :packageName |
		self.typeDictionary.select { :each |
			each.packageName = packageName
		}
	}

	packageTraits { :self :packageName |
		self.traitDictionary.select { :each |
			each.packageName = packageName
		}.values
	}

	packageTypes { :self :packageName |
		self.typeDictionary.select { :each |
			each.packageName = packageName
		}.values
	}

	pseudoSlotNameArray { :self |
		[
			'cache',
			'globalDictionary',
			'methodDictionary',
			'traitDictionary',
			'typeDictionary',
			'window',
			'library', (* Package *)
			'transcript' (* Package *)
		]
	}

	randomFloat { :self |
		<primitive: return Math.random();>
	}

	sessionStorage { :self |
		self.window.sessionStorage
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
		| answer = self.cached('uniqueId') { 1 }; |
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

+SmallFloat {

	cancel { :self |
		<primitive: clearTimeout(_self); return null;>
	}

}

+Procedure {

	once { :self |
		|(
			cache = system.cached('onceCache') {
				WeakMap()
			}
		)|
		cache.atIfAbsentPut(self) {
			self.value
		}
	}

	once { :self :where :key |
		where.cached(key) {
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
			count +:= 1
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
