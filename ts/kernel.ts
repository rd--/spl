import { PriorityQueue } from '../lib/flatqueue/PriorityQueue.js'
export { PriorityQueue } from '../lib/flatqueue/PriorityQueue.js'

import { MersenneTwister } from '../lib/mersenne-twister/src/index.ts'

import { throwError } from '../lib/jssc3/ts/kernel/error.ts'

import * as evaluate from './evaluate.ts'
import { isOperatorName, operatorMethodName } from './operator.ts'
import { slOptions } from './options.ts'

type Arity = number;
type PackageName = string;
type TypeName = string;
type TraitName = string;
type MethodName = string;
type QualifiedMethodName = string; // i.e. MethodName:/Arity
type MethodSourceCode = string;
type MethodOrigin = Trait | Type;

type SlObject = object & {_type: TypeName};

type QualifiedMethodDictionary = Map<QualifiedMethodName, Method>
type TraitDictionary = Map<TraitName, Trait>;
type TypeDictionary = Map<TypeName, Type>;

type ByTypeMethodDictionary = Map<TypeName, Method>;
type ByArityMethodDictionary = Map<Arity, ByTypeMethodDictionary>;
type MethodDictionary = Map<MethodName, ByArityMethodDictionary>

function isRecord(anObject: SlObject): boolean {
	// console.debug(`isRecord: ${anObject}`);
	const c = anObject.constructor;
	return c === undefined || c.name === 'Object';
}

function objectType(anObject: SlObject): TypeName {
	return anObject instanceof Array ? 'Array' :
		(anObject instanceof Map ? 'Map' :
		 (anObject instanceof Set ? 'Set' :
		  (anObject instanceof Promise ? 'Promise' :
		   (anObject instanceof PriorityQueue ? 'PriorityQueue' :
		    (anObject instanceof Uint8Array ? 'ByteArray' :
		     (anObject instanceof Float64Array ? 'Float64Array' :
		      (anObject instanceof Error ? 'Error' :
		       (anObject instanceof WeakMap ? 'WeakMap' :
		        (anObject._type ||
		         (isRecord(anObject) ? 'Record' : anObject.constructor.name))))))))));
}

/* This runs slower than the form above, is .constructor.name slow?
function objectType(anObject: SlObject): TypeName {
	return anObject instanceof Uint8Array ? 'ByteArray' :
		(anObject._type ||
			(isRecord(anObject) ? 'Record' : anObject.constructor.name));
}
*/

export function typeOf(anObject: unknown): TypeName {
	if(anObject === null || anObject === undefined) {
		return 'Nil';
	} else {
		switch (typeof anObject) {
		case 'boolean': return 'Boolean';
		case 'function': return 'Procedure';
		case 'number': return 'SmallFloat';
		case 'bigint': return 'LargeInteger';
		case 'string': return 'String';
		case 'object': return objectType(<SlObject>anObject);
		default: throwError(`typeOf: unknown type: ${anObject}`); return 'Unknown';
		}
	}
}

export function isArray<T>(anObject: unknown): anObject is Array<T> { return Array.isArray(anObject); }
export function isByteArray(anObject: unknown): anObject is Uint8Array { return anObject instanceof Uint8Array; }
export function isFunction(anObject: unknown): anObject is Function { return anObject instanceof Function; }
export function isSmallFloat(anObject: unknown): anObject is number { return typeof anObject === 'number'; }
export function isLargeInteger(anObject: unknown): anObject is bigint { return typeof anObject === 'bigint'; }
export function isSet<T>(anObject: unknown): anObject is Set<T> { return anObject instanceof Set; }
export function isString(anObject: unknown): anObject is string { return typeof anObject === 'string'; }

export function isSmallFloatInteger(anObject: unknown): anObject is number {
	return isSmallFloat(anObject) && Number.isInteger(anObject)
}

export function isByte(anObject: unknown): boolean {
	return isSmallFloatInteger(anObject) && anObject >= 0 && anObject < 256;
}

