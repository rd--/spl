MemoizationTable : [Object, Iterable, Collection] { | block:<Block> table |

	at { :self :key |
		self.table.atIfAbsent(key) {
			let value = self.block.value(key);
			self.table.atPut(key, value);
			value
		}
	}

	atAll { :self :keys |
		keys.collect { :key |
			self.at(key)
		}
	}

	atAllPath { :self :operand |
		let [keys] = operand;
		self.atAll(keys)
	}

	do { :self :aBlock:/1 |
		self.table.do(aBlock:/1)
	}

	size { :self |
		self.table.size
	}

}

+Block {

	Dictionary { :self |
		MemoizationTable(
			self,
			Dictionary()
		)
	}

	Map { :self |
		MemoizationTable(
			self,
			Map()
		)
	}

	MemoizationTable { :self :table |
		newMemoizationTable().initializeSlots(
			self,
			table
		)
	}

}
