skeinforge tweaks:

2010/04/12: Added ./.skeinforge check to getSettingsDirectoryPath in reprap_python_beanshell_16/fabmetheus_utilities/settings.py:
--snip--
def getSettingsDirectoryPath( subfolder = '' ):
        "Get the settings directory path, which is the home directory joined with .skeinforge."
        settingsDirectory = os.path.join( os.path.expanduser( '.' ), '.skeinforge' )
        if subfolder == '':
                settingsDirectory = os.path.join( os.path.expanduser( '~' ), '.skeinforge' )
        if subfolder == '':
                return settingsDirectory
        return os.path.join( settingsDirectory, subfolder )
--end-snip--

