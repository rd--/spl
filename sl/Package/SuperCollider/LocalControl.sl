LocalControl! : [Object] {

	name { :self | <primitive: return _self.name> }
	index { :self | <primitive: return _self.index> }
	defaultValue { :self | <primitive: return _self.defaultValue> }
	operatingRate { :self | <primitive: return _self.operatingRate> }
	isTriggered { :self | <primitive: return _self.isTriggered> }

	pseudoSlotNameArray { :self |
		['name', 'index', 'defaultValue', 'operatingRate', 'isTriggered']
	}

}
