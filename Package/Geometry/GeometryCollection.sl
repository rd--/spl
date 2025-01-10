GeometryCollection : [Object] { | contents |

	boundingBox { :self |
		self.contents.collect(boundingBox:/1).boundingBoxMerging
	}

	forSvg { :self :options |
		self.contents.collect { :each |
			each.forSvg(options)
		}.unlines
	}

	project { :self :projection |
		let projectionBlock = projection.asUnaryBlock;
		GeometryCollection(
			self.contents.collect { :each |
				each.project(projectionBlock)
			}
		)
	}

}

+List {

	GeometryCollection { :self |
		newGeometryCollection().initializeSlots(
			self.flatten
		)
	}

}
