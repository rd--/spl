+ Void {

	systemTimeInMilliseconds { <primitive: return performance.now();> }
	systemTime { systemTimeInMilliseconds().milliseconds }
	unixTimeInMilliseconds { <primitive: return Date.now();> }
	unixTime { unixTimeInMilliseconds().milliseconds }

}

+ Procedure {

	evaluateAfterMilliseconds { :self :delayMilliseconds | <primitive: return setTimeout(_self, _delayMilliseconds);> }
	evaluateAfterMilliseconds { :self :delayMilliseconds :anObject | <primitive: return setTimeout(_self, _delayMilliseconds, _anObject);> }

	evaluateAfter { :self :delay | self.evaluateAfterMilliseconds(delay.asDuration.milliseconds) }
	evaluateAfter { :self :delay :anObject | self.evaluateAfterMilliseconds(delay.asDuration.milliseconds, anObject) }

	evaluateEveryMilliseconds { :self :delayMilliseconds | <primitive: return setInterval(_self, _delayMilliseconds);> }
	evaluateEvery { :self :delay | self.evaluateEveryMilliseconds(delay.asDuration.milliseconds) }

	evaluateAt { :self :time | | now = unixTime(); | self.evaluateAfter(time.asDuration - now) }
	evaluateAt { :self :time :anObject | | now = unixTime(); | self.evaluateAfter(time.asDuration - now, anObject) }

}

+ Number {

	cancel { :self | <primitive: clearTimeout(_self); return null;> }

}

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
		system::genericProcedures[self].keys
	}

	methodImplementations { :self |
		(* Each of my implementations (I name a method) *)
		self.isMethodName.if {
			| answer = List(), table = system::genericProcedures[self]; |
			table.keysValuesDo { :arity :dictionary | answer.add(dictionary)	};
			answer
		} {
			'methodImplementations: not a method'.error
		}
	}

	methodSignatures { :self |
		(* Signatures of each of my implementations (I name a method) *)
		| list = self.methodImplementations, answer = List(); |
		list.do { :dictionary |
			dictionary.associationsDo { :each |
				[each.key, each.value[2]].postLine;
				answer.add(each.key ++ '>>' ++ self ++ '/' ++ each.value[2])
			}
		};
		answer
	}

	methodSource { :self :arity :typeName |
		(* My implementation at arity for typeName (I name a method) *)
		system::genericProcedures[self][arity][typeName][3]
	}

	methodTraits { :self |
		(* Traits implementing myself, at any arity (I name a method) *)
		system::traitMethods.select({ :item | item.keys.includes(self) }).keys
	}

	methodTypes { :self |
		(* Types implementing myself, at any arity (I name a method) *)
		self.isMethodName.if {
			system::genericProcedures[self].values.collect(keys).concatenation
		} {
			'methodTypes: not a method'.error
		}
	}

	traitMethods { :self |
		(* Methods I implement (I name a trait) *)
		self.isTraitName.if {
			system::traitMethods[self]
		} {
			'traitMethods: not a trait'.error
		}
	}

	traitTypes { :self |
		(* Types implementing myself (I name a trait) *)
		self.isTraitName.if {
			system::traitTypes[self]
		} {
			'traitTypes: not a trait'.error
		}
	}

	typeMethods { :self |
		(* Methods implemented by myself (I name a type) *)
		self.isTypeName.if {
			system::genericProcedures.keys.select { :each | each.methodTypes.includes(self) }
		} {
			'typeMethods: not a type'.error
		}
	}

	typeTraits { :self |
		(* Traits implemented by myself (I name a type) *)
		self.isTypeName.if {
			| answer = List(); |
			system::traitTypes.keysValuesDo { :key :value |
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
		methodList().collect(methodSignatures).concatenation.sorted
	}

	methodList {
		system::genericProcedures.keys
	}

	multipleArityMethodList {
		methodList().select { :each | each.methodArities.size > 1 }
	}

	onlyZeroArityMethodList {
		methodList().select { :each | each.methodArities = [0] }
	}

	traitList {
		system::traitTypes.keys
	}

}

Object {
	respondsTo { :self :aMethod | doesTypeImplementMethod(self.typeOf, aMethod.name) }
}
