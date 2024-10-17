/* Requires: ImageViewer SmallKansas */

+SmallKansas {

	PngViewer { :self :title :pngData |
		let url = pngData.createObjectUrl;
		self.addFrame(ImageViewer(title, url), nil).onClose { :unused |
			url.revokeObjectUrl
		}
	}

}
