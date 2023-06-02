import { PriorityQueue } from '../lib/flatqueue/PriorityQueue.js'
export { PriorityQueue } from '../lib/flatqueue/PriorityQueue.js'

import { throwError } from '../lib/jssc3/ts/kernel/error.ts'

import { isOperatorName, operatorMethodName } from './operator.ts'
import { slOptions } from './options.ts'

type Arity = number;
type TypeName = string;
type TraitName = string;
type MethodName = string;
type CategoryName = string;
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

function isStringDictionary(anObject: SlObject): boolean {
	const c = anObject.constructor;
	return c === undefined || c.name === 'Object';
}

function objectType(anObject: SlObject): TypeName {
	return anObject instanceof Array ? 'Array' :
		(anObject instanceof Error ? 'Error' :
		 (anObject instanceof Map ? 'IdentityDictionary' :
		  (anObject instanceof Set ? 'IdentitySet' :
		   (anObject instanceof Uint8Array ? 'ByteArray' :
		    (anObject instanceof Float64Array ? 'Float64Array' :
		     (anObject instanceof Promise ? 'Promise' :
		      (anObject instanceof PriorityQueue ? 'PriorityQueue' :
		       (anObject._type ||
		        (isStringDictionary(anObject) ? 'StringDictionary' : anObject.constructor.name)))))))));
}

