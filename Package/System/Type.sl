Type! : [Object, Equal] {

	category { :self |
		system.categoryDictionary.categoryOf('type', self.name)
	}

	constructorName { :self |
		['new', self.name, '/0'].stringCatenate
	}

	instanceOf { :self |
		let void = system.typeLookup('Void');
		let method = void.methodDictionary[self.constructorName];
		let constructor/0 = method.block;
		let instance = constructor();
		instance.initialize;
		instance
	}

	isMeta { :self |
		self.name.endsWith('^')
	}

	methodList { :self |
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
		self.name
	}

	pseudoSlotNameList { :self |
		['name', 'packageName', 'traitNameList', 'slotNameList', 'methodDictionary']
	}

	slotNameList { :self |
		<primitive: return _self.slotNameArray;>
	}

	traitList { :self |
		self.traitNameList.collect { :each |
			system.traitLookup(each)
		}
	}

	traitNameList { :self |
		<primitive: return _self.traitNameArray;>
	}

}
