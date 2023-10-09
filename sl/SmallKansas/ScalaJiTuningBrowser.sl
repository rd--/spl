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

+RatioTuning {

	htmlView { :self |
		|(
			ratios = self.ratios,
			vectorLimit = self.limit.min(13),
			limitPrimes = vectorLimit.primesUpTo.allButFirst,
			tuningPrimes = self.latticePrimes,
			primesVector = (self.limit <= 13).if {
				limitPrimes
			} {
				(tuningPrimes.size <= 5).if {
					tuningPrimes
				} {
					nil
				}
			},
			div = 'div'.createElement
		)|
		div.appendChildren([
			[
				['Size', self.size.asString],
				['Limit', self.limit.asString],
				['Description', self.description],
				['Octave', self.octave.asString],
				['Primes', tuningPrimes.asString]
			].asHtmlTable,
			[
				[1 .. self.size],
				ratios,
				ratios.collect { :each |
					primesVector.ifNil {
						'*'
					} {
						each.latticeVectorString(primesVector)
					}
				},
				self.cents.rounded,
				self.integers
			].transposed.asHtmlTable,
			primesVector.ifNil {
				'No drawing'.TextParagraph
			} {
				self.latticeDrawing(primesVector)
			}
		]);
		div
	}

	latticeDrawing { :self :primes |
		self.latticeGraph(primes).drawing(1, identity:/1)
	}

	latticeGraph { :self :primes |
		|(
			vertices = self.latticeVertices(primes),
			edges = self.latticeEdges(vertices),
			points = vertices.collect(wilsonLatticeCoordinates:/1) * 4
		)|
		Graph(vertices.size, edges, points, nil)
	}

}

+SmallKansas {

	ScalaJiTuningBrowser { :self :jiTunings |
		|(
			sizes = jiTunings.collect(size:/1).values.copyWithoutDuplicates.sort.collect(asString:/1),
			selectedSize = nil,
			selectedLimit = nil
		)|
		self.ColumnBrowser('Scala Ji Tuning Browser', 'text/html', false, true, [1, 1, 4], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('Size/Limit/Name');
					sizes
				},
				1 -> {
					browser.setStatus('Size = ' ++ path[1]);
					selectedSize := path[1].parseInteger(10);
					jiTunings.select { :each |
						each.size = selectedSize
					}.collect { :each |
						each.limit
					}.values.copyWithoutDuplicates.sort.collect(asString:/1)
				},
				2 -> {
					browser.setStatus(['Size = ', path[1], ', Limit = ', path[2]].join);
					selectedLimit := path[2].parseInteger(10);
					jiTunings.select { :each |
						each.size = selectedSize & {
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
