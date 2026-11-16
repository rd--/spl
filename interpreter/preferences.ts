export type Preferences = Record<string, any>;

export function preferencesRead<T>(
	preferences: Preferences,
	preferenceKey: string,
): Preferences {
	const configurationKey: string = preferences['Configuration'];
	const configuration = preferences[configurationKey];
	// console.debug('preferencesRead', preferences, configurationKey, configuration, preferenceKey);
	if (configuration) {
		const entry: T | null = configuration[preferenceKey];
		if (entry) {
			return entry;
		} else {
			throw new Error(
				`preferencesRead: known configuration: ${configurationKey}, unknown preference: ${preferenceKey}`,
			);
		}
	} else {
		const defaultConfiguration = preferences['Default'];
		if (defaultConfiguration) {
			const defaultEntry: T | null = defaultConfiguration[preferenceKey];
			if (defaultEntry) {
				return defaultEntry;
			} else {
				throw new Error(
					`preferencesRead: unknown configuration: ${configurationKey}, unknown preference at default: ${preferenceKey}`,
				);
			}
		} else {
			throw new Error(`preferencesRead: no Default configuration`);
		}
	}
}
