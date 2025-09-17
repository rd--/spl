+ByteArray {

	basicDigest { :self :algorithm |
		<primitive: return crypto.subtle.digest(_algorithm, _self);>
	}

	digest { :self :algorithm |
		self.basicDigest(algorithm).then(asByteArray:/1)
	}

	hash { :self :seed |
		self.murmurHashGenerator(seed).value
	}

	hash { :self |
		self.hash(2166136261)
	}

	murmurHashGenerator { :self :seed |
		<primitive:
		let h = _seed >>> 0;
		function rotateLeft(n, r) {
			return (n << r) | (n >>> (32 - r));
		}
		function mix (h, k) {
			const c1 = 0xcc9e2d51; /* 0xcc9e2d51 === 3432918353 */
			const c2 = 0x1b873593; /* 0x1b873593 ===  461845907 */
			const r1 = 15; /* 32 - 15 === 17 */
			const r2 = 13; /* 32 - 13 === 19 */
			k = Math.imul(k, c1);
			k = rotateLeft(k, r1);
			k = Math.imul(k, c2);
			const m = 5;
			const n = 0xe6546b64; /* 0xe6546b64 === 3864292196 */
			h ^= k;
			h = rotateLeft(h, r2);
			h = Math.imul(h, m) + n;
			return h;
		}
		function fmix (h) {
			h ^= h >>> 16;
			h = Math.imul(h, 0x85ebca6b); /* 0x85ebca6b === 2246822507 */
			h ^= h >>> 13;
			h = Math.imul(h, 0xc2b2ae35); /* 0xc2b2ae35 === 3266489909 */
			h ^= h >>> 16;
			return h;
		};
		const key = _self;
		const len = key.length;
		for (let i = 0; i < len; i++) {
			h = mix(h, key[i]) | 0;
		}
		h ^= len & 0xffffffff; /* 0xffffffff === 4294967295 */
		return function () {
			return fmix(h) >>> 0;
		};
		>
	}

}

+String {

	digest { :self :algorithm |
		self.utf8ByteArray.digest(algorithm).then(base16Encode:/1)
	}

	hash { :self :seed |
		self.murmurHashGenerator(seed).value
	}

	hash { :self |
		self.hash(2166136261)
	}

	murmurHashGenerator { :self :seed |
		self.utf8ByteArray.murmurHashGenerator(seed)
	}

}
