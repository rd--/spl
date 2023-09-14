+Graph {

	drawing { :self :scale :derivePoint:/1 |
		|(
			lineWidth = 1,
			points = self.vertexLabels.collect(derivePoint:/1),
			bbox = points.computeBoundingBox.scaleBy(scale),
			lineWidth = 1,
			dots = points.collect { :each |
				'circle'.createSvgElement (
					cx: each.x,
					cy: each.y,
					r: lineWidth * 2,
					fill: 'black'
				)
			},
			lines = self.edges.collect { :each |
				| [i, j] = each; |
				'line'.createSvgElement (
					x1: points[i].x,
					y1: points[i].y,
					x2: points[j].x,
					y2: points[j].y,
					stroke: 'black',
					'stroke-width': lineWidth
				)
			},
			svg = 'svg'.createSvgElement (
				width: bbox.width,
				height: bbox.height,
				viewBox: bbox.viewBoxString(5),
				preserveAspectRatio: 'xMidYMid meet'
			),
			group = 'g'.createSvgElement (
				transform: 'translate(0, ' ++ (bbox.height + (2 * bbox.origin.y)) ++ ') scale(' ++ scale ++ ', -' ++ scale ++ ')'
			)
		)|
		group.appendChildren(dots);
		group.appendChildren(lines);
		svg.appendChild(group);
		svg
	}

}

+JiTuning {

	htmlView { :self |
		| ratios = self.ratios, div = 'div'.createElement; |
		div.appendChildren([
			[
				[1 .. self.degree],
				ratios,
				ratios.collect { :each |
					each.latticeVectorString(self.limit)
				},
				self.cents.rounded,
				self.integerPitches
			].transpose.asHtmlTable,
			self.latticeDrawing
		]);
		div
	}

	latticeDrawing { :self |
		self.latticeGraph.drawing(1, identity:/1)
	}

	latticeGraph { :self |
		|(
			vertices = self.latticeVertices,
			edges = self.latticeEdges(vertices),
			points = vertices.collect(wilsonLatticeCoordinates:/1) * 4
		)|
		Graph(vertices.size, edges, points, nil)
	}

}

+Record {

	ScalaJiTuningBrowser { :self |
		| degrees = self.collect(degree:/1).Set.Array.sorted.collect(asString:/1); |
		ColumnBrowser('Scala Ji Tuning Browser', 'text/html', false, true, [1, 1, 4], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('Degree/Limit/Name');
					degrees
				},
				1 -> {
					browser.setStatus('Degree = ' ++ path[1]);
					self.select { :each |
						each.degree = path[1].parseInteger(10)
					}.collect { :each |
						each.limit
					}.Set.Array.sorted.collect(asString:/1)
				},
				2 -> {
					browser.setStatus(['Degree = ', path[1], ', Limit = ', path[2]].join);
					self.select { :each |
						each.degree = path[1].parseInteger(10) & {
							each.limit = path[2].parseInteger(10)
						}
					}.indices
				},
				3 -> {
					| ji = self[path[3]]; |
					browser.setStatus(ji.description);
					ji.htmlView.outerHTML
				}
			])
		}
	}

}

+SmallKansas {

	jiScala { :self |
		self.useLibraryItem(
			LibraryItem(
				'jiScala',
				'https://rohandrape.net/sw/hmt/data/json/scala-ji-tuning.json',
				'application/json',
				{ :item |
					item.collect(JiTuning:/1)
				}
			)
		)
	}

}

ScalaJiTuningBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.jiScala.then { :jiTuning |
			smallKansas.addFrame(jiTuning.ScalaJiTuningBrowser, event)
		}
	}

}
