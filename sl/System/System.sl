System : [Object] {

	allMethodNames { :self |
		self.methodDictionary.keys
	}

	allMethodSignatures { :self |
		self.methodDictionary.keys.collect { :methodName |
			self.methodSignatures(methodName)
		}.concatenation.sorted
	}

	doesTypeImplementMethod { :self :typeName :methodName |
		self.methodTypes(methodName).includes(typeName)
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

	method { :self :methodName :arity :typeName |
		self.methodDictionary[methodName][arity][typeName]
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
			('methodImplementations: not a method: ' ++ methodName).error
		}
	}

	methodImplementors { :self :methodName |
		system.methodImplementations(methodName).collect(origin:/1)
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

	methodTypes { :self :methodName |
		(* Types implementing methodName. *)
		self.isMethodName(methodName).if {
			self.methodDictionary[methodName].values.collect(keys:/1).concatenation
		} {
			('methodTypes: not a method: ' ++ methodName).error
		}
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
			('trait: not a trait: ' ++ traitName).error
		}
	}

	traitDictionary { :self |
		<primitive: return _self.traitDictionary;>
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
		self.isTypeName(typeName).if {
			self.typeDictionary[typeName].methodDictionary.values
		} {
			('typeMethods: not a type: ' ++ typeName).error
		}
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
		self.isTypeName(typeName).if {
			self.typeDictionary[typeName].traitArray
		} {
			('typeTraits: not a type: ' ++ typeName).error
		}
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
