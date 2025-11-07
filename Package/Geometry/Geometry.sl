@Geometry {

	asLineDrawing { :self |
		LineDrawing([self])
	}

	asPerspectiveDrawing { :self :projection |
		PerspectiveDrawing(
			[self],
			(
				projection: projection,
				height: 100
			)
		)
	}

	asPerspectiveDrawing { :self |
		PerspectiveDrawing([self])
	}

	boundingBox { :self |
		self.typeResponsibility('boundingBox')
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

	svgFragment { :self :options |
		self.typeResponsibility('svgFragment')
	}

}

AnnotatedGeometry : [Object, Geometry] { | geometry annotation |

	boundingBox { :self |
		self.geometry.boundingBox
	}

	embeddingDimension { :self |
		self.geometry.embeddingDimension
	}

	svgFragment { :self :options |
		'<g fill="%">%</g>'.format(
			[
				self.annotation.at('fillColour').rgbString,
				self.geometry.svgFragment(options)
			]
		)
	}

}

+@Geometry {

	AnnotatedGeometry { :self :annotation |
		newAnnotatedGeometry().initializeSlots(self, annotation)
	}

}
