Ugen! : [Object, Number] {

	adaptToNumberAndApply { :self :aNumber :aBlock |
		<primitive:
		return sl.applyGenericAt(
			sl.nameWithoutArity(_aBlock.name),
			[_aNumber, _self],
			'Ugen'
		);
		>
	}

	adaptToCollectionAndApply { :self :aCollection :aBlock:/2 |
		aCollection.collect { :each |
			aBlock(each, self)
		}
	}

	port { :self |
		<primitive: return _self.port>
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

	scUgen { :self |
		<primitive: return _self.scUgen>
	}

}

+String {

	encodeUgen { :self :aUgen |
		<primitive: return sc.encodeUgen(_self, sc.wrapOut(0, _aUgen));>
	}

}
