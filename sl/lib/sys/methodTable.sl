+ String {

	doesTypeImplementMethod { :self :methodName |
		(* Do I implement a named method (I name a type) *)
		methodName.methodTypes.includes(self)
	}

	isMethodName { :self |
		methodList().includes(self)
	}

	isTraitName { :self |
		traitList().includes(self)
	}

	isTypeName { :self |
		system::typeList.includes(self)
	}

	methodArities { :self |
		(* Arities I am implemented for (I name a method) *)
		system::methodTable[self].keys
	}

	methodImplementations { :self |
		(* Each of my implementations (I name a method) *)
		self.isMethodName.if {
			|
				answer = OrderedCollection(),
				table = system::methodTable[self];
			|
			table.keysValuesDo { :arity :dictionary |
				answer.add(dictionary)
			};
			answer
		} {
			'methodImplementations: not a method'.error
		}
	}

	methodPrintString { :self |
		(* Print string of my implementations (I name a method) *)
		| answer = OrderedCollection(); |
		self.methodImplementations.do { :dictionary |
			dictionary.associationsDo { :each |
				answer.add('+ ' ++ each.key ++ ' {\n\t' ++ self ++ ' ' ++ each.value[3] ++ '\n}')
			}
		};
		answer
	}

	methodSignatures { :self |
		(* Signatures of each of my implementations (I name a method) *)
		| answer = OrderedCollection(); |
		self.methodImplementations.do { :dictionary |
			dictionary.associationsDo { :each |
				answer.add(each.key ++ '>>' ++ self ++ ':/' ++ each.value[2])
			}
		};
		answer
	}

	methodSource { :self :arity :typeName |
		(* My implementation at arity for typeName (I name a method) *)
		system::methodTable[self][arity][typeName][3]
	}

	methodTraits { :self |
		(* Traits implementing myself, at any arity (I name a method) *)
		system::traitMethodTable.select({ :item |
			item.keys.includes(self)
		}).keys
	}

	methodTypes { :self |
		(* Types implementing myself, at any arity (I name a method) *)
		self.isMethodName.if {
			system::methodTable[self].values.collect(keys:/1).concatenation
		} {
			'methodTypes: not a method'.error
		}
	}

	traitMethods { :self |
		(* Methods I implement (I name a trait) *)
		self.isTraitName.if {
			system::traitMethodTable[self]
		} {
			'traitMethods: not a trait'.error
		}
	}

	traitTypes { :self |
		(* Types implementing myself (I name a trait) *)
		self.isTraitName.if {
			system::traitTypeTable[self]
		} {
			'traitTypes: not a trait'.error
		}
	}

	typeMethods { :self |
		(* Methods implemented by myself (I name a type) *)
		self.isTypeName.if {
			system::methodTable.keys.select {
				:each | each.methodTypes.includes(self)
			}
		} {
			'typeMethods: not a type'.error
		}
	}

	typeTraits { :self |
		(* Traits implemented by myself (I name a type) *)
		self.isTypeName.if {
			| answer = OrderedCollection(); |
			system::traitTypeTable.keysValuesDo { :key :value |
				value.includes(self).ifTrue { answer.add(key) }
			};
			answer
		} {
			'typeTraits: not a type'.error
		}
	}

}

+ Void {

	allMethodSignatures {
		methodList().collect(methodSignatures:/1).concatenation.sorted
	}

	methodList {
		system::methodTable.keys
	}

	multipleArityMethodList {
		methodList().select { :each | each.methodArities.size > 1 }
	}

	onlyZeroArityMethodList {
		methodList().select { :each | each.methodArities = [0] }
	}

	traitList {
		system::traitTypeTable.keys
	}

}

Object {

	respondsTo { :self :aMethod |
		doesTypeImplementMethod(self.typeOf, aMethod.methodName)
	}

}
