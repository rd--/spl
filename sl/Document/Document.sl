@AbstractRange {

}

@CharacterData {

	data { :self | <primitive: return _self.data;> }
	length { :self | <primitive: return _self.length;> }

}

@Document {

	body { :self | <primitive: return _self.body;> }
	createElement { :self :tagName | <primitive: return _self.createElement(_tagName);> }
	getElementById { :self :aString | <primitive: return _self.getElementById(_aString);> }
	getSelection { :self | <primitive: return _self.getSelection();> }
	querySelector { :self :aString | <primitive: return _self.querySelector(_aString);> }
	querySelectorAll { :self :aString | <primitive: return _self.querySelectorAll(_aString);> }

}

@Element {

	attributes { :self | <primitive: return _self.attributes;> }
	id { :self | <primitive: return _self.id;> }
	innerHTML { :self | <primitive: return _self.innerHTML;> }
	innerHTML { :self :aString | <primitive: return _self.innerHTML = _aString;> }
	setAttribute { :self :name :value | <primitive: return _self.setAttribute(_name, _value);> }

}

@Event {

	target { :self | <primitive: return _self.target;> }
	timeStamp { :self | <primitive: return _self.timeStamp;> }
	type { :self | <primitive: return _self.type;> }

}

@EventTarget {

	addEventListener { :self :aString :aProcedure |
		<primitive: return _self.addEventListener(_aString, _aProcedure);>
	}

}

@HtmlCollection {

	item { :self :anInteger | <primitive: return _self.item(_anInteger);> }
	length { :self | <primitive: return _self.length;> }
	namedItem { :self :aString | <primitive: return _self.namedItem(_aString);> }

}

@HtmlElement {

	blur { :self | <primitive: return _self.blur();> }
	click { :self | <primitive: return _self.click();> }
	focus { :self | <primitive: return _self.focus();> }
	innerText { :self | <primitive: return _self.innerText;> }
	innerText { :self :aString | <primitive: return _self.innerText = _aString;> }

}

@Node {

	appendChild { :self :aChild | <primitive: return _self.appendChild(_aChild);> }
	childNodes { :self | <primitive: return _self.childNodes;> }
	nodeType { :self | <primitive: return _self.nodeType;> }
	textContent { :self | <primitive: return _self.textContent;> }

}

@UiEvent {

}
