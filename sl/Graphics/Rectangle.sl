Rectangle : [Object] { | origin corner |

	= { :self :aRectangle |
		aRectangle.isRectangle & {
			self.origin = aRectangle.origin
		} & {
			self.corner = aRectangle.corner
		}
	}

	area { :self |
		| h = self.height, w = self.width; |
		(h <= 0 | { w <= 0 }).if {
			0
		} {
			w * h
		}
	}

	bottomLeft { :self |
		self.origin.x @ self.corner.y
	}

	bottomRight { :self |
		self.corner
	}

	center { :self |
		self.topLeft + self.bottomRight / 2
	}

	containsPoint { :self :aPoint |
		self.origin <= aPoint & {
			aPoint < self.corner
		}
	}

	encompass { :self :aPoint |
		Rectangle(
			self.origin.min(aPoint),
			self.corner.max(aPoint)
		)
	}

	extent { :self |
		self.corner - self.origin
	}

	height { :self |
		self.corner.y - self.origin.y
	}

	intersect { :self :aRectangle |
		Rectangle(
			self.origin.max(aRectangle.origin),
			self.corner.min(aRectangle.corner)
		)
	}

	intersects { :self :aRectangle |
		self.origin.max(aRectangle.origin) < self.corner.min(aRectangle.corner)
	}

	intersectsAny { :self :rectangleList |
		withReturn {
			rectangleList.do { :r |
				self.intersects(r).ifTrue {
					true.return
				}
			};
			false
		}
	}

	left { :self |
		self.origin.x
	}

	merge { :self :aRectangle |
		Rectangle(
			self.origin.min(aRectangle.origin),
			self.corner.max(aRectangle.corner)
		)
	}

	printString { :self |
		'Rectangle(' ++ self.origin.printString ++ ', ' ++ self.corner.printString ++ ')'
	}

	scaleBy { :self :scale |
		Rectangle(self.origin * scale, self.corner * scale)
	}

	topLeft { :self |
		self.origin
	}

	topRight { :self |
		self.corner.x @ self.origin.y
	}

	translateBy { :self :factor |
		Rectangle(self.origin + factor, self.corner + factor)
	}

	width { :self |
		self.corner.y - self.origin.y
	}

	x { :self |
		origin.x
	}

	y { :self |
		origin.y
	}

}

+ Point {

	Rectangle { :self :aPoint |
		newRectangle().initialize(self, aPoint)
	}

}
