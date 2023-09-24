Type! : [Object] {

	category { :self |
		system.categoryDictionary.categoryOf('type', self.name)
	}

	constructorName { :self |
		'new' ++ self.name ++ ':/0'
	}

	instanceOf { :self |
		| instance = system.typeLookup('Void').methodDictionary[self.constructorName].procedure.value; |
		instance.initialize;
		instance
	}

	isMeta { :self |
		self.name.endsWith('^')
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
