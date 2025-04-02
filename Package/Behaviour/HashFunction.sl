+String {

	hash { :self :seed |
		self.murmurHashGenerator(seed).value
	}

	hash { :self |
		self.hash(2166136261)
	}

	murmurHashGenerator { :self :seed |
		<primitive:
		let h = _seed >>> 0;
		const key = _self;
		const len = key.length;
		const c1 = 0xcc9e2d51; /* 0xcc9e2d51 === 3432918353 */
		const c2 = 0x1b873593; /* 0x1b873593 ===  461845907 */
		const r1 = 15;
		const r2 = 13;
		const m = 5;
		const n = 0xe6546b64; /* 0xe6546b64 === 3864292196 */
		for (let i = 0; i < len; i++) {
			let k = key.charCodeAt(i);
			k = Math.imul(k, c1);
			k = k << r1 | k >>> 17;
			k = Math.imul(k, c2);
			h ^= k;
			h = h << r2 | h >>> 19;
			h = Math.imul(h, m) + n | 0;
		}
		h ^= len;
		return function () {
			h ^= h >>> 16;
			h = Math.imul(h, 0x85ebca6b); /* 0x85ebca6b === 2246822507 */
			h ^= h >>> 13;
			h = Math.imul(h, 0xc2b2ae35); /* 0xc2b2ae35 === 3266489909 */
			h ^= h >>> 16;
			return h >>> 0;
		};
		>
	}

}
