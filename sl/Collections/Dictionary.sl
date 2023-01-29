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

	associationsSelect { :self :aBlock:/1 |
		| answer = self.species.new; |
		self.associationsDo { :each |
			aBlock(each).ifTrue { answer.add(each) }
		};
		answer
	}

	atDelegateToIfAbsent { :self :key :delegateKey :aProcedure:/0 |
		self.atIfAbsent(key) {
			| parent = self[delegateKey]; |
			parent.notNil.if {
				parent.atDelegateToIfAbsent(key, delegateKey, aProcedure:/0)
			} {
				aProcedure()
			}
		}
	}

	atDelegateTo { :self :key :delegateKey |
		self.atDelegateToIfAbsent(key, delegateKey) {
			('Dictionary>>atDelegate: unknown key: ' ++ key).error
		}
	}

	atIfAbsent { :self :key :aProcedure:/0 |
		self[key] ? { aProcedure() }
	}

	atIfAbsentPut { :self :key :aProcedure:/0 |
		self.atIfAbsent(key) {
			self[key] := aProcedure()
		}
	}

	atPutDelegateToIfAbsent { :self :key :value :delegateKey :aProcedure:/0 |
		self.includesKey(key).if {
			self.atPut(key, value) 
		} {
			self.atIfAbsent(key) {
				| parent = self[delegateKey]; |
				parent.notNil.if {
					parent.atPutDelegateToIfAbsent(key, value, delegateKey, aProcedure:/0)
				} {
					aProcedure()
				}
			}
		}
	}

	atPutDelegateTo { :self :key :value :delegateKey |
		self.atPutDelegateToIfAbsent(key, value, delegateKey) {
			self.atPut(key, value)
		}
	}

	collect { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.keysValuesDo { :key :value |
			answer.add(key -> aProcedure(value))
		};
		answer
	}

	copy { :self |
		| answer = self.species.new; |
		answer.addAll(self);
		answer
	}

	do { :self :aProcedure |
		self.valuesDo(aProcedure)
	}

	fillFromWith { :self :aCollection :aProcedure:/1 |
		aCollection.isDictionary.if {
			aCollection.associationsDo { :association |
				self[association.key] := aProcedure(association.value)
			}
		} {
			aCollection.do { :element |
				self.add(aProcedure(element))
			}
		}
	}

	isDictionary { :self |
		true
	}

	keysAndValuesDo { :self :aProcedure:/2 |
		self.associationsDo { :association |
			aProcedure(association.key, association.value)
		}
	}

	messageSend { :self :selector :delegateKey :argumentsArray |
		| answer = self.atDelegateTo(selector, delegateKey); |
		answer.isProcedure.if {
			answer.apply([self] ++ argumentsArray)
		} {
			answer
		}
	}

	removeKey { :self :key |
		removeKeyIfAbsent(self, key) {
			error('Dictionary:removeKey')
		}
	}

	select { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.associationsDo { :each |
			aProcedure(each.value).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	valuesDo { :self :aProcedure:/1 |
		self.associationsDo { :association |
			aProcedure(association.value)
		}
	}

}

+ @Object {

	isDictionary { :self |
		false
	}

}
