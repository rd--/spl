@Store {

	printString { :self |
		self.storeString
	}

	storeString { :self :aFunction/1 |
		self.storeStringAsInitializeSlots(aFunction/1)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	storeStringAsInitializeSlots { :self :aFunction/1 |
		self.storeStringNamedSlots(self.slotNameList, aFunction/1)
	}

	storeStringAsInitializeSlots { :self |
		self.storeStringAsInitializeSlots(storeString/1)
	}

	storeStringAsInitializeSlotsOmitting { :self :slotNameList |
		self.storeStringNamedSlots(
			self.slotNameList.withoutAll!(slotNameList)
		)
	}

	storeStringNamedSlots { :self :slotNameList :aFunction/1 |
		let slotValueList = slotNameList.collect { :each |
			self.uncheckedSlotRead(each)
		};
		'%(%)'.format(
			[
				self.typeName,
				slotValueList.collect(aFunction/1).commaSeparated
			]
		)
	}

	storeStringNamedSlots { :self :slotNameList |
		self.storeStringNamedSlots(slotNameList, storeString/1)
	}

}

+@Object {

	storeString { :self |
		self.error('Does not implement @Store')
	}

}
