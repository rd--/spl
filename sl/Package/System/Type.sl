Type! : [Object] {

	category { :self |
		system.categoryOf('type', self.name)
	}

	methodArray { :self |
		self.methodDictionary.values
	}

	methodDictionary { :self |
		<primitive: return _self.methodDictionary;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	packageName { :self |
		<primitive: return _self.packageName;>
	}

	printString { :self |
		self.qualifiedName
	}

	pseudoSlotNameArray { :self |
		['name', 'packageName', 'traitNameArray', 'slotNameArray', 'methodDictionary']
	}

	qualifiedName { :self |
		self.name
	}

	slotNameArray { :self |
		<primitive: return _self.slotNameArray;>
	}

	traitArray { :self |
		self.traitNameArray.collect { :each |
			system.traitLookup(each)
		}
	}

	traitNameArray { :self |
		<primitive: return _self.traitNameArray;>
	}

}
