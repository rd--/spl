+Graph {

	drawing { :self :scale :derivePoint:/1 |
		let lineWidth = 1;
		let points = self.vertexLabels.collect(derivePoint:/1);
		let bbox = points.computeBoundingBox.scaleBy(scale);
		let dots = points.collect { :each |
			'circle'.createSvgElement(
				cx: each.x,
				cy: each.y,
				r: lineWidth * 2,
				fill: 'black'
			)
		};
		let lines = self.edgeList.collect { :each |
			let [i, j] = each;
			'line'.createSvgElement(
				x1: points[i].x,
				y1: points[i].y,
				x2: points[j].x,
				y2: points[j].y,
				stroke: 'black',
				'stroke-width': lineWidth
			)
		};
		let svg = 'svg'.createSvgElement(
			width: bbox.width,
			height: bbox.height,
			viewBox: bbox.viewBoxString(5),
			preserveAspectRatio: 'xMidYMid meet'
		);
		let group = 'g'.createSvgElement(
			transform: [
				'translate(0, ' ++ (bbox.height + (2 * bbox.origin.y)) ++ ')',
				'scale(' ++ scale ++ ', -' ++ scale ++ ')'
			].join
		);
		group.appendChildren(dots);
		group.appendChildren(lines);
		svg.appendChild(group);
		svg
	}

}

+RatioTuning {

	htmlView { :self |
		let ratios = self.asRatios;
		let vectorLimit = self.limit.min(13);
		let limitPrimes = vectorLimit.primesUpTo.allButFirst;
		let tuningPrimes = self.latticePrimes;
		let primesVector = (self.limit <= 13).if {
			limitPrimes
		} {
			(tuningPrimes.size <= 5).if {
				tuningPrimes
			} {
				nil
			}
		};
		let div = 'div'.createElement;
		div.appendChildren([
			[
				['Size', self.size.asString],
				['Limit', self.limit.asString],
				['Description', self.description],
				['Octave', self.octave.asString],
				['Primes', tuningPrimes.asString]
			].asHtmlTable,
			primesVector.ifNil {
				'No drawing'.TextParagraph
			} {
				self.latticeDrawing(primesVector)
			},
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
				self.asCents.rounded,
				self.asIntegers
			].transposed.asHtmlTable
		]);
		div
	}

	latticeDrawing { :self :primes |
		self.latticeGraph(primes).drawing(1, identity:/1)
	}

	latticeGraph { :self :primes |
		let primesList = self.latticeVertices(primes);
		let edgeList = self.latticeEdges(primesList);
		let coordinateList = primesList.collect(wilsonLatticeCoordinates:/1) * 4;
		Graph([1 .. primesList.size], edgeList).vertexLabels(coordinateList)
	}

}

+SmallKansas {

	ScalaJiTuningBrowser { :self :jiTunings |
		let sizes = jiTunings.collect(size:/1).values.copyWithoutIdenticalElements.sort.collect(asString:/1);
		let selectedSize = nil;
		let selectedLimit = nil;
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
					}.values.copyWithoutIdenticalElements.sort.collect(asString:/1)
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
					let jiTuning = jiTunings[path[3]];
					browser.setStatus(jiTuning.description);
					jiTuning.htmlView.outerHtml
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
				{ :libraryItem |
					libraryItem.collect { :each |
						each.includesKey('octave').if {
							let [numerator, denominator] = each::octave;
							each::octave := Fraction(numerator, denominator)
						} {
							each::octave := 2/1
						};
						each.asJiTuning
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
