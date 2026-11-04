@New {

	new { :self :aNumber |
		let f/1 = self.species;
		f(aNumber)
	}

	new { :self |
		self.new(0)
	}

	newFrom { :self :aCollection |
		let size = aCollection.size;
		let answer = self.new(size);
		answer.fillFrom!(aCollection);
		answer
	}

	newOfSize { :self :aNumber |
		let answer = self.new(aNumber);
		(answer.size != aNumber).ifTrue {
			answer.extendToSize!(aNumber)
		};
		answer
	}

	species { :self |
		self.typeReponsibility('species')
	}

}

