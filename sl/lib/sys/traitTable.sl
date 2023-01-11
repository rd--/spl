+ IdentityDictionary {

	isTraitName { :self :aString |
		self::traitDictionary.includesKey(aString)
	}

	methodTraits { :self :qualifiedMethodName |
		self::traitDictionary.select({ :each |
			each.methodDictionary.keys.includes(qualifiedMethodName)
		}).keys
	}

	trait { :self :traitName |
		self.isTraitName(traitName).if {
			self::traitDictionary[traitName]
		} {
			('trait: not a trait: ' ++ traitName).error
		}
	}

	traitList { :self |
		self::traitTypeTable.keys
	}

	traitMethodDictionary { :self :traitName |
		self.trait(traitName).methodDictionary
	}

	traitTypes { :self :traitName |
		self.isTraitName(traitName).if {
			| answer = OrderedCollection(); |
			self::typeDictionary.keysValuesDo { :key :value |
				value.includes(traitName).ifTrue {
					answer.add(key)
				}
			};
			answer
		} {
			('traitTypes: not a trait: ' ++ traitName).error
		}
	}

	typeTraits { :self :typeName |
		self.isTypeName(typeName).if {
			self::typeDictionary[typeName]
		} {
			('typeTraits: not a type: ' ++ typeName).error
		}
	}

}
