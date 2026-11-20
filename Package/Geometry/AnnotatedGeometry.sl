AnnotatedGeometry : [Object, Geometry] {

	| geometry annotation | <@Geometry>

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
		uncheckedAnnotatedGeometry(
			self,
			annotation
		)
	}

}
