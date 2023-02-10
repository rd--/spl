Type : [Object] {

	category { :self |
		system.categoryOf(self.name)
	}

	methodDictionary { :self |
		<primitive: return _self.methodDictionary;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	prefixedName { :self |
		self.name
	}

	slotNameArray { :self |
		<primitive: return _self.slotNameArray;>
	}

	traitNameArray { :self |
		<primitive: return _self.traitNameArray;>
	}

}
