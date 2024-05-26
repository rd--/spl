@Object {

	= { :self :anObject |
		self.hasEqualSlots(anObject)
		{- self.typeResponsibility('@Object>>=') -}
	}

	~ { :self :anObject |
		self = anObject
	}

	~= { :self :anObject |
		not(self = anObject)
	}

	== { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	~~ { :self :anObject |
		<primitive: return _self !== _anObject;>
	}

	? { :self :aBlock:/0 |
		self
	}

	?? { :self :anObject |
		self
	}

	~? { :self :aBlock:/0 |
		aBlock()
	}

	assert { :self :aString :aBlock:/0 |
		aBlock().if {
			self
		} {
			self.error('Assertion failed: ' ++ aString)
		}
	}

	assert { :self :aBlock:/0 |
		self.assert('*unknown context*', aBlock:/0)
	}

	asString { :self |
		self.printString
	}

	caseError { :self |
		self.error('@Object>>caseError: case not found and no otherwise clause')
	}

	caseOf { :self :aBlockAssociationCollection |
		self.caseOfOtherwise(aBlockAssociationCollection) { :case |
			self.caseError
		}
	}

	caseOfOtherwise { :self :aBlockAssociationCollection :otherwise:/1 |
		valueWithReturn { :return:/1 |
			aBlockAssociationCollection.associationsDo { :assoc |
				(assoc.key.value = self).ifTrue {
					assoc.value.value.return
				}
			};
			otherwise:/1.cull(self)
		}
	}

	constant { :self |
		{ :unusedObject |
			self
		}
	}

	copy { :self |
		let answer = self.shallowCopy;
		answer.postCopy;
		answer
	}

	deepCopy { :self |
		<primitive: return structuredClone(_self);>
	}

	errorMessage { :self :message |
		[
			self.typeOf, ': ',
			message,
			': (', self.printStringLimitedTo(16), ')'
		].stringJoin
	}

	error { :self :message |
		let description = self.errorMessage(message);
		Error(description).signal
	}

	hasEqualSlotsBy { :self :anObject :aBlock:/2 |
		self.typeOf = anObject.typeOf & {
			aBlock(self.slotValueList, anObject.slotValueList)
		}
	}

	hasEqualSlots { :self :anObject |
		self.typeOf = anObject.typeOf & {
			self.slotValueList = anObject.slotValueList
		}
	}

	identity { :self |
		self
	}

	in { :self :aBlock:/1 |
		aBlock(self)
	}

	initialize { :self |
		self
	}

	inspectAsList { :self :maxIndices |
		[
			['Type' -> self.type],
			self.slotList,
			self.pseudoSlotList,
			self.isIndexable.if {
				self.indices.take(maxIndices).collect { :each |
					each.asString -> self[each]
				}
			} {
				[]
			}
		].concatenation
	}

	isBinary { :self |
		false
	}

	isByte { :self |
		false
	}

	isImmediate { :self |
		false
	}

	isInteger { :self |
		false
	}

	isJson { :self |
		false
	}

	isLiteral { :self |
		false
	}

	isNumber { :self |
		false
	}

	leftIdentity { :self :anObject |
		self
	}

	notificationMessage { :self :message |
		[
			self.typeOf, ': ',
			message,
			': (' ++ self.printStringLimitedTo(16) ++ ')'
		].stringJoin
	}

	notify { :self :message |
		system.postLine(self.notificationMessage(message));
		self
	}

	perform { :self :aString |
		system.methodLookupAtType(aString, 1, self.typeOf).block . (self)
	}

	perform { :self :aString :aValue |
		system.methodLookupAtType(aString, 2, self.typeOf).block . (self, aValue)
	}

	postCopy { :self |
		self
	}

	primitiveEquals { :self :anObject |
		<primitive: return _self == _anObject;>
	}

	printString { :self |
		self.storeString
	}

	printStringConcise { :self :count |
		let answer = self.printString;
		(answer.size > count).if {
			self.typeOf.withIndefiniteArticle
		} {
			answer
		}
	}

	printStringLimitedTo { :self :count |
		let answer = self.printString;
		(answer.size > count).if {
			answer.truncateTo(count - 8) ++ '... &etc'
		} {
			answer
		}
	}

	pseudoSlotList { :self |
		self.pseudoSlotNameList.collect { :each |
			each -> self.perform(each)
		}
	}

	pseudoSlotNameList { :self |
		[]
	}

	rightIdentity { :self :anObject |
		anObject
	}

	shallowCopy { :self |
		<primitive: return Object.assign({}, _self);>
	}

	slotList { :self |
		self.type.slotNameList.collect { :each |
			each -> self.perform(each)
		}
	}

	slotNameList { :self |
		self.type.slotNameList
	}

	slotValueList { :self |
		self.type.slotNameList.collect { :each |
			self.slotRead(each)
		}
	}

	slotRead { :self :key |
		<primitive: return _self[_key];>
	}

	slotWrite { :self :key :value |
		<primitive: _self[_key] = _value;>
		nil
	}

	storeStringAsInitializeSlots { :self |
		[
			self.typeOf,
			'(',
				self.slotValueList.collect(storeString:/1).stringJoin(', '),
			')'
		].stringJoin
	}

	storeString { :self |
		self.typeOf.withIndefiniteArticle
	}

	then { :self :aBlock:/1 |
		self.aBlock
	}

	type { :self |
		system.typeLookup(self.typeOf)
	}

	typeOf { :self |
		<primitive: return sl.typeOf(_self);>
	}

	value { :self |
		self
	}

	warningMessage { :self :message |
		[
			'Warning: ',
			self.typeOf, ': ',
			message,
			': (' ++ self.printStringLimitedTo(16) ++ ')'
		].stringJoin
	}

	warning { :self :message |
		system.postLine(self.warningMessage(message));
		self
	}

	yourself { :self |
		self
	}

}
