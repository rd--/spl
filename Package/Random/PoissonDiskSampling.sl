+@RandomNumberGenerator {

	poissonDiskSampling { :self :shape :radius :tries |
		<primitive:
		/* https://github.com/kchapelier/fast-2d-poisson-disk-sampling/ */
		let shape = _shape;
		let radius = _radius;
		let tries = _tries;
		let rng = function() {
			return _nextRandomFloat_1(_self);
		};
		let piDiv3 = Math.PI / 3;
		let neighbourhood = [
			[ 0, 0 ],   [ 0, -1 ],  [ -1, 0 ],
			[ 1, 0 ],   [ 0, 1 ],   [ -1, -1 ],
			[ 1, -1 ],  [ -1, 1 ],  [ 1, 1 ],
			[ 0, -2 ],  [ -2, 0 ],  [ 2, 0 ],
			[ 0, 2 ],   [ -1, -2 ], [ 1, -2 ],
			[ -2, -1 ], [ 2, -1 ],  [ -2, 1 ],
			[ 2, 1 ],   [ -1, 2 ],  [ 1, 2 ]
		];
		let neighbourhoodLength = neighbourhood.length;
		let width = shape[0];
		let height = shape[1];
		let maxTries = Math.max(3, Math.ceil(tries));
		let floatPrecisionMitigation = Math.max(1, Math.max(width, height) / 64 | 0);
		let epsilonRadius = 1e-14 * floatPrecisionMitigation;
		let epsilonAngle = 2e-14;
		let squareRadius = radius * radius;
		let radiusPlusEpsilon = radius + epsilonRadius;
		let cellSize = radius * Math.SQRT1_2;
		let angleIncrement = Math.PI * 2 / maxTries;
		let angleIncrementOnSuccess = piDiv3 + epsilonAngle;
		let triesIncrementOnSuccess = Math.ceil(angleIncrementOnSuccess / angleIncrement);
		let processList = [];
		let samplePoints = [];
		let gridShape = [
			Math.ceil(width / cellSize),
			Math.ceil(height / cellSize)
		];
		let strideX = gridShape[1];
		let grid = new Uint32Array(gridShape[0] * gridShape[1]);
		let addRandomPoint = function () {
			return directAddPoint([
				rng() * width,
				rng() * height,
				rng() * Math.PI * 2,
				0
			]);
		};
		let directAddPoint = function (point) {
			let coordsOnly = [point[0], point[1]];
			processList.push(point);
			samplePoints.push(coordsOnly);
			let internalArrayIndex = ((point[0] / cellSize) | 0) * strideX + ((point[1] / cellSize) | 0);
			grid[internalArrayIndex] = samplePoints.length;
			return coordsOnly;
		};
		let inNeighbourhood = function (point) {
			let boundX = gridShape[0];
			let boundY = gridShape[1];
			let cellX = point[0] / cellSize | 0;
			let cellY = point[1] / cellSize | 0;
			for (let neighbourIndex = 0; neighbourIndex < neighbourhoodLength; neighbourIndex++) {
				let currentDimensionX = cellX + neighbourhood[neighbourIndex][0];
				let currentDimensionY = cellY + neighbourhood[neighbourIndex][1];
				let internalArrayIndex = (
					currentDimensionX < 0 || currentDimensionY < 0 || currentDimensionX >= boundX || currentDimensionY >= boundY ?
					-1 :
					currentDimensionX * strideX + currentDimensionY
				);
				if (internalArrayIndex !== -1 && grid[internalArrayIndex] !== 0) {
					let existingPoint = samplePoints[grid[internalArrayIndex] - 1];
					if (Math.pow(point[0] - existingPoint[0], 2) + Math.pow(point[1] - existingPoint[1], 2) < squareRadius) {
						return true;
					}
				}
			}
			return false;
		};
		let next = function () {
			while (processList.length > 0) {
				let index = processList.length * rng() | 0;
				let currentPoint = processList[index];
				let currentAngle = currentPoint[2];
				let tries = currentPoint[3];
				if (tries === 0) {
					currentAngle = currentAngle + (rng() - 0.5) * piDiv3 * 4;
				}
				for (; tries < maxTries; tries++) {
					let newPoint = [
						currentPoint[0] + Math.cos(currentAngle) * radiusPlusEpsilon,
						currentPoint[1] + Math.sin(currentAngle) * radiusPlusEpsilon,
						currentAngle,
						0
					];
					if (
						(newPoint[0] >= 0 && newPoint[0] < width) &&
						(newPoint[1] >= 0 && newPoint[1] < height) &&
						!inNeighbourhood(newPoint)
					) {
						currentPoint[2] = currentAngle + angleIncrementOnSuccess + rng() * angleIncrement;
						currentPoint[3] = tries + triesIncrementOnSuccess;
						return directAddPoint(newPoint);
					}
					currentAngle = currentAngle + angleIncrement;
				}
				if (tries >= maxTries) {
					const r = processList.pop();
					if (index < processList.length) {
						processList[index] = r;
					}
				}
			}
			return null;
		};
		if (samplePoints.length === 0) {
			addRandomPoint();
		}
		while(next()) {
			continue;
		}
		return samplePoints;
		>
	}

}
