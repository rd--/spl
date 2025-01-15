Window! : [Object] {

	alert { :self :aString |
		<primitive: return _self.alert(_aString);>
	}

	caches { :self |
		<primitive: return _self.caches;>
	}

	confirm { :self :aString |
		<primitive: return _self.confirm(_aString);>
	}

	document { :self |
		<primitive: return _self.document;>
	}

	localStorage { :self |
		<primitive: return _self.localStorage;>
	}

	location { :self |
		<primitive: return _self.location;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	navigator { :self |
		<primitive: return _self.navigator;>
	}

	prompt { :self :message :defaultValue |
		<primitive: return _self.prompt(_message, _defaultValue);>
	}

	pseudoSlotNameList { :self |
		['localStorage', 'location', 'name', 'navigator', 'sessionStorage']
	}

	requestAnimationFrame { :self :aBlock:/1 |
		<primitive: return _self.requestAnimationFrame(_aBlock_1);>
	}

	sessionStorage { :self |
		<primitive: return _self.sessionStorage;>
	}

}
