{- Requires: SmallKansas -}

PngViewer : [Object, View] { | pngPane title pngData pngUrl |

	createElements { :self |
		let img = 'img'.createElement;
		self.pngPane := 'div'.createElement(
			class: 'pngPane'
		);
		img.src := self.pngUrl;
		self.pngPane.appendChild(img)
	}

	frame { :self :aFrame |
		aFrame.addEventListener('close') { :event |
			self.pngUrl.revokeObjectUrl
		}
	}

	initialize { :self :title :pngData |
		self.title := title;
		self.pngData := pngData;
		self.pngUrl := pngData.createObjectUrl;
		self.createElements;
		self
	}

	outerElement { :self |
		self.pngPane
	}

}

+String {

	PngViewer { :title :pngData |
		newPngViewer().initialize(title, pngData)
	}

}

+SmallKansas {

	PngViewer { :self :title :pngData |
		self.addFrame(PngViewer(title, pngData), nil)
	}

}
