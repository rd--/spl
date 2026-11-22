ColourGradient : [Object, Store] {

	| colourList positionList | <List>

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
					p.decimalStringToScale(3),
					c.Colour.rgbString
				]
			)
		}.zipWith(self.colourList, self.positionList);
		let post = [
			'	</linearGradient>',
			'</defs>',
			'<rect width="%" height="%" fill="url(#gradient)" />'.format([w, h]),
			'</svg>'
		];
		[pre, stops, post].joinSvg
	}

	isEquallySpaced { :self |
		let p = self.positionList;
		p.isArithmeticProgression(p[2] - p[1], ~)
	}

	isValid { :self |
		let [m, n] = self.colourList.shape;
		n = 3 & {
			self.positionList.size = m
		}
	}

	resample { :self :anInteger |
		let p = (0.0 -- 1.0).discretize(anInteger);
		ColourGradient(
			p.collect(self.unaryFunction),
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

	unaryFunction { :self |
		self.positionList.linearInterpolator(
			self.colourList
		)
	}

}

+List {

	ColourGradient { :self :positionListOrNil |
		uncheckedColourGradient(
			self,
			positionListOrNil.ifNil {
				(0.0 -- 1.0).discretize(
					self.size
				)
			}
		)
	}

	ColourGradient { :self |
		let [c, p] = self;
		ColourGradient(c, p)
	}

	continuousColourGradient { :self |
		ColourGradient(
			self,
			(0.0 -- 1.0).discretize(
				self.size
			).List
		)
	}

	discreteColourGradient { :self |
		let c = [];
		let p = [];
		let x = 0;
		let z = 1 / self.size;
		1.toDo(self.size) { :i |
			c.add!(self[i]);
			p.add!(x);
			c.add!(self[i]);
			p.add!((x + z).min(1));
			x := x + z
		};
		ColourGradient(c, p)
	}

}

+String {

	namedColourFunction { :collectionName :paletteName |
		namedColourGradient(collectionName, paletteName).unaryFunction
	}

	namedColourFunction { :self |
		self.namedColourGradient.unaryFunction
	}

	namedColourGradient { :collectionName :paletteName |
		system
		.colourGradients
		.at(collectionName)
		.at(paletteName)
		.ColourGradient
	}

	namedColourGradient { :self |
		self.includes('/').if {
			let [collectionName, gradientName] = self.splitOn('/');
			collectionName.namedColourGradient(gradientName)
		} {
			let answer = [];
			system.colourGradients.do { :each |
				each.keysAndValuesDo { :key :value |
					(key = self).ifTrue {
						answer.add!(value)
					}
				}
			};
			answer.size.caseOf([
				0 -> { self.error('namedColourGradient: unknown colour gradient') },
				1 -> { answer[1].ColourGradient }
			]) {
				self.error('namedColourGradient: multiple matches')
			}
		}
	}

}

+[Integer, @SmallInteger] {

	parula { :self |
		system
		.colourGradients['Mathworks']['Parula']
		.ColourGradient
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
							k.parseBase16.List / 255
						},
						nil
					]
				} {
					[
						j['c'].collect { :k |
							k.parseBase16.List / 255
						},
						j['p']
					]
				}
			}
		}
	}
)
