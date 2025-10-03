Type! : [Object, Equatable] {

	category { :self |
		system.categoryDictionary.categoryOf('type', self.name)
	}

	constructorName { :self |
		'new' ++ self.name ++ ':/0'
	}

	instanceOf { :self |
		let instance = system.typeLookup('Void').methodDictionary[self.constructorName].block.value;
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
		self.qualifiedName
	}

	pseudoSlotNameList { :self |
		['name', 'packageName', 'traitNameList', 'slotNameList', 'methodDictionary']
	}

	qualifiedName { :self |
		self.name
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
