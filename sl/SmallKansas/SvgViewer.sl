SvgViewer : [Object, View] { | svgPane title svg |

	createElements { :self |
		self.svgPane := 'div'.createElement(
			class: 'svgPane'
		);
		self.svgPane.appendChild(self.svg)
	}

	initialize { :self :title :svg |
		self.title := title;
		self.svg := svg;
		self.createElements;
		self
	}

	outerElement { :self |
		self.svgPane
	}

}

+String {

	SvgViewer { :self :svg |
		newSvgViewer().initialize(self, svg)
	}

}

+SmallKansas {

	SvgViewer { :self :title :svg |
		self.addFrame(SvgViewer(title, svg), nil)
	}

}

