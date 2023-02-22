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

(*
	++ { :self :anArray |
		self.append(anArray)
	}

	at { :self :key |
		self.getAttribute(key)
	}

	atPut { :self :key :value |
		self.setAttribute(key, value)
	}
*)

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

+ String {


	createElement { :self |
		system.window.document.createElement(self)
	}

	getElementById { :self |
		system.window.document.getElementById(self)
	}

	querySelector { :self |
		system.window.document.querySelector(self)
	}

}
