@Json {

	isJson { :self |
		true
	}

	encodeJson { :self |
		<primitive: return JSON.stringify(_self);>
	}

	encodeJson { :self :replacer :space |
		<primitive: return JSON.stringify(_self, _replacer, _space);>
	}

}
