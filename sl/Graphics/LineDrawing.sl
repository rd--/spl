/* Requires: Svg */

LineDrawing : [Object] { | contents |

	asSvg { :self |
		let boundingBox = self.boundingBox.asRectangle;
		let nameSpace = 'http://www.w3.org/2000/svg';
		let beginSvg = '<svg xmlns="%" width="%" height="%" viewBox="%">'.format([
			nameSpace,
			boundingBox.width,
			boundingBox.height,
			boundingBox.asSvgViewBox(5)
		]);
		let beginGroup = '<g fill="none" stroke="black" transform="translate(0, %) scale(1, -1)">'.format([
			boundingBox.height + (2 * boundingBox.lowerLeft.y)
		]);
		let items = self.contents.collect(asSvg:/1);
		[beginSvg, beginGroup, items, '</g>', '</svg>'].flatten.unlines
	}

	boundingBox { :self |
		self.contents.collect(boundingBox:/1).boundingBoxMerging
	}

}

+List {

	LineDrawing { :self |
		newLineDrawing().initializeSlots(self)
	}

}
