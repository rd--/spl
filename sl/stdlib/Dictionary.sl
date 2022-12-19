@Dictionary {

	= { :self :aDictionary |
		| keyArray = self.keys; |
		(keyArray = aDictionary.keys) & { keyArray.allSatisfy({ :key | self[key] = aDictionary[key] }) }
	}

	++ { :self :aCollection |
		| answer = self.copy; |
		answer.addAll(aCollection);
		answer
	}

	add { :self :anAssociation |
		self[anAssociation.key] := anAssociation.value;
		anAssociation
	}

	addAll { :self :aCollection |
		aCollection.associationsDo({ :asAssociation | self.add(asAssociation) });
		aCollection
	}

	asArray { :self |
		| answer = Array(self.size), index = 1; |
		self.associationsDo({ :each | answer[index] := each; index := index + 1 });
		answer
	}

	associationsDo { :self :aProcedure |
		self.keysValuesDo { :key :value |
			aProcedure.value(key -> value)
		}
	}

	atIfAbsent { :self :aKey :aBlock |
		self[aKey] ? aBlock.value
	}

	atIfAbsentPut { :self :key :aBlock |
		self.atIfAbsent(key) { self[key] := aBlock.value }
	}

	collect { :self :aProcedure |
		| answer = self.species.new; |
		self.keysValuesDo { :aKey :aValue |
			answer.add(aKey -> aProcedure.value(aValue))
		};
		answer
	}

	copy { :self |
		| answer = self.species.new; |
		answer.addAll(self);
		answer
	}

	do { :self :aBlock |
		self.valuesDo(aBlock)
	}

	fillFromWith { :self :aCollection :aBlock |
		aCollection.isDictionary.if {
			aCollection.associationsDo { :association |
				self[association.key] := aBlock.value(association.value)
			}
		} {
			aCollection.do { :element |
				self.add(aBlock.value(element))
			}
		}
	}

	isDictionary { :self | true }

	removeKey { :self :aKey |
		removeKeyIfAbsent(self, aKey, { error('Dictionary:removeKey') })
	}

	select { :self :aBlock |
		| newCollection = self.species.new; |
		self.associationsDo { :each |
			aBlock.value(each.value).ifTrue {
				newCollection.add(each.copy)
			}
		};
		newCollection
	}

	valuesDo { :self :aBlock |
		self.associationsDo { :association | aBlock.value(association.value) }
	}

}

+ Object {

	isDictionary { :self | false }

}
