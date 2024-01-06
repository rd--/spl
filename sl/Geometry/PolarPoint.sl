PolarPoint : [Object, Point] { | r theta |

	asArray { :self |
		[self.r, self.theta]
	}

	asPolarPoint { :self |
		self
	}

	asRecord { :self |
		(r: self.r, theta: self.theta)
	}

	phi { :self |
		self.theta
	}

	rho { :self |
		self.r
	}

	x { :self |
		self.r * self.theta.cos
	}

	y { :self |
		self.r * self.theta.sin
	}

}

+@Number {

	PolarPoint { :r :theta |
		newPolarPoint().initializeSlots(r, theta)
	}

}

+Array {

	asPolarPoint { :self |
		let [r, theta] = self;
		PolarPoint(r, theta)
	}

}

+Record {

	asPolarPoint { :self |
		PolarPoint(self::r, self::theta)
	}

}
