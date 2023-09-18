(* Requires: SmallKansas *)

PngViewer : [Object, View] { | pngPane title pngData pngUrl |

	createElements { :self |
		| img = 'img'.createElement; |
		self.pngPane := 'div'.createElement (
			class: 'pngPane'
		);
		img.src := self.pngUrl;
		self.pngPane.appendChild(img)
	}

	frame { :self :aFrame |
		aFrame.addEventListener('close') { :event |
			self.pngUrl.revokeObjectURL
		}
	}

	initialize { :self :title :pngData |
		self.title := title;
		self.pngData := pngData;
		self.pngUrl := pngData.createObjectURL;
		self.createElements;
		self
	}

	outerElement { :self |
		self.pngPane
	}

}

+String {

	PngViewer { :self :pngData |
		newPngViewer().initialize(self, pngData)
	}

}

+SmallKansas {

	PngViewer { :self :title :png |
		self.addFrame(PngViewer(title, png), nil)
	}

}
