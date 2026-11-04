/* Requires: SmallKansas */

MenuItem : [Object, Compare] {

	| name accessKey onSelect |

	accessKeyDislayText { :self |
		self.accessKey.ifNil {
			''
		} {
			' (' ++ self.accessKey ++ ')'
		}
	}

	compare { :self :aMenuItem |
		compareOn(self, aMenuItem, name/1)
	}

	displayText { :self |
		self.name ++ self.accessKeyDislayText
	}

	doSelect { :self :event |
		let f/1 = self.onSelect;
		f(event)
	}

	keyBinding { :self :event :where |
		let f/1 = self.onSelect;
		self.accessKey -> {
			event.preventDefault;
			f(where)
		}
	}

}

+String {

	MenuItem { :self :accessKey :onSelect/1 |
		newMenuItem().initializeSlots(self, accessKey, onSelect/1)
	}

}

Menu : [Object, View] {

	| frame menuPane listPane menuList title isTransient |

	createElements { :self |
		self.menuPane := 'div'.createElement(
			(
				class: 'menuPane'
			)
		);
		self.listPane := 'div'.createElement(
			(
				class: 'listPane'
			)
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

	initialize! { :self :title :entries |
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
		self.menuList.removeAllChildren!;
		self.menuList.size := entries.size;
		entries.collect { :menuItem |
			let listItem = TextOption(menuItem.displayText);
			let pointerBegin = { :event |
				event.stopPropagationAndPreventDefault;
				menuItem.doSelect(event);
				self.isTransient.ifTrue {
					self.frame.ifNotNil {
						self.frame.close
					}
				}
			};
			self.menuList.appendChild(listItem);
			listItem.addEventListener('pointerdown', pointerBegin/1)
		}
	}

}

+String {

	Menu { :self :entries |
		newMenu().initialize!(self, entries)
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

