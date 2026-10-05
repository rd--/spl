PerspectiveDrawing : [Object] { | components metadata |

	asLineDrawing { :self |
		let projection = self.metadata['projection'];
		LineDrawing(
			self.components.collect { :each |
				each.project(projection)
			},
			self.metadata
		)
	}

	drawing { :self |
		self.asLineDrawing.drawing
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
