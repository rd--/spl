+ IdentityDictionary {

	allMethodSignatures { :self |
		self.methodList.collect({ :methodName |
			self.methodSignatures(methodName)
		}).concatenation.sorted
	}

	doesTypeImplementMethod { :self :typeName :methodName |
		self.methodTypes(methodName).includes(typeName)
	}

	isMethodName { :self :aString |
		self.methodList.includes(aString)
	}

	isTypeName { :self :aString |
		self::typeDictionary.includesKey(aString)
	}

	method { :self :methodName :arity :typeName |
		self::methodTable[methodName][arity][typeName]
	}

	methodArities { :self :methodName |
		(* Arities methodName is implemented for. *)
		self::methodTable[methodName].keys
	}

	methodImplementations { :self :methodName |
		(* Each of the implementations of methodName. *)
		self.isMethodName(methodName).if {
			|
				answer = IdentityDictionary(),
				table = self::methodTable[methodName];
			|
			table.keysValuesDo { :arity :dictionary |
				answer.add(arity -> dictionary)
			};
			answer
		} {
			('methodImplementations: not a method: ' ++ methodName).error
		}
	}

	methodList { :self |
		self::methodTable.keys
	}

	methodPrintString { :self :methodName |
		(* Print string of implementations of methodName. *)
		| answer = OrderedCollection(); |
		self.methodImplementations(methodName).do { :dictionary |
			dictionary.associationsDo { :each |
				answer.add('+ ' ++ each.key ++ ' {\n\t' ++ methodName ++ ' ' ++ each.value.sourceCode ++ '\n}')
			}
		};
		answer
	}

	methodSignatures { :self :methodName |
		(* Signatures of each implementation of methodName. *)
		| answer = OrderedCollection(); |
		self.methodImplementations(methodName).do { :dictionary |
			dictionary.associationsDo { :each |
				|
					typeName = each.key,
					arity = each.value.arity,
					origin = each.value.origin,
					originNote = (origin = typeName).if { '' } { ' (@' ++ origin ++ ')' };
				|
				answer.add(typeName ++ '>>' ++ methodName ++ ':/' ++ arity ++ originNote)
			}
		};
		answer
	}

	methodTypes { :self :methodName |
		(* Types implementing methodName. *)
		self.isMethodName(methodName).if {
			self::methodTable[methodName].values.collect(keys:/1).concatenation
		} {
			('methodTypes: not a method: ' ++ methodName).error
		}
	}

	multipleArityMethodList { :self |
		self.methodList.select { :methodName |
			self.methodArities(methodName).size > 1
		}
	}

	onlyZeroArityMethodList { :self |
		(* Methods implemented by typeName. *)
		self.methodList.select { :methodName |
			self.methodArities(methodName) = [0]
		}
	}

	typeMethods { :self :typeName |
		(* Methods implemented by typeName. *)
		self.isTypeName(typeName).if {
			self::methodTable.keys.select { :methodName |
				self.methodTypes(methodName).includes(typeName)
			}
		} {
			'typeMethods: not a type'.error
		}
	}

}

+ @Object {

	respondsTo { :self :aMethod |
		system.doesTypeImplementMethod(self.typeOf, aMethod.methodName)
	}

}
