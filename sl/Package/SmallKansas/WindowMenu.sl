+SmallKansas {

	windowMenuEntries { :self |
		self.frameSet.Array.collect { :frame |
			MenuItem(frame.title, nil) { :unusedEvent |
				frame.bringToFront
			}
		}
	}

	WindowMenu { :self :event |
		| menu = Menu('Window Menu', self.windowMenuEntries); |
		self.addFrameWithAnimator(menu, event, 1) {
			menu.setEntries(self.windowMenuEntries)
		}
	}

}
