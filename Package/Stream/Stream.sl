@Stream {

	cycle { :self |
		BlockStream {
			self.atEnd.ifTrue {
				self.reset!
			};
			self.next!
		} {
			self.reset!
		}
	}

	equalToOnReset { :self :places |
		let initialAnswer = self.next!(places);
		self.reset!;
		self.next!(places) = initialAnswer
	}

	equalUpToEndOnReset { :self |
		let initialAnswer = self.upToEnd;
		self.reset!;
		self.upToEnd = initialAnswer
	}

	isBinary { :self |
		self.typeResponsibility('Stream>>isBinary')
	}

	isStream { :self |
		true
	}

	reset! { :self |
		self.typeResponsibility('Stream>>reset!')
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
