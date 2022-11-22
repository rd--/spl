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
	playUgen { :self | <primitive: return globalThis.playUgen(_self);> }

	<! { :self :aUgen | self.mrg(aUgen) }

}

+ Procedure {

	play { :self | self.value.playUgen }

}
