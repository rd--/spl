@Dictionary {

	= { :self :aDictionary |
		| keyArray = self.keys; |
		(keyArray = aDictionary.keys) &
		{
			keyArray.allSatisfy { :key |
				self[key] = aDictionary[key]
			}
		}
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
		aCollection.associationsDo { :asAssociation |
			self.add(asAssociation)
		};
		aCollection
	}

	asArray { :self |
		| answer = Array(self.size), index = 1; |
		self.associationsDo { :each |
			answer[index] := each;
			index := index + 1
		};
		answer
	}

	associationsDo { :self :aProcedure:/1 |
		self.keysValuesDo { :key :value |
			aProcedure(key -> value)
		}
	}

	atIfAbsent { :self :aKey :aBlock |
		self[aKey] ? aBlock.value
	}

	atIfAbsentPut { :self :key :aBlock |
		self.atIfAbsent(key) {
			self[key] := aBlock.value
		}
	}

	collect { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.keysValuesDo { :aKey :aValue |
			answer.add(aKey -> aProcedure(aValue))
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

	fillFromWith { :self :aCollection :aBlock:/1 |
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
		removeKeyIfAbsent(self, aKey) {
			error('Dictionary:removeKey')
		}
	}

	select { :self :aBlock:/1 |
		| answer = self.species.new; |
		self.associationsDo { :each |
			aBlock(each.value).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	valuesDo { :self :aBlock:/1 |
		self.associationsDo { :association |
			aBlock(association.value)
		}
	}

}

+ Object {

	isDictionary { :self |
		false
	}

}
