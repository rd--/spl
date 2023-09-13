RegExp! : [Object] {

	asRegExp { :self |
		self
	}

	exec { :self :aString |
		<primitive: return _self.exec(_aString);>
	}

	flags { :self |
		<primitive: return _self.flags;>
	}

	source { :self |
		<primitive: return _self.source;>
	}

	storeString { :self |
		<primitive: return `RegExp('${_self.source}', '${_self.flags}')`;>
	}

	stringLiteral { :self |
		<primitive: return _self.toString();>
	}

	test { :self :aString |
		<primitive: return _self.test(_aString);>
	}

}

+String {

	allRegExpMatches { :self :aRegExp |
		<primitive: return _self.match(_aRegExp);>
	}

	asRegExp { :self |
		RegExp(self)
	}

	matchesRegExp { :self :aRegExp |
		aRegExp.asRegExp.test(self)
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
