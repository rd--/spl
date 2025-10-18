import { PriorityQueue } from '../lib/scsynth-wasm-builds/lib/ext/PriorityQueue.js';
export { PriorityQueue } from '../lib/scsynth-wasm-builds/lib/ext/PriorityQueue.js';

import { MersenneTwister } from '../lib/scsynth-wasm-builds/lib/ext/mersenne-twister.ts';
export { MersenneTwister } from '../lib/scsynth-wasm-builds/lib/ext/mersenne-twister.ts';

import { default as Delaunator } from '../lib/scsynth-wasm-builds/lib/ext/delaunator.js';
export { default as Delaunator } from '../lib/scsynth-wasm-builds/lib/ext/delaunator.js';

import { default as earcut } from '../lib/scsynth-wasm-builds/lib/ext/earcut.js';
export { default as earcut } from '../lib/scsynth-wasm-builds/lib/ext/earcut.js';

import * as evaluate from './evaluate.ts';
import { slOptions } from './options.ts';
import { isSmallFloatInteger } from './predicates.ts';

export { slGrammar, slParse, slSemantics } from './grammar.ts';

type Arity = number;
type PackageName = string;
type TypeName = string;
type TraitName = string;
type TypeOrTraitName = string;
type MethodName = string;
type ParameterNames = string[];
type QualifiedMethodName = string; // i.e. MethodName:/Arity
type MethodSourceCode = string;
type MethodOrigin = Trait | Type;

type SplObject = object & { _type: TypeName };
type SplBlock = (...args: never) => unknown;

type QualifiedMethodDictionary = Map<QualifiedMethodName, Method>;
type TraitDictionary = Map<TraitName, Trait>;
type TypeDictionary = Map<TypeName, Type>;

type ByTypeMethodDictionary = Map<TypeName, Method>;
type ByArityMethodDictionary = Map<Arity, ByTypeMethodDictionary>;
type MethodDictionary = Map<MethodName, ByArityMethodDictionary>;

function isRecord(anObject: SplObject): boolean {
	const c = anObject.constructor;
	return c === undefined || c.name === 'Object';
}

function objectNameByConstructor(anObject: SplObject): TypeName {
	const name = anObject.constructor.name;
	if (name == 'Range') {
		return 'DocumentRange';
	}
	if (name == 'Blob') {
		return 'BinaryLargeObject';
	}
	if (name == 'bound Storage') {
		return 'Storage' /* deno 2.3.1, <https://github.com/denoland/deno/issues/27303>, delete when fixed */
	}
	return name;
}

function splObjectTypeOf(anObject: SplObject): TypeName {
	if (anObject instanceof Array) {
		return 'List';
	}
	if (anObject instanceof Map) {
		return 'Map';
	}
	if (anObject instanceof Set) {
		return 'IdentitySet';
	}
	if (anObject instanceof Promise) {
		return 'Promise';
	}
	if (anObject instanceof PriorityQueue) {
		return 'PriorityQueue';
	}
	if (anObject instanceof Uint8Array) {
		return 'ByteArray'; /* Rename */
	}
	if (anObject instanceof Float64Array) {
		return 'Float64Array';
	}
	if (anObject instanceof Error) {
		return 'Error';
	}
	if (anObject instanceof WeakMap) {
		return 'WeakMap';
	}
	const splType = anObject._type;
	if (splType !== undefined) {
		return splType;
	}
	if (isRecord(anObject)) {
		return 'Record';
	}
	return objectNameByConstructor(anObject);
}

/* This runs slower than the form above, is .constructor.name slow?
function splObjectTypeOf(anObject: SplObject): TypeName {
	return anObject instanceof Uint8Array ? 'ByteArray' :
		(anObject._type ||
			(isRecord(anObject) ? 'Record' : anObject.constructor.name));
}
*/

