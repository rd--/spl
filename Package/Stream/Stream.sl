@Stream {

	reset! { :self |
		self.typeResponsibility('Stream>>reset!')
	}

}

+@Stream {

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

	Stream { :self |
		self
	}

}

+@Object {

	isStream { :self |
		false
	}

}
