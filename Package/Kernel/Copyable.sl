@Copyable {

	copy { :self |
		let answer = self.shallowCopy;
		answer.postCopy;
		answer
	}

	postCopy { :self |
		nil
	}

	shallowCopy { :self |
		self.primitiveCopy
	}

}
