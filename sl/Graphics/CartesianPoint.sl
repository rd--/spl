@CartesianPoint {

	= { :self :anObject |
		(self.x = anObject.x) & { self.y = anObject.y }
	}

	< { :self :aPoint |
		self.x < aPoint.x & { self.y < aPoint.y }
	}

	<= { :self :aPoint |
		self.x <= aPoint.x & { self.y <= aPoint.y }
	}

	max { :self :aPoint |
		self.x.max(aPoint.x) @ self.y.max(aPoint.y)
	}

	min { :self :aPoint |
		self.x.min(aPoint.x) @ self.y.min(aPoint.y)
	}

	r { :self |
		(* r = radius = rho *)
		(self.x.squared + self.y.squared).sqrt
	}

	t { :self |
		(* t = theta *)
		atan2(self.y, self.x)
	}

}

+ Number {

	adaptToPointAndApply { :self :aPoint :aProcedure:/2 |
		aProcedure(aPoint, self.asPoint)
	}

}
