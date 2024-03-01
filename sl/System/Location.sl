{- Requires: Url -}

Location! : [Object, Url] {

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
