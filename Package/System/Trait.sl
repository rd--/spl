Trait! : [Object, Equal] {

	addMethodsTo { :self :aCollection |
		trait.methodDictionary.values.do { :method |
			aCollection.add!(method)
		}
	}

	methodDictionary { :self |
		<primitive: return _self.methodDictionary;>
	}

	methodList { :self |
		self.methodDictionary.values
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
		['methodDictionary', 'name', 'packageName']
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
