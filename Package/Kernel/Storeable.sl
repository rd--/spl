@Storeable {

	printString { :self |
		self.storeString
	}

	storeStringNamedSlots { :self :slotNameList :aBlock:/1 |
		let slotValueList = slotNameList.collect { :each |
			self.uncheckedSlotRead(each)
		};
		'%(%)'.format(
			[
				self.typeOf,
				slotValueList.collect(aBlock:/1).commaSeparated
			]
		)
	}

	storeStringNamedSlots { :self :slotNameList |
		self.storeStringNamedSlots(slotNameList, storeString:/1)
	}

	storeStringAsInitializeSlots { :self :aBlock:/1 |
		self.storeStringNamedSlots(self.slotNameList, aBlock:/1)
	}

	storeStringAsInitializeSlots { :self |
		self.storeStringAsInitializeSlots(storeString:/1)
	}

	storeStringAsInitializeSlotsOmitting { :self :slotNameList |
		self.storeStringNamedSlots(
			self.slotNameList.withoutAll(slotNameList)
		)
	}

	storeString { :self :aBlock:/1 |
		self.storeStringAsInitializeSlots(aBlock:/1)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+@Object {

	storeString { :self |
		self.error('Not Storeable')
	}

}
