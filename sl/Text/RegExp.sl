RegExp : [Object] {

	asString { :self |
		<primitive: return _self.toString();>
	}

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

+ @Object {

	isRegExp { :self |
		false
	}

}

+ String {

	allRegExpMatches { :self :aRegExp |
		<primitive: return _self.match(_aRegExp);>
	}

	asRegExp { :self |
		RegExp(self)
	}

	matchesRegExp { :self :aRegExp |
		aRegExp.test(self)
	}

	splitRegExp { :self :aRegExp |
		<primitive: return _self.split(_aRegExp);>
	}

	RegExp { :self :flags |
		<primitive: return new RegExp(_self, _flags);>
	}

	RegExp { :self |
		<primitive: return new RegExp(_self);>
	}

}
