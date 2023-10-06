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
		|(
			ratios = self.ratios,
			vectorLimit = self.limit.min(13),
			div = 'div'.createElement
		)|
		div.appendChildren([
			[
				['Degree', self.degree.asString],
				['Limit', self.limit.asString],
				['Description', self.description],
				['Octave', self.octave.asString]
			].asHtmlTable,
			[
				[1 .. self.degree],
				ratios,
				ratios.collect { :each |
					each.latticeVectorString(vectorLimit)
				},
				self.cents.rounded,
				self.integers
			].transposed.asHtmlTable,
			(self.limit > 13).if {
				'No drawing'.TextParagraph
			} {
				self.latticeDrawing
			}
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

+SmallKansas {

	ScalaJiTuningBrowser { :self :jiTunings |
		|(
			degrees = jiTunings.collect(degree:/1).values.withoutDuplicates.sort.collect(asString:/1),
			selectedDegree = nil,
			selectedLimit = nil
		)|
		self.ColumnBrowser('Scala Ji Tuning Browser', 'text/html', false, true, [1, 1, 4], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('Degree/Limit/Name');
					degrees
				},
				1 -> {
					browser.setStatus('Degree = ' ++ path[1]);
					selectedDegree := path[1].parseInteger(10);
					jiTunings.select { :each |
						each.degree = selectedDegree
					}.collect { :each |
						each.limit
					}.values.withoutDuplicates.sort.collect(asString:/1)
				},
				2 -> {
					browser.setStatus(['Degree = ', path[1], ', Limit = ', path[2]].join);
					selectedLimit := path[2].parseInteger(10);
					jiTunings.select { :each |
						each.degree = selectedDegree & {
							each.limit = selectedLimit
						}
					}.indices
				},
				3 -> {
					| jiTuning = jiTunings[path[3]]; |
					browser.setStatus(jiTuning.description);
					jiTuning.htmlView.outerHTML
				}
			])
		}
	}

}

+@Cache {

	jiScala { :self |
		self.useLibraryItem(
			LibraryItem(
				'jiScala',
				'https://rohandrape.net/sw/hmt/data/json/scala-ji-tuning.json',
				'application/json',
				{ :item |
					item.collect { :each |
						each.includesKey('octave').if {
							| [numerator, denominator] = each::octave; |
							each::octave := Fraction(numerator, denominator)
						} {
							each::octave := 2:1
						};
						each.JiTuning
					}
				}
			)
		)
	}

}

ScalaJiTuningBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.jiScala.then { :jiTuning |
			smallKansas.addFrame(smallKansas.ScalaJiTuningBrowser(jiTuning), event)
		}
	}

}
