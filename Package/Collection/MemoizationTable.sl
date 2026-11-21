MemoizationTable : [Object, Do, Collection] {

	| memoizedFunction table | <Function>

	at { :self :key |
		self.table.atIfAbsent(key) {
			let f/1 = self.memoizedFunction;
			let value = f(key);
			self.table.put!(key, value);
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

	do { :self :aFunction/1 |
		self.table.do(aFunction/1)
	}

	size { :self |
		self.table.size
	}

}

+Function {

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
		uncheckedMemoizationTable(
			self,
			table
		)
	}

}
