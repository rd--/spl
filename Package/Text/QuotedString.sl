/* Requires: String */

BacktickQuotedString : [Object, Storeable, Equatable] { | contents:<String> |

	asString { :self |
		self.contents
	}

	printString { :self |
		'`%`'.format([self.contents])
	}

}

+String {

	BacktickQuotedString { :self |
		newBacktickQuotedString().initializeSlots(self)
	}

}

DoubleQuotedString : [Object, Storeable, Equatable] { | contents:<String> |

	asString { :self |
		self.contents
	}

	printString { :self |
		'"%"'.format([self.contents])
	}

}

+String {

	DoubleQuotedString { :self |
		newDoubleQuotedString().initializeSlots(self)
	}

}
