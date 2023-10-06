Scale : [Object] { | startDegree intervals description |

	degree { :self |
		self.intervals.size
	}

	storeString { :self |
		['Scale(', self.startDegree, ', ', self.intervals, ', "', self.description, '")'].join
	}

	tuningDegree { :self |
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
