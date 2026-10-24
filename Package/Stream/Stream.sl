@Stream {

	reset! { :self |
		self.typeResponsibility('Stream>>reset!')
	}

}

+@Stream {

	Stream { :self |
		self
	}

	equalToOnReset { :self :places |
		let initialAnswer = self.next(places);
		self.reset!;
		self.next(places) = initialAnswer
	}

	equalUpToEndOnReset { :self |
		let initialAnswer = self.upToEnd;
		self.reset!;
		self.upToEnd = initialAnswer
	}

	isStream { :self |
		true
	}

}

+@Object {

	isStream { :self |
		false
	}

}
