{- Requires: Dom EventTarget Rectangle -}

+@Document {

	createSvgElement { :self :tagName |
		self.createElementNS('http://www.w3.org/2000/svg', tagName)
	}

	createSvgElement { :self :tagName :attributeDictionary |
		let element = self.createSvgElement(tagName);
		element.setAttributesNS(nil, attributeDictionary);
		element
	}

}

+String {

	createSvgElement { :self :attributeDictionary |
		system.window.document.createSvgElement(self, attributeDictionary)
	}

	parseSvg { :self |
		DOMParser().parseFromString(self, 'image/svg+xml').documentElement
	}

}

@SVGElement {

	transform { :self |
		<primitive: return _self.transform;>
	}

	transform { :self :transformList |
		<primitive: return _self.transform = _transformList;>
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

SVGCircleElement! : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

}

SVGGElement! : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement] {

}

SVGLineElement! : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

	p2 { :self :aPoint |
		self.setAttribute('x2', aPoint.x);
		self.setAttribute('y2', aPoint.y)
	}

}

SVGPathElement! : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

}

SVGPointList! : [Object] {

	clear { :self | <primitive: return _self.clear();> }
	getItem { :self :index | <primitive: return _self.getItem(_index);> }
	length { :self | <primitive: return _self.length;> }
	numberOfItems { :self | <primitive: return _self.numberOfItems;> }

}

SVGPolygonElement! : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

	points { :self | <primitive: return _self.points;> }

}

SVGPolylineElement! : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

}

SVGRectElement! : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGGeometryElement] {

}

SVGSVGElement! : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement] {

	createSVGMatrix { :self | <primitive: return _self.createSVGMatrix();> }
	createSVGRect { :self | <primitive: return _self.createSVGRect();> }
	createSVGTransform { :self | <primitive: return _self.createSVGTransform();> }
	createSVGTransformFromMatrix { :self :aMatrix | <primitive: return _self.createSVGTransformFromMatrix(_aMatrix);> }

}

SVGTextElement! : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGTextContentElement, SVGTextPositioningElement] {

}

SVGTextPathElement! : [Object, EventTarget, Node, Element, SVGElement, SVGGraphicsElement, SVGTextContentElement] {

}

SVGTitleElement! : [Object, EventTarget, Node, Element, SVGElement] {

}

SVGTransform! : [Object] {

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

SVGTransformList! : [Object] {

	appendItem { :self :aTransform | <primitive: return _self.appendItem(_aTransform);> }
	getItem { :self :index | <primitive: return _self.getItem(_index);> }

}
