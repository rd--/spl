/* Requires: String */

BacktickQuotedString : [Object] { |contents|

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

DoubleQuotedString : [Object] { |contents|

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+String {

	BacktickQuotedString { :self |
		newBacktickQuotedString().initializeSlots(self)
	}

	DoubleQuotedString { :self |
		newDoubleQuotedString().initializeSlots(self)
	}

}
