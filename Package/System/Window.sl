Window! : [Object] {

	alert { :self :aString |
		<primitive: return _self.alert(_aString);>
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

	sessionStorage { :self |
		<primitive: return _self.sessionStorage;>
	}

}
