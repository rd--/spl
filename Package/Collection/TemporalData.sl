TemporalData : [Object] { | pathList |

	linePlot { :self |
		self.pathList.linePlot
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
