@Object {

	= { :self :anObject |
		self.hasEqualSlots(anObject)
		/* self.typeResponsibility('@Object>>=') */
	}

	~ { :self :anObject |
		self = anObject
		/* self.hasEqualSlotsBy(anObject, ~) */
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

	concisePrintString { :self |
		self.typeOf.withIndefiniteArticle
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

	equalByAtNamedSlots { :self :anObject :slotNameList :aBlock:/2 |
		<primitive: return _slotNameList.every(function (key) {
			return _aBlock_2(_self[key], _anObject[key]);
		});
		>
	}

	errorMessage { :self :message |
		[
			self.typeOf, ': ',
			message,
			': (', self.printStringLimitedTo(16), ')'
		].join('')
	}

	error { :self :message |
		let description = self.errorMessage(message);
		Error(description).signal
	}

	hasEqualSlots { :self :anObject |
		self.hasEqualSlotsBy(anObject, =)
	}

	hasEqualSlotsBy { :self :anObject :aBlock:/2 |
		self.typeOf = anObject.typeOf & {
			self.equalByAtNamedSlots(
				anObject,
				self.slotNameList,
				aBlock:/2
			)
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
			['Type' -> self.typeDefinition],
			self.slotList,
			self.pseudoSlotList,
			self.isIndexable.if {
				self.indices.take(maxIndices).collect { :each |
					each.concisePrintString -> self[each]
				}
			} {
				[]
			}
		].concatenation
	}

	isBinary { :self |
		false
	}

	isImmediate { :self |
		false
	}

	isJson { :self |
		false
	}

	isLiteral { :self |
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
		].join('')
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

	primitiveIdentity { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	printString { :self |
		self.storeString
	}

	printStringLimitedTo { :self :count |
		let answer = self.printString;
		(answer.size > count).if {
			answer.abbreviateTo(count)
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
		self.typeDefinition.slotNameList.collect { :each |
			each -> self.perform(each)
		}
	}

	slotNameList { :self |
		self.typeDefinition.slotNameList
	}

	slotValueList { :self |
		self.typeDefinition.slotNameList.collect { :each |
			self.slotRead(each)
		}
	}

	slotRead { :self :key |
		<primitive: return _self[_key];>
	}

	slotReadList { :self :keyList |
		<primitive: return _keyList.map(function (key) {
			return _self[key];
		});
		>
	}

	slotWrite { :self :key :value |
		<primitive: _self[_key] = _value;>
		nil
	}

	storeStringAsInitializeSlots { :self |
		[
			self.typeOf,
			'(',
			self.slotValueList.collect(storeString:/1).join(', '),
			')'
		].join('')
	}

	storeString { :self |
		self.typeOf.withIndefiniteArticle
	}

	then { :self :aBlock:/1 |
		self.aBlock
	}

	typeDefinition { :self |
		system.typeLookup(self.typeOf)
	}

	typeOf { :self |
		<primitive: return sl.splTypeOf(_self);>
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
		].join('')
	}

	warning { :self :message |
		system.postLine(self.warningMessage(message));
		self
	}

	yourself { :self |
		self
	}

}
