@Copy {

	copy { :self |
		let answer = self.shallowCopy;
		answer.postCopy;
		answer
	}

	deepCopy { :self |
		self.primitiveObjectDeepCopy
	}

	postCopy { :self |
		nil
	}

	shallowCopy { :self |
		self.primitiveObjectShallowCopy
	}

}
