ColourGrid : [Object] { | contents |

	asLineDrawing { :self |
		let matrix = self.contents;
		let [height, width] = self.shape;
		let cellSize = self.cellSize;
		let yMax = height * cellSize;
		AnnotatedGeometry(
			{ :x :y |
				let colour = matrix[y][x].asColour;
				colour.isTransparent.if {
					nil
				} {
					let x0 = (x - 1) * cellSize;
					let y0 = yMax - ((y - 1) * cellSize);
					AnnotatedGeometry(
						Rectangle(
							[x0, y0],
							[x0 + cellSize, y0 + cellSize]
						),
						(
							fillColour: colour
						)
					)
				}
			}.table(
				1.to(width),
				1.to(height)
			).collect(deleteMissing:/1).GeometryCollection,
			(
				strokeColour: nil,
				strokeWidth: nil
			)
		).asLineDrawing
	}

	cellSize { :self |
		let [m, n] = self.shape;
		(100 / m.max(n / 1.goldenRatio)).round.max(1)
	}

	drawing { :self |
		/* Simpler form for direct drawing of matrices &etc. */
		let matrix = self.contents;
		let [height, width] = self.shape;
		let cellSize = self.cellSize;
		let items = { :x :y |
			let colour = matrix[y][x].asColour;
			colour.isTransparent.if {
				nil
			} {
				'<rect x="%" y="%" width="%" height="%" fill="%"/>'.format(
					[
						(x - 1 * cellSize),
						(y - 1 * cellSize),
						cellSize,
						cellSize,
						colour.rgbString
					]
				)
			}
		}.table(
			1.to(width),
			1.to(height)
		).collect(deleteMissing:/1);
		[
			'<svg xmlns="%" width="%" height="%" viewBox="%">'.format(
				[
					'http://www.w3.org/2000/svg',
					width * cellSize,
					height * cellSize,
					self.viewBox.asSvgViewBox(margin: 0, precision: 0)
				]
			),
			items,
			'</svg>'
		].flatten.unlines.Svg
	}

	shape { :self |
		self.contents.dimensions(2)
	}

	viewBox { :self |
		Rectangle([0, 0], self.shape.reverse * self.cellSize)
	}

}

+List {

	ColourGrid { :self |
		newColourGrid().initializeSlots(self)
	}

}

+List {

	asColourDrawing { :self |
		ColourGrid(self).asLineDrawing
	}

	asGreyscaleDrawing { :self |
		self.greyscaleMatrix.asColourDrawing
	}

}
