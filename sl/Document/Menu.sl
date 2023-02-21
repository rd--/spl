Menu : [Object, View] { | frame menuPane listPane menuList title isTransient |

	createElements { :self |
		self.menuPane := 'div'.createElement;
		self.listPane := 'div'.createElement;
		self.menuList := 'select'.createElement;
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
		self.menuList.size := entries.size;
		entries.collect { :each |
			|
				listItem = TextOption(each.key, each.key),
				onSelect = { :event |
					event.preventDefault;
					each.value . (event);
					self.isTransient.ifTrue {
						self.frame.ifNotNil {
							self.frame.close
						}
					}
				};
			|
			self.menuList.appendChild(listItem);
			listItem.addEventListener('pointerdown', onSelect);
			listItem.addEventListener('keydown', { :event |
				['keydown', event.key].postLine;
				(event.key = 'Enter').ifTrue {
					onSelect(event)
				}
			})
		}
	}

	titlePaneContextMenu { :self :event |
		|
			entries = self.isTransient.if {
				[ 'markNotTransient' -> { :unusedEvent | self.isTransient := false } ]
			} {
				[ 'markTransient' -> { :unusedEvent | self.isTransient := true } ]
			};
		|
		workspace::smallKansas.menu('Menu Context Menu', entries, true, event);
	}

}

+ String {

	Menu { :title :entries |
		newMenu().initialize(title, entries)
	}

}