export function splTypeOf(anObject: unknown): TypeName {
	if (anObject === null || anObject === undefined) {
		return 'Nil';
	}
	switch (typeof anObject) {
		case 'boolean':
			return 'Boolean';
		case 'function':
			return 'Block';
		case 'number':
			return 'SmallFloat';
		case 'string':
			return 'String';
		case 'bigint':
			return 'LargeInteger';
		case 'object':
			return splObjectTypeOf(<SplObject> anObject);
		default:
			throw new Error(`splTypeOf: unknown type: "${anObject}"`);
	}
}

export class MethodInformation {
	name: MethodName;
	packageName: PackageName;
	parameterNames: ParameterNames;
	sourceCode: MethodSourceCode;
	origin: MethodOrigin;
	arity: Arity;
	constructor(
		name: MethodName,
		packageName: PackageName,
		parameterNames: ParameterNames,
		sourceCode: MethodSourceCode,
		origin: MethodOrigin,
	) {
		this.name = name;
		this.packageName = packageName;
		this.parameterNames = parameterNames;
		this.sourceCode = sourceCode;
		this.origin = origin;
		this.arity = parameterNames.length; // derived
	}
	qualifiedName() {
		// console.debug(`MethodInformation>>qualifiedName: ${this.name}, ${this.arity}`);
		return `${this.name}:/${this.arity}`;
	}
}

export class Method {
	block: Function;
	information: MethodInformation;
	constructor(block: Function, information: MethodInformation) {
		this.block = block;
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
	constructor(
		name: TypeName,
		packageName: PackageName,
		traitNameArray: TraitName[],
		slotNameArray: string[],
		methodDictionary: QualifiedMethodDictionary,
	) {
		this.name = name;
		this.packageName = packageName;
		this.traitNameArray = traitNameArray;
		this.slotNameArray = slotNameArray;
		this.methodDictionary = methodDictionary;
	}
}

/* NB. "package" is a reserved word
CF. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar */
export class Package {
	category: string;
	name: string;
	requires: string[];
	url: string;
	text: string;
	preCompiled: boolean;
	isLoaded: boolean;
	constructor(
		category: string,
		name: string,
		requires: string[],
		url: string,
		text: string,
		preCompiled: boolean,
		isLoaded: boolean,
	) {
		this.category = category;
		this.name = name;
		this.requires = requires;
		this.url = url;
		this.text = text;
		this.preCompiled = preCompiled;
		this.isLoaded = isLoaded;
	}
}

export function parsePackageRequires(text: string): string[] {
	const firstLine = text.split('\n', 1)[0];
	const packageNames = firstLine.match(/Requires: (.*)\*\//);
	if (packageNames == null) {
		return [];
	}
	return packageNames[1].trim().split(' ');
}

export function evaluatePackage(pkg: Package): unknown {
	// console.debug(`evaluatePackage: ${pkg.name}, ${pkg.url}, ${pkg.preCompiled}`);
	if (pkg.preCompiled) {
		try {
			// <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#never_use_direct_eval!>
			return eval?.(`"use strict"; ${pkg.text}`);
		} catch (err) {
			throw new Error(`Error loading package: ${pkg} ${err}`);
		}
	}
	return evaluate.evaluateFor(pkg.name, pkg.text);
}

export async function evaluatePackageArrayInSequence(pkgArray: Package[]) {
	// console.debug(`evaluatePackageArrayInSequence: '${pkgArray}'`);
	for (const pkg of pkgArray) {
		await evaluatePackage(pkg);
	}
}

// Required if methods are added before type definition. This should all be cleared up.
// Void is not an ordinary type, it names the place in the method table for no-argument blocks.
const preinstalledTypes = ['List', 'SmallFloat', 'String', 'Void'];

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
		this.typeDictionary = new Map(preinstalledTypes.map(function (each) {
			return [each, new Type(each, 'Kernel', [], [], new Map())];
		}));
		this.window = globalThis; // ech...
		this.packageDictionary = new Map();
		this.cache = new Map();
	}
}

export const system: System = new System();

function traitExists(traitName: TraitName): boolean {
	return system.traitDictionary.has(traitName);
}

function getTrait(traitName: TraitName): Trait {
	if (!traitExists(traitName)) {
		throw new Error(`getTrait: does not exist: ${traitName}`);
	}
	return system.traitDictionary.get(traitName)!;
}

