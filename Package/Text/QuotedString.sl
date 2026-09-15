/* Requires: String */

BacktickQuotedString : [Object, Store, Equal] { | contents:<String> |

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

DoubleQuotedString : [Object, Store, Equal] { | contents:<String> |

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
