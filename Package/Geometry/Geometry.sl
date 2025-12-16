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
		let a = self.annotation;
		let toColour = { :x |
			x.isNil.if {
				'none'
			} {
				x.rgbString
			}
		};
		let stroke = a.atIfPresentIfAbsent('strokeColour') { :x |
			'stroke="%" '.format([toColour(x)])
		} {
			''
		};
		let strokeWidth = a.atIfPresentIfAbsent('strokeWidth') { :x |
			'stroke-width="%" '.format([x.isNil.if { 0 } { x }])
		} {
			''
		};
		let fill = a.atIfPresentIfAbsent('fillColour') { :x |
			'fill="%" '.format([toColour(x)])
		} {
			''
		};
		let fragmentText = self.geometry.svgFragment(options);
		fragmentText.includes('\n').ifTrue {
			fragmentText := '\n' ++ fragmentText ++ '\n'
		};
		'<g %%%>%</g>'.format(
			[
				stroke,
				strokeWidth,
				fill,
				fragmentText
			]
		)
	}

}

+@Geometry {

	AnnotatedGeometry { :self :annotation |
		newAnnotatedGeometry().initializeSlots(self, annotation)
	}

}
