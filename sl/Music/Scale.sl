Scale : [Object] { | startDegree intervals description |

	size { :self |
		self.intervals.size
	}

	storeString { :self |
		['Scale(', self.startDegree, ', ', self.intervals, ', "', self.description, '")'].join
	}

	tuningIndices { :self |
		| sum = self.startDegree, answer = [sum], tuningSize = self.tuningSize; |
		self.intervals.allButLastDo { :item |
			sum := ((sum - 1 + item) % tuningSize) + 1; (* one-indexed modulo *)
			answer.add(sum)
		};
		answer
	}

	tuningSize { :self |
		self.intervals.sum
	}

}

+@Integer {

	Scale { :startDegree :intervals :description |
		newScale().initializeSlots(startDegree, intervals, description)
	}

}

+Array {

	Scale { :self |
		| [startDegree, intervals, description] = self; |
		Scale(startDegree, intervals, description)
	}

}
