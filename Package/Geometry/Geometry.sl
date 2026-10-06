@Geometry {

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

AnnotatedGeometry : [Object, Geometry] {

	| geometry annotation |

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
		let fragmentText = self.geometry.svgFragmentText(options);
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
