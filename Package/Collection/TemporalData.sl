TemporalData : [Object] { | pathList |

	dataPointCount { :self |
		self.pathList.collect(size:/1).sum
	}

	discretePlot { :self |
		self.pathList.discretePlot
	}

	isRegular { :self |
		self.timeList.allSatisfy { :each |
			each.differences.allEqual
		}
	}

	linePlot { :self |
		self.pathList.linePlot
	}

	minimumIncrement { :self |
		self.timeList.collect { :each |
			each.differences.min
		}.min
	}

	pathCount { :self |
		self.pathList.size
	}

	timeList { :self |
		self.pathList.collect { :each |
			each.transposed.first
		}
	}

	valueList { :self |
		self.pathList.collect { :each |
			each.transposed.second
		}
	}

}

+List {

	TemporalData { :self |
		newTemporalData().initializeSlots(self)
	}

}
