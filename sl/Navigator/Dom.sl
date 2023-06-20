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
		aDictionary.keysAndValuesDo { :key :value |
			self.setProperty(key, value, '')
		}
	}

}

@Document {

	body { :self |
		<primitive: return _self.body;>
	}

	createElement { :self :tagName |
		<primitive: return _self.createElement(_tagName);>
	}

	createElement { :self :tagName :attributeDictionary |
		| element = self.createElement(tagName); |
		element.setAttributes(attributeDictionary);
		element
	}

	createElementNS { :self :namespaceURI :qualifiedName |
		<primitive: return _self.createElementNS(_namespaceURI, _qualifiedName);>
	}

	createSvgElement { :self :tagName |
		self.createElementNS('http://www.w3.org/2000/svg', tagName)
	}

	createSvgElement { :self :tagName :attributeDictionary |
		| element = self.createSvgElement(tagName); |
		element.setAttributesNS(nil, attributeDictionary);
		element
	}

	createTextNode { :self :aString |
		<primitive: return _self.createTextNode(_aString);>
	}

	defaultView { :self |
		<primitive: return _self.defaultView;>
	}

	documentElement { :self |
		<primitive: return _self.documentElement;>
	}

	getElementById { :self :aString |
		<primitive: return _self.getElementById(_aString);>
	}

	getSelection { :self |
		<primitive: return _self.getSelection();>
	}

	querySelector { :self :aString |
		<primitive: return _self.querySelector(_aString);>
	}

	querySelectorAll { :self :aString |
		<primitive: return _self.querySelectorAll(_aString);>
	}

	visibilityState { :self |
		<primitive: return _self.visibilityState;>
	}

}

+String {

	createElement { :self |
		system.window.document.createElement(self)
	}

	createElement { :self :attributeDictionary |
		system.window.document.createElement(self, attributeDictionary)
	}

	createSvgElement { :self :attributeDictionary |
		system.window.document.createSvgElement(self, attributeDictionary)
	}

	getElementById { :self |
		system.window.document.getElementById(self)
	}

	querySelector { :self |
		system.window.document.querySelector(self)
	}

}

@DOMMatrixReadOnly {

	is2D { :self | <primitive: return _self.is2D;> }
	isIdentity { :self | <primitive: return _self.isIdentity;> }

	transformPoint { :self :point | <primitive: return _self.transformPoint(_point);> }

}

