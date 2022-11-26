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
		system::genericProcedures[self].keys
	}

	methodSignatures { :self |
		(* Signatures of each of my implementations (I name a method) *)
		self.isMethodName.if {
			| answer = List(), table = system::genericProcedures[self]; |
			table.keysValuesDo { :arity :dictionary |
				dictionary.keys.do { :type | answer.add(type ++ '>>' ++ self ++ '/' ++ arity) }
			};
			answer
		} {
			'methodSignatures: not a method'.error
		}
	}

	methodSource { :self :arity :type |
		system::genericProcedures[self][arity][type][3]
	}

	methodTypes { :self |
		(* Types implementing myself, at any arity (I name a method) *)
		self.isMethodName.if {
			system::genericProcedures[self].values.collect(keys).concatenation
		} {
			'methodTypes: not a method'.error
		}
	}

	respondsTo { :self :aMethod |
		aMethod.methodTypes.includes(self)
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
