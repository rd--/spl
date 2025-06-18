ColourGradient : [Object] { | colourList positionListOrNil |

	asBlock { :self |
		self.positionList.linearInterpolator(
			self.colourList
		)
	}

	drawing { :self |
		let w = 300;
		let h = 50;
		let pre = [
			'<svg',
			'	width="%" height="%"'.format([w, h]),
			'	viewBox="0 0 % %"'.format([w, h]),
			'	xmlns="http://www.w3.org/2000/svg"',
			'	xmlns:xlink="http://www.w3.org/1999/xlink"',
			'>',
			'<defs>',
			'	<linearGradient id="gradient">'
		];
		let stops = { :c :p |
			'		<stop offset="%" stop-color="%" />'.format(
				[
					p.printStringToFixed(3),
					c.asColour.rgbString
				]
			)
		}.map(self.colourList, self.positionList);
		let post = [
			'	</linearGradient>',
			'</defs>',
			'<rect width="%" height="%" fill="url(#gradient)" />'.format([w, h]),
			'</svg>'
		];
		[pre, stops, post].catenate.unlines.Svg
	}

	isEquallySpaced { :self |
		self.positionListOrNil.isNil | {
			let p = self.positionList;
			p.isArithmeticProgressionBy(p[2] - p[1], ~)
		}
	}

	isValid { :self |
		let [m, n] = self.colourList.shape;
		(n = 3) & {
			self.positionListOrNil.ifNil {
				true
			} { :p |
				p.size = m
			}
		}
	}

	positionList { :self |
		self.positionListOrNil.ifNil {
			(0 -- 1).discretize(self.colourList.size)
		}
	}

	resample { :self :anInteger |
		let p = (0 -- 1).discretize(anInteger);
		ColourGradient(
			p.collect(self.asBlock),
			nil
		)
	}

	size { :self |
		self.isValid.if {
			self.colourList.size
		} {
			self.error('size: invalid')
		}
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+List {

	asColourGradient { :self |
		let [c, p] = self;
		ColourGradient(c, p)
	}

	asContinuousColourGradient { :self |
		ColourGradient(
			self,
			(0 -- 1).discretize(self.size).asList
		)
	}

	asDiscreteColourGradient { :self |
		let c = [];
		let p = [];
		let x = 0;
		let z = 1 / self.size;
		1.toDo(self.size) { :i |
			c.add(self[i]);
			p.add(x);
			c.add(self[i]);
			p.add((x + z).min(1));
			x := x + z
		};
		ColourGradient(c, p)
	}

	ColourGradient { :self :aList |
		newColourGradient().initializeSlots(self, aList)
	}

}

+String {

	namedColourGradient { :collectionName :paletteName |
		system
		.colourGradients
		.at(collectionName)
		.at(paletteName)
		.asColourGradient
	}

	namedColourGradient { :self |
		self.includes('/').if {
			let [collectionName, gradientName] = self.splitBy('/');
			collectionName.namedColourGradient(gradientName)
		} {
			let answer = [];
			system.colourGradients.do { :each |
				each.keysAndValuesDo { :key :value |
					(key = self).ifTrue {
						answer.add(value)
					}
				}
			};
			answer.size.caseOf([
				0 -> { self.error('namedColourGradient: unknown colour gradient') },
				1 -> { answer[1].asColourGradient }
			]) {
				self.error('namedColourGradient: multiple matches')
			}
		}
	}

}


+SmallFloat {

	parula { :self |
		system
		.colourGradients['Mathworks', 'Parula']
		.asColourGradient
		.resample(self)
		.colourList
	}

}

+System {

	colourGradients { :self |
		self.requireLibraryItem(
			'ColourGradients'
		)
	}

}

LibraryItem(
	name: 'ColourGradients',
	category: 'Graphics/Colour',
	url: 'https://rohandrape.net/sw/hsc3-data/data/colour/ColourGradients.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :i |
			i.collect { :j |
				j.isList.if {
					[
						j.collect { :k |
							k.parseBase16.asList / 255
						},
						nil
					]
				} {
					[
						j['c'].collect { :k |
							k.parseBase16.asList / 255
						},
						j['p']
					]
				}
			}
		}
	}
)
