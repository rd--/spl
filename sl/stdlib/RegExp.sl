RegExp {

	exec { :self :aString |
		<primitive: return _self.exec(_aString);>
	}

	isRegExp { :self |
		true
	}

	test { :self :aString |
		<primitive: return _self.test(_aString);>
	}

}

+ Object {

	isRegExp { :self |
		false
	}

}

+ String {
	RegExp { :self :flags |
		<primitive: return new RegExp(_self, _flags);>
	}

	RegExp { :self |
		<primitive: return new RegExp(_self);>
	}

	allRegExpMatches { :self :aRegExp |
		<primitive: return _self.match(_aRegExp);>
	}

	asRegExp { :self |
		RegExp(self)
	}

	matchesRegExp { :self :aRegExp |
		aRegExp.test(self)
	}

}
