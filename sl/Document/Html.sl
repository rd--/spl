Attr : [Object, Node] {

	name { :self | <primitive: return _self.name;> }
	ownerElement { :self | <primitive: return _self.ownerElement;> }
	value { :self | <primitive: return _self.value;> }

}

CSSStyleDeclaration : [Object, CssProperties] {
	(* Chromium... *)
}

CSS2Properties : [Object, CssProperties] {
	(* Firefox... *)
}

DOMRect : [Object] {

	height { :self | <primitive: return _self.height;> }
	width { :self | <primitive: return _self.width;> }
	x { :self | <primitive: return _self.x;> }
	y { :self | <primitive: return _self.y;> }

}

DOMTokenList : [Object] {

	add { :self :aString | <primitive: return _self.add(_aString);> }
	contains { :self :aString | <primitive: return _self.contains(_aString);> }
	remove { :self :aString | <primitive: return _self.remove(_aString);> }

}

Event : [Object, UiEvent, Event] {

}

HTMLBodyElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLButtonElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLCollection : [Object, HtmlCollection] {

}

HTMLDialogElement : [Object, EventTarget, Node, Element, HtmlElement] {

	close { :self | <primitive: return _self.close();> }
	show { :self | <primitive: return _self.show();> }
	showModal { :self | <primitive: return _self.showModal();> }

}

HTMLDivElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLDocument : [Object, EventTarget, Node, Element, HtmlElement, Document] {

}

HTMLElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLHeadingElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLLIElement : [Object, EventTarget, Node, Element, HtmlElement] {

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

HTMLParagraphElement : [Object, EventTarget, Node, Element, HtmlElement] {

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

	deselect { :self |
		self.selectedIndex := -1
	}

	indexOf { :self :aString |
		aString.isEmpty.if {
			-1
		} {
			withReturn {
				(0 .. self.length - 1).do { :index |
					(self.options.item(index).value = aString).ifTrue {
						index.return
					}
				};
				-1
			}
		}
	}

	removeAll { :self |
		self.length := 0
	}

	select { :self :aString |
		self.selectedIndex := self.indexOf(aString)
	}

	value { :self |
		(self.selectedIndex = -1).if {
			''
		} {
			self.item(self.selectedIndex).value
		}
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

HTMLUListElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

KeyboardEvent : [Object, UiEvent, Event] {

	ctrlKey { :self | <primitive: return _self.ctrlKey;> }
	key { :self | <primitive: return _self.key;> }
	shiftKey { :self | <primitive: return _self.shiftKey;> }

}

MouseEvent : [Object, UiEvent, Event, MouseEvent] {

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

PointerEvent : [Object, UiEvent, Event, MouseEvent] {

	isPrimary { :self | <primitive: return _self.isPrimary;> }
	pointerId { :self | <primitive: return _self.pointerId;> }
	pointerPressure { :self | <primitive: return _self.pointerPressure;> }
	pointerType { :self | <primitive: return _self.pointerType;> }

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

+ String {

	Event { :self |
		<primitive: return new Event(_self);>
	}

}
