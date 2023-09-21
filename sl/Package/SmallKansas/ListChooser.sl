(* Requires: TextElement *)

ListChooser : [Object] { | listChooserPane filterText select entries ignoreCase |

	applyFilter { :self |
		|(
			caseRule:/1 = self.ignoreCase.if {
				asLowercase:/1
			} {
				identity:/1
			},
			filter = self.filterText.ifNil {
				{
					true
				}
			} {
				| matchString = self.filterText.value.caseRule; |
				{ :aString |
					aString.caseRule.includesSubstring(matchString)
				}
			}
		)|
		self.select.removeAll;
		self.select.appendChildren(self.entries.select(filter).collect { :each |
			TextOption(each)
		});
		self.select.deselect
	}

	initialize { :self :withFilter :titleText :listSize |
		self.ignoreCase := true;
		self.listChooserPane := 'div'.createElement (
			class: 'listChooserPane'
		);
		titleText.ifNotNil {
			| title = TextButton(titleText) (class: 'listTitle'); |
			self.listChooserPane.appendChild(title)
		};
		withFilter.if {
			self.filterText := TextInput('') (class: 'filterText');
			self.filterText.addEventListener('change') { :event |
				self.applyFilter
			};
			self.listChooserPane.appendChild(self.filterText)
		} {
			self.filterText := nil
		};
		self.select := 'select'.createElement;
		self.select.size := listSize;
		self.listChooserPane.appendChild(self.select);
		self
	}

	setEntries { :self :entries |
		self.entries := entries;
		self.applyFilter
	}

}

+Boolean {

	ListChooser { :self :title :listSize |
		newListChooser().initialize(self, title, listSize)
	}

}