// Unsigned 32-bit? 2^31=2147483648 2^32=4294967296
export function isBitwise(anObject: unknown): boolean {
	return isSmallFloatInteger(anObject) && (anObject >= -2147483648) && (anObject <= 2147483647);
}

export class MethodInformation {
	name: MethodName;
	packageName: PackageName;
	arity: Arity;
	sourceCode: MethodSourceCode;
	origin: MethodOrigin;
	constructor(name: MethodName, packageName: PackageName, arity: Arity, sourceCode: MethodSourceCode, origin: MethodOrigin) {
		this.name = name;
		this.packageName = packageName;
		this.arity = arity;
		this.sourceCode = sourceCode;
		this.origin = origin;
	}
	qualifiedName() {
		// console.debug(`MethodInformation>>qualifiedName: ${this.name}, ${this.arity}`);
		return `${this.name}:/${this.arity}`;
	}
}

export class Method {
	procedure: Function;
	information: MethodInformation;
	constructor(procedure: Function, information: MethodInformation) {
		this.procedure = procedure;
		this.information = information;
	}
	qualifiedName() {
		return this.information.qualifiedName();
	}
}

export class Trait {
	name: TraitName;
	packageName: PackageName;
	methodDictionary: QualifiedMethodDictionary;
	constructor(name: TraitName, packageName: PackageName) {
		this.name = name;
		this.packageName = packageName;
		this.methodDictionary = new Map();
	}
}

export class Type {
	name: TypeName;
	packageName: PackageName;
	traitNameArray: TraitName[];
	slotNameArray: string[];
	methodDictionary: QualifiedMethodDictionary;
	constructor(name: TypeName, packageName: PackageName, traitNameArray: TraitName[], slotNameArray: string[], methodDictionary: QualifiedMethodDictionary) {
		this.name = name;
		this.packageName = packageName;
		this.traitNameArray = traitNameArray;
		this.slotNameArray = slotNameArray;
		this.methodDictionary = methodDictionary;
	}
}

/* Note: "package" is a reserved word
c.f. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar */
export class Package {
	category: string;
	name: string;
	requires: string[];
	url: string;
	text: string;
	isLoaded: boolean;
	constructor(category: string, name: string, requires: string[], url: string, text: string, isLoaded: boolean) {
		this.category = category;
		this.name = name;
		this.requires = requires;
		this.url = url;
		this.text = text;
		this.isLoaded = isLoaded;
	}
}

export function parsePackageRequires(text: string): string[] {
	var firstLine = text.split('\n', 1)[0];
	var packageNames = firstLine.match(/Requires: (.*)\*\)/);
	if(packageNames) {
		return packageNames[1].trim().split(' ');
	} {
		return [];
	}
}

export function evaluatePackage(pkg: Package) {
	// console.debug(`evaluatePackage: ${pkg.name}, ${pkg.text}`);
	return evaluate.evaluateFor(pkg.name, pkg.text);
}

export async function evaluatePackageArrayInSequence(pkgArray: Package[]) {
	// console.debug(`evaluatePackageArrayInSequence: '${pkgArray}'`);
	for(let pkg of pkgArray) {
		await evaluatePackage(pkg);
	}
}

// required if methods are added before type definition, this should be cleared up
const preinstalledTypes = ['Array', 'SmallFloat', 'String', 'Void'];

export class System {
	methodDictionary: MethodDictionary;
	traitDictionary: Map<TraitName, Trait>;
	typeDictionary: Map<TypeName, Type>;
	packageDictionary: Map<PackageName, Package>;
	window: Window;
	cache: Map<string, unknown>;
	constructor() {
		this.methodDictionary = new Map();
		this.traitDictionary = new Map();
		// Void is not an ordinary type, it names the place in the method table for no-argument procedures.
		this.typeDictionary = new Map(preinstalledTypes.map(function(each) { return [each, new Type(each, 'Kernel', [], [], new Map())]; }));
		this.window = window;
		this.packageDictionary = new Map();
		this.cache = new Map();
	}
}

export const system: System = new System();

