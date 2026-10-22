Trait! : [Object, Equal] {

	addMethodsTo { :self :aCollection |
		trait.methodDictionary.values.do { :method |
			aCollection.add!(method)
		}
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

	pseudoSlotNameList { :self |
		['methodDictionary', 'name', 'packageName']
	}

	printString { :self |
		self.name
	}

	unqualifiedName { :self |
		self.name.allButFirst
	}

}

+String {

	isTraitName { :self |
		self[1] = '@'
	}

}
