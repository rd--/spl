Inspector : [Object, View] { | inspectorPane inspectorList |

	addInspector { :self :aValue :index |
		|(
			maxStringSize = 32,
			maxIndices = 2048,
			fields = aValue.inspectAsArray(maxIndices),
			listChooser = ListChooser(false, aValue.printStringConcise(maxStringSize), 6),
			select = listChooser.select
		)|
		listChooser.setEntries(fields.collect { :each |
			each.key ++ ': ' ++ each.value.printStringConcise(maxStringSize)
		});
		select.deselect;
		select.addEventListener('change') { :event |
			fields.atIfPresent(select.selectedIndex + 1) { :item |
				self.removeInspectorsFrom(index + 1);
				self.addInspector(item.value, index + 1)
			}
		};
		self.inspectorPane.appendChild(listChooser.listChooserPane);
		self.inspectorList.add(listChooser)
	}

	initialize { :self :aValue |
		self.inspectorPane := 'div'.createElement (
			class: 'inspectorPane'
		);
		self.inspectorList([]);
		self.addInspector(aValue, 1);
		self
	}

	removeInspectorsFrom { :self :index |
		(index <= self.inspectorList.size).ifTrue {
			self.inspectorList.removeLast(self.inspectorList.size - index + 1).do { :each |
				each.listChooserPane.remove
			}
		}
	}

	outerElement { :self |
		self.inspectorPane
	}

}

+@Object {

	Inspector { :self |
		newInspector().initialize(self)
	}

	inspect { :self |
		system::smallKansas.inspectorOn(self, nil)
	}

}

+SmallKansas {

	inspectorOn { :self :aValue :event |
		self.addFrame(Inspector(aValue), event)
	}

}
