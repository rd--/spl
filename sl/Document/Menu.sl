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
