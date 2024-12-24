/* Requires: SmallKansas */

ImageViewer : [Object, View] { | title url outerElement |

	createElements { :self |
		let img = 'img'.createElement;
		img.src := self.url;
		self.outerElement := 'div'.createElement(
			class: 'imageViewerPane'
		);
		self.outerElement.appendChild(img)
	}

	initialize { :self :title :url |
		self.title := title;
		self.url := url;
		self.createElements;
		self
	}

}

+String {

	ImageViewer { :title :url |
		newImageViewer().initialize(title, url)
	}

}

+SmallKansas {

	ImageViewer { :self :title :url |
		self.addFrame(
			ImageViewer(title, url),
			self.where
		)
	}

}
