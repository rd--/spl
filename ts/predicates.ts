export function isArray<T>(anObject: unknown): anObject is Array<T> {
	return Array.isArray(anObject);
}

export function isByteArray(anObject: unknown): anObject is Uint8Array {
	return anObject instanceof Uint8Array;
}

export function isFunction(anObject: unknown): anObject is Function {
	return anObject instanceof Function;
}

export function isSmallFloat(anObject: unknown): anObject is number {
	return typeof anObject === 'number';
}

export function isLargeInteger(anObject: unknown): anObject is bigint {
	return typeof anObject === 'bigint';
}

export function isSet<T>(anObject: unknown): anObject is Set<T> {
	return anObject instanceof Set;
}

export function isString(anObject: unknown): anObject is string {
	return typeof anObject === 'string';
}

export function isSmallFloatInteger(anObject: unknown): anObject is number {
	return isSmallFloat(anObject) && Number.isInteger(anObject);
}

export function isByte(anObject: unknown): boolean {
	return isSmallFloatInteger(anObject) && anObject >= 0 && anObject < 256;
}

// Unsigned 32-bit? 2^31=2147483648 2^32=4294967296
export function isBitwise(anObject: unknown): boolean {
	return isSmallFloatInteger(anObject) && (anObject >= -2147483648) &&
		(anObject <= 2147483647);
}
