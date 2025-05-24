ColourPalette : [Object] { | colourList |

	asContinuousColourGradient { :self |
		self.colourList.asContinuousColourGradient
	}

	asDiscreteColourGradient { :self |
		self.colourList.asDiscreteColourGradient
	}

	asSvg { :self |
		self.asDiscreteColourGradient.asSvg
	}

	at { :self :index |
		self.colourList.at(index)
	}

	draw { :self |
		self.asDiscreteColourGradient.draw
	}

	size { :self |
		self.colourList.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	writeSvg { :self :fileName |
		self.asSvg.writeSvg(fileName)
	}

}

+String {

	namedColourPalette { :collectionName :paletteName |
		ColourPalette(
			system
			.colourPalettes
			.at(collectionName)
			.at(paletteName)
		)
	}

	namedColourPalette { :self |
		self.includes('/').if {
			let [collectionName, paletteName] = self.splitBy('/');
			collectionName.namedColourPalette(paletteName)
		} {
			let answer = [];
			system.colourPalettes.do { :each |
				each.keysAndValuesDo { :key :value |
					(key = self).ifTrue {
						answer.add(value)
					}
				}
			};
			answer.size.caseOf([
				0 -> { self.error('namedColourPalette: unknown colour palette') },
				1 -> { ColourPalette(answer[1]) }
			]) {
				self.error('namedColourPalette: multiple matches')
			}
		}
	}

}

+List {

	ColourPalette { :self |
		newColourPalette().initializeSlots(self)
	}

}

+System {

	colourPalettes { :self |
		self.requireLibraryItem(
			'ColourPalettes'
		)
	}

}

LibraryItem(
	name: 'ColourPalettes',
	category: 'Graphics/Colour',
	url: 'https://rohandrape.net/sw/hsc3-data/data/colour/ColourPalettes.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :i |
			i.collect { :j |
				j.collect { :k |
					k.parseBase16.asList / 255
				}
			}
		}
	}
)
