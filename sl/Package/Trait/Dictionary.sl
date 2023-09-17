@Dictionary {

	= { :self :aDictionary |
		| keyArray = self.indices; |
		(keyArray = aDictionary.indices) & {
			keyArray.allSatisfy { :key |
				self[key] = aDictionary[key]
			}
		}
	}

	++ { :self :aDictionary |
		| answer = self.copy; |
		answer.includeAll(aDictionary);
		answer
	}

	add { :self :anAssociation |
		self.includesIndex(anAssociation.key).if {
			self.error('@Dictionary>>add: index exists: ' ++ anAssociation.key)
		} {
			self[anAssociation.key] := anAssociation.value;
			anAssociation
		}
	}

	addAll { :self :aCollection |
		aCollection.associationsDo { :anAssociation |
			self.add(anAssociation)
		};
		aCollection
	}

	Array { :self |
		| answer = Array(self.size), index = 1; |
		self.valuesDo { :each |
			answer[index] := each;
			index +:= 1
		};
		answer
	}

	associationAt { :self :key |
		self.associationAtIfAbsent(key) {
			self.error('@Dictionary>>associationAt: no such key')
		}
	}

	associationAtIfAbsent { :self :key :aBlock:/0 |
		self.atIfPresentIfAbsent(key) { :value |
			key -> value
		} {
			aBlock()
		}
	}

	associations { :self |
		| answer = Array(self.size), index = 1; |
		self.associationsDo { :each |
			answer[index] := each;
			index +:= 1
		};
		answer
	}

	associationsDo { :self :aProcedure:/1 |
		self.withIndexDo { :value :key |
			aProcedure(key -> value)
		}
	}

	associationsRemove { :self :aBlock:/1 |
		self.removeAllSuchThat(aBlock:/1)
	}

	associationsSelect { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.associationsDo { :each |
			each.aProcedure.ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	atDelegateToIfAbsent { :self :key :delegateKey :aProcedure:/0 |
		self.atIfAbsent(key) {
			self.includesIndex(delegateKey).if {
				self[delegateKey].atDelegateToIfAbsent(
					key,
					delegateKey,
					aProcedure:/0
				)
			} {
				aProcedure()
			}
		}
	}

	atDelegateTo { :self :key :delegateKey |
		self.atDelegateToIfAbsent(key, delegateKey) {
			self.error('@Dictionary>>atDelegate: unknown key: ' ++ key)
		}
	}

	atPutDelegateToIfAbsent { :self :key :value :delegateKey :aProcedure:/0 |
		self.includesIndex(key).if {
			self.atPut(key, value)
		} {
			self.atIfAbsent(key) {
				self.includesIndex(delegateKey).if {
					self[delegateKey].atPutDelegateToIfAbsent(
						key,
						value,
						delegateKey,
						aProcedure:/0
					)
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

	basicAt { :self :key |
		<primitive: return _self[_key];>
	}

	basicAtPut { :self :key :value |
		<primitive:
		_self[_key] = _value;
		return _value;
		>
	}

	collect { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.withIndexDo { :value :key |
			answer.add(key -> aProcedure(value))
		};
		answer
	}

	declareFrom { :self :key :aDictionary |
		self.includesIndex(key).if {
			nil
		} {
			aDictionary.includesIndex(key).if {
				| association = aDictionary.associationAt(key); |
				self.add(association);
				aDictionary.removeKey(key);
				association
			} {
				self.add(key -> nil);
				nil
			}
		}
	}

	do { :self :aProcedure:/1 |
		self.valuesDo(aProcedure:/1)
	}

	errorValueNotFound { :self |
		self.error('Value not found')
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

	include { :self :anAssociation |
		self[anAssociation.key] := anAssociation.value;
		anAssociation
	}

	includeAll { :self :aCollection |
		aCollection.associationsDo { :anAssociation |
			self.include(anAssociation)
		};
		aCollection
	}

	includesAssociation { :self :anAssociation |
		self.atIfPresentIfAbsent(anAssociation.key) { :value |
			anAssociation.value = value
		} {
			false
		}
	}

	includesIdentity { :self :anObject |
		valueWithReturn { :return:/1 |
			self.do { :each |
				(anObject == each).ifTrue {
					true.return
				}
			};
			false
		}
	}

	includesIndex { :self :key |
		self.indices.includes(key)
	}

	indexAtValueIfAbsent { :self :value :exceptionBlock:/1 |
		valueWithReturn { :return:/1 |
			self.associationsDo { :association |
				(value = association.value).ifTrue {
					association.key.return
				}
			};
			exceptionBlock(value)
		}
	}

	indexAtValue { :self :value |
		self.indexAtValueIfAbsent(value) {
			self.errorValueNotFound
		}
	}

	indicesDo { :self :aBlock:/1 |
		self.associationsDo { :association |
			aBlock(association.key)
		}
	}

	isDictionary { :self |
		true
	}

	keysAndValuesRemove { :self :keyValueBlock:/2 |
		self.associationsRemove { :each |
			keyValueBlock(each.key, each.value)
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

	remove { :self :anAssociation |
		self.removeAssociation(anAssociation)
	}

	removeAll { :self |
		self.removeAllSuchThat { :unusedItem |
			true
		}
	}

	removeAllSuchThat { :self :aBlock:/1 |
		| removals = []; |
		self.associationsDo { :each |
			aBlock(each).ifTrue {
				removals.add(each.key)
			}
		};
		removals.do { :key |
			self.removeKey(key)
		}
	}

	removeAssociation { :self :oldObject |
		self.includesAssociation(oldObject).if {
			self.removeKey(oldObject.key)
		} {
			anExceptionBlock()
		}
	}

	removeAt { :self :key |
		self.includesIndex(key).if {
			| removed = self[key]; |
			self.removeKey(key);
			removed
		} {
			self.error('@Dictionary>>removeAt')
		}
	}

	removeKey { :self :key |
		self.removeKeyIfAbsent(key) {
			self.error('@Dictionary>>removeKey')
		}
	}

	removeIfAbsent { :self :oldObject :anExceptionBlock:/0 |
		self.shouldNotImplement('@Dictionary>>removeIfAbsent')
	}

	replace { :self :aBlock:/1 |
		self.indices.do { :key |
			self[key] := aBlock(self[key])
		}
	}

	select { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.associationsDo { :each |
			each.value.aProcedure.ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	storeString { :self |
		self.associations.storeString ++ '.' ++ self.typeOf
	}

	valuesDo { :self :aProcedure:/1 |
		self.associationsDo { :association |
			aProcedure(association.value)
		}
	}

	withIndexDo { :self :aProcedure:/2 |
		self.associationsDo { :association |
			aProcedure(association.value, association.key)
		}
	}

}

+@Object {

	isDictionary { :self |
		false
	}

}
