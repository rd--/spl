WindowMenu : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		|(
			currentWindowTitles = {
				smallKansas.frameSet.Array.collect { :frame |
					MenuItem(frame.title, nil) { :unusedEvent |
						frame.bringToFront
					}
				}.sort
			},
			menu = Menu(self.title, currentWindowTitles())
		)|
		smallKansas.addFrameWithAnimator(menu, event, 1) {
			menu.setEntries(currentWindowTitles())
		}
	}

	title { :self |
		'Window Menu'
	}

}
