@EventTarget {

	addEventListener { :self :aString :aProcedure |
		<primitive: return _self.addEventListener(_aString, _aProcedure);>
	}

}

@Node {

	childNodes { :self | <primitive: return _self.childNodes;> }
	nodeType { :self | <primitive: return _self.nodeType;> }
	textContent { :self | <primitive: return _self.textContent;> }

}

@Element {

	attributes { :self | <primitive: return _self.attributes;> }
	setAttribute { :self :name :value | <primitive: return _self.setAttribute(_name, _value);> }

}

@HtmlElement {

	blur { :self | <primitive: return _self.blur();> }
	click { :self | <primitive: return _self.click();> }
	focus { :self | <primitive: return _self.focus();> }
	innerText { :self | <primitive: return _self.innerText;> }
	innerText { :self :aString | <primitive: return _self.innerText = _aString;> }

}

@Document {

	body { :self | <primitive: return _self.body;> }
	createElement { :self :tagName | <primitive: return _self.createElement(_tagName);> }
	getElementById { :self :aString | <primitive: return _self.getElementById(_aString);> }
	querySelector { :self :aString | <primitive: return _self.querySelector(_aString);> }
	querySelectorAll { :self :aString | <primitive: return _self.querySelectorAll(_aString);> }

}

@UiEvent {

}

@Event {

	target { :self | <primitive: return _self.target;> }
	timeStamp { :self | <primitive: return _self.timeStamp;> }
	type { :self | <primitive: return _self.type;> }

}
