LocalControl! : [Object] {

	defaultValue { :self |
		<primitive: return _self.defaultValue>
	}

	index { :self |
		<primitive: return _self.index>
	}

	isTriggered { :self |
		<primitive: return _self.isTriggered>
	}

	name { :self |
		<primitive: return _self.name>
	}

	operatingRate { :self |
		<primitive: return _self.operatingRate>
	}

	pseudoSlotNameArray { :self |
		['name', 'index', 'defaultValue', 'operatingRate', 'isTriggered']
	}

}
