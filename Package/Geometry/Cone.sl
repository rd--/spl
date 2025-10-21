Cone : [Object, Equatable, Geometry] { | coordinates radius |

	baseArea { :self |
		let r = self.radius;
		r.square.pi
	}

	dimension { :self |
		3
	}

	embeddingDimension { :self |
		self.coordinates.anyOne.size
	}

	height { :self |
		let [a, b] = self.coordinates;
		a.euclideanDistance(b)
	}

	lateralSurfaceArea { :self |
		let r = self.radius;
		let l = self.slantHeight;
		r.pi * l
	}

	slantHeight { :self |
		let r = self.radius;
		let h = self.height;
		(r.square + h.square).sqrt
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	volume { :self |
		let a = self.baseArea;
		let h = self.height;
		(a * h) / 3
	}

}

+List {

	Cone { :coordinates :radius |
		newCone().initializeSlots(coordinates, radius)
	}

}
