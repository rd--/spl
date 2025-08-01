Trait! : [Object] {

	addMethodsTo { :self :aCollection |
		trait.methodDictionary.values.do { :method |
			aCollection.add(method)
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
		self.qualifiedName
	}

	qualifiedName { :self |
		'@' ++ self.name
	}

}

+String {

	isQualifiedTraitName { :self |
		self[1] = '@'
	}

	parseQualifiedTraitName { :self |
		self.isQualifiedTraitName.if {
			self.copyFromTo(2, self.size)
		} {
			self
		}
	}

}
