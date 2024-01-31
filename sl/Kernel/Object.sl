@Object {

	= { :self :anObject |
		self.typeResponsibility('@Object>>=')
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

	assert { :self :aBlock:/0 |
		aBlock().if {
			self
		} {
			self.error('Assertion failed')
		}
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

	equalSlots { :self :anObject |
		self.typeOf = anObject.typeOf & {
			self.slotArray = anObject.slotArray
		}
	}

	errorMessage { :self :message |
		[
			self.typeOf, ': ',
			message,
			': (', self.printStringLimitedTo(16), ')'
		].join
	}

	error { :self :message |
		let description = self.errorMessage(message);
		Error(description).signal
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

	inspectAsArray { :self :maxIndices |
		[
			['Type' -> self.Type],
			self.slotArray,
			self.pseudoSlotArray,
			self.isIndexable.if {
				self.indices.take(maxIndices).collect { :each |
					each.asString -> self[each]
				}
			} {
				[]
			}
		].concatenation
	}

	isByte { :self |
		false
	}

	isInteger { :self |
		false
	}

	isNumber { :self |
		false
	}

	notificationMessage { :self :message |
		[
			self.typeOf, ': ',
			message,
			': (' ++ self.printStringLimitedTo(16) ++ ')'
		].join
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

	pseudoSlotArray { :self |
		self.pseudoSlotNameArray.collect { :each |
			each -> self.perform(each)
		}
	}

	pseudoSlotNameArray { :self |
		[]
	}

	shallowCopy { :self |
		<primitive: return Object.assign({}, _self);>
	}

	slotArray { :self |
		self.Type.slotNameArray.collect { :each |
			each -> self.perform(each)
		}
	}

	slotNameArray { :self |
		self.Type.slotNameArray
	}

	slotRead { :self :key |
		<primitive: return _self[_key];>
	}

	slotWrite { :self :key :value |
		<primitive: _self[_key] = _value;>
		nil
	}

	storeString { :self |
		self.typeOf.withIndefiniteArticle
	}

	then { :self :aBlock:/1 |
		self.aBlock
	}

	Type { :self |
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
		].join
	}

	warning { :self :message |
		system.postLine(self.warningMessage(message));
		self
	}

	yourself { :self |
		self
	}

}
