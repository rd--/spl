Ugen! : [Object, Number] {

	scUgen { :self | <primitive: return _self.scUgen> }
	port { :self | <primitive: return _self.port> }

	adaptToNumberAndApply { :self :aNumber :aProcedure |
		<primitive:
		return sl.applyGenericAt(
			sl.nameWithoutArity(_aProcedure.name),
			[_aNumber, _self],
			'Ugen'
		);
		>
	}

	adaptToCollectionAndApply { :self :aCollection :aProcedure:/2 |
		aCollection.collect { :each |
			aProcedure(each, self)
		}
	}

	printString { :self |
		[
			self.scUgen.printString,
			':',
			self.port.printString
		].join
	}

	pseudoSlotNameArray { :self |
		['scUgen', 'port']
	}

}

+String {

	encodeUgen { :self :aUgen |
		<primitive: return sc.encodeUgen(_self, sc.wrapOut(0, _aUgen));>
	}

}
