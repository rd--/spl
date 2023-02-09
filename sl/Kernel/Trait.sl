Trait : [Object] {

	methodDictionary { :self |
		<primitive: return _self.methodDictionary;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	prefixedName { :self |
		'𝒯' ++ self.name (*  𝜏 𝑡 𝑇 @ *)
	}

}
