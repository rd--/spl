MemoizationTable : [Object] { | block table |

	at { :self :key |
		self.table.atIfAbsent(key) {
			let value = self.block.value(key);
			self.table.atPut(key, value);
			value
		}
	}

}

+Block {

	Map { :self |
		newMemoizationTable().initializeSlots(
			self,
			Map()
		)
	}

}
