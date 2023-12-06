# Preferences

Persistent system configuration.
A preferences files is loaded during system startup.
Preferences are stored in the system cache and can be accessed at `system.preferences`.

To read a preference, providing a default value in case it does not exist:

	system.preference('Configuration', 'Default')

To set the a preference, here the _Configuration_:

	system.preference::Configuration := '1×2+1×8+2×4'

The default configuration is called _Default_:

	system.preference::Configuration := 'Default'