export function addTrait(traitName: TraitName, packageName: PackageName): void {
	if (traitExists(traitName)) {
		throw new Error(`addTrait: trait exists: ${traitName}`);
	}
	system.traitDictionary.set(traitName, new Trait(traitName, packageName));
}

function typeExists(typeName: TypeName): boolean {
	return system.typeDictionary.has(typeName);
}

function getType(typeName: TypeName): Type {
	if (!typeExists(typeName)) {
		throw new Error(`getType: does not exist: ${typeName}`);
	}
	return system.typeDictionary.get(typeName)!;
}

function methodExists(methodName: MethodName): boolean {
	return system.methodDictionary.has(methodName);
}

// CF. rewrite/makeMethodList
export function addMethodToExistingTrait(
	traitName: TraitName,
	packageName: PackageName,
	methodName: MethodName,
	parameterNames: ParameterNames,
	block: Function,
	sourceCode: MethodSourceCode,
): Method {
	// console.debug(`addMethodToExistingTrait: ${traitName}, ${packageName}, ${methodName}, ${parameterNames}`);
	if (!traitExists(traitName)) {
		throw new Error(
			`addMethodToExistingTrait: trait does not exist: ${traitName}, ${methodName}, ${parameterNames.length}`,
		);
	}
	const trait = getTrait(traitName);
	const method = new Method(
		block,
		new MethodInformation(
			methodName,
			packageName,
			parameterNames,
			sourceCode,
			trait,
		),
	);
	trait.methodDictionary.set(method.qualifiedName(), method);
	return method;
}

// addMethodFor decides if the trait method is copied or not.
export function copyTraitMethodsToType(
	traitName: TraitName,
	typeName: TypeName,
): void {
	if (!traitExists(traitName) || !typeExists(typeName)) {
		throw new Error(
			`copyTraitMethodsToType: trait or type does not exist: ${traitName}, ${typeName}`,
		);
	}
	const trait = getTrait(traitName);
	const methodDictionary = trait.methodDictionary;
	for (const [_unusedName, method] of methodDictionary) {
		// console.debug(`copyTraitMethodsToType: ${traitName}, ${typeName}, ${name}, ${method.information.arity}`);
		addMethodFor(typeName, method, true);
	}
}

// List of names of types that implement named trait.
export function typesImplementingTrait(traitName: TraitName): TypeName[] {
	const answer = [];
	for (const [typeName, typeValue] of system.typeDictionary) {
		if (typeValue.traitNameArray.includes(traitName)) {
			answer.push(typeName);
		}
	}
	return answer;
}

export function annotateFunction(
	aBlock: SplBlock,
	argumentNames: string[],
): SplBlock {
	aBlock.argumentNames = argumentNames;
	return aBlock;
}

// CF. rewrite/makeMethodList
export function extendTraitWithMethod(
	traitName: TraitName,
	packageName: PackageName,
	name: MethodName,
	parameterNames: ParameterNames,
	block: Function,
	sourceCode: MethodSourceCode,
): Method {
	const method = addMethodToExistingTrait(
		traitName,
		packageName,
		name,
		parameterNames,
		block,
		sourceCode,
	);
	typesImplementingTrait(traitName).forEach(
		function (typeName) {
			addMethodFor(typeName, method, true);
		},
	);
	return method;
}

// CF. rewrite/makeMethodList
export function extendTypeOrTraitWithMethod(
	typeOrTraitName: TypeOrTraitName,
	packageName: PackageName,
	name: MethodName,
	parameterNames: ParameterNames,
	block: Function,
	sourceCode: MethodSourceCode,
): Method {
	const isTraitName = typeOrTraitName.startsWith('@');
	if (isTraitName) {
		return extendTraitWithMethod(
			typeOrTraitName.substring(1),
			packageName,
			name,
			parameterNames,
			block,
			sourceCode,
		);
	}
	return addMethodToExistingType(
		typeOrTraitName,
		packageName,
		name,
		parameterNames,
		block,
		sourceCode,
	);
}

