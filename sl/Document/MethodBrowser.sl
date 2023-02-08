MethodBrowser { |
	browserPane selectionPane programPane typeTraitPane
	typeList traitList methodList listPlaces
	methodTextPre methodTextCode
	currentDictionary |

	createElements { :self |
		self.browserPane := 'div'.createElement;
		self.selectionPane :=  'div'.createElement;
		self.programPane := 'div'.createElement;
		self.typeTraitPane :=  'div'.createElement;
		self.typeList := 'select'.createElement;
		self.traitList := 'select'.createElement;
		self.methodList := 'select'.createElement;
		self.methodTextPre := 'pre'.createElement;
		self.methodTextCode := 'code'.createElement;
		self.typeTraitPane.appendChildren([self.typeList, self.traitList]);
		self.selectionPane.appendChildren([self.typeTraitPane, self.methodList]);
		self.methodTextPre.appendChild(self.methodTextCode);
		self.programPane.appendChild(self.methodTextPre);
		self.browserPane.appendChildren([self.selectionPane, self.programPane]);
	}

	setListElements { :self |
		self.typeList.appendChildren(system.typeDictionary.keys.sorted.collect { :each |
			TextOption(each, each)
		});
		self.traitList.appendChildren(system.traitDictionary.keys.sorted.collect { :each |
			TextOption(each, each)
		})
	}

	setAttributes { :self |
		self.programPane.setAttribute('class', 'programContainer');
		self.browserPane.style.setProperties([
			'display' -> 'flex',
			'flex-direction' -> 'column',
			'flex-wrap' -> 'nowrap',
			'resize' -> 'both',
			'overflow' -> 'auto',
			'height' -> '25em',
			'width' -> '50em'
		]);
		self.typeTraitPane.style.setProperties([
			'display' -> 'flex',
			'flex-direction' -> 'column',
			'margin' -> '2px',
			'flex-grow' -> '1'
		]);
		self.selectionPane.style.setProperties([
			'display' -> 'flex',
			'flex-direction' -> 'row',
			'flex-grow' -> '1',
			'margin' -> '2px'
		]);
		[self.typeList, self.traitList].do { :each |
			each.style.setProperties([
				'flex-grow' -> '1',
				'flex-basis' -> '6em',
				'margin' -> '1px',
				'width' -> '100%'
			])
		};
		self.methodList.style.setProperties([
			'flex-grow' -> '3',
			'flex-basis' -> '8em',
			'margin' -> '2px'
		]);
		self.programPane.style.setProperties([
			'flex-grow' -> '1',
			'flex-basis' -> '6em',
			'margin' -> '4px'
		]);
		self.listPlaces := 6;
		self.typeList.size := self.listPlaces;
		self.traitList.size := self.listPlaces;
		self.methodList.size := self.listPlaces * 2;
		self.methodTextCode.setAttributes((contentEditable: 'true', spellcheck: 'false'))
	}

	updateMethodList { :self |
		self.methodList.removeAll;
		self.methodList.appendChildren(
			self.currentDictionary.values.collect(qualifiedName:/1).sorted.collect { :each |
				TextOption(each, each)
			}
		)
	}

	updateProgramText { :self :qualifiedMethodName |
		|
			[methodName, arity] = qualifiedMethodName.parseQualifiedMethodName,
			programText = ('	' ++ methodName ++ ' ' ++ self.currentDictionary[qualifiedMethodName].sourceCode);
		|
		self.methodTextCode.textContent := programText
	}

	setEventHandlers { :self |
		self.typeList.addEventListener('change', { :event |
			self.traitList.selectedIndex := -1;
			self.methodTextCode.textContent := '';
			self.currentDictionary := system.typeDictionary[event.target.value].methodDictionary;
			self.updateMethodList
		});
		self.traitList.addEventListener('change', { :event |
			self.typeList.selectedIndex := -1;
			self.methodTextCode.textContent := '';
			self.currentDictionary := system.traitDictionary[event.target.value].methodDictionary;
			self.updateMethodList
		});
		self.methodList.addEventListener('change', { :event |
			self.updateProgramText(event.target.value)
		})
	}

}

+ Void {

	MethodBrowser {
		| methodBrowser = newMethodBrowser(nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil); |
		methodBrowser.createElements;
		methodBrowser.setListElements;
		methodBrowser.setAttributes;
		methodBrowser.setEventHandlers;
		system.window.document.body.appendChild(methodBrowser.browserPane);
		methodBrowser
	}

}