@DOMPointReadOnly {

	x { :self | <primitive: return _self.x;> }
	y { :self | <primitive: return _self.y;> }
	z { :self | <primitive: return _self.z;> }
	w { :self | <primitive: return _self.w;> }

	matrixTransform { :self :matrix | <primitive: return _self.matrixTransform(_matrix);> }

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
	hasPointerCapture { :self :pointerId | <primitive: return _self.hasPointerCapture(pointerId);> }
	id { :self | <primitive: return _self.id;> }
	innerHTML { :self | <primitive: return _self.innerHTML;> }
	innerHTML { :self :aString | <primitive: return _self.innerHTML = _aString;> }
	outerHTML { :self | <primitive: return _self.outerHTML;> }
	outerHTML { :self :aString | <primitive: return _self.outerHTML = _aString;> }
	releasePointerCapture { :self :pointerId | <primitive: return _self.releasePointerCapture(_pointerId);> }
	remove { :self | <primitive: return _self.remove();> }
	removeAttribute { :self :aString | <primitive: return _self.removeAttribute(_aString);> }
	setAttribute { :self :name :value | <primitive: return _self.setAttribute(_name, _value);> }
	setAttributeNS { :self :namespace :name :value | <primitive: return _self.setAttributeNS(_namespace, _name, _value);> }
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

	setAttributesNS { :self :namespace :aDictionary |
		aDictionary.keysAndValuesDo { :key :value |
			self.setAttributeNS(namespace, key, value)
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

	stopPropagationAndPreventDefault { :self |
		self.stopPropagation;
		self.cancelable.ifTrue {
			self.preventDefault
		}
	}


}

@EventTarget {

	addEventListener { :self :aString :aProcedure |
		<primitive: return _self.addEventListener(_aString, _aProcedure);>
	}

	addEventListener { :self :aString :aProcedure :options |
		<primitive: return _self.addEventListener(_aString, _aProcedure, _options);>
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

	isHtmlElement { :self |
		true
	}

}

+@Object {

	isHtmlElement { :self |
		false
	}

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

@SVGElement {

	transform { :self |
		<primitive: return _self.transform;>
	}

	transform { :self :transformList |
		<primitive: return _self.transform = transformList;>
	}

}

+Rectangle {

	viewBoxString { :self :margin |
		[
			self.origin.x - margin,
			self.origin.y - margin,
			self.width + (margin * 2),
			self.height + (margin * 2)
		].collect(asString:/1).unwords
	}

}

@SVGGeometryElement {

}

@SVGGraphicsElement {

}

@SVGTextContentElement {

}

@SVGTextPositioningElement {

}

@UiEvent {

}

Attr : [Object, Node] {

	name { :self | <primitive: return _self.name;> }
	ownerElement { :self | <primitive: return _self.ownerElement;> }
	value { :self | <primitive: return _self.value;> }

}

CanvasGradient : [Object] {

}

CanvasPattern : [Object] {

}

CanvasRenderingContext2D : [Object] {

	arcTo { :self :x1 :y1 :x2 :y2 :radius |
		<primitive: return _self.arcTo(_x1, _y1, _x2, _y2, _radius);>
	}

	ellipse { :self :x :y :radiusX :radiusY :rotation :startAngle :endAngle |
		<primitive: return _self.ellipse(_x, _y, _radiusX, _radiusY, _rotation, _startAngle, _endAngle);>
	}

	fill { :self |
		<primitive: return _self.fill();>
	}

	fillStyle { :self |
		<primitive: return _self.fillStyle;>
	}

	fillStyle { :self :anObject |
		<primitive: return _self.fillStyle = _anObject;>
	}

	moveTo { :self :x :y |
		<primitive: return _self.moveTo(_x, _y);>
	}

	rotate { :self :angle |
		<primitive: return _self.rotate(_angle);>
	}

	transform { :self :a :b :c :d :e :f |
		<primitive: return _self.transform(_a, _b, _c, _d, _e, _f);>
	}

	translate { :self :x :y |
		<primitive: return _self.translate(_x, _y);>
	}

}

CSSStyleDeclaration : [Object, CssProperties] {
	(* Chromium... *)
}

CSS2Properties : [Object, CssProperties] {
	(* Firefox... *)
}

CustomEvent : [Object, Event] {

	detail { :self | <primitive: return _self.detail;> } (* Read only *)

}

+String {

	CustomEvent { :self :options |
		<primitive: return new CustomEvent(_self, _options);>
	}

}

DOMParser : [Object] {

	parseFromString { :self :aString :mimeType |
		<primitive: return _self.parseFromString(_aString, _mimeType);>
	}

}

+Void {

	DOMParser {
		<primitive: return new DOMParser();>
	}

}

+ String {

	parseSvg { :self |
		DOMParser().parseFromString(self, 'image/svg+xml').documentElement
	}

}

DOMMatrix : [Object, DOMMatrixReadOnly] {

}

DOMMatrixReadOnly : [Object, DOMMatrixReadOnly] {

}

+Array {

	DOMMatrix { :self |
		<primitive: return new DOMMatrix(_self);>
	}

	DOMMatrixReadOnly { :self |
		<primitive: return new DOMMatrixReadOnly(_self);>
	}

}

DOMPoint : [Object, DOMPointReadOnly] {

}

DOMPointReadOnly : [Object, DOMPointReadOnly] {

}

+SmallFloat {

	DOMPoint { :self :y :z :w |
		<primitive: return new DOMPoint(_self, _y, _z, _w);>
	}

	DOMPointReadOnly { :self :y :z :w |
		<primitive: return new DOMPointReadOnly(_self, _y, _z, _w);>
	}

}

+Record {

	DOMPointReadOnly { :self |
		<primitive: return DOMPointReadOnly.fromPoint(_self);>
	}

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

+String {

	Event { :self |
		<primitive: return new Event(_self);>
	}

}

HTMLBodyElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLButtonElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLCanvasElement : [Object, EventTarget, Node, Element, HtmlElement] {

	getContext { :self :contextType :contextAttributes |
		<primitive: return _self.getContext(_contextType, _contextAttributes);>
	}

	height { :self |
		<primitive: return _self.height;>
	}

	width { :self |
		<primitive: return _self.width;>
	}

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

HTMLImageElement : [Object, EventTarget, Node, Element, HtmlElement] {

	alt { :self | <primitive: return _self.value;> }
	complete { :self | <primitive: return _self.complete;> } (* Read only *)
	height { :self | <primitive: return _self.height;> }
	width { :self | <primitive: return _self.width;> }
	x { :self | <primitive: return _self.x;> } (* Read only *)
	y { :self | <primitive: return _self.y;> } (* Read only *)

	src { :self | <primitive: return _self.src;> }
	src { :self :url | <primitive: return _self.src = _url;> }

}

+SmallFloat {

	Image { :self :height |
		<primitive: return new Image(_self, _height);>
	}

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

HTMLTableElement : [Object, EventTarget, Node, Element, HtmlElement] {

	caption { :self | <primitive: return _self.caption;> }
	rows { :self | <primitive: return _self.rows;> } (* Read only *)

	asHtmlTable { :self |
		self
	}

}

+@SequenceableCollection {

	asHtmlRow { :self :toString:/1 |
		| tr = 'tr'.createElement; |
		self.do { :cell |
			| td = 'td'.createElement; |
			td.textContent(cell.toString);
			tr.appendChild(td)
		};
		tr
	}

	asHtmlTable { :self |
		self.asHtmlTable(asString:/1)
	}

	asHtmlTable { :self :toString:/1 |
		| table = 'table'.createElement; |
		self.do { :row |
			table.appendChild(
				row.asHtmlRow(toString:/1)
			)
		};
		table
	}

}

+Association {

	asHtmlRow { :self :toString:/1 |
		self.Array.asHtmlRow(toString:/1)
	}

}

+@Dictionary {

	asHtmlTable { :self :toString:/1 |
		self.associations.asHtmlTable(toString:/1)
	}

}

HTMLTableCellElement : [Object, EventTarget, Node, Element, HtmlElement] {

	cellIndex { :self | <primitive: return _self.cellIndex;> } (* Read only *)

}

HTMLTableColElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLTableRowElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLTableSectionElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLTextAreaElement  : [Object, EventTarget, Node, Element, HtmlElement] {

	cols { :self | <primitive: return _self.cols;> }
	cols { :self :anInteger | <primitive: return _self.cols = _anInteger;> }
	rows { :self | <primitive: return _self.rows;> }
	rows { :self :anInteger | <primitive: return _self.rows = _anInteger;> }

}

HTMLUListElement : [Object, EventTarget, Node, Element, HtmlElement] {

}

ImageBitmap : [Object] {

	close { :self | <primitive: return _self.close();> }
	height { :self | <primitive: return _self.height;> } (* Read only *)
	width { :self | <primitive: return _self.width;> } (* Read only *)

}

+[Blob, HTMLImageElement] {

	ImageBitmap { :self | <primitive: return createImageBitmap(_self);> }

}

ImageData : [Object] {

	data { :self | <primitive: return _self.data;> } (* Read only *)
	colorSpace { :self | <primitive: return _self.colorSpace;> } (* Read only *)
	height { :self | <primitive: return _self.height;> } (* Read only *)
	width { :self | <primitive: return _self.width;> } (* Read only *)

}

KeyboardEvent : [Object, UiEvent, Event] {

	ctrlKey { :self | <primitive: return _self.ctrlKey;> }
	key { :self | <primitive: return _self.key;> }
	shiftKey { :self | <primitive: return _self.shiftKey;> }

}

Location : [Object] {

	hash { :self | <primitive: return _self.hash;> }
	host { :self | <primitive: return _self.host;> }
	hostname { :self | <primitive: return _self.hostname;> }
	href { :self | <primitive: return _self.href;> }
	origin { :self | <primitive: return _self.origin;> } (* read only *)
	pathname { :self | <primitive: return _self.pathname;> }
	port { :self | <primitive: return _self.port;> }
	protocol { :self | <primitive: return _self.protocol;> }
	search { :self | <primitive: return _self.search;> }

	reload { :self | <primitive: return _self.reload();> }
	replace { :self :url | <primitive: return _self.reload(_url);> }

	pseudoSlotNameArray { :self |
		['protocol', 'hostname', 'port', 'pathname', 'search', 'hash']
	}

}

MediaSource : [Object, EventTarget] {

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
		<primitive: return _self.requestMIDIAccess(_midiOptions);>
	}

	sendBeacon { :self :data |
		<primitive: return _self.sendBeacon(_self, _data);>
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

OffscreenCanvas : [Object, EventTarget] {

	getContext { :self :contextType :contextAttributes |
		<primitive: return _self.getContext(_contextType, _contextAttributes);>
	}

}

OffscreenCanvasRenderingContext2D : [Object] {

}

+SmallFloat {

	OffscreenCanvas { :self :height |
		<primitive: return new OffscreenCanvas(_self, _height);>
	}

}

Path2D : [Object] {

}

PointerEvent : [Object, UiEvent, Event, MouseEvent] {

	isPrimary { :self | <primitive: return _self.isPrimary;> }
	pointerId { :self | <primitive: return _self.pointerId;> }
	pointerPressure { :self | <primitive: return _self.pointerPressure;> }
	pointerType { :self | <primitive: return _self.pointerType;> }

}

Range : [Object, AbstractRange] {

	deleteContents { :self | <primitive: return _self.deleteContents();> }
	insertNode { :self :aNode | <primitive: return _self.insertNode(_aNode);> }

}

Selection : [Object] {

	getRangeAt { :self :anInteger |
		<primitive: return _self.getRangeAt(_anInteger);>
	}

	toString { :self |
		<primitive: return _self.toString();>
	}

}

SVGCircleElement : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

}

SVGGElement : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement] {

}

SVGLineElement : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

	p2 { :self :aPoint |
		self.setAttribute('x2', aPoint.x);
		self.setAttribute('y2', aPoint.y)
	}

}

SVGPathElement : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

}

SVGPointList : [Object] {

	clear { :self | <primitive: return _self.clear();> }
	getItem { :self :index | <primitive: return _self.getItem(_index);> }
	length { :self | <primitive: return _self.length;> }
	numberOfItems { :self | <primitive: return _self.numberOfItems;> }

}

SVGPolygonElement : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

	points { :self | <primitive: return _self.points;> }

}

SVGPolylineElement : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

}

SVGRectElement : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

}

SVGSVGElement : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement] {

	createSVGMatrix { :self | <primitive: return _self.createSVGMatrix();> }
	createSVGRect { :self | <primitive: return _self.createSVGRect();> }
	createSVGTransform { :self | <primitive: return _self.createSVGTransform();> }
	createSVGTransformFromMatrix { :self :aMatrix | <primitive: return _self.createSVGTransformFromMatrix(_aMatrix);> }

}

