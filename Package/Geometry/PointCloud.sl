PointCloud : [Object, Geometry] { | vertexCoordinates |

	asBitmap { :self :k |
		let p = self.vertexCoordinates;
		let q = (p - [p.min]).rescale;
		let i = (q * k).rounded;
		let [w, h] = i.max;
		let a = i.collect { :each |
			let [x, y] = each;
			[h - y, x] -> 1
		};
		SparseArray(a, [h, w], 0).normal.Bitmap
	}

	boundingBox { :self |
		self.vertexCoordinates.coordinateBoundingBox
	}

	embeddingDimension { :self |
		self.vertexCoordinates.anyOne.size
	}

	forSvg { :self :options |
		self.vertexCoordinates.Point.collect { :each |
			each.forSvg(options)
		}.unlines
	}

	project { :self :projection |
		PointCloud(
			self.vertexCoordinates.collect(projection.asUnaryBlock)
		)
	}

}

+List {

	PointCloud { :self |
		newPointCloud().initializeSlots(self)
	}

}
