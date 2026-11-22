PerspectiveDrawing : [Object] {

	| geometryList metadata | <List>

	LineDrawing { :self |
		let projection = self.metadata['projection'];
		LineDrawing(
			self.geometryList.collect { :each |
				each.project(projection)
			},
			self.metadata
		)
	}

	drawing { :self |
		self.LineDrawing.drawing
	}

}

+List {

	PerspectiveDrawing { :self :options |
		uncheckedPerspectiveDrawing(
			self.flatten,
			options
		)
	}

	PerspectiveDrawing { :self |
		PerspectiveDrawing(
			self,
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
