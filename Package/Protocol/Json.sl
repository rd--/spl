@Json {

	isJson { :self |
		true
	}

	encodeJson { :self |
		self.typeResponsibility('encodeJson')
	}

	uncheckedEncodeJson { :self |
		<primitive: return JSON.stringify(_self);>
	}

	uncheckedEncodeJson { :self :replacer :space |
		<primitive: return JSON.stringify(_self, _replacer, _space);>
	}

}
