Table : [Object] { | contents columnLabels columnTypes |

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+List {

	Table { :self :columnLabels :columnTypes |
		newTable().initializeSlots(self, columnLabels, columnTypes)
	}

	Table { :self :columnLabels |
		Table(self, columnLabels, self[1].collect(typeOf:/1))
	}

	Table { :self |
		Table(self, [1 .. self[1].size].collect(printString:/1))
	}

}

