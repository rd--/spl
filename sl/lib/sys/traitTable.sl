+ IdentityDictionary {

	isTraitName { :self :aString |
		self.traitList.includes(aString)
	}

	methodTraits { :self :methodName |
		self::traitMethodTable.select({ :each |
			each.keys.includes(methodName)
		}).keys
	}

	traitList { :self |
		self::traitTypeTable.keys
	}

	traitMethods { :self :traitName |
		self.isTraitName(traitName).if {
			self::traitMethodTable[traitName]
		} {
			'traitMethods: not a trait'.error
		}
	}

	traitTypes { :self :traitName |
		self.isTraitName(traitName).if {
			(traitName = 'Object').if {
				self::typeList
			} {
				self::traitTypeTable[traitName]
			}
		} {
			'traitTypes: not a trait'.error
		}
	}

	typeTraits { :self :typeName |
		self.isTypeName(typeName).if {
			| answer = OrderedCollection(); |
			self::traitTypeTable.keysValuesDo { :key :value |
				value.includes(typeName).ifTrue {
					answer.add(key)
				}
			};
			answer
		} {
			'typeTraits: not a type'.error
		}
	}

}