function traitExists(traitName: TraitName): boolean {
	return system.traitDictionary.has(traitName);
}

function typeExists(typeName: TypeName): boolean {
	return system.typeDictionary.has(typeName);
}

function methodExists(methodName: MethodName): boolean {
	return system.methodDictionary.has(methodName);
}

export function addTrait(traitName: TraitName, packageName: PackageName): void {
	if(traitExists(traitName)) {
		throw(`addTrait: trait exists: ${traitName}`);
	} else {
		system.traitDictionary.set(traitName, new Trait(traitName, packageName));
	}
}

// c.f. rewrite/makeMethodList
export function addTraitMethod(traitName: TraitName, packageName: PackageName, methodName: MethodName, arity: Arity, procedure: Function, sourceCode: MethodSourceCode): Method {
	// console.debug(`addTraitMethod: ${traitName}, ${packageName}, ${methodName}, ${arity}`);
	if(traitExists(traitName)) {
		const trait = system.traitDictionary.get(traitName)!;
		const method = new Method(procedure, new MethodInformation(methodName, packageName, arity, sourceCode, trait));
		trait.methodDictionary.set(method.qualifiedName(), method);
		return method;
	} else {
		throw(`addTraitMethod: trait does not exist: ${traitName}, ${methodName}, ${arity}`);
	}
}

export function copyTraitToType(traitName: TraitName, typeName: TypeName): void {
	if(traitExists(traitName) && typeExists(typeName)) {
		const methodDictionary = system.traitDictionary.get(traitName)!.methodDictionary;
		for (const [name, method] of methodDictionary) {
			// console.debug(`copyTraitToType: ${traitName}, ${typeName}, ${name}, ${method.information.arity}`);
			addMethodFor(typeName, method, true);
		}
	} else {
		throw(`copyTraitToType: trait or type does not exist: ${traitName}, ${typeName}`);
	}
}

export function traitTypeArray(traitName: TraitName): TypeName[] {
	const answer = [];
	for (const [typeName, typeValue] of system.typeDictionary) {
		if(typeValue.traitNameArray.includes(traitName)) {
			answer.push(typeName);
		}
	}
	return answer;
}

// c.f. rewrite/makeMethodList
export function extendTraitWithMethod(traitName: TraitName, packageName: PackageName, name: MethodName, arity: Arity, procedure: Function, sourceCode: MethodSourceCode): Method {
	if(traitExists(traitName)) {
		const method = addTraitMethod(traitName, packageName, name, arity, procedure, sourceCode);
		traitTypeArray(traitName).forEach(function(typeName) {
			addMethodFor(typeName, method, true);
		});
		return method;
	} else {
		throw(`extendTraitWithMethod: trait does not exist: ${traitName}, ${name}`);
	}
}

export function lookupGeneric(methodName: MethodName, methodArity: Arity, receiverType: TypeName): Method {
	return system.methodDictionary.get(methodName)!.get(methodArity)!.get(receiverType)!;
}

export function nameWithoutArity(methodName: MethodName) {
	return methodName.split(':')[0];
}

export function applyGenericAt(methodName: MethodName, parameterArray: unknown[], receiverType: TypeName) {
	// console.log(`applyGenericAt: ${methodName}, ${parameterArray.length}, ${receiverType}`);
	const method = lookupGeneric(methodName, parameterArray.length, receiverType);
	return method.procedure.apply(null, parameterArray)
}

export function dispatchByType(name: string, arity: number, typeTable: ByTypeMethodDictionary, parameterArray: unknown[]) {
	if(arity === 0) {
		const method = typeTable.get('Void');
		if(method) {
			return method.procedure.apply(null, [])
		} else {
			return throwError(`dispatchByType: no zero arity method: ${name}`);
		}
	} else {
		const receiver = parameterArray[0];
		const receiverType = typeOf(receiver);
		const typeMethod = typeTable.get(receiverType);
		if(typeMethod) {
			// console.debug(`dispatchByType: name=${name}, arity=${arity}, type=${receiverType}`);
			return typeMethod.procedure.apply(null, parameterArray)
		} else {
			return throwError(`dispatchByType: no method ${name}:/${arity} for ${receiverType}`);
		}
	}
}

