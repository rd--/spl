@Stream {

	asStream { :self |
		self
	}

	isBinary { :self |
		self.typeResponsibility('Stream>>isBinary')
	}

	isStream { :self |
		true
	}

	reset { :self |
		self.typeResponsibility('Stream>>reset')
	}

}

+@Object {

	isStream { :self |
		false
	}

}
