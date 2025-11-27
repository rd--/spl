@Object {

	[identical, ==] { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	[nonidentical, !==] { :self :anObject |
		<primitive: return _self !== _anObject;>
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

	caseOf { :self :aCollection |
		self.caseOf(aCollection) { :case |
			self.caseError
		}
	}

	caseOf { :self :aCollection :otherwise:/1 |
		valueWithReturn { :return:/1 |
			aCollection.associationsDo { :each |
				(each.key = self).ifTrue {
					each.value.blockValue.return
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
		self.primitiveCopy
	}

	deepCopy { :self |
		self.typeResponsibility('deepCopy')
	}

	errorMessage { :self :message |
		'%: %: (%)'.format(
			[
				self.typeOf,
				message,
				self.printStringLimitedTo(16)
			]
		)
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
		].catenate
	}

	isBinary { :self |
		false
	}

	isImmediate { :unused |
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

	normal { :self |
		self
	}

	notificationMessage { :self :message |
		'%: %: (%)'.format(
			[
				self.typeOf,
				message,
				self.printStringLimitedTo(16)
			]
		)
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

	primitiveCopy { :self |
		<primitive: return Object.assign({}, _self);>
	}

	primitiveDeepCopy { :self |
		<primitive: return structuredClone(_self);>
	}

	primitiveIdentity { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	printString { :self |
		self.typeOf.withIndefiniteArticle
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
			self.uncheckedSlotRead(each)
		}
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


	uncheckedSlotRead { :self :key |
		<primitive: return _self[_key];>
	}

	uncheckedSlotReadList { :self :keyList |
		<primitive: return _keyList.map(function (key) {
			return _self[key];
		});
		>
	}

	uncheckedSlotWrite { :self :key :value |
		<primitive: _self[_key] = _value;>
		nil
	}

	value { :self |
		/* self.shouldNotImplement('value') */
		self
	}

	warningMessage { :self :message |
		'Warning: %: %: (%)'.format(
			[
				self.typeOf,
				message,
				self.printStringLimitedTo(16)
			]
		)
	}

	warning { :self :message |
		system.postLine(self.warningMessage(message));
		self
	}

	yourself { :self |
		self
	}

}
