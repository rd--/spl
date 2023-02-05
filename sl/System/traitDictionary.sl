+ System {

	isTraitName { :self :aString |
		self.traitDictionary.includesKey(aString)
	}

	methodTraits { :self :qualifiedMethodName |
		self.traitDictionary.select({ :each |
			each.methodDictionary.keys.includes(qualifiedMethodName)
		}).keys
	}

	trait { :self :traitName |
		self.isTraitName(traitName).if {
			self.traitDictionary[traitName]
		} {
			('trait: not a trait: ' ++ traitName).error
		}
	}

	traitTypes { :self :traitName |
		self.isTraitName(traitName).if {
			self.typesImplementingTrait(traitName)
		} {
			('traitTypes: not a trait: ' ++ traitName).error
		}
	}

}
