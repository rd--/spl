MenuItem : [Object] { | name accessKey onSelect |

	<= { :self :aMenuItem |
		self.name <= aMenuItem.name
	}

	accessKeyDislayText { :self |
		self.accessKey.ifNil {
			''
		} {
			' (' ++ self.accessKey ++ ')'
		}
	}

	displayText { :self |
		self.name ++ self.accessKeyDislayText
	}

	keyBinding { :self :event :where |
		self.accessKey -> {
			event.preventDefault;
			self.onSelect . (where)
		}
	}

}

+String {

	MenuItem { :self :accessKey :onSelect |
		newMenuItem().initializeSlots(self, accessKey, onSelect)
	}

}

Menu : [Object, View] { | frame menuPane listPane menuList title isTransient |

	createElements { :self |
		self.menuPane := 'div'.createElement(
			class: 'menuPane'
		);
		self.listPane := 'div'.createElement(
			class: 'listPane'
		);
		self.menuList := 'select'.createElement;
		self.listPane.appendChild(self.menuList);
		self.menuPane.appendChild(self.listPane)
	}

	frameMenuItems { :self |
		[
			self.isTransient.if {
				MenuItem('Mark Not Transient', nil) { :unusedEvent |
					self.isTransient := false
				}
			} {
				MenuItem('Mark Transient', nil) { :unusedEvent |
					self.isTransient := true
				}
			}
		]
	}

	initialize { :self :title :entries |
		self.title := title;
		self.isTransient := false;
		self.createElements;
		self.setEntries(entries);
		self
	}

	outerElement { :self |
		self.menuPane
	}

	setEntries { :self :entries |
		self.menuList.removeAllChildren;
		self.menuList.size := entries.size;
		entries.collect { :menuItem |
			let listItem = TextOption(menuItem.displayText);
			let pointerBegin = { :event |
				event.stopPropagationAndPreventDefault;
				menuItem.onSelect . (event);
				self.isTransient.ifTrue {
					self.frame.ifNotNil {
						self.frame.close
					}
				}
			};
			self.menuList.appendChild(listItem);
			listItem.addEventListener('pointerdown', pointerBegin:/1)
		}
	}

}

+String {

	Menu { :self :entries |
		newMenu().initialize(self, entries)
	}

}

+SmallKansas {

	menu { :self :title :entries :isTransient :event |
		let menu = Menu(title, entries);
		let frame = self.addFrame(menu, event);
		self.where := event;
		menu.isTransient := isTransient;
		frame
	}

}

