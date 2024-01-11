{- Requires: Colour SmallKansas -}

ColourChooser : [Object, View] { | colourChooserPane colourInput |

	hexString { :self |
		self.colourInput.getAttribute('value')
	}

	initialize { :self :initialColour :onSelect:/1 |
		self.colourChooserPane := 'div'.createElement (
			class: 'colourChooser'
		);
		self.colourInput := 'input'.createElement (
			class: 'colourInput',
			type: 'color',
			value: initialColour.hexString
		);
		self.colourChooserPane.appendChild(self.colourInput);
		self.colourInput.addEventListener('input') { :event |
			onSelect(event.target.value.parseHexColour)
		};
		self
	}

	outerElement { :self |
		self.colourChooserPane
	}

	title { :self |
		'Colour Chooser'
	}

}

+Colour {

	ColourChooser { :self :onSelect:/1 |
		newColourChooser().initialize(self, onSelect:/1)
	}

}

+Block {

	ColourChooser { :self |
		Colour(0.5, 0.5, 0.5, 0.5).ColourChooser(self)
	}

}

+SmallKansas {

	colourChooserOn { :self :subject :event |
		self.addFrame(ColourChooser({ :aColour |
			subject.colour(aColour)
		}), event)
	}

}

BackgroundColourChooser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.colourChooserOn(smallKansas, event)
	}

}
