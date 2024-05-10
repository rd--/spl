{- Requires: RectangularCoordinates -}

Rectangle : [Object] { | origin corner |

	= { :self :anObject |
		anObject.isRectangle & {
			self.origin = anObject.origin & {
				self.corner = anObject.corner
			}
		}
	}

	area { :self |
		let h = self.height;
		let w = self.width;
		(h <= 0 | {
			w <= 0
		}).if {
			0
		} {
			w * h
		}
	}

	asString { :self :toString:/1 |
		[
			'Rectangle(',
				self.origin.toString,
				', ',
				self.corner.toString,
			')'
		].join
	}

	bottomLeft { :self |
		self.origin.x @ self.corner.y
	}

	bottomRight { :self |
		self.corner
	}

	ceiling { :self |
		self.isInteger.if {
			self
		} {
			self.x.ceiling @ self.y.ceiling
		}
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

	floor { :self |
		self.isInteger.if {
			self
		} {
			self.x.floor @ self.y.floor
		}
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
		valueWithReturn { :return:/1 |
			rectangleList.do { :r |
				self.intersects(r).ifTrue {
					true.return
				}
			};
			false
		}
	}

	isInteger { :self |
		self.x.isInteger & {
			self.y.isInteger
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

	pointAtFraction { :self :relativePoint |
		self.origin + (self.extent * relativePoint)
	}

	printString { :self |
		self.asString(printString:/1)
	}

	storeString { :self |
		self.asString(storeString:/1)
	}

	randomPoint { :self |
		self.pointAtFraction(1.randomFloat @ 1.randomFloat)
	}

	right { :self |
		self.corner.x
	}

	rightCenter { :self |
		self.corner.x @ self.center.y
	}

	rounded { :self |
		self.isInteger.if {
			self
		} {
			self.x.rounded @ self.y.rounded
		}
	}

	scaleBy { :self :scale |
		Rectangle(self.origin * scale, self.corner * scale)
	}

	swallow { :self :aRectangle |
		self.origin := self.origin.min(aRectangle.origin);
		self.corner := self.corner.max(aRectangle.corner)
	}

	top { :self |
		self.origin.y
	}

	topCenter { :self |
		self.center.x @ self.origin.y
	}

	topHalf { :self |
		self.withBottom(self.center.y)
	}

	topLeft { :self |
		self.origin
	}

	topLeftQuadrant { :self |
		self.topLeft.corner(self.center)
	}

	topRight { :self |
		self.corner.x @ self.origin.y
	}

	topRightQuadrant { :self |
		self.topCenter.corner(self.rightCenter)
	}

	translateBy { :self :factor |
		Rectangle(self.origin + factor, self.corner + factor)
	}

	width { :self |
		self.corner.x - self.origin.x
	}

	withBottom { :self :y |
		self.origin.corner(self.corner.x @ y)
	}

	x { :self |
		self.origin.x
	}

	y { :self |
		self.origin.y
	}

}

+RectangularCoordinates {

	corner { :self :aPoint |
		self.rectangleOriginCorner(aPoint)
	}

	extent { :self :aPoint |
		self.rectangleOriginExtent(aPoint)
	}

	rectangle { :self :aPoint |
		rectangleOriginCorner(self.min(aPoint), self.max(aPoint))
	}

	rectangeCenterExtent { :centerPoint :extentPoint |
		rectangleOriginExtent(centerPoint - (extentPoint // 2), extentPoint)
	}

	rectangleOriginCorner { :originPoint :cornerPoint |
		newRectangle().initializeSlots(originPoint, cornerPoint)
	}

	rectangleOriginExtent { :originPoint :extentPoint |
		rectangleOriginCorner(originPoint, originPoint + extentPoint)
	}

	Rectangle { :originPoint :cornerPoint |
		rectangleOriginCorner(originPoint, cornerPoint)
	}

}

+List {

	computeBoundingBox { :self |
		let box = Rectangle(self[1], self[1]);
		self.do { :aPoint |
			box.swallow(Rectangle(aPoint, aPoint))
		};
		box
	}

}

+@Sequence {

	rectangleMerging { :self |
		let topLeft = self.first.topLeft;
		let bottomRight = self.first.bottomRight;
		self.allButFirstDo { :each |
			topLeft := topLeft.min(each.topLeft);
			bottomRight := bottomRight.max(each.bottomRight)
		};
		Rectangle(topLeft, bottomRight)
	}

}