// Only for Ugen>>adaptToNumberAndApply.
export function lookupGeneric(
	methodName: MethodName,
	methodArity: Arity,
	receiverType: TypeName,
): Method {
	const byArity = system.methodDictionary.get(methodName)!;
	const byType = byArity.get(methodArity)!;
	return byType.get(receiverType)!;
}

// Only for Ugen>>adaptToNumberAndApply.
export function nameWithoutArity(methodName: MethodName) {
	return methodName.split(':')[0];
}

// Only for Ugen>>adaptToNumberAndApply.
export function applyGenericAt(
	methodName: MethodName,
	parameterArray: unknown[],
	receiverType: TypeName,
) {
	// console.log(`applyGenericAt: ${methodName}, ${parameterArray.length}, ${receiverType}`);
	const genericMethod = lookupGeneric(
		methodName,
		parameterArray.length,
		receiverType,
	);
	if (!genericMethod) {
		throw new Error(`applyGenericAt: ${methodName}: lookup failed`);
	}
	return genericMethod.block.apply(null, parameterArray);
}

// The typeTable for zero arity methods always has exactly one entry, for Void.
// NB. methodName is for error reporting only.
export function dispatchVoid(
	methodName: string,
	typeTable: ByTypeMethodDictionary,
) {
	// console.debug(`dispatchVoid: ${methodName}, ${typeTable.size}`);
	const voidMethod = typeTable.get('Void');
	if (!voidMethod) {
		throw new Error(`dispatchVoid: ${methodName}: method lookup failed`);
	}
	return voidMethod.block.apply(null, []);
}

// NB. methodName is for error reporting only.
export function dispatchByType(
	methodName: string,
	typeTable: ByTypeMethodDictionary,
	parameterArray: unknown[],
) {
	const receiver = parameterArray[0];
	const receiverType = splTypeOf(receiver);
	const typeMethod = typeTable.get(receiverType);
	if (!typeMethod) {
		const arity = parameterArray.length;
		const qualifiedName = `${methodName}:/${arity}`;
		throw new Error(
			`dispatchByType: no method "${qualifiedName}" for "${receiverType}"`,
		);
	}
	return typeMethod.block.apply(null, parameterArray);
}

declare var globalThis: { [key: string]: unknown };

// Is existingMethod more specific than method.
// NB. This is not a correct test, it should be fixed.
// It should not over-write less specific traits, however it works for stdlib.
function isMoreSpecific(
	typeName: TypeName,
	existingMethod: Method,
	method: Method,
): boolean {
	const methodOrigin = method.information.origin;
	const methodIsAtType = methodOrigin.name === typeName;
	if (methodIsAtType) {
		return false;
	}
	const existingOrigin = existingMethod.information.origin;
	const existingIsAtType = existingOrigin.name === typeName;
	if (existingIsAtType && !methodIsAtType) {
		return true;
	}
	const typeValue = getType(typeName);
	const existingTraitIndex = typeValue.traitNameArray.findIndex(
		(item) => item === existingOrigin.name,
	);
	const methodTraitIndex = typeValue.traitNameArray.findIndex(
		(item) => item === methodOrigin.name,
	);
	/*
	if((existingTraitIndex > methodTraitIndex)) {
		console.debug(
			'isMoreSpecific',
			typeName,
			method.information.name,
			existingOrigin.name,
			existingTraitIndex,
			methodOrigin.name,
			methodTraitIndex
		);
	};
	*/
	return (existingTraitIndex > methodTraitIndex);
}

