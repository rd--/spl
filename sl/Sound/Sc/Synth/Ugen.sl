Ugen : [Object, Numeric] {

	adaptToNumberAndApply { :self :aNumber :aProcedure |
		<primitive: return sl.applyGenericAt(sl.nameWithoutArity(_aProcedure.name), [_aNumber, _self], 'Ugen');>
	}

	adaptToCollectionAndApply { :self :aCollection :aProcedure:/2 |
		aCollection.collect { :each |
			aProcedure(each, self)
		}
	}

}

+ String {

	encodeUgen { :self :aUgen |
		<primitive: return sc.encodeUgen(_self, sc.wrapOut(0, _aUgen));>
	}

	ugenGraph { :self :aUgen |
		<primitive: return sc.makeUgenGraph(_self, sc.wrapOut(0, _aUgen));>
	}

}

+ [Array, Number, Ugen] {

	<! { :self :aUgen |
		self.mrg(aUgen)
	}

	isOutputSignal { :self |
		<primitive: return sc.isOutputSignal(_self);>
	}

	kr { :aUgen |
		<primitive: return sc.kr(_aUgen);>
	}

	mrg { :self :aUgen |
		<primitive: return sc.mrg(_self, _aUgen);>
	}

	playUgen { :self |
		<primitive: sc.scsynthEnsure(globalScsynth, function() { sc.playUgen(globalScsynth, _self, 1) });>
	}

	printUgen { :aUgen |
		<primitive: return sc.prettyPrintSyndefOf(_aUgen);>
	}

}

+ Procedure {

	play { :self |
		| answer = self.value; |
		answer.isOutputSignal.ifTrue {
			playUgen(answer)
		}
	}

}

+ Void {

	resetScsynth {
		<primitive: return sc.resetScsynth(globalScsynth);>
	}

}

+ IdentityDictionary {

	localControls { :self |
		<primitive: return sc.localControls(Object.fromEntries(_self));>
	}

}
