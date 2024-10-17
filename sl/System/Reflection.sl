/* Requires: System */

+System {

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
		let answer = [];
		system.addAllTraitMethodsTo(answer);
		system.addAllTypeMethodsTo(answer);
		answer
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

	methodArities { :self :methodName |
		/* Arities methodName is implemented for. */
		self.methodDictionary[methodName].indices
	}

	methodList { :self |
		self.allMethods
	}

	methodDo { :self :aBlock:/1 |
		self.traitDictionary.do { :aTrait |
			aTrait.methodDictionary.do { :aMethod |
				aMethod.aBlock
			}
		};
		self.typeDictionary.do { :aType |
			aType.methodDictionary.do { :aMethod |
				aMethod.aBlock
			}
		}
	}

	methodImplementations { :self :methodName |
		/* Implementations of methodName. */
		self.isMethodName(methodName).if {
			let answer = Set();
			let table = self.methodDictionary[methodName];
			table.do { :dictionary |
				dictionary.do { :method |
					answer.basicInclude(method)
				}
			};
			answer.asList
		} {
			self.error('System>>methodImplementations: not a methodName: ' ++ methodName)
		}
	}

	methodImplementors { :self :methodName |
		system.methodImplementations(methodName).collect(origin:/1)
	}

	methodLookupAtSignature { :self :signature |
		let [qualifiedOriginName, qualifiedMethodName] = signature.parseMethodSignature;
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
		/* Print string of implementations of methodName. */
		let answer = [];
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
		/* Signatures of each implementation of methodName. */
		self.methodImplementations(methodName).collect(signature:/1)
	}

	methodSourceCodeSearch { :self :aString |
		let answer = [];
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

	multipleArityMethodList { :self |
		self.methodDictionary.indices.select { :methodName |
			self.methodArities(methodName).size > 1
		}
	}

	onlyZeroArityMethodList { :self |
		/* Methods implemented by typeName. */
		self.methodDictionary.indices.select { :methodName |
			self.methodArities(methodName) = [0]
		}
	}

	packageMethods { :self :packageName |
		let answer = [];
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

	traitLookup { :self :traitName |
		self.isTraitName(traitName).if {
			self.traitDictionary[traitName]
		} {
			self.error('System>>traitLookup: no such trait: ' ++ traitName)
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
				self.error('System>>traitOrType: not such trait or type: ' ++ traitOrTypeName)
			}
		}
	}

	traitTypes { :self :traitName |
		self.isTraitName(traitName).if {
			self.typesImplementingTrait(traitName)
		} {
			self.error('System>>traitTypes: no such trait: ' ++ traitName)
		}
	}

	typeDirectMethodDictionary { :self :typeName |
		/* Methods implemented directly at typeName. */
		self.typeLookup(typeName).methodDictionary
	}

	typeInheritedMethodDictionary { :self :typeName |
		/* Methods inherited from Traits at typeName, most specific only. */
		let answer = ();
		self.typeLookup(typeName).traitNameList.do { :traitName |
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
			self.error('System>>typeLookup: not a type: ' ++ typeName)
		}
	}

	typeMethodDictionary { :self :typeName |
		self.typeInheritedMethodDictionary(typeName) ++ self.typeDirectMethodDictionary(typeName)
	}

	typeTraits { :self :typeName |
		self.typeLookup(typeName).traitNameList
	}

	typesImplementingTrait { :self :traitName |
		system.typeDictionary.select { :each |
			each.traitNameList.includes(traitName)
		}.indices
	}

	uncategorisedMethods { :self |
		system.methodDictionary.indices.collect { :each |
			each -> system.categoryDictionary.categoryOf('method', each)
		}.select { :each |
			each.value = '*Uncategorized*'
		}.collect(key:/1)
	}

}

+@Object {

	respondsTo { :self :aBlock |
		system.typeMethodDictionary(self.typeOf).anySatisfy { :each |
			each.qualifiedName = aBlock.name
		}
	}

}
