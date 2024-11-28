Inspector : [Object, View] { | inspectorPane inspectorList |

	addInspector { :self :aValue :index |
		let maxIndices = 2048;
		let fields = aValue.inspectAsList(maxIndices);
		let listChooser = ListChooser(false, aValue.concisePrintString, 6);
		let select = listChooser.select;
		listChooser.setEntries(fields.collect { :each |
			each.key ++ ': ' ++ each.value.concisePrintString
		});
		select.deselect;
		select.addEventListener('change') { :event |
			fields.atIfPresent(select.selectedIndex + 1) { :each |
				self.removeInspectorsFrom(index + 1);
				self.addInspector(each.value, index + 1)
			}
		};
		self.inspectorPane.appendChild(listChooser.listChooserPane);
		self.inspectorList.add(listChooser)
	}

	initialize { :self :aValue |
		self.inspectorPane := 'div'.createElement(
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
		system.smallKansas.inspectorOn(self, nil)
	}

}

+SmallKansas {

	inspectorOn { :self :aValue :event |
		self.addFrame(Inspector(aValue), event)
	}

}
