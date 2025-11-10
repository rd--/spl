QuantityArray : [Object, Equatable] { | magnitudeArray unitOrUnitList |

	assertIsValid { :self |
		(self.unitList.size = self.columnCount).if {
			self
		} {
			self.error('invalid parameters')
		}
	}

	columnCount { :self |
		self.magnitudeArray.dimensions.last
	}

	normal { :self |
		let m = self.magnitudeArray;
		let u = self.unitList;
		let d = m.arrayDepth;
		m.atLevelCollect(d - 1) { :each |
			each.withCollect(u, Quantity:/2)
		}
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	unitList { :self |
		let u = self.unitOrUnitList;
		u.isList.if {
			u
		} {
			let d = self.magnitudeArray.dimensions;
			List(d.last, u)
		}
	}

}

+List {

	QuantityArray { :magnitudeArray :unitOrUnitList |
		newQuantityArray()
		.initializeSlots(magnitudeArray, unitOrUnitList)
		.assertIsValid
	}

}

