Menu : [Object] { | menuPane listPane menuList title |

	createElements { :self |
		self.menuPane := 'div'.createElement;
		self.listPane := 'div'.createElement;
		self.menuList := 'ul'.createElement;
		self.listPane.appendChild(self.menuList);
		self.menuPane.appendChild(self.listPane);
	}

	outerElement { :self |
		self.menuPane
	}

	setAttributes { :self |
		self.menuPane.setAttribute('class', 'menuPane');
		self.listPane.setAttribute('class', 'listPane');
	}

	setEntries { :self :entries |
		entries.collect { :each |
			| listItem = TextListItem(each.key); |
			self.menuList.appendChild(listItem);
			listItem.addEventListener('pointerdown', { :unusedEvent |
				each.value.value
			})
		}
	}

}

+ String {

	Menu { :title :entries |
		| menu = newMenu(); |
		menu.createElements;
		menu.setEntries(entries);
		menu.setAttributes;
		menu.title := title;
		menu
	}

}
