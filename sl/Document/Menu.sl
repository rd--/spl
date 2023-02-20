Menu : [Object, View] { | frame menuPane listPane menuList title isTransient |

	contextMenu { :self :event |
		|
			entries = self.isTransient.if {
				[ 'markNotTransient' -> { :unusedEvent | self.isTransient := false } ]
			} {
				[ 'markTransient' -> { :unusedEvent | self.isTransient := true } ]
			};
		|
		workspace::smallKansas.menu('Menu Context Menu', entries, true, event);
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
		entries.collect { :each |
			| listItem = TextListItem(each.key); |
			self.menuList.appendChild(listItem);
			listItem.addEventListener('pointerdown', { :event |
				event.preventDefault;
				each.value . (event);
				self.isTransient.ifTrue {
					self.frame.ifNotNil {
						self.frame.close
					}
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
