Menu : [Object, View] { | menuPane listPane menuList title onSelect |

	createElements { :self |
		self.menuPane := 'div'.createElement;
		self.listPane := 'div'.createElement;
		self.menuList := 'ul'.createElement;
		self.listPane.appendChild(self.menuList);
		self.menuPane.appendChild(self.listPane)
	}

	initialize { :self :title :entries |
		self.title := title;
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
