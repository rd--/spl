UgenGraph! : [Object] {

	controlArray { :self |
		<primitive: return _self.controlArray>
	}

	constantArray { :self |
		<primitive: return _self.constantArray>
	}

	encode { :self |
		<primitive: return sc.graphEncodeSyndef(_self);>
	}

	name { :self |
		<primitive: return _self.name>
	}

	pseudoSlotNameArray { :self |
		['name', 'ugenArray', 'constantArray', 'controlArray']
	}

	ugenArray { :self |
		<primitive: return _self.ugenArray>
	}

}

+String {

	ugenGraph { :self :aUgen |
		<primitive: return sc.makeUgenGraph(_self, sc.wrapOut(0, _aUgen));>
	}

}
