/* Requires: String */

BacktickQuotedString : [Object] { | contents |

	asString { :self |
		self.contents
	}

	printString { :self |
		'`%`'.format([self.contents])
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

DoubleQuotedString : [Object] { | contents |

	asString { :self |
		self.contents
	}

	printString { :self |
		'"%"'.format([self.contents])
	}

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
