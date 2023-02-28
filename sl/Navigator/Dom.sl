@AbstractRange {

}

@CharacterData {

	data { :self | <primitive: return _self.data;> }
	length { :self | <primitive: return _self.length;> }

}

@CSSRule {

}

@CssProperties {

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

@Document {

	body { :self | <primitive: return _self.body;> }
	createElement { :self :tagName | <primitive: return _self.createElement(_tagName);> }
	defaultView { :self | <primitive: return _self.defaultView;> }
	getElementById { :self :aString | <primitive: return _self.getElementById(_aString);> }
	getSelection { :self | <primitive: return _self.getSelection();> }
	querySelector { :self :aString | <primitive: return _self.querySelector(_aString);> }
	querySelectorAll { :self :aString | <primitive: return _self.querySelectorAll(_aString);> }
	visibilityState { :self | <primitive: return _self.visibilityState;> }

}

@Element {

	append { :self :anArray | <primitive: return _self.append(..._anArray);> }
	attributes { :self | <primitive: return _self.attributes;> }
	childElementCount { :self | <primitive: return _self.childElementCount;> }
	children { :self | <primitive: return _self.children;> }
	classList { :self | <primitive: return _self.classList;> }
	className { :self | <primitive: return _self.className;> }
	className { :self :aString | <primitive: return _self.className = _aString;> }
	getAttribute { :self :name | <primitive: return _self.getAttribute(_name);> }
	getBoundingClientRect { :self | <primitive: return _self.getBoundingClientRect();> }
	id { :self | <primitive: return _self.id;> }
	innerHTML { :self | <primitive: return _self.innerHTML;> }
	innerHTML { :self :aString | <primitive: return _self.innerHTML = _aString;> }
	releasePointerCapture { :self :pointerId | <primitive: return _self.releasePointerCapture(_pointerId);> }
	remove { :self | <primitive: return _self.remove();> }
	removeAttribute { :self :aString | <primitive: return _self.removeAttribute(_aString);> }
	setAttribute { :self :name :value | <primitive: return _self.setAttribute(_name, _value);> }
	setPointerCapture { :self :pointerId | <primitive: return _self.setPointerCapture(_pointerId);> }

	removeAllChildren { :self |
		self.children.Array.do { :each |
			each.remove
		}
	}

	setAttributes { :self :aDictionary |
		aDictionary.keysAndValuesDo { :key :value |
			self.setAttribute(key, value)
		}
	}

}

@Event {

	cancelable { :self | <primitive: return _self.cancelable;> }
	preventDefault { :self | <primitive: return _self.preventDefault();> }
	stopPropagation { :self | <primitive: return _self.stopPropagation();> }
	stopImmediatePropagation { :self | <primitive: return _self.stopImmediatePropagation();> }
	target { :self | <primitive: return _self.target;> }
	timeStamp { :self | <primitive: return _self.timeStamp;> }
	type { :self | <primitive: return _self.type;> }

}

@EventTarget {

	addEventListener { :self :aString :aProcedure |
		<primitive: return _self.addEventListener(_aString, _aProcedure);>
	}

	addEventListener { :self :aString :aProcedure :options |
		<primitive: return _self.addEventListener(_aString, _aProcedure, Object.fromEntries(_options));>
	}

	dispatchEvent { :self :event |
		<primitive: return _self.dispatchEvent(_event);>
	}

	removeEventListener { :self :aString :aProcedure |
		<primitive: return _self.removeEventListener(_aString, _aProcedure);>
	}

}

@HtmlCollection {

	item { :self :anInteger | <primitive: return _self.item(_anInteger);> }
	length { :self | <primitive: return _self.length;> }
	namedItem { :self :aString | <primitive: return _self.namedItem(_aString);> }

	Array { :self | <primitive: return Array.from(_self);> }

}

@HtmlElement {

	accessKey { :self | <primitive: return _self.accessKey;> }
	accessKey { :self :aString | <primitive: return _self.accessKey = _aString;> }
	blur { :self | <primitive: return _self.blur();> }
	click { :self | <primitive: return _self.click();> }
	contentEditable  { :self | <primitive: return _self.contentEditable;> }
	contentEditable  { :self :aString | <primitive: return _self.contentEditable = _aString;> }
	focus { :self | <primitive: return _self.focus();> }
	focus { :self :options | <primitive: return _self.focus(options);> }
	innerText { :self | <primitive: return _self.innerText;> }
	innerText { :self :aString | <primitive: return _self.innerText = _aString;> }
	isContentEditable  { :self | <primitive: return _self.isContentEditable;> }
	style { :self | <primitive: return _self.style;> }
	tabIndex { :self | <primitive: return _self.tabIndex;> }
	tabIndex { :self :anInteger | <primitive: return _self.tabIndex = _anInteger;> }
	title { :self | <primitive: return _self.title;> }
	title { :self :aString | <primitive: return _self.title = _aString;> }

	computedStyle { :self | <primitive: return window.getComputedStyle(_self);> }

}

@MouseEvent {

	buttons { :self | <primitive: return _self.buttons;> }
	clientX { :self | <primitive: return _self.clientX;> }
	clientY { :self | <primitive: return _self.clientY;> }
	x { :self | <primitive: return _self.x;> }
	y { :self | <primitive: return _self.y;> }

}

@Node {

	appendChild { :self :aChild | <primitive: return _self.appendChild(_aChild);> }
	childNodes { :self | <primitive: return _self.childNodes;> }
	firstChild { :self | <primitive: return _self.firstChild;> }
	nodeType { :self | <primitive: return _self.nodeType;> }
	textContent { :self | <primitive: return _self.textContent;> }
	textContent { :self :aString | <primitive: return _self.textContent = _aString;> }

	appendChildren { :self :anArray |
		anArray.do { :each |
			self.appendChild(each)
		}
	}

}

@UiEvent {

}

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

HTMLInputElement : [Object, EventTarget, Node, Element, HtmlElement] {

	value { :self |
		<primitive: return _self.value;>
	}

	value { :self :aValue |
		<primitive: return _self.value = _aValue;>
	}

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

Navigator : [Object] {

	maxTouchPoints { :self |
		<primitive: return _self.maxTouchPoints;>
	}

	requestMidiAccess { :self |
		<primitive: return _self.requestMIDIAccess();>
	}

	requestMidiAccess { :self :midiOptions |
		<primitive: return _self.requestMIDIAccess(Object.fromEntries(_midiOptions));>
	}

	sendBeacon { :url :data |
		<primitive: return _self.sendBeacon(_url, _data);>
	}

	storage { :self |
		<primitive: return _self.storage;>
	}

	userAgent  { :self |
		<primitive: return _self.userAgent;>
	}

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

+String {


	createElement { :self |
		system.window.document.createElement(self)
	}

	getElementById { :self |
		system.window.document.getElementById(self)
	}

	querySelector { :self |
		system.window.document.querySelector(self)
	}

	Event { :self |
		<primitive: return new Event(_self);>
	}

}
