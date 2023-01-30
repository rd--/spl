Attr : [Object, Node] {

	name { :self | <primitive: return _self.name;> }
	ownerElement { :self | <primitive: return _self.ownerElement;> }
	value { :self | <primitive: return _self.value;> }

}

HTMLBodyElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLButtonElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLDivElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLDocument : [Object, EventTarget, Node, Element, HtmlElement, Document] {

}

HTMLOptionsCollection : [Object, HtmlCollection] {

}

HTMLOptionElement : [Object, EventTarget, Node, Element, HtmlElement, Document] {

	index { :self | <primitive: return _self.index;> }
	label { :self | <primitive: return _self.label;> }
	selected { :self | <primitive: return _self.selected;> }
	text { :self | <primitive: return _self.text;> }
	value { :self | <primitive: return _self.value;> }

}

HTMLSelectElement : [Object, EventTarget, Node, Element, HtmlElement] {

	add { :self :item :before | <primitive: return _self.add(_item, _before);> }
	item { :self :anInteger | <primitive: return _self.item(_anInteger);> }
	labels { :self | <primitive: return _self.labels;> }
	options { :self | <primitive: return _self.options;> }
	remove { :self :anInteger | <primitive: return _self.remove(_anInteger);> }
	selectedIndex { :self | <primitive: return _self.selectedIndex;> }

}

HTMLSpanElement : [Object, EventTarget, Node, Element, HtmlElement] {

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
	prompt { :self :message :defaultValue | <primitive: return _self.prompt(_message, _defaultValue);> }

}

+ Void {

	document { <primitive: return document;> }
	window { <primitive: return window;> }

}
