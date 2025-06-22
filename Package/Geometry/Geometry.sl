@Geometry {

	asLineDrawing { :self |
		[self].LineDrawing
	}

	asPerspectiveDrawing { :self :projection |
		[self].PerspectiveDrawing(
			projection: projection,
			height: 100
		)
	}

	asPerspectiveDrawing { :self |
		[self].PerspectiveDrawing
	}

	drawing { :self |
		let d = self.embeddingDimension;
		(d = 2).if {
			self.asLineDrawing.drawing
		} {
			self.asPerspectiveDrawing.drawing
		}
	}

	embeddingDimension { :self |
		self.typeResponsibility('embeddingDimension')
	}

}
