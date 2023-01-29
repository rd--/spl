HTMLDocument : [Object, EventTarget, Node, Element, HtmlElement, Document] {
}

HTMLBodyElement : [Object, EventTarget, Node, Element, HtmlElement] {
}

HTMLDivElement : [Object, EventTarget, Node, Element, HtmlElement] {
}

HTMLButtonElement : [Object, EventTarget, Node, Element, HtmlElement] {
}

NamedNodeMap : [Object] {

	getNamedItem { :self :aString | <primitive: return _self.getNamedItem(aString);> }
	item { :self :anInteger | <primitive: return _self.item(_anInteger);> }
	length { :self | <primitive: return _self.length;> }

}

Attr : [Object, Node] {

	name { :self | <primitive: return _self.name;> }
	ownerElement { :self | <primitive: return _self.ownerElement;> }
	value { :self | <primitive: return _self.value;> }

}

MouseEvent : [Object, UiEvent, Event] {

	buttons { :self | <primitive: return _self.buttons;> }
	x { :self | <primitive: return _self.x;> }
	y { :self | <primitive: return _self.y;> }

}

+ Void {

	document { <primitive: return document;> }

}

+ String {

	TextButton { :self :aDictionary |
		| b = document().createElement('button'); |
		b.innerText(self);
		aDictionary.keysAndValuesDo { :key :value | b.setAttribute(key, value) };
		b
	}

}

