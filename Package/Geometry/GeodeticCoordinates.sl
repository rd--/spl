GeodeticCoordinates : [Object] { | coordinates |

	elevation { :self |
		self.coordinates[3]
	}

	h { :self |
		self.coordinates[3]
	}

	lambda { :self |
		self.coordinates[2]
	}

	latitude { :self |
		self.coordinates[1]
	}

	longitude { :self |
		self.coordinates[2]
	}

	phi { :self |
		self.coordinates[1]
	}

}

+List {

	GeodeticCoordinates { :self |
		let c = self.copy;
		(c.size = 2).ifTrue {
			c.addLast(0)
		};
		newGeodeticCoordinates().initializeSlots(c)
	}

}
