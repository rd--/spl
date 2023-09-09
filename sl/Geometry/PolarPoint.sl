PolarPoint : [Object, Point] { | r t |

	PolarPoint { :self |
		self
	}

	x { :self |
		self.r * self.t.cos
	}

	y { :self |
		self.r * self.t.sin
	}

}

+@Number {

	PolarPoint { :self :t |
		newPolarPoint().initializeSlots(self, t)
	}

}