export function typeOf(anObject: unknown): TypeName {
	if(anObject === null || anObject === undefined) {
		return 'UndefinedObject';
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
export function isIdentitySet<T>(anObject: unknown): anObject is Set<T> { return anObject instanceof Set; }
export function isString(anObject: unknown): anObject is string { return typeof anObject === 'string'; }

export function isByte(anObject: unknown): boolean {
	return isSmallFloat(anObject) && Number.isInteger(anObject) && anObject >= 0 && anObject < 256;
}

export class Method {
	name: MethodName;
	procedure:  Function;
	arity: Arity;
	sourceCode: MethodSourceCode;
	origin: MethodOrigin;
	constructor(name: MethodName, procedure: Function, arity: Arity, sourceCode: MethodSourceCode, origin: MethodOrigin) {
		this.name = name;
		this.procedure = procedure;
		this.arity = arity;
		this.sourceCode = sourceCode;
		this.origin = origin;
	}
	qualifiedName() {
		return `${this.name}:/${this.arity}`;
	}
}

export class Trait {
	name: TraitName;
	methodDictionary: QualifiedMethodDictionary;
	constructor(name: TraitName) {
		this.name = name;
		this.methodDictionary = new Map();
	}
}

export class Type {
	name: TypeName;
	traitNameArray: TraitName[];
	slotNameArray: string[];
	methodDictionary: QualifiedMethodDictionary;
	constructor(name: TypeName, traitNameArray: TraitName[], slotNameArray: string[], methodDictionary: QualifiedMethodDictionary) {
		this.name = name;
		this.traitNameArray = traitNameArray;
		this.slotNameArray = slotNameArray;
		this.methodDictionary = methodDictionary;
	}
}

const preinstalledTypes = ['Array', 'SmallFloat', 'String', 'Void']; // required if methods are added before type definition

export class Transcript {
	entries: [string, string][];
	constructor() {
		this.entries = [];
	}
	error(text: string): void {
		this.entries.push(['error', text]);
		console.error(text);
	}
	clear(): void {
		this.entries = [];
		console.clear();
	}
	log(text: string): void {
		this.entries.push(['log', text]);
		console.log(text);
	}
	warn(text: string): void {
		this.entries.push(['warn', text]);
		console.warn(text);
	}
}

type LibraryItem = unknown;

export class System {
	methodDictionary: MethodDictionary;
	traitDictionary: Map<TraitName, Trait>;
	typeDictionary: Map<TypeName, Type>;
	categoryDictionary: Map<CategoryName, Set<string>>
	nextUniqueId: number;
	window: Window;
	library: Map<string, LibraryItem>;
	transcript: Transcript;
	constructor() {
		this.methodDictionary = new Map();
		this.traitDictionary = new Map();
		// Void is not an ordinary type, it names the place in the method table for no-argument procedures.
		this.typeDictionary = new Map(preinstalledTypes.map(function(each) { return [each, new Type(each, [], [], new Map())]; }));
		this.categoryDictionary = new Map();
		this.nextUniqueId = 1;
		this.window = window;
		this.library = new Map();
		this.transcript = new Transcript();
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

export function addTrait(traitName: TraitName): void {
	if(traitExists(traitName)) {
		throw(`addTrait: trait exists: ${traitName}`);
	} else {
		system.traitDictionary.set(traitName, new Trait(traitName));
	}
}

// c.f. rewrite/makeMethodList
export function addTraitMethod(traitName: TraitName, methodName: MethodName, arity: Arity, procedure: Function, sourceCode: MethodSourceCode): Method {
	if(traitExists(traitName)) {
		const trait = system.traitDictionary.get(traitName)!;
		const method = new Method(methodName, procedure, arity, sourceCode, trait);
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
			// console.debug(`copyTraitToType: ${traitName}, ${typeName}, ${name}, ${method.arity}`);
			addMethodFor(typeName, method);
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
export function extendTraitWithMethod(traitName: TraitName, name: MethodName, arity: Arity, procedure: Function, sourceCode: MethodSourceCode): Method {
	if(traitExists(traitName)) {
		const method = addTraitMethod(traitName, name, arity, procedure, sourceCode);
		traitTypeArray(traitName).forEach(function(typeName) {
			addMethodFor(typeName, method);
		});
		return method;
	} else {
		throw(`extendTraitWithMethod: ${traitName}, ${name}`);
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
			return throwError(`dispatchByType: no method for type: ${receiverType}; arity=${arity} name=${name}`);
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

export function addMethodFor(typeName: TypeName, method: Method): Method {
	if(slOptions.requireTypeExists && !typeExists(typeName)) {
		throw(`addMethodFor: type does not exist: ${typeName} (${method})`);
	}
	// console.debug(`addMethodFor: ${typeName}, ${method.name}, ${method.arity}`);
	if(!methodExists(method.name)) {
		// console.debug(`addMethodFor: new method name`);
		system.methodDictionary.set(method.name, new Map());
		if(slOptions.simpleArityModel) {
			const prefixedName = '_' + method.name;
			let globalFunction = globalThis[prefixedName];
			if(globalFunction === undefined) {
				globalFunction = globalThis[prefixedName] = function(...argumentsArray: unknown[]) {
					// console.debug(`dispatchByArity: ${method.name}, ${JSON.stringify(argumentsArray)}`);
					return dispatchByArity(method.name, argumentsArray.length, arityTable, argumentsArray);
				};
				Object.defineProperty(globalFunction, "name", { value: method.name });
				Object.defineProperty(globalFunction, "hasRestParameters", { value: true });
			}
		}
	}
	let arityTable = system.methodDictionary.get(method.name)!;
	if(!arityTable.has(method.arity)) {
		// console.debug(`addMethodFor: new method arity`);
		arityTable.set(method.arity, new Map());
		if(!slOptions.simpleArityModel) {
			const prefixedNameWithArity = `_${method.name}_${method.arity}`;
			// console.debug(`addMethodFor: generate global: ${prefixedNameWithArity}`);
			let globalFunctionWithArity = globalThis[prefixedNameWithArity];
			if(globalFunctionWithArity === undefined) {
				const typeTable = arityTable.get(method.arity)!;
				globalFunctionWithArity = globalThis[prefixedNameWithArity] = function(...argumentsArray: unknown[]) {
					// console.debug(`dispatchByType: ${method.name}, ${JSON.stringify(argumentsArray)}`);
					return dispatchByType(method.name, method.arity, typeTable, argumentsArray);
				};
				Object.defineProperty(globalFunctionWithArity, "name", { value: method.qualifiedName() });
				Object.defineProperty(globalFunctionWithArity, "length", { value: method.arity }); // c.f. makeCheckedAritySpecificFunction
			}
		}
	}
	const existingEntry = arityTable.get(method.arity)!.get(typeName);
	// Todo: this is not a correct test, it needs to not over-write less specific traits as well... it works for stdlib...
	if(existingEntry && existingEntry.origin.name === typeName && method.origin.name !== typeName) {
		// console.debug('addMethodFor: existing more specific entry');
	} else {
		arityTable.get(method.arity)!.set(typeName, method);
	}
	if(typeName === method.origin.name) {
		system.typeDictionary.get(typeName)!.methodDictionary.set(method.qualifiedName(), method);
	}
	return method;
}

// c.f. rewrite/makeMethodList
export function addMethod(typeName: TypeName, methodName: MethodName, arity: Arity, procedure: Function, sourceCode: MethodSourceCode): Method {
	if(typeExists(typeName)) {
		const typeValue = system.typeDictionary.get(typeName)!;
		const method = new Method(methodName, procedure, arity, sourceCode, typeValue);
		return addMethodFor(typeName, method);
	} else {
		throw(`addMethod: ${typeName}, ${methodName}, ${arity}`);
	}
}

// Allows methods to be added to 'pre-installed' types before the type is added, c.f. load &etc. (& parseInteger ...).
// It'd be possible to only allow this for the 'pre-installed' methods, which might be saner.
// Run for built-in types, which may have traits.  Assumes non-kernel types have at least one slot.
export function addType(typeName: TypeName, traitList: TraitName[], slotNames: string[]): void {
	if(!typeExists(typeName) || preinstalledTypes.includes(typeName)) {
		const initializeSlots = slotNames.map(each => `anInstance.${each} = ${each}`).join('; ');
		const nilSlots = slotNames.map(each => `${each}: null`).join(', ');
		const defNilType = slotNames.length === 0 ? '' : `addMethod('Void', 'new${typeName}', 0, function() { return {_type: '${typeName}', ${nilSlots} }; }, '<primitive: constructor>')`;
		const defInitializeSlots = slotNames.length === 0 ? '' : `addMethod('${typeName}', 'initializeSlots', ${slotNames.length + 1}, function(anInstance, ${slotNames.join(', ')}) { ${initializeSlots}; return anInstance; }, '<primitive: initializer>')`;
		const defPredicateFalse = `extendTraitWithMethod('Object', 'is${typeName}', 1, function(anObject) { return false; }, '<primitive: predicate>')`;
		const defPredicateTrue = `addMethod('${typeName}', 'is${typeName}', 1, function(anInstance) { return true; }, '<primitive: predicate>')`;
		const defSlotAccess = slotNames.map(each => `addMethod('${typeName}', '${each}', 1, function(anInstance) { return anInstance.${each} }, '<primitive: accessor>');`).join('; ');
		const defSlotMutate = slotNames.map(each => `addMethod('${typeName}', '${each}', 2, function(anInstance, anObject) { anInstance.${each} = anObject; return anObject; }, '<primitive: mutator>');`).join('; ');
		// console.debug(`addType: ${typeName}, ${slotNames}`);
		const methodDictionary = typeExists(typeName) ? system.typeDictionary.get(typeName)!.methodDictionary : new Map();
		system.typeDictionary.set(typeName, new Type(typeName, traitList, slotNames, methodDictionary));
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

export function arrayCheckIndex(anArray: unknown[], anInteger: number): boolean {
	return Number.isInteger(anInteger) && anInteger >= 0 && anInteger < anArray.length;
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
	var _inf: number;
	var _constant: Map<string,unknown>;
	var _implicitDictionary: Map<string,unknown>;
	var _system: System;
	var _workspace: Map<string,unknown>;
}

export function assignGlobals() {
	globalThis._inf = Infinity;
	globalThis._constant = new Map();
	globalThis._implicitDictionary = new Map();
	globalThis._system = system;
	globalThis._workspace = new Map();
}
