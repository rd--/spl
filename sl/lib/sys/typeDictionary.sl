+ IdentityDictionary {

	isTypeName { :self :aString |
		self::typeDictionary.includesKey(aString)
	}

	type { :self :typeName |
		self.isTypeName(typeName).if {
			self::typeDictionary[typeName]
		} {
			('type: not a type: ' ++ typeName).error
		}
	}

	typeMethods { :self :typeName |
		self.isTypeName(typeName).if {
			self::typeDictionary[typeName].methodDictionary.values
		} {
			('typeMethods: not a type: ' ++ typeName).error
		}
	}

	typeTraits { :self :typeName |
		self.isTypeName(typeName).if {
			self::typeDictionary[typeName].traitArray
		} {
			('typeTraits: not a type: ' ++ typeName).error
		}
	}

	typesImplementingTrait { :self :traitName |
		system::typeDictionary.select({ :each |
			each.traitArray.includes(traitName)
		}).keys
	}

}
