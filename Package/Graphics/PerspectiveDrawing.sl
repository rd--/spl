PerspectiveDrawing : [Object] {

	| components metadata |

	drawing { :self |
		self.LineDrawing.drawing
	}

	LineDrawing { :self |
		let projection = self.metadata['projection'];
		LineDrawing(
			self.components.collect { :each |
				each.project(projection)
			},
			self.metadata
		)
	}

}

+List {

	PerspectiveDrawing { :self :options |
		newPerspectiveDrawing().initializeSlots(
			self.flatten,
			options
		)
	}

	PerspectiveDrawing { :self |
		self.PerspectiveDrawing(
			(
				projection: AxonometricProjection(
					1/6.pi, 0, 0,
					0.5, 1, -1
				),
				height: 100
			)
		)
	}

}
