@Point {

	= { :self :aPoint |
		self.x = aPoint.x & {
			self.y = aPoint.y
		}
	}

	< { :self :aPoint |
		self.x < aPoint.x & {
			self.y < aPoint.y
		}
	}

	<= { :self :aPoint |
		self.x <= aPoint.x & {
			self.y <= aPoint.y
		}
	}

	abs { :self |
		self.x.abs @ self.y.abs
	}

	at { :self :index |
		index.caseOfOtherwise([
			1 -> { self.x },
			2 -> { self.y }
		]) {
			self.error('@Point>>at: index out of range')
		}
	}

	atPut { :self :index :value |
		index.caseOfOtherwise([
			1 -> { self.x := value },
			2 -> { self.y := value }
		]) {
			self.error('@Point>>atPut: index out of range')
		}
	}

	closeTo { :self :aPoint |
		self.x.closeTo(aPoint.x) & {
			self.y.closeTo(aPoint.y)
		}
	}

	distance { :self :aPoint |
		|(
			dx = aPoint.x - self.x,
			dy = aPoint.y - self.y
		)|
		((dx * dx) + (dy * dy)).sqrt
	}

	dotProduct { :self :aPoint |
		(self.x * aPoint.x) + (self.y * aPoint.y)
	}

	isPoint { :self |
		true
	}

	isZero { :self |
		self.x.isZero & {
			self.y.isZero
		}
	}

	max { :self :aPoint |
		self.x.max(aPoint.x) @ self.y.max(aPoint.y)
	}

	min { :self :aPoint |
		self.x.min(aPoint.x) @ self.y.min(aPoint.y)
	}

	norm { :self |
		(self.x.squared + self.y.squared).sqrt
	}

	normalized { :self |
		self / self.norm
	}

	size { :self |
		2
	}

	translateBy { :self :delta |
		(delta.x + self.x) @ (delta.y + self.y)
	}

}

+@Object {

	isPoint { :self |
		false
	}

}
