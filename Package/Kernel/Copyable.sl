@Copyable {

	copy { :self |
		let answer = self.shallowCopy;
		answer.postCopy;
		answer
	}

	deepCopy { :self |
		<primitive: return structuredClone(_self);>
	}

	postCopy { :self |
		self
	}

	shallowCopy { :self |
		<primitive: return Object.assign({}, _self);>
	}

}