export function addMethodFor(
	typeName: TypeName,
	method: Method,
	requireTypeExists: boolean,
): Method {
	if (requireTypeExists && !typeExists(typeName)) {
		throw new Error(
			`addMethodFor: type does not exist: ${typeName} (${method})`,
		);
	}
	const name = method.information.name;
	// console.debug(`addMethodFor: ${typeName}, ${method.qualifiedName()}`);
	if (!methodExists(name)) {
		// console.debug(`addMethodFor: new method name`);
		system.methodDictionary.set(name, new Map());
	}
	const arity = method.information.arity;
	const arityTable = system.methodDictionary.get(name)!;
	if (!arityTable.has(arity)) {
		// console.debug(`addMethodFor: new method arity`);
		arityTable.set(arity, new Map());
		const prefixedNameWithArity = `_${name}_${arity}`;
		// console.debug(`addMethodFor: generate global: ${prefixedNameWithArity}`);
		let globalFunctionWithArity = globalThis[prefixedNameWithArity];
		if (globalFunctionWithArity === undefined) {
			// NB. The method name is passed for error reporting only
			const typeTable = arityTable.get(arity)!;
			const voidFunction = function () {
				return dispatchVoid(name, typeTable);
			};
			const typeFunction = function (...args: unknown[]) {
				return dispatchByType(name, typeTable, args);
			};
			const dispatchFunction = (arity === 0) ? voidFunction : typeFunction;
			globalFunctionWithArity =
				globalThis[prefixedNameWithArity] =
					dispatchFunction;
			Object.defineProperty(globalFunctionWithArity, 'name', {
				value: method.qualifiedName(),
			});
			Object.defineProperty(globalFunctionWithArity, 'length', {
				value: arity,
			}); // CF. makeCheckedAritySpecificFunction
			Object.defineProperty(globalFunctionWithArity, 'parameterNames', {
				value: method.information.parameterNames,
			});
		}
	}
	const existingEntry = arityTable.get(arity)!.get(typeName);
	if (existingEntry && isMoreSpecific(typeName, existingEntry, method)) {
		// console.debug('addMethodFor: existing more specific entry');
	} else {
		arityTable.get(arity)!.set(typeName, method);
	}
	if (typeName === method.information.origin.name) {
		system.typeDictionary.get(typeName)!.methodDictionary.set(
			method.qualifiedName(),
			method,
		);
	}
	return method;
}

// CF. rewrite/makeMethodList
export function addMethodToExistingType(
	typeName: TypeName,
	packageName: PackageName,
	methodName: MethodName,
	parameterNames: ParameterNames,
	block: Function,
	sourceCode: MethodSourceCode,
): Method {
	// console.debug(`addMethod: ${typeName}, ${packageName}, ${methodName}, ${parameterNames}`);
	if (!typeExists(typeName)) {
		throw new Error(
			`addMethod: type does not exist: ${typeName}, ${methodName}, ${parameterNames.length}`,
		);
	}
	const typeValue = system.typeDictionary.get(typeName)!;
	const method = new Method(
		block,
		new MethodInformation(
			methodName,
			packageName,
			parameterNames,
			sourceCode,
			typeValue,
		),
	);
	return addMethodFor(typeName, method, true);
}

