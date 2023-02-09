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

	categoriesOf { :self :value |
		self.categoryDictionary.keys.select { :each |
			self.categoryDictionary[each].includes(value)
		}
	}

	categorise { :self :key :value |
		key.isValidCategoryName.if {
			self.categoryDictionary.includesKey(key).if {
				self.categoryDictionary[key].add(value)
			} {
				self.categoryDictionary[key] := [value].IdentitySet
			}
		} {
			('categorise: not a valid category name: ' ++ key).error
		}
	}

	categoriseAll { :self :key :valueArray |
		key.isValidCategoryName.if {
			self.categoryDictionary.includesKey(key).if {
				self.categoryDictionary[key].addAll(valueArray)
			} {
				self.categoryDictionary[key] := valueArray.IdentitySet
			}
		} {
			('categoriseAll: not a valid category name: ' ++ key).error
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

	isCategorised { :self :aString |
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

	methodLookup { :self :methodName :arity :typeName |
		self.methodDictionary[methodName][arity][typeName]
	}

	methodPrintString { :self :methodName |
		(* Print string of implementations of methodName. *)
		| answer = OrderedCollection(); |
		self.methodImplementations(methodName).do { :method |
			answer.add('+ ' ++ method.origin.prefixedName ++ ' {\n\t' ++ method.name ++ ' ' ++ method.sourceCode ++ '\n}')
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

	trait { :self :traitName |
		self.isTraitName(traitName).if {
			self.traitDictionary[traitName]
		} {
			('System>>trait: not a trait: ' ++ traitName).error
		}
	}

	traitDictionary { :self |
		<primitive: return _self.traitDictionary;>
	}

	traitMethods { :self :traitName |
		self.trait(traitName).methodDictionary.values
	}

	traitOrType { :self :traitOrTypeName |
		self.isTraitName(traitOrTypeName).if {
			self.traitDictionary[traitOrTypeName]
		} {
			self.isTypeName(traitOrTypeName).if {
				self.typeDictionary[traitOrTypeName]
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

	type { :self :typeName |
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
		self.type(typeName).methodDictionary.values
	}

	typeProtocols { :self :typeName |
		(* Methods understood by typeName. *)
		self.isTypeName(typeName).if {
			self.methodDictionary.keys.select { :methodName |
				self.methodTypes(methodName).includes(typeName)
			}
		} {
			'typeProtocols: not a type'.error
		}
	}

	typeTraits { :self :typeName |
		self.type(typeName).traitArray
	}

	typesImplementingTrait { :self :traitName |
		system.typeDictionary.select { :each |
			each.traitArray.includes(traitName)
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

+ Number {

	cancel { :self |
		<primitive: clearTimeout(_self); return null;>
	}

}

+ @Object {

	respondsTo { :self :aMethod |
		system.doesTypeImplementMethod(self.typeOf, aMethod.methodName)
	}

}

+ Procedure {

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

+ String {

	categoryNameParts { :self |
		self.splitRegExp(RegExp('(?<=/)', 'g'))
	}

	isValidCategoryName { :self |
		self.last = '/'
	}

}
