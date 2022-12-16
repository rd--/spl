Ugen {

	adaptToNumberAndApply { :self :aNumber :aProcedure |
		<primitive: return sl.applyGenericAt(_aProcedure.name, [_aNumber, _self], 'Ugen');>
	}

	adaptToCollectionAndApply { :self :aCollection :aProcedure |
		aCollection.collect { :each | aProcedure(each, self) }
	}

}

+ String {
	encodeUgen { :self :aUgen | <primitive: return sc.encodeUgen(_self, sc.wrapOut(0, _aUgen));> }
}

+ Object {

	kr { :aUgen | <primitive: return sc.kr(_aUgen);> }
	printUgen { :aUgen | <primitive: return sc.prettyPrintSyndefOf(_aUgen);> }
	mrg { :self :aUgen | <primitive: return sc.mrg(_self, _aUgen);> }
	isOutputSignal { :self | <primitive: return sc.isOutputSignal(_self);> }
	playUgen { :self | <primitive: sc.scsynthEnsure(globalScsynth, function() { sc.playUgen(globalScsynth, _self, 1) });> }

	<! { :self :aUgen | self.mrg(aUgen) }

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
	resetScsynth { <primitive: return sc.resetScsynth(globalScsynth);> }
}
