Menu : [Object, View] { | frame menuPane listPane menuList title persistent onSelect |

	contextMenu { :self :event |
		workspace::smallKansas.contextMenu(
			Menu(
				'Menu Menu',
				[
					'persistent' -> { :unusedEvent | self.persistent := true },
					'transient' -> { :unusedEvent | self.persistent := false }
				]
			),
			event
		);
	}

	createElements { :self |
		self.menuPane := 'div'.createElement;
		self.listPane := 'div'.createElement;
		self.menuList := 'ul'.createElement;
		self.listPane.appendChild(self.menuList);
		self.menuPane.appendChild(self.listPane)
	}

	initialize { :self :title :entries |
		self.title := title;
		self.persistent := true;
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
		entries.collect { :each |
			| listItem = TextListItem(each.key); |
			self.menuList.appendChild(listItem);
			listItem.addEventListener('pointerdown', { :event |
				each.value . (event);
				self.persistent.ifFalse {
					self.frame.ifNotNil {
						self.frame.close
					}
				};
				self.onSelect.ifNotNil {
					self.onSelect . (each.key)
				}
			})
		}
	}

}

+ String {

	Menu { :title :entries |
		newMenu().initialize(title, entries)
	}

}
