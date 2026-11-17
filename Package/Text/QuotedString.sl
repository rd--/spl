/* Requires: String */

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
