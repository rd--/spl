/* Requires: String */

DoubleQuotedString : [Object, Store, Equal] {

	| unquotedString | <String>

	printString { :self |
		'"%"'.format([self.unquotedString])
	}

}

+String {

	DoubleQuotedString { :self |
		uncheckedDoubleQuotedString(self)
	}

}
