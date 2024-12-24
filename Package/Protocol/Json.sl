@Json {

	isJson { :self |
		true
	}

	asJson { :self |
		<primitive: return JSON.stringify(_self);>
	}

	asJson { :self :replacer :space |
		<primitive: return JSON.stringify(_self, _replacer, _space);>
	}

}
