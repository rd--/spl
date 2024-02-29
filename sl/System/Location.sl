@Location {

	hash { :self |
		<primitive: return _self.hash;>
	}

	host { :self |
		<primitive: return _self.host;>
	}

	hostName { :self |
		<primitive: return _self.hostname;>
	}

	href { :self |
		<primitive: return _self.href;>
	}

	origin { :self |
		<primitive: return _self.origin;> {- Read only -}
	}

	pathName { :self |
		<primitive: return _self.pathname;>
	}

	port { :self |
		<primitive: return _self.port;>
	}

	protocol { :self |
		<primitive: return _self.protocol;>
	}

	search { :self |
		<primitive: return _self.search;>
	}

}

Location! : [Object, Location] {

	reload { :self |
		<primitive: return _self.reload();>
	}

	replace { :self :url |
		<primitive: return _self.reload(_url);>
	}

	pseudoSlotNameList { :self |
		['protocol', 'hostName', 'port', 'pathName', 'search', 'hash']
	}

}
