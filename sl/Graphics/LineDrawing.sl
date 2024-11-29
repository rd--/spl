/* Requires: Svg */

LineDrawing : [Object] { | contents |

	asSvg { :self |
		let boundingBox = self.contents.collect(boundingBox:/1).rectangleMerging;
		let viewBox = boundingBox.svgViewBox(5);
		let nameSpace = 'http://www.w3.org/2000/svg';
		let beginSvg = '<svg xmlns="%" width="%" height="%" viewBox="%">'.format([
			nameSpace width height viewBox
		]);
		let beginGroup = '<g fill="none" stroke="black" transform="translate(0, %) scale(1, -1)">'.format([
			boundingBox.height + (2 * boundingBox.lowerLeft.y)
		]);
		let items = self.contents.collect(asSvg:/1);
		[beginSvg, beginGroup, items, '</g>', '</svg>'].unlines
	}

}

+List {

	LineDrawing { :self |
		newLineDrawing.initializeSlots(self)
	}

}
