@Object {

	assert { :self :aString :aBlock/0 |
		aBlock().if {
			self
		} {
			self.error('Assertion failed', [aString])
		}
	}

	assert { :self :aBlock/0 |
		self.assert('*unknown context*', aBlock/0)
	}

	caseError { :self |
		self.error('@Object>>caseError: case not found and no otherwise clause')
	}

	caseOf { :self :aCollection :otherwise/1 |
		withReturn { :return/1 |
			aCollection.associationsDo { :each |
				(each.key = self).ifTrue {
					let f/0 = each.value;
					f().return
				}
			};
			otherwise/1.cull(self)
		}
	}

	caseOf { :self :aCollection |
		self.caseOf(aCollection) { :case |
			self.caseError
		}
	}

	concisePrintString { :self |
		self.typeName.withIndefiniteArticle
	}

	constant { :self :argumentCount |
		argumentCount.caseOf(
			[
				0 -> {
					{
						self
					}
				},
				1 -> {
					{ :unusedObject |
						self
					}
				},
				2 -> {
					{ :unusedFirstArgument :unusedSecondArgument |
						self
					}
				}
			]
		)
	}

	constant { :self |
		self.constant(1)
	}

	displayString { :self |
		self.printString
	}

	error { :self :message :parameters |
		self.errorValue(message, parameters).signal
	}

	error { :self :message |
		self.error(message, [])
	}

	errorMessage { :self :message :parameters |
		'%: %: %: (%)'.format(
			[
				self.typeName,
				message,
				parameters.printString,
				self.printStringLimitedTo(16)
			]
		)
	}

	errorValue { :self :message :parameters |
		let description = self.errorMessage(message, parameters);
		Error(description)
	}

	identity { :self |
		self
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

	[isIdentical, ==] { :self :anObject |
		<primitive: return _self === _anObject;>
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

	[isNonidentical, !==] { :self :anObject |
		<primitive: return _self !== _anObject;>
	}

	leftIdentity { :self :anObject |
		self
	}

	notificationMessage { :self :message |
		'%: %: (%)'.format(
			[
				self.typeName,
				message,
				self.printStringLimitedTo(16)
			]
		)
	}

	notify { :self :message |
		system.printLine(self.notificationMessage(message));
		self
	}

	perform { :self :aString |
		system.methodLookupAtType(aString, 1, self.typeName).block . (self)
	}

	perform { :self :aString :aValue |
		system.methodLookupAtType(aString, 2, self.typeName).block . (self, aValue)
	}

	primitiveIdentity { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	primitiveObjectDeepCopy { :self |
		<primitive: return structuredClone(_self);>
	}

	primitiveObjectShallowCopy { :self |
		<primitive: return Object.assign({}, _self);>
	}

	printString { :self |
		self.typeName.withIndefiniteArticle
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

	then { :self :aBlock/1 |
		self.aBlock
	}

	typeDefinition { :self |
		system.typeLookup(self.typeName)
	}

	typeName { :self |
		<primitive: return sl.splTypeName(_self);>
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
		self.shouldNotImplement('value')
	}

	warning { :self :message :parameters |
		self.errorValue(message, parameters).description.printLine;
		self
	}

	warning { :self :message |
		self.warning(message, [])
	}

	yourself { :self |
		self
	}

}