// Allows methods to be added to 'pre-installed' types before the type is added, CF. load &etc. (& parseSmallInteger ...).
// It'd be possible to only allow this for the 'pre-installed' methods, which might be saner.
// Run for built-in types, which may have traits.  Assumes non-kernel types have at least one slot.
export function addType(
	isHostType: boolean,
	typeName: TypeName,
	packageName: PackageName,
	traitList: TraitName[],
	slotNames: string[],
): void {
	if (typeExists(typeName) && !preinstalledTypes.includes(typeName)) {
		throw new Error(
			`addType: type exists and is not pre-installed: ${typeName}`,
		);
	}
	const initializeSlots = slotNames.map(
		(each) => `anInstance.${each} = ${each}`,
	).join('; ');
	const nilSlots = slotNames.map((each) => `${each}: null`).join(', ');
	const defNewType = isHostType
		? ''
		: `sl.addMethodToExistingType('Void', '${packageName}', 'new${typeName}', [], function() { return {_type: '${typeName}', ${nilSlots} }; }, '<primitive: constructor>')`;
	const defInitializeSlots = isHostType
		? ''
		: `sl.addMethodToExistingType('${typeName}', '${packageName}', 'initializeSlots', ${
			JSON.stringify(['self'].concat(slotNames))
		}, function(anInstance, ${
			slotNames.join(', ')
		}) { ${initializeSlots}; return anInstance; }, '<primitive: initializer>')`;
	const defPredicateFalse =
		`sl.extendTraitWithMethod('Object', '${packageName}', 'is${typeName}', ['self'], function(anObject) { return false; }, '<primitive: predicate>')`;
	const defPredicateTrue =
		`sl.addMethodToExistingType('${typeName}', '${packageName}', 'is${typeName}', ['self'], function(anInstance) { return true; }, '<primitive: predicate>')`;
	const defSlotAccess = slotNames.map(
		(each) =>
			`sl.addMethodToExistingType('${typeName}', '${packageName}', '${each}', ['self'], function(anInstance) { return anInstance.${each} }, '<primitive: accessor>');`,
	).join('; ');
	const defSlotMutate = slotNames.map(
		(each) =>
			`sl.addMethodToExistingType('${typeName}', '${packageName}', '${each}', ['self', 'anObject'], function(anInstance, anObject) { anInstance.${each} = anObject; return anObject; }, '<primitive: mutator>');`,
	).join('; ');
	// console.debug(`addType: ${typeName}, ${packageName}, ${slotNames}`);
	const methodDictionary = typeExists(typeName)
		? system.typeDictionary.get(typeName)!.methodDictionary
		: new Map();
	system.typeDictionary.set(
		typeName,
		new Type(typeName, packageName, traitList, slotNames, methodDictionary),
	);
	const allDef = [
		defNewType,
		defInitializeSlots,
		defPredicateFalse,
		defPredicateTrue,
		defSlotAccess,
		defSlotMutate,
	].join(';');
	// <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#never_use_direct_eval!>
	eval?.(`"use strict"; ${allDef}`);
}

/* Spl is one-indexed.  NB. The index is not decremented because in Js '1' - 1 is 0 &etc. */
export function arrayCheckIndex(
	anArray: unknown[],
	anInteger: number | bigint,
): boolean {
	return isSmallFloatInteger(anInteger) && (anInteger >= 1) &&
		(anInteger <= anArray.length);
}

export function initializeLocalPackages(
	qualifiedPackageNames: string[],
): Package[] {
	const packageArray: Package[] = [];
	qualifiedPackageNames.forEach((qualifiedName) => {
		const parts = qualifiedName.split('-');
		const category = parts[0];
		const name = parts[1];
		const url = `${category}/${name}.sl`;
		const pkg = new Package(
			category,
			name,
			[],
			url,
			'', // text
			true, // preCompiled
			false, // isLoaded
		);
		/* NB. Requires text and preCompiled are set after fetch. */
		/* Add to dictionary (initialized & fetched, not loaded) */
		system.packageDictionary.set(name, pkg);
		packageArray.push(pkg);
	});
	return packageArray;
}

/* Evaluate already fetched packages in sequence. */
export async function primitiveLoadPackageSequence(
	packageNames: string[],
): Promise<void> {
	// console.debug(`primitiveLoadPackageSequence: '${packageNames}'`);
	const packageArray: Package[] = [];
	packageNames.forEach(
		(name) => {
			const pkg = system.packageDictionary.get(name);
			if (pkg == undefined) {
				throw new Error(
					`primitiveLoadPackageSequence: no such package: ${name}, ${pkg}, ${packageNames.length}, [${packageNames}]`,
				);
			}
			pkg.isLoaded = true;
			packageArray.push(pkg);
		},
	);
	await evaluatePackageArrayInSequence(packageArray);
}

declare global {
	var _system: System;
}

export function assignGlobals() {
	globalThis._system = system;
}

/* https://regex101.com/r/Awcj1k/1 */
export function stringToSentences(str: string): Array<string> {
	return str.match(
		/(?=[^])(?:\P{Sentence_Terminal}|\p{Sentence_Terminal}(?!['"`\p{Close_Punctuation}\p{Final_Punctuation}\s]))*(?:\p{Sentence_Terminal}+['"`\p{Close_Punctuation}\p{Final_Punctuation}]*|$)/guy,
	) || [];
}
