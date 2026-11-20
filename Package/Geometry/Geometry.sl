@Geometry {

	LineDrawing { :self |
		LineDrawing([self])
	}

	PerspectiveDrawing { :self :projection |
		PerspectiveDrawing(
			[self],
			(
				projection: projection,
				height: 100
			)
		)
	}

	PerspectiveDrawing { :self |
		PerspectiveDrawing([self])
	}

	boundingBox { :self |
		self.typeResponsibility('boundingBox')
	}

	drawing { :self |
		let d = self.embeddingDimension;
		(d = 2).if {
			self.LineDrawing.drawing
		} {
			self.PerspectiveDrawing.drawing
		}
	}

	embeddingDimension { :self |
		self.typeResponsibility('embeddingDimension')
	}

	svgFragment { :self :options |
		self.typeResponsibility('svgFragment')
	}

	svgFragmentText { :self :options |
		let fragment = self.svgFragment(options);
		fragment.isString.if {
			fragment
		} {
			fragment.flatten.stringIntercalate('\n')
		}
	}

}