SVGTextElement : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGTextContentElement, SVGTextPositioningElement] {

}

SVGTextPathElement : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGTextContentElement] {

}

SVGTitleElement : [Object, EventTarget, Node, Element, SVGElement] {

}

SVGTransform : [Object] {

	setMatrix { :self :aMatric |
		<primitive: _self.setMatrix(_aMatrix);>
	}

	setTranslate { :self :x :y |
		<primitive: _self.setTranslate(_x, _y);>
	}

	setScale { :self :x :y |
		<primitive: _self.setScale(_x, _y);>
	}

	setRotate { :self :angle :x :y |
		<primitive: _self.setMatrix(_angle, _x, _y);>
	}

}

SVGTransformList : [Object] {

	appendItem { :self :aTransform | <primitive: return _self.appendItem(_aTransform);> }
	getItem { :self :index | <primitive: return _self.getItem(_index);> }

}

Text : [Object, EventTarget, Node, CharacterData] {

	wholeText { :self | <primitive: return _self.wholeText;> }

}

+Window {

	document { :self | <primitive: return _self.document;> }
	getComputedStyle { :self :element | <primitive: return _self.getComputedStyle(_element);> }
	getSelectedText { :self | <primitive: return _self.getSelection().toString();> }
	getSelection { :self | <primitive: return _self.getSelection();> }
	innerHeight { :self | <primitive: return _self.innerHeight;> }
	innerWidth { :self | <primitive: return _self.innerWidth;> }

}

+String {

	insertAtCursor { :self |
		system.window.getSelection.getRangeAt(
			0
		).insertNode(
			system.window.document.createTextNode(
				self
			)
		)
	}

}

WebGLRenderingContext : [Object] {

}

XMLDocument : [Object, EventTarget, Node, Document] {

}
