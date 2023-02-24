Colour : [Object] { | red green blue alpha |

	hexString { :self |
		'#' ++ [self.red, self.green, self.blue].collect { :each |
			(each * 255).rounded.printString(16)
		}.join
	}

}

+ Number {

	Colour { :r :g :b |
		Colour(r, g, b, 1)
	}

	Colour { :r :g :b :a |
		newColour().initializeSlots(r, g, b, a)
	}

}

+ Array {

	Colour { :self |
		| [r, g, b] = self; |
		Colour(r, g, b)
	}

}

+ String {

	parseHexColourString { :self |
		| r = self.copyFromTo(2, 3), g = self.copyFromTo(4, 5), b = self.copyFromTo(6, 7); |
		[r, b, g].collect { :each | each.parseInteger(16) }.Colour
	}

}

ColourChooser : [Object, View] { | colourChooserPane colourInput |

	hexString { :self |
		self.colourInput.getAttribute('value')
	}

	initialize { :self :initialColour :onSelect:/1 |
		self.colourChooserPane := 'div'.createElement;
		self.colourInput := 'input'.createElement;
		self.colourInput.setAttributes((type: 'color', value: initialColour.hexString));
		self.colourChooserPane.appendChild(self.colourInput);
		self.colourChooserPane.setAttribute('class', 'colourChooser');
		self.colourChooserPane.setAttribute('class', 'colourInput');
		self.colourInput.addEventListener('change') { :event |
			onSelect(self.hexString.parseHexColourString)
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

+ Colour {

	ColourChooser { :self :onSelect:/1 |
		newColourChooser().initialize(self, onSelect:/1)
	}

}

+ Procedure {

	ColourChooser { :self |
		Colour(1, 1, 1, 1).ColourChooser(self)
	}

}

MenuItem : [Object] { | name accessKey onSelect |

	accessKeyDislayText { :self |
		self.accessKey.notNil.if {
			'(' ++ self.accessKey ++ ')'
		} {
			nil
		}
	}

	displayText { :self |
		self.name ++? self.accessKeyDislayText
	}


}

+ String {

	MenuItem { :self :accessKey :onSelect |
		newMenuItem().initializeSlots(self, accessKey, onSelect)
	}

}

Menu : [Object, View] { | frame menuPane listPane menuList title isTransient |

	createElements { :self |
		self.menuPane := 'div'.createElement;
		self.listPane := 'div'.createElement;
		self.menuList := 'select'.createElement;
		self.listPane.appendChild(self.menuList);
		self.menuPane.appendChild(self.listPane)
	}

	frameMenuItems { :self |
		[
			self.isTransient.if {
				MenuItem('Mark Not Transient', nil) {
					:unusedEvent | self.isTransient := false }
			} {
				MenuItem('Mark Transient', nil) { :unusedEvent | self.isTransient := true }
			}
		]
	}

	initialize { :self :title :entries |
		self.title := title;
		self.isTransient := false;
		self.createElements;
		self.setAttributes;
		self.setEntries(entries);
		self
	}

	outerElement { :self |
		self.menuPane
	}

	setAttributes { :self |
		self.menuPane.setAttribute('class', 'menuPane');
		self.listPane.setAttribute('class', 'listPane')
	}

	setEntries { :self :entries |
		self.menuList.removeAllChildren;
		self.menuList.size := entries.size;
		entries.collect { :menuItem |
			|
				listItem = TextOption(menuItem.displayText, menuItem.displayText),
				dispatchEvent = { :event |
					['menuDispatch', event].postLine;
					event.preventDefault;
					menuItem.onSelect . (event);
					self.isTransient.ifTrue {
						self.frame.ifNotNil {
							self.frame.close
						}
					}
				};
			|
			self.menuList.appendChild(listItem);
			listItem.addEventListener('pointerdown', dispatchEvent)
		}
	}

}

+ String {

	Menu { :title :entries |
		newMenu().initialize(title, entries)
	}

}
