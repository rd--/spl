/* Requires: String */

BacktickQuotedString : [Object, Store, Equal] {

	| unquotedString |

	printString { :self |
		'`%`'.format([self.unquotedString])
	}

}

+String {

	BacktickQuotedString { :self |
		newBacktickQuotedString().initializeSlots(self)
	}

}

DoubleQuotedString : [Object, Store, Equal] {

	| unquotedString |

	printString { :self |
		'"%"'.format([self.unquotedString])
	}

}

+String {

	DoubleQuotedString { :self |
		newDoubleQuotedString().initializeSlots(self)
	}

}
