@Json {

	encodeJson { :self |
		self.typeResponsibility('encodeJson')
	}

	isJson { :self |
		true
	}

	uncheckedEncodeJson { :self |
		<primitive: return JSON.stringify(_self);>
	}

	uncheckedEncodeJson { :self :replacer :space |
		<primitive: return JSON.stringify(_self, _replacer, _space);>
	}

}
