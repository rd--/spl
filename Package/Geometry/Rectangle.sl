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

	asPolygon { :self |
		self.vertexCoordinates.Polygon
	}

	asString { :self :aBlock:/1 |
		[
			'Rectangle(',
			aBlock(self.lowerLeft),
			', ',
			aBlock(self.upperRight),
			')'
		].join('')
	}

	boundingBox { :self |
		[
			self.lowerLeft,
			self.upperRight
		]
	}

	center { :self |
		self.lowerLeft + self.upperRight / 2
	}

	centerLeft { :self |
		[self.left, self.center[2]]
	}

	centerRight { :self |
		[self.right, self.center[2]]
	}

	centroid { :self |
		self.center
	}

	circumcircle { :self |
		Circle(self.center, self.circumradius)
	}

	circumradius { :self |
		(self.width.squared + self.height.squared).sqrt
	}

	containsPoint { :self :aPoint |
		(self.lowerLeft <= aPoint).allTrue & {
			(aPoint <self.upperRight).allTrue
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

	faceCount { :self |
		1
	}

	faceIndices { :self |
		[[1 .. 4]]
	}

	forSvg { :self :options |
		let precision = options::precision;
		'<rect x="%" y="%" width="%" height="%" />'.format([
			self.x.printStringToFixed(precision),
			self.y.printStringToFixed(precision),
			self.width.printStringToFixed(precision),
			self.height.printStringToFixed(precision)
		])
	}

	height { :self |
		self.upperRight[2] - self.lowerLeft[2]
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
		self.lowerLeft[1]
	}

	lower { :self |
		self.lowerLeft[2]
	}

	lowerCenter { :self |
		[self.center[1], self.lower]
	}

	lowerHalf { :self |
		Rectangle(self.lowerLeft, self.centerRight)
	}

	lowerLeftQuadrant { :self |
		Rectangle(self.lowerLeft, self.center)
	}

	lowerRight { :self |
		[self.upperRight[1], self.lowerLeft[2]]
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

	randomPoint { :self :rng :shape |
		{
			self.pointAtFraction(
				[
					rng.nextRandomFloat,
					rng.nextRandomFloat
				]
			)
		} ! shape
	}

	right { :self |
		self.upperRight[1]
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
		self.upperRight[2]
	}

	upperCenter { :self |
		[self.center[1], self.upper]
	}

	upperHalf { :self |
		Rectangle(self.centerLeft, self.upperRight)
	}

	upperLeft { :self |
		[self.lowerLeft[1], self.upperRight[2]]
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

	vertexCoordinates { :self |
		[
			self.lowerLeft
			self.lowerRight
			self.upperRight
			self.upperLeft
		]
	}

	vertexCount { :self |
		4
	}

	width { :self |
		self.upperRight[1] - self.lowerLeft[1]
	}

	withLower { :self :y |
		self.lowerLeft.upperRight([self.upperRight[1], y])
	}

	x { :self |
		self.lowerLeft[1]
	}

	y { :self |
		self.lowerLeft[2]
	}

}

+List {

	asRectangle { :self |
		(self.shape = [2 2]).if {
			Rectangle(self.first, self.second)
		} {
			self.error('List>>asRectangle: invalid shape')
		}
	}

	boundingBoxMerging { :self |
		let lowerLeft = self[1][1];
		let upperRight = self[1][2];
		self.allButFirstDo { :each |
			lowerLeft := lowerLeft.min(each[1]);
			upperRight := upperRight.max(each[2])
		};
		[lowerLeft, upperRight]
	}

	computeBoundingBoxRectangle { :self |
		let answer = Rectangle(self[1], self[1]);
		self.allButFirstDo { :aPoint |
			answer.swallow(Rectangle(aPoint, aPoint))
		};
		answer
	}

	rectangleMerging { :self |
		self.boundingBoxMerging.asRectangle
	}

	Rectangle { :lowerLeft :upperRight |
		(lowerLeft.rank > 1).if {
			lowerLeft.withCollect(upperRight.nest, Rectangle:/2)
		} {
			newRectangle().initializeSlots(lowerLeft, upperRight)
		}
	}

	RectangleCenterExtent { :centerPoint :extentPoint |
		let half = extentPoint / 2;
		Rectangle(centerPoint - half, centerPoint + half)
	}

	unitSquare { :center |
		Rectangle(
			center - [0.5, 0.5],
			center + [0.5, 0.5]
		)
	}

}