export function dispatchByArity(name: string, arity: number, arityTable: ByArityMethodDictionary, parameterArray: unknown[]) {
	const typeTable = arityTable.get(arity);
	if(typeTable) {
		return dispatchByType(name, arity, typeTable, parameterArray);
	} else {
		return throwError(`dispatchbyArity: no entry for arity: name=${name}, arity=${arity}`);
	}
}

declare var globalThis: { [key: string]: unknown };

export function addMethodFor(typeName: TypeName, method: Method, requireTypeExists: boolean): Method {
	if(requireTypeExists && !typeExists(typeName)) {
		throw(`addMethodFor: type does not exist: ${typeName} (${method})`);
	}
	// console.debug(`addMethodFor: ${typeName}, ${method.qualifiedName()}`);
	if(!methodExists(method.information.name)) {
		// console.debug(`addMethodFor: new method name`);
		system.methodDictionary.set(method.information.name, new Map());
		if(slOptions.simpleArityModel) {
			const prefixedName = '_' + method.information.name;
			let globalFunction = globalThis[prefixedName];
			if(globalFunction === undefined) {
				globalFunction = globalThis[prefixedName] = function(...argumentsArray: unknown[]) {
					// console.debug(`dispatchByArity: ${method.qualifiedName()}, ${JSON.stringify(argumentsArray)}`);
					return dispatchByArity(method.information.name, argumentsArray.length, arityTable, argumentsArray);
				};
				Object.defineProperty(globalFunction, "name", { value: method.information.name });
				Object.defineProperty(globalFunction, "hasRestParameters", { value: true });
			}
		}
	}
	let arityTable = system.methodDictionary.get(method.information.name)!;
	if(!arityTable.has(method.information.arity)) {
		// console.debug(`addMethodFor: new method arity`);
		arityTable.set(method.information.arity, new Map());
		if(!slOptions.simpleArityModel) {
			const prefixedNameWithArity = `_${method.information.name}_${method.information.arity}`;
			// console.debug(`addMethodFor: generate global: ${prefixedNameWithArity}`);
			let globalFunctionWithArity = globalThis[prefixedNameWithArity];
			if(globalFunctionWithArity === undefined) {
				const typeTable = arityTable.get(method.information.arity)!;
				globalFunctionWithArity = globalThis[prefixedNameWithArity] = function(...argumentsArray: unknown[]) {
					// console.debug(`dispatchByType: ${method.qualifiedName()}, ${JSON.stringify(argumentsArray)}`);
					return dispatchByType(method.information.name, method.information.arity, typeTable, argumentsArray);
				};
				Object.defineProperty(globalFunctionWithArity, "name", { value: method.qualifiedName() });
				Object.defineProperty(globalFunctionWithArity, "length", { value: method.information.arity }); // c.f. makeCheckedAritySpecificFunction
			}
		}
	}
	const existingEntry = arityTable.get(method.information.arity)!.get(typeName);
	// Todo: this is not a correct test, it needs to not over-write less specific traits as well... it works for stdlib...
	if(existingEntry && existingEntry.information.origin.name === typeName && method.information.origin.name !== typeName) {
		// console.debug('addMethodFor: existing more specific entry');
	} else {
		arityTable.get(method.information.arity)!.set(typeName, method);
	}
	if(typeName === method.information.origin.name) {
		system.typeDictionary.get(typeName)!.methodDictionary.set(method.qualifiedName(), method);
	}
	return method;
}

// Is type of type (i.e. meta-type)
function isTypeType(typeName: TypeName):boolean {
	return typeName.endsWith('^')
}

