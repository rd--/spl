@Copy {

	copy { :self |
		let answer = self.shallowCopy;
		answer.postCopy;
		answer
	}

	deepCopy { :self |
		self.primitiveDeepCopy
	}

	postCopy { :self |
		nil
	}

	shallowCopy { :self |
		self.primitiveShallowCopy
	}

}
