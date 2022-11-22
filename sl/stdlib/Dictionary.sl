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
		self.keysValuesDo { :key :value | aProcedure(key -> value) }
	}

	atIfAbsent { :self :aKey :aBlock |
		self[aKey] ? aBlock()
	}

	collect { :self :aProcedure |
		| answer = self.species.new; |
		self.keysValuesDo { :key :value | answer.add(key -> aProcedure(value)) };
		answer
	}

	copy { :self |
		| answer = self.species.new; |
		answer.addAll(self);
		answer
	}

	do { :self :aBlock | self.valuesDo(aBlock) }

	fillFromWith { :self :aCollection :aBlock |
		aCollection.isDictionary.if {
			aCollection.associationsDo { :association |
				self[association.key] := aBlock(association.value)
			}
		} {
			aCollection.do { :element |
				self.add(aBlock(element))
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
			aBlock(each.value).ifTrue {
				newCollection.add(each.copy)
			}
		};
		newCollection
	}

	valuesDo { :self :aBlock |
		self.associationsDo { :association | aBlock(association.value) }
	}

}

+ Object {

	isDictionary { :self | false }

}
