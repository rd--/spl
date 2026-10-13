@New {

	species { :self |
		self.typeReponsibility('species')
	}

}

+@New {

	new { :self :aNumber |
		self.species.cull(aNumber)
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

}
