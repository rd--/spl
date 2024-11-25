/* Requires: Blob Event EventTarget */

@AbstractRange {

}

@CharacterData {

	data { :self | <primitive: return _self.data;> }
	length { :self | <primitive: return _self.length;> }

}

@CssProperties {

	cssText { :self :aString | <primitive: return _self.cssText = _aString;> }
	cssText { :self | <primitive: return _self.cssText;> }
	getPropertyPriority { :self :name | <primitive: return _self.getPropertyPriority();> }
	getPropertyValue { :self :name | <primitive: return _self.getPropertyValue(_name);> }
	length { :self | <primitive: return _self.length;> } /* Read only */
	removeProperty { :self :name | <primitive: return _self.removeProperty(_name);> }
	setProperty { :self :name :value :priority | <primitive: return _self.setProperty(_name, _value, _priority);> }

	at { :self :name |
		self.getPropertyValue(name)
	}

	atPut { :self :name :value |
		self.setProperty(name, value, '')
	}

	setProperties { :self :aDictionary |
		aDictionary.withIndexDo { :value :key |
			self.setProperty(key, value, '')
		}
	}

}

@CssRule {

	cssText { :self | <primitive: return _self.cssText;> } /* Read only */

}

@Document {

	adoptedStyleSheets { :self :styleSheets |
		<primitive: _self.adoptedStyleSheets = _styleSheets;>
		nil
	}

	body { :self |
		<primitive: return _self.body;>
	}

	createElement { :self :tagName |
		<primitive: return _self.createElement(_tagName);>
	}

	createElement { :self :tagName :attributeDictionary |
		let element = self.createElement(tagName);
		element.setAttributes(attributeDictionary);
		element
	}

	createElementNS { :self :namespaceURI :qualifiedName |
		<primitive: return _self.createElementNS(_namespaceURI, _qualifiedName);>
	}

	createRange { :self |
		<primitive: return _self.createRange();>
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

	styleSheetList { :self |
		<primitive: return [..._self.styleSheets];>
	}

	styleSheets { :self |
		<primitive: return _self.styleSheets;>
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

	append { :self :aList | <primitive: return _self.append(..._aList);> }
	attributes { :self | <primitive: return _self.attributes;> }
	childElementCount { :self | <primitive: return _self.childElementCount;> }
	children { :self | <primitive: return _self.children;> }
	classList { :self | <primitive: return _self.classArray;> }
	className { :self :aString | <primitive: return _self.className = _aString;> }
	className { :self | <primitive: return _self.className;> }
	getAttribute { :self :name | <primitive: return _self.getAttribute(_name);> }
	getBoundingClientRect { :self | <primitive: return _self.getBoundingClientRect();> }
	hasPointerCapture { :self :pointerId | <primitive: return _self.hasPointerCapture(pointerId);> }
	id { :self | <primitive: return _self.id;> }
	innerHtml { :self :aString | <primitive: return _self.innerHTML = _aString;> }
	innerHtml { :self | <primitive: return _self.innerHTML;> }
	insertAdjacentElement { :self :position :element | <primitive: return _self.insertAdjacentElement(_position, _elementwhere);> }
	insertAdjacentText { :self :where :data | <primitive: return _self.insertAdjacentText(_where, _data);> }
	localName { :self | <primitive: return _self.localName;> } /* Read only */
	matches { :self :selectors | <primitive: return _self.matches(_selectors);> }
	nextElementSibling { :self | <primitive: return _self.nextElementSibling;> } /* Read only */
	outerHtml { :self :aString | <primitive: return _self.outerHTML = _aString;> }
	outerHtml { :self | <primitive: return _self.outerHTML;> }
	previousElementSibling { :self | <primitive: return _self.previousElementSibling;> } /* Read only */
	releasePointerCapture { :self :pointerId | <primitive: return _self.releasePointerCapture(_pointerId);> }
	remove { :self | <primitive: return _self.remove();> }
	removeAttribute { :self :aString | <primitive: return _self.removeAttribute(_aString);> }
	setAttribute { :self :name :value | <primitive: return _self.setAttribute(_name, _value);> }
	setAttributeNS { :self :namespace :name :value | <primitive: return _self.setAttributeNS(_namespace, _name, _value);> }
	setPointerCapture { :self :pointerId | <primitive: return _self.setPointerCapture(_pointerId);> }
	tagName { :self | <primitive: return _self.tagName;> } /* Read only */

	removeAllChildren { :self |
		self.children.asList.do { :each |
			each.remove
		}
	}

	setAttributes { :self :aDictionary |
		aDictionary.withIndexDo { :value :key |
			self.setAttribute(key, value)
		}
	}

	setAttributesNS { :self :namespace :aDictionary |
		aDictionary.withIndexDo { :value :key |
			self.setAttributeNS(namespace, key, value)
		}
	}

}

@HtmlCollection {

	item { :self :anInteger | <primitive: return _self.item(_anInteger);> }
	length { :self | <primitive: return _self.length;> }
	namedItem { :self :aString | <primitive: return _self.namedItem(_aString);> }

	asList { :self |
		<primitive: return Array.from(_self);>
	}

	at { :self :anInteger |
		self.item(anInteger - 1) /* One-indexed */
	}

}

@HtmlElement {

	accessKey { :self :aString | <primitive: return _self.accessKey = _aString;> }
	accessKey { :self | <primitive: return _self.accessKey;> }
	blur { :self | <primitive: return _self.blur();> }
	click { :self | <primitive: return _self.click();> }
	contentEditable { :self :aString | <primitive: return _self.contentEditable = _aString;> }
	contentEditable { :self | <primitive: return _self.contentEditable;> }
	focus { :self :options | <primitive: return _self.focus(options);> }
	focus { :self | <primitive: return _self.focus();> }
	innerText { :self :aString | <primitive: return _self.innerText = _aString;> }
	innerText { :self | <primitive: return _self.innerText;> }
	isContentEditable { :self | <primitive: return _self.isContentEditable;> }
	style { :self | <primitive: return _self.style;> }
	tabIndex { :self :anInteger | <primitive: return _self.tabIndex = _anInteger;> }
	tabIndex { :self | <primitive: return _self.tabIndex;> }
	title { :self :aString | <primitive: return _self.title = _aString;> }
	title { :self | <primitive: return _self.title;> }

	computedStyle { :self | <primitive: return globalThis.getComputedStyle(_self);> }

	isHtmlElement { :self |
		true
	}

	/* Valid at <audio>, <img>, <link>, <script>, and <video> */
	crossOrigin { :self :aString | <primitive: return _self.crossorigin = _aString;> }
	crossOrigin { :self | <primitive: return _self.crossorigin;> }

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
	childNodes { :self | <primitive: return _self.childNodes;> } /* Read only */
	firstChild { :self | <primitive: return _self.firstChild;> } /* Read only */
	nextSibling { :self | <primitive: return _self.nextSibling;> } /* Read only */
	nodeType { :self | <primitive: return _self.nodeType;> } /* Read only */
	nodeValue { :self | <primitive: return _self.nodeValue;> }
	parentElement { :self | <primitive: return _self.parentElement;> } /* Read only */
	previousSibling { :self | <primitive: return _self.previousSibling;> } /* Read only */
	textContent { :self :aString | <primitive: return _self.textContent = _aString;> }
	textContent { :self | <primitive: return _self.textContent;> }

	appendChildren { :self :aList |
		aList.do { :each |
			self.appendChild(each)
		}
	}

	isAllWhiteSpace { :self |
		self.textContent.isAllWhiteSpace
	}

	isAttribute { :self |
		self.nodeType = 2
	}

	isCData { :self |
		self.nodeType = 4
	}

	isComment { :self |
		self.nodeType = 8
	}

	isCommentOrWhiteSpace { :self |
		self.isComment | {
			self.isText & {
				self.isAllWhiteSpace
			}
		}
	}

	isElement { :self |
		self.nodeType = 1
	}

	isText { :self |
		self.nodeType = 3
	}

}

@StyleSheet {

	href { :self | <primitive: return _self.href;> } /* Read only */
	title { :self | <primitive: return _self.title;> } /* Read only */
	type { :self | <primitive: return _self.type;> } /* Read only */

}

@Text {

	assignedSlot { :self | <primitive: return _self.assignedSlot;> } /* Read only */
	splitText { :self :offset | <primitive: return _self.splitText(_offset);> }
	wholeText { :self | <primitive: return _self.wholeText;> } /* Read only */

}

@UiEvent {

}

Attr! : [Object, Node] {

	name { :self | <primitive: return _self.name;> }
	ownerElement { :self | <primitive: return _self.ownerElement;> }
	value { :self | <primitive: return _self.value;> }

}

CanvasGradient! : [Object] {

}

CanvasPattern! : [Object] {

}

CanvasRenderingContext2D! : [Object] {

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

ClipboardEvent! : [Object, Event] {

	clipboardData { :self | <primitive: return _self.clipboardData;> } /* Read only */

}

CSSFontFaceRule! : [Object, CssRule] {

	style { :self | <primitive: return _self.style;> } /* Read only */

}

CSSRuleList! : [Object] {

	item { :self :index | <primitive: return _self.item(_index);> }
	length { :self | <primitive: return _self.length;> } /* Read only */

	at { :self :index |
		self.item(index - 1) /* One-indexed */
	}

	size { :self |
		self.length
	}

}

CSSStyleDeclaration! : [Object, CssProperties] {
	/* Chromium... */
}

CSS2Properties! : [Object, CssProperties] {
	/* Firefox... */
}

CSSStyleRule! : [Object, CssRule] {

}

CSSStyleSheet! : [Object, StyleSheet] {

	cssRuleList { :self | <primitive: return [..._self.cssRules];> }
	cssRules { :self | <primitive: return _self.cssRules;> } /* Read only */
	deleteRule { :self :index | <primitive: return _self.deleteRule(_index);> }
	insertRule { :self :rule :index | <primitive: return _self.insertRule(_rule, _index);> }
	insertRule { :self :rule | <primitive: return _self.insertRule(_rule);> }
	replace { :self :text | <primitive: return _self.replace(_text);> }
	replaceSync { :self :text | <primitive: return _self.replaceSync(_text);> }

}

+Void {

	CssStyleSheet {
		<primitive: return new CSSStyleSheet();>
	}

}

+Record {

	CssStyleSheet { :options |
		<primitive: return new CSSStyleSheet(_options);>
	}

}

CustomEvent! : [Object, Event] {

	detail { :self | <primitive: return _self.detail;> } /* Read only */

}

DataTransfer! : [Object] {

	getData { :self :format |  <primitive: return _self.getData(_format);> }

}

+String {

	CustomEvent { :self :options |
		<primitive: return new CustomEvent(_self, _options);>
	}

}

DOMMatrix! : [Object, DOMMatrixReadOnly] {

}

DOMMatrixReadOnly! : [Object, DOMMatrixReadOnly] {

}

+List {

	DOMMatrix { :self |
		<primitive: return new DOMMatrix(_self);>
	}

	DOMMatrixReadOnly { :self |
		<primitive: return new DOMMatrixReadOnly(_self);>
	}

}

DOMParser! : [Object] {

	parseFromString { :self :aString :mimeType |
		<primitive: return _self.parseFromString(_aString, _mimeType);>
	}

}

+Void {

	DOMParser {
		<primitive: return new DOMParser();>
	}

}

DOMPoint! : [Object, DOMPointReadOnly] {

}

DOMPointReadOnly! : [Object, DOMPointReadOnly] {

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

DOMRange! : [Object, AbstractRange] { /* Note: Renamed by Spl kernel from Range */

	cloneRange { :self | <primitive: return _self.cloneRange();> }
	commonAncestorContainer { :self | <primitive: return _self.commonAncestorContainer;> } /* Read only */
	deleteContents { :self | <primitive: return _self.deleteContents();> }
	endContainer { :self | <primitive: return _self.endContainer;> } /* Read only */
	endOffset { :self | <primitive: return _self.endOffset + 1;> } /* One-indexed */
	insertNode { :self :aNode | <primitive: return _self.insertNode(_aNode);> }
	selectNodeContents { :self :aNode | <primitive: return _self.selectNodeContents(_aNode);> }
	setEnd { :self :endNode :endOffset | <primitive: return _self.setEnd(_endNode, _endOffset - 1);> } /* One-indexed */
	setStart { :self :startNode :startOffset | <primitive: return _self.setStart(_startNode, _startOffset - 1);> } /* One-indexed */
	startContainer { :self | <primitive: return _self.startContainer;> } /* Read only */
	startOffset { :self | <primitive: return _self.startOffset + 1;> } /* One-indexed */
	toString { :self | <primitive: return _self.toString();> }

	isInTextAreaElement { :self |
		self.startContainer.isElement & {
			self.startContainer.childNodes[self.startOffset].isHTMLTextAreaElement
		}
	}

}

DOMRect! : [Object] {

	height { :self | <primitive: return _self.height;> }
	width { :self | <primitive: return _self.width;> }
	x { :self | <primitive: return _self.x;> }
	y { :self | <primitive: return _self.y;> }

}

DOMTokenList! : [Object] {

	add { :self :aString | <primitive: return _self.add(_aString);> }
	contains { :self :aString | <primitive: return _self.contains(_aString);> }
	remove { :self :aString | <primitive: return _self.remove(_aString);> }

}

HTMLBodyElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLButtonElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLCanvasElement! : [Object, EventTarget, Node, Element, HtmlElement] {

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

HTMLCollection! : [Object, HtmlCollection] {

}

HTMLDialogElement! : [Object, EventTarget, Node, Element, HtmlElement] {

	close { :self | <primitive: return _self.close();> }
	show { :self | <primitive: return _self.show();> }
	showModal { :self | <primitive: return _self.showModal();> }

}

HTMLDetailsElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLDivElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLDocument! : [Object, EventTarget, Node, Element, HtmlElement, Document] {

}

HTMLElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLHeadingElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLHtmlElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLImageElement! : [Object, EventTarget, Node, Element, HtmlElement] {

	alt { :self | <primitive: return _self.value;> }
	complete { :self | <primitive: return _self.complete;> } /* Read only */
	height { :self | <primitive: return _self.height;> }
	src { :self :url | <primitive: return _self.src = _url;> }
	src { :self | <primitive: return _self.src;> }
	width { :self | <primitive: return _self.width;> }
	x { :self | <primitive: return _self.x;> } /* Read only */
	y { :self | <primitive: return _self.y;> } /* Read only */

}

+SmallFloat {

	Image { :self :height |
		<primitive: return new Image(_self, _height);>
	}

}

HTMLInputElement! : [Object, EventTarget, Node, Element, HtmlElement] {

	selectionEnd { :self |
		<primitive: return _self.selectionEnd;>
	}

	selectionStart { :self |
		<primitive: return _self.selectionStart;>
	}

	setSelectionRange { :self :selectionStart :selectionEnd |
		<primitive: return _self.setSelectionRange(selectionStart, selectionEnd);>
	}

	type { :self |
		<primitive: return _self.type;>
	}

	value { :self :aValue |
		<primitive: return _self.value = _aValue;>
	}

	value { :self |
		<primitive: return _self.value;>
	}

}

HTMLLIElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLOptionsCollection! : [Object, HtmlCollection] {

}

HTMLOptionElement! : [Object, EventTarget, Node, Element, HtmlElement] {

	index { :self | <primitive: return _self.index;> }
	label { :self | <primitive: return _self.label;> }
	selected { :self | <primitive: return _self.selected;> }
	text { :self :aString | <primitive: return _self.text = _aString;> }
	text { :self | <primitive: return _self.text;> }
	value { :self :aString | <primitive: return _self.value = _aString;> }
	value { :self | <primitive: return _self.value;> }

}

HTMLParagraphElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLPreElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLSelectElement! : [Object, EventTarget, Node, Element, HtmlElement] {

	add { :self :item :before | <primitive: return _self.add(_item, _before);> }
	item { :self :anInteger | <primitive: return _self.item(_anInteger);> }
	labels { :self | <primitive: return _self.labels;> }
	length { :self :anInteger | <primitive: return _self.length = _anInteger;> }
	length { :self | <primitive: return _self.length;> }
	options { :self | <primitive: return _self.options;> }
	remove { :self :anInteger | <primitive: return _self.remove(_anInteger);> }
	selectedIndex { :self :anInteger | <primitive: return _self.selectedIndex = _anInteger;> }
	selectedIndex { :self | <primitive: return _self.selectedIndex;> }
	size { :self :anInteger | <primitive: return _self.size = _anInteger;> }
	size { :self | <primitive: return _self.size;> }
	type { :self | <primitive: return _self.type;> }

	deselect { :self |
		self.selectedIndex := -1
	}

	indexOf { :self :aString |
		aString.isEmpty.if {
			-1
		} {
			valueWithReturn { :return:/1 |
				0.toDo(self.length - 1) { :index |
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

HTMLSpanElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLTableElement! : [Object, EventTarget, Node, Element, HtmlElement] {

	caption { :self | <primitive: return _self.caption;> }
	rows { :self | <primitive: return _self.rows;> } /* Read only */

	asHtmlTable { :self |
		self
	}

}

+@Sequence {

	asHtmlRow { :self :toString:/1 |
		let tr = 'tr'.createElement;
		self.do { :cell |
			let td = 'td'.createElement;
			td.textContent(cell.toString);
			tr.appendChild(td)
		};
		tr
	}

	asHtmlTable { :self :toString:/1 |
		let table = 'table'.createElement;
		self.do { :row |
			table.appendChild(
				row.asHtmlRow(toString:/1)
			)
		};
		table
	}

	asHtmlTable { :self |
		self.asHtmlTable(asString:/1)
	}

}

+Association {

	asHtmlRow { :self :toString:/1 |
		self.asList.asHtmlRow(toString:/1)
	}

}

+@Dictionary {

	asHtmlTable { :self :toString:/1 |
		self.associations.asHtmlTable(toString:/1)
	}

}

HTMLTableCellElement! : [Object, EventTarget, Node, Element, HtmlElement] {

	cellIndex { :self | <primitive: return _self.cellIndex;> } /* Read only */

}

HTMLTableColElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLTableRowElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLTableSectionElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

HTMLTextAreaElement! : [Object, EventTarget, Node, Element, HtmlElement] {

	cols { :self :anInteger | <primitive: return _self.cols = _anInteger;> }
	cols { :self | <primitive: return _self.cols;> }
	readOnly { :self :aBoolean | <primitive: return _self.readOnly = _aBoolean;> }
	readOnly { :self | <primitive: return _self.readOnly;> }
	rows { :self :anInteger | <primitive: return _self.rows = _anInteger;> }
	rows { :self | <primitive: return _self.rows;> }
	selectionEnd { :self | <primitive: return _self.selectionEnd;> }
	selectionStart { :self | <primitive: return _self.selectionStart;> }
	setRangeText { :self :replacement :startSelection :endSelection :selectMode | <primitive: return _self.setRangeText(_replacement, _startSelection, _endSelection, _selectMode);> }
	setSelectionRange { :self :i :j | <primitive: return _self.setSelectionRange(_i, _j);> }
	type { :self | <primitive: return _self.type;> }
	value { :self :aString | <primitive: return _self.value = _aString;> }
	value { :self | <primitive: return _self.value;> }

}

HTMLUListElement! : [Object, EventTarget, Node, Element, HtmlElement] {

}

ImageBitmap! : [Object] {

	close { :self | <primitive: return _self.close();> }
	height { :self | <primitive: return _self.height;> } /* Read only */
	width { :self | <primitive: return _self.width;> } /* Read only */

}

+[Blob, HTMLImageElement] {

	ImageBitmap { :self | <primitive: return createImageBitmap(_self);> }

}

ImageData! : [Object] {

	colorSpace { :self | <primitive: return _self.colorSpace;> } /* Read only */
	data { :self | <primitive: return _self.data;> } /* Read only */
	height { :self | <primitive: return _self.height;> } /* Read only */
	width { :self | <primitive: return _self.width;> } /* Read only */

}

KeyboardEvent! : [Object, UiEvent, Event] {

	ctrlKey { :self | <primitive: return _self.ctrlKey;> }
	key { :self | <primitive: return _self.key;> }
	shiftKey { :self | <primitive: return _self.shiftKey;> }

}

MediaSource! : [Object, EventTarget] {

}

MouseEvent! : [Object, UiEvent, Event, MouseEvent] {

}

NamedNodeMap! : [Object] {

	getNamedItem { :self :aString | <primitive: return _self.getNamedItem(aString);> }
	item { :self :anInteger | <primitive: return _self.item(_anInteger);> }
	length { :self | <primitive: return _self.length;> }

}

NodeList! : [Object] {

	item { :self :anInteger | <primitive: return _self.item(_anInteger);> }
	length { :self | <primitive: return _self.length;> }

	at { :self :anInteger |
		self.item(anInteger - 1) /* One-indexed */
	}

}

OffscreenCanvas! : [Object, EventTarget] {

	getContext { :self :contextType :contextAttributes |
		<primitive: return _self.getContext(_contextType, _contextAttributes);>
	}

}

OffscreenCanvasRenderingContext2D! : [Object] {

}

+SmallFloat {

	OffscreenCanvas { :self :height |
		<primitive: return new OffscreenCanvas(_self, _height);>
	}

}

Path2D! : [Object] {

}

PointerEvent! : [Object, UiEvent, Event, MouseEvent] {

	isPrimary { :self | <primitive: return _self.isPrimary;> }
	pointerId { :self | <primitive: return _self.pointerId;> }
	pointerPressure { :self | <primitive: return _self.pointerPressure;> }
	pointerType { :self | <primitive: return _self.pointerType;> }

}

Selection! : [Object] {

	anchorNode { :self | <primitive: return _self.anchorNode;> }
	anchorOffset { :self | <primitive: return _self.anchorOffset + 1;> } /* One-indexed */
	collapse { :self :node :offset | <primitive: return _self.collapse(_node, _offset);> }
	collapseToEnd { :self | <primitive: return _self.collapseToEnd();> }
	collapseToStart { :self | <primitive: return _self.collapseToStart();> }
	containsNode{ :self :node :partialContainment | <primitive: return _self.containsNode(_node, _partialContainment);> }
	focusNode { :self | <primitive: return _self.focusNode;> }
	focusOffset { :self | <primitive: return _self.focusOffset + 1;> } /* One-indexed */
	getRangeAt { :self :anInteger | <primitive: return _self.getRangeAt(_anInteger - 1);> } /* One-indexed */
	rangeCount { :self | <primitive: return _self.rangeCount;> } /* Read only */
	removeAllRanges { :self | <primitive: return _self.removeAllRanges();> }
	toString { :self | <primitive: return _self.toString();> }
	type { :self | <primitive: return _self.type;> }

	isCaret { :self |
		self.type = 'Caret'
	}

	isRange { :self |
		self.type = 'Range'
	}

	range { :self |
		(self.rangeCount = 1).if {
			self.getRangeAt(1)
		} {
			self.error('Selection>>range: more than one range')
		}
	}

}

Text! : [Object, EventTarget, Node, CharacterData] {

	wholeText { :self | <primitive: return _self.wholeText;> }

}

+Window {

	document { :self | <primitive: return _self.document;> }
	getComputedStyle { :self :element | <primitive: return _self.getComputedStyle(_element);> }
	getSelection { :self | <primitive: return _self.getSelection();> }
	innerHeight { :self | <primitive: return _self.innerHeight;> }
	innerWidth { :self | <primitive: return _self.innerWidth;> }

}

+[HTMLDocument, Window] {

	caretIsInTextAreaElement { :self |
		self.selection.range.isInTextAreaElement
	}

	caretIsInTextNode { :self |
		self.selection.range.startContainer.isText
	}

	insertStringAtCaret { :self :aString |
		self.selection.range.insertNode(
			self.document.createTextNode(
				aString
			)
		)
	}

	paragraphAtCaret { :self |
		let range = self.selection.range;
		range.isInTextAreaElement.if {
			let textArea = range.startContainer.childNodes[range.startOffset];
			textArea.value.paragraphAtIndex(textArea.selectionStart)
		} {
			range.startContainer.isText.if {
				range.startContainer.nodeValue.paragraphAtIndex(range.startOffset)
			} {
				'not yet...'.error
			}
		}
	}

	selectedText { :self |
		<primitive: return _self.getSelection().toString();>
	}

	selectedTextOrWordAtCaret { :self |
		let text = self.selectedText;
		text.isEmpty.if {
			self.wordAtCaret
		} {
			text
		}
	}

	selection { :self |
		<primitive: return _self.getSelection();>
	}

	wordAtCaret { :self |
		let selection = self.selection;
		let text = selection.focusNode.textContent;
		let index = selection.focusOffset;
		text.wordAtIndex(index)
	}

}

WebGLRenderingContext! : [Object] {

}

XMLDocument! : [Object, EventTarget, Node, Document] {

}
