Frequency : [Object, Magnitude] { | hertz |

	= { :self :anObject |
		anObject.isFrequency & {
			self.hertz = anObject.hertz
		}
	}

	~ { :self :anObject |
		anObject.isFrequency & {
			self.hertz ~ anObject.hertz
		}
	}

	< { :self :aFrequency |
		self.hertz < aFrequency.hertz
	}

	asHertz { :self |
		self.hertz
	}

	Duration { :self |
		self.hertz.reciprocal.seconds
	}

	cyclesPerMinute { :self |
		self.hertz * 60
	}

	cyclesPerSecond { :self |
		self.hertz
	}

	kilohertz { :self |
		self.hertz / 1000
	}

	megaherz { :self |
		self.hertz / 1000000
	}

	storeString { :self |
		self.hertz.storeString ++ '.hertz'
	}

}

+@Number {

	asHertz { :self |
		self
	}

	hertz { :self |
		newFrequency().initializeSlots(self)
	}

	kilohertz { :self |
		(self * 1000).hertz
	}

	megaherz { :self |
		(self * 1000000).hertz
	}

}

+Duration {

	Frequency { :self |
		self.seconds.reciprocal.hertz
	}

}
