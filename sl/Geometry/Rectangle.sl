{- Requires: RectangularCoordinates -}

Rectangle : [Object] { | lowerLeft upperRight |

	= { :self :anObject |
		anObject.isRectangle & {
			self.lowerLeft = anObject.lowerLeft & {
				self.upperRight = anObject.upperRight
			}
		}
	}

	arcLength { :self |
		self.perimeter
	}

	area { :self |
		let h = self.height;
		let w = self.width;
		(
			h <= 0 | {
				w <= 0
			}
		).if {
			0
		} {
			w * h
		}
	}

	asString { :self :aBlock:/1 |
		[
			'Rectangle(',
				aBlock(self.lowerLeft),
				', ',
				aBlock(self.upperRight),
			')'
		].stringJoin
	}

	center { :self |
		self.lowerLeft + self.upperRight / 2
	}

	centerLeft { :self |
		self.left @ self.center.y
	}

	centerRight { :self |
		self.right @ self.center.y
	}

	circumcircle { :self |
		Circle(self.center, self.circumradius)
	}

	circumradius { :self |
		(self.width.squared + self.height.squared).sqrt
	}

	containsPoint { :self :aPoint |
		self.lowerLeft <= aPoint & {
			aPoint < self.upperRight
		}
	}

	dimension { :self |
		2
	}

	embeddingDimension { :self |
		2
	}

	encompass { :self :aPoint |
		Rectangle(
			self.lowerLeft.min(aPoint),
			self.upperRight.max(aPoint)
		)
	}

	extent { :self |
		self.upperRight - self.lowerLeft
	}

	height { :self |
		self.upperRight.y - self.lowerLeft.y
	}

	incircle { :self |
		Circle(self.center, self.inradius)
	}

	inradius { :self |
		self.isSquare.if {
			self.width / 2
		} {
			self.error('Rectangle>>inradius: not square')
		}
	}

	intersect { :self :aRectangle |
		Rectangle(
			self.lowerLeft.max(aRectangle.lowerLeft),
			self.upperRight.min(aRectangle.upperRight)
		)
	}

	intersects { :self :aRectangle |
		let ll = self.lowerLeft.max(aRectangle.lowerLeft);
		let ur = self.upperRight.min(aRectangle.upperRight);
		ll < ur
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

	isSquare { :self |
		self.width = self.height
	}

	left { :self |
		self.lowerLeft.x
	}

	lower { :self |
		self.lowerLeft.y
	}

	lowerCenter { :self |
		self.center.x @ self.lower
	}

	lowerHalf { :self |
		Rectangle(self.lowerLeft, self.centerRight)
	}

	lowerLeftQuadrant { :self |
		Rectangle(self.lowerLeft, self.center)
	}

	lowerRight { :self |
		self.upperRight.x @ self.lowerLeft.y
	}

	lowerRightQuadrant { :self |
		Rectangle(self.lowerCenter, self.centerRight)
	}

	merge { :self :aRectangle |
		Rectangle(
			self.lowerLeft.min(aRectangle.lowerLeft),
			self.upperRight.max(aRectangle.upperRight)
		)
	}

	perimeter { :self |
		(self.width + self.height) * 2
	}

	pointAtFraction { :self :relativePoint |
		self.lowerLeft + (self.extent * relativePoint)
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
		self.upperRight.x
	}

	scaleBy { :self :scale |
		Rectangle(
			self.lowerLeft * scale,
			self.upperRight * scale
		)
	}

	swallow { :self :aRectangle |
		self.lowerLeft := self.lowerLeft.min(aRectangle.lowerLeft);
		self.upperRight := self.upperRight.max(aRectangle.upperRight)
	}

	upper { :self |
		self.upperRight.y
	}

	upperCenter { :self |
		self.center.x @ self.upper
	}

	upperHalf { :self |
		Rectangle(self.centerLeft, self.upperRight)
	}

	upperLeft { :self |
		self.lowerLeft.x @ self.upperRight.y
	}

	upperLeftQuadrant { :self |
		Rectangle(self.centerLeft, self.upperCenter)
	}

	upperRightQuadrant { :self |
		Rectangle(self.center, self.upperRight)
	}

	translateBy { :self :factor |
		Rectangle(
			self.lowerLeft + factor,
			self.upperRight + factor
		)
	}

	width { :self |
		self.upperRight.x - self.lowerLeft.x
	}

	withLower { :self :y |
		self.lowerLeft.upperRight(self.upperRight.x @ y)
	}

	x { :self |
		self.lowerLeft.x
	}

	y { :self |
		self.lowerLeft.y
	}

}

+RectangularCoordinates {

	RectangeCenterExtent { :centerPoint :extentPoint |
		let half = extentPoint / 2;
		Rectangle(centerPoint - half, centerPoint + half)
	}

	Rectangle { :lowerLeft :upperRight |
		newRectangle().initializeSlots(lowerLeft, upperRight)
	}

}

+List {

	asRectangle { :self |
		(self.shape = [2 2]).if {
			Rectangle(self.first, self.second)
		} {
			self.error('List>>asRectangle')
		}
	}

	computeBoundingBox { :self |
		let box = Rectangle(self[1], self[1]);
		self.do { :aPoint |
			box.swallow(Rectangle(aPoint, aPoint))
		};
		box
	}

	Rectangle { :lowerLeft :upperRight |
		Rectangle(lowerLeft.asRectangularCoordinates, upperRight.asRectangularCoordinates)
	}

}

+@Sequence {

	rectangleMerging { :self |
		let lowerLeft = self.first.lowerLeft;
		let upperRight = self.first.upperRight;
		self.allButFirstDo { :each |
			lowerLeft := lowerLeft.min(each.lowerLeft);
			upperRight := upperRight.max(each.upperRight)
		};
		Rectangle(lowerLeft, upperRight)
	}

}
