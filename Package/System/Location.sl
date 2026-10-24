/* Requires: Url */

Location! : [Object, Url] {

	pseudoSlotNameList { :self |
		['protocol', 'hostName', 'port', 'pathName', 'search', 'hash']
	}

	reload { :self |
		<primitive: return _self.reload();>
	}

	replace { :self :url |
		<primitive: return _self.reload(_url);>
	}

}
