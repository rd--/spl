Attr : [Object, Node] {

	name { :self | <primitive: return _self.name;> }
	ownerElement { :self | <primitive: return _self.ownerElement;> }
	value { :self | <primitive: return _self.value;> }

}

CSSStyleDeclaration : [Object] {

	cssText { :self | <primitive: return _self.cssText;> }
	cssText { :self :aString | <primitive: return _self.cssText = _aString;> }
	getPropertyValue { :self :name | <primitive: return _self.getPropertyValue(_name);> }
	removeProperty { :self :name | <primitive: return _self.removeProperty(_name);> }
	setProperty { :self :name :value :priority | <primitive: return _self.setProperty(_name, _value, _priority);> }

	at { :self :name |
		self.getPropertyValue(name)
	}

	atPut { :self :name :value |
		self.setProperty(name, value, '')
	}

	setProperties { :self :aDictionary |
		aDictionary.StringDictionary.keysAndValuesDo { :key :value |
			self.setProperty(key, value, '')
		}
	}

}

Event : [Object, UiEvent, Event] {

}

HTMLBodyElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLButtonElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLDivElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLDocument : [Object, EventTarget, Node, Element, HtmlElement, Document] {

}

HTMLElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLOptionsCollection : [Object, HtmlCollection] {

}

HTMLOptionElement : [Object, EventTarget, Node, Element, HtmlElement] {

	index { :self | <primitive: return _self.index;> }
	label { :self | <primitive: return _self.label;> }
	selected { :self | <primitive: return _self.selected;> }
	text { :self | <primitive: return _self.text;> }
	text { :self :aString | <primitive: return _self.text = _aString;> }
	value { :self | <primitive: return _self.value;> }
	value { :self :aString | <primitive: return _self.value = _aString;> }

}

HTMLPreElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLSelectElement : [Object, EventTarget, Node, Element, HtmlElement] {

	add { :self :item :before | <primitive: return _self.add(_item, _before);> }
	item { :self :anInteger | <primitive: return _self.item(_anInteger);> }
	labels { :self | <primitive: return _self.labels;> }
	length { :self | <primitive: return _self.length;> }
	length { :self :anInteger | <primitive: return _self.length = _anInteger;> }
	options { :self | <primitive: return _self.options;> }
	remove { :self :anInteger | <primitive: return _self.remove(_anInteger);> }
	selectedIndex { :self | <primitive: return _self.selectedIndex;> }
	selectedIndex { :self :anInteger | <primitive: return _self.selectedIndex = _anInteger;> }
	size { :self | <primitive: return _self.size;> }
	size { :self :anInteger | <primitive: return _self.size = _anInteger;> }
	type { :self | <primitive: return _self.type;> }
	value { :self | <primitive: return _self.value;> }

	removeAll { :self |
		self.length := 0
	}

}

HTMLSpanElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLTextAreaElement  : [Object, EventTarget, Node, Element, HtmlElement] {

	cols { :self | <primitive: return _self.cols;> }
	cols { :self :anInteger | <primitive: return _self.cols = _anInteger;> }
	rows { :self | <primitive: return _self.rows;> }
	rows { :self :anInteger | <primitive: return _self.rows = _anInteger;> }

}

MouseEvent : [Object, UiEvent, Event] {

	buttons { :self | <primitive: return _self.buttons;> }
	x { :self | <primitive: return _self.x;> }
	y { :self | <primitive: return _self.y;> }

}

NamedNodeMap : [Object] {

	getNamedItem { :self :aString | <primitive: return _self.getNamedItem(aString);> }
	item { :self :anInteger | <primitive: return _self.item(_anInteger);> }
	length { :self | <primitive: return _self.length;> }

}

NodeList : [Object] {

	item { :self :anInteger | <primitive: return _self.item(_anInteger);> }
	length { :self | <primitive: return _self.length;> }

}

Range : [Object, AbstractRange] {

}

Selection : [Object] {

	getRangeAt { :self :anInteger | <primitive: return _self.getRangeAt(anInteger);> }
	toString { :self | <primitive: return _self.toString();> }

}

Text : [Object, EventTarget, Node, CharacterData] {

	wholeText { :self | <primitive: return _self.wholeText;> }

}

Window : [Object] {

	alert { :self :aString | <primitive: return _self.alert(_aString);> }
	confirm { :self :aString | <primitive: return _self.confirm(_aString);> }
	document { :self | <primitive: return _self.document;> }
	getComputedStyle { :self :element | <primitive: return _self.getComputedStyle(_element);> }
	getSelectedText { :self | <primitive: return _self.getSelection().toString();> }
	getSelection { :self | <primitive: return _self.getSelection();> }
	localStorage { :self | <primitive: return _self.localStorage;> }
	location { :self | <primitive: return _self.location;> }
	name { :self | <primitive: return _self.name;> }
	navigator { :self | <primitive: return _self.navigator;> }
	prompt { :self :message :defaultValue | <primitive: return _self.prompt(_message, _defaultValue);> }
	sessionStorage { :self | <primitive: return _self.sessionStorage;> }

}
