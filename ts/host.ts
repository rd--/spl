export function currentWorkingDirectory(): string {
	return Deno.cwd();
}

export function environmentVariableGet(variableName: string): string | null {
	return Deno.env.get(variableName) || null;
}

export function environmentVariableSet(
	variableName: string,
	variableValue: string,
): null {
	Deno.env.set(variableName, variableValue);
	return null;
}

export function environmentVariables(): Record<string, string> {
	return Deno.env.toObject();
}

export function exit(code: number): never {
	return Deno.exit(code);
}

export function fileInformationAsync(
	path: string | URL,
): Promise<Deno.FileInfo> {
	return Deno.stat(path);
}

export function fileInformationSync(path: string | URL): Deno.FileInfo {
	return Deno.statSync(path);
}

export function hostName(): string {
	return Deno.hostname();
}

export function instructionSetArchitecture(): string {
	return Deno.build.arch;
}

export function modificationTimeSync(path: string | URL): number {
	try {
		const info = Deno.statSync(path);
		return info.mtime ? info.mtime.getTime() : 0;
	} catch (_) {
		return 0;
	}
}

export function operatingSystem(): string {
	return Deno.build.os;
}

export function makeDirectorySync(
	path: string | URL,
	allowRecursive: boolean,
	fileMode: number,
): void {
	return Deno.mkdirSync(path, { recursive: allowRecursive, mode: fileMode });
}

export function readBinaryFileAsync(path: string | URL): Promise<Uint8Array> {
	return Deno.readFile(path);
}

export function readBinaryFileSync(path: string | URL): Uint8Array {
	return Deno.readFileSync(path);
}

export function readTextFileAsync(path: string | URL): Promise<string> {
	return Deno.readTextFile(path);
}

export function readTextFileSync(path: string | URL): string {
	return Deno.readTextFileSync(path);
}

export function removeDirectorySync(
	path: string | URL,
	recursive: boolean,
): void {
	const info = Deno.statSync(path);
	if (!info.isDirectory) {
		throw new Error(`removeDirectory: not a directory: ${path}`);
	}
	return Deno.removeSync(path, { recursive: recursive });
}

export function removeFileSync(path: string | URL): void {
	const info = Deno.statSync(path);
	if (!info.isFile) {
		throw new Error(`removeFile: not a file: ${path}`);
	}
	return Deno.removeSync(path);
}

interface CommandResult {
	exitCode: number;
	outputText: string;
	errorText: string;
}

export function systemCommand(
	commandName: string,
	argumentArray: string[],
): CommandResult {
	const command = new Deno.Command(commandName, { args: argumentArray });
	const result = command.outputSync();
	return {
		exitCode: result.code,
		outputText: new TextDecoder().decode(result.stdout),
		errorText: new TextDecoder().decode(result.stderr),
	};
}

export function systemCommandAsync(
	commandName: string,
	argumentArray: string[],
): Promise<CommandResult> {
	// console.debug('systemCommandAsync', commandName, argumentArray);
	try {
		const command = new Deno.Command(commandName, { args: argumentArray });
		return command.output().then(
			function (result) {
				return {
					exitCode: result.code,
					outputText: new TextDecoder().decode(result.stdout),
					errorText: new TextDecoder().decode(result.stderr),
				};
			},
		);
	} catch (err) {
		return Promise.reject(
			new Error(`systemCommandAsync: ${err}`),
		);
	}
}

export function writeBinaryFileAsync(
	path: string | URL,
	data: Uint8Array,
): Promise<void> {
	return Deno.writeFile(path, data);
}

export function writeBinaryFileSync(
	path: string | URL,
	data: Uint8Array,
): void {
	return Deno.writeFileSync(path, data);
}

export function writeTextFileAsync(
	path: string | URL,
	data: string,
): Promise<void> {
	return Deno.writeTextFile(path, data);
}

export function writeTextFileSync(
	path: string | URL,
	data: string,
): void {
	return Deno.writeTextFileSync(path, data);
}

export async function readDirectoryAsync(
	path: string | URL,
): Promise<Deno.DirEntry[]> {
	const answer: Deno.DirEntry[] = [];
	for await (const dirEntry of Deno.readDir(path)) {
		answer.push(dirEntry);
	}
	return answer;
}

export function readDirectorySync(
	path: string | URL,
): Deno.DirEntry[] {
	const answer: Deno.DirEntry[] = [];
	for (const dirEntry of Deno.readDirSync(path)) {
		answer.push(dirEntry);
	}
	return answer;
}

export function readTextFileArrayAsync(pathArray: string[]): Promise<string[]> {
	return Promise.all(
		pathArray.map(function (path: string): Promise<string> {
			return Deno.readTextFile(path);
		}),
	);
}

export function readTextFileArraySync(pathArray: string[]): string[] {
	return pathArray.map(function (path: string): string {
		return Deno.readTextFileSync(path);
	});
}

export function makeTemporaryFileSync(prefix: string, suffix: string): string {
	return Deno.makeTempFileSync({prefix: prefix, suffix: suffix});
}

/*
function getEnvOr(variableName: string, defaultValue: string) {
	return getEnv(variableName) || defaultValue;
}
*/