// c.f. rewrite/makeMethodList
export function addMethod(typeName: TypeName, packageName: PackageName, methodName: MethodName, arity: Arity, procedure: Function, sourceCode: MethodSourceCode): Method {
	// console.debug(`addMethod: ${typeName}, ${packageName}, ${methodName}, ${arity}`);
	const isMeta = isTypeType(typeName);
	if(isMeta && !typeExists(typeName)) {
		// Lazily add meta-type entries as required
		system.typeDictionary.set(typeName, new Type(typeName, 'Kernel-System-Meta', ['Object'], [], new Map()));
	}
	if(typeExists(typeName)) {
		const typeValue = system.typeDictionary.get(typeName)!;
		const method = new Method(procedure, new MethodInformation(methodName, packageName, arity, sourceCode, typeValue));
		return addMethodFor(typeName, method, slOptions.requireTypeExists);
	} else {
		throw(`addMethod: type does not exist: ${typeName}, ${methodName}, ${arity}`);
	}
}

// Allows methods to be added to 'pre-installed' types before the type is added, c.f. load &etc. (& parseInteger ...).
// It'd be possible to only allow this for the 'pre-installed' methods, which might be saner.
// Run for built-in types, which may have traits.  Assumes non-kernel types have at least one slot.
export function addType(isHostType: boolean, typeName: TypeName, packageName: PackageName, traitList: TraitName[], slotNames: string[]): void {
	if(!typeExists(typeName) || preinstalledTypes.includes(typeName)) {
		const initializeSlots = slotNames.map(each => `anInstance.${each} = ${each}`).join('; ');
		const nilSlots = slotNames.map(each => `${each}: null`).join(', ');
		const defNilType = isHostType ? '' : `addMethod('Void', '${packageName}', 'new${typeName}', 0, function() { return {_type: '${typeName}', ${nilSlots} }; }, '<primitive: constructor>')`;
		const defInitializeSlots = isHostType ? '' : `addMethod('${typeName}', '${packageName}', 'initializeSlots', ${slotNames.length + 1}, function(anInstance, ${slotNames.join(', ')}) { ${initializeSlots}; return anInstance; }, '<primitive: initializer>')`;
		const defPredicateFalse = `extendTraitWithMethod('Object', '${packageName}', 'is${typeName}', 1, function(anObject) { return false; }, '<primitive: predicate>')`;
		const defPredicateTrue = `addMethod('${typeName}', '${packageName}', 'is${typeName}', 1, function(anInstance) { return true; }, '<primitive: predicate>')`;
		const defSlotAccess = slotNames.map(each => `addMethod('${typeName}', '${packageName}', '${each}', 1, function(anInstance) { return anInstance.${each} }, '<primitive: accessor>');`).join('; ');
		const defSlotMutate = slotNames.map(each => `addMethod('${typeName}', '${packageName}', '${each}', 2, function(anInstance, anObject) { anInstance.${each} = anObject; return anObject; }, '<primitive: mutator>');`).join('; ');
		// console.debug(`addType: ${typeName}, ${packageName}, ${slotNames}`);
		const methodDictionary = typeExists(typeName) ? system.typeDictionary.get(typeName)!.methodDictionary : new Map();
		system.typeDictionary.set(typeName, new Type(typeName, packageName, traitList, slotNames, methodDictionary));
		eval(defNilType);
		eval(defInitializeSlots);
		eval(defPredicateFalse);
		eval(defPredicateTrue);
		eval(defSlotAccess);
		eval(defSlotMutate);
	} else {
		throw(`addType: type exists: ${typeName}`);
	}
}

// Until the <primitive:> parser allows escaped >...
export function shiftRight(lhs: number, rhs: number): number {
	return lhs >> rhs;
}

export function methodName(name: string): MethodName {
	return isOperatorName(name) ? operatorMethodName(name) : name;
}

/* spl = one-indexed.  The index is not decremented because in Js '1' - 1 is 0 &etc. */
export function arrayCheckIndex(anArray: unknown[], anInteger: number | bigint): boolean {
	return isSmallFloatInteger(anInteger) && (anInteger >= 1) && (anInteger <= anArray.length);
}

export async function initializeLocalPackages(qualifiedPackageNames: string[]): Promise<Package[]> {
	const packageArray = [];
	qualifiedPackageNames.forEach(qualifiedName => {
		const parts = qualifiedName.split('-');
		const category = parts[0];
		const name = parts[1];
		const url = category + '/' + name + '.sl';
		const pkg = new Package(category, name, null, url, null, false); /* note: requires and text are set after fetch */
		/* add to dictionary (initialized & fetched, not loaded) */
		system.packageDictionary.set(name, pkg);
		packageArray.push(pkg);
	});
	return packageArray;
}

/* Evaluate already fetched packages in sequence. */
export async function loadPackageSequence(packageNames: string[]): Promise<void> {
	// console.debug(`loadPackageSequence: '${packageNames}'`);
	const packageArray = [];
	packageNames.forEach(name => {
		const pkg = system.packageDictionary.get(name);
		if(!pkg) {
			console.error(`loadPackageSequence: no such package: ${name}, ${pkg}`);
		} {
			pkg.isLoaded = true;
			packageArray.push(pkg);
		}
	});
	await evaluatePackageArrayInSequence(packageArray);
}

/* https://github.com/Aisse-258/bigint-isqrt */
export function bigIntSqrt(anInteger: bigint): bigint {
	if(anInteger < 2n) {
		return anInteger;
	}
	if(anInteger < 16n) {
		return BigInt(Math.sqrt(Number(anInteger))|0);
	}
	let x0, x1;
	if(anInteger < 4503599627370496n) {
		x1 = BigInt(Math.sqrt(Number(anInteger))|0)-3n;
	} else {
		let vlen = anInteger.toString().length;
		if(!(vlen&1)) {
			x1 = 10n**(BigInt(vlen/2));
		} else {
			x1 = 4n*10n**(BigInt((vlen/2)|0));
		}
	}
	do {
		x0 = x1;
		x1 = ((anInteger / x0) + x0) >> 1n;
	} while((x0 !== x1 && x0 !== (x1 - 1n)));
	return x0;
}

declare global {
	var _system: System;
	var _workspace: Map<string,unknown>;
}

export function assignGlobals() {
	globalThis._system = system;
	globalThis._workspace = new Map();
}

/* https://github.com/bryc/code/blob/master/jshash/PRNGs.md */
export function sfc32Generator(a: number, b: number, c: number, d: number) {
	return function() {
		a |= 0; b |= 0; c |= 0; d |= 0;
		var t = (a + b | 0) + d | 0;
		d = d + 1 | 0;
		a = b ^ b >>> 9;
		b = c + (c << 3) | 0;
		c = c << 21 | c >>> 11;
		c = c + t | 0;
		return (t >>> 0) / 4294967296;
    }
}

export function splitMix32Generator(a: number) {
	return function() {
		a |= 0; a = a + 0x9e3779b9 | 0;
		var t = a ^ a >>> 15; t = Math.imul(t, 0x85ebca6b);
        t = t ^ t >>> 13; t = Math.imul(t, 0xc2b2ae35);
		return ((t = t ^ t >>> 16) >>> 0) / 4294967296;
    }
}

export function mersenneTwister53Generator(seed: number) {
	var mt = new MersenneTwister(seed);
	return function () {
		return mt.genrand_res53();
	}
}

export function murmur3Generator(str: string, seed: number) {
	var h = seed >>> 0; /* h = 2166136261 >>> 0 */
	for(var k, i = 0; i < str.length; i++) {
		k = Math.imul(str.charCodeAt(i), 3432918353); k = k << 15 | k >>> 17; /* 0xcc9e2d51 */
		h ^= Math.imul(k, 461845907); h = h << 13 | h >>> 19; /* 0x1b873593 */
		h = Math.imul(h, 5) + 3864292196 | 0; /* 0xe6546b64 */
	}
	h ^= str.length;
	return function() {
		h ^= h >>> 16; h = Math.imul(h, 2246822507); /* 0x85ebcab6 */
		h ^= h >>> 13; h = Math.imul(h, 3266489909); /* 0xc2b2ae35 */
		h ^= h >>> 16;
		return h >>> 0;
	}
}
