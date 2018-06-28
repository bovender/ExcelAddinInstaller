ExcelAddinInstaller
===================

[InnoSetup][] script to install and activate Excel&reg; addins.

> Note: You may also be interested in my [VstoAddinInstaller][] which 
> is a much improved version.

Features
--------

- Works with native Excel addins for Excel 2000-2003 (`.XLA` files) as well as
  Excel 2007-2013 (`.XLAM` files).
- Automatically registers and activates the addin.
- Checks if Excel is running and can automatically shut it down before
  proceeding with the installation process.
- Can be used with an `/UPDATE` switch to silently shut down and restart Excel
  after the installation.
- Modular structure makes it easy to keep custom configuration separate from
  the core functionality.

The script is based on the installer used by [Daniel's XL Toolbox][].


Planned features
----------------

- Ability to install binary addins (e.g., .NET/VSTO addins).


Obtaining
---------

- If you have [Git for Windows][] installed on your system, you can simply
  clone the repository: <https://github.com/bovender/ExcelAddinInstaller.git>
- If you do not have Git, just download the latest [ZIP file][] from
  Github. The file contains a directory "ExcelAddinInstaller-master",
  so you can simply unzip it into the downloads folder without
  polluting your files.


Usage
-----

The scipt is divided into several files. The master file,
`addin-installer.iss`, pulls in several non-configurable files from
the `inc\` subfolder as well as customized configuration files from
the main folder (see below).

To generate an installer, use InnoSetup to compile the master file
`addin-installer.iss`. Never make changes to this master file; use
custom configuration files instead: To protect you from accidentally
overwriting your personalized configuration with an update from the
Git repository, the distributed configuration files (to be recognized
by the ".dist" contained in the filename) need to be copied from the
`config-dist` folder to the parent folder. Then, rename the files to
remove the ".dist" part from them, and edit these files.

Depending on how much you want to customize the script, you need to
copy and rename just one or several files.


### Most basic scenario ###

The most basic scenario assumes that you have an `.XLAM` and/or an
`.XLA` file, but no other files that need to be installed.

Copy the distributed configuration file `config-dist\config.dist.iss`
to the main folder and rename it to `config.iss`.

Edit the new file `config.iss` and insert the appropriate descriptive
information. By default, the `.XLAM`/`.XLA` files are expected in a
`source\` folder, but this can be adjusted in the `config.iss` file
too.

__Important:__ When you first edit this file, you *must* create a
global unique ID (GUID) for your addin. You will easily identify the
line in the default configuration file where this information is
needed.  InnoSetup has a "Generate GUID" command in the "Tools" menu.

When you are done editing, save the file, then right-click on the
`addin-installer.iss` file and choose "Compile" from the context menu
(if you do not see a "Compile" command in the context menu, check that
you have actually installed [InnoSetup]).

Alternatively, double-click on `addin-installer.iss`, which will start
InnoSetup with the file loaded.

The installer will be written to the `deploy\` folder by default. This
can be changed in the `config.iss` file.


### Adding more files ###

If you need more files than just an `.XLAM` and/or `.XLA` addin file,
you need to copy the `files.dist.iss` configuration file from the
`config-dist` folder to the main folder, and rename it to `files.iss`.

Add the file definitions to this file. Make sure to use the `Dest`
directive as described in this configuration file (i.e., it must
contain a call to the `GetDestDir` function).


### Advanced configuration ###

If you need more advanced configuration, copy and rename one or
several of the following configuration files from the `config-dist`
folder to the main folder:
- `lanuages.dist.iss` and `messages.dist.iss` to add more languages.
- `tasks.dist.iss` to define custom tasks.

Always remember to remove the `.dist` from the file names after
copying them to the main folder.


Demo
----

The ExcelAddinInstaller comes with a sample configuration and two
(empty) Excel addin files, one for Excel 2000-2003 (`.XLA`) and one
for Excel 2007-2013 (`.XLAM`). To test the demo, copy the file
`demo\config.demo.iss` to the main folder and rename it to
`config.iss`. Then, use InnoSetup to compile the master file
`addin-installer.iss`.

The demo script will generate a setup file `demo_1.0.exe` in the
`deploy\` subfolder. When you execute this file, the appropriate addin
file (depending on what version of Excel you have installed) will be
installed to your user profile folder.

Successful installation can be verified using Excel's addin manager,
by looking at the Add/Remove Software applet in the Windows Control
Panel, and by opening an Explorer window on the profile folder:

- With Windows XP: `Start` > `Run...` >  `"%appdata%\Microsoft\Addins"`
- With Windows 7: `Start` > `"%appdata%\Microsoft\Addins"`


Further information
-------------------

For background information, see
<http://xltoolbox.sf.net/blog/2013/12/using-innosetup-to-install-excel-addins>.


Credits
-------

Victor McClean tested the script and contributed bug fixes.
Jorrit Wronski (@jowr) contributed Danish language messages.
@cardsurf fixed a bug.


License
-------

Published under the [GPL v3 license](LICENSE).

	Copyright (C) 2013-2018  Daniel Kraus <http://github.com/bovender>

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
	GNU General Public License for more details.

Microsoft®, Windows®, Office, and Excel® are either registered
trademarks or trademarks of Microsoft Corporation in the United States
and/or other countries.


[InnoSetup]: http://www.jrsoftware.org/isinfo.php
[Daniel's XL Toolbox]: http://xltoolbox.sf.net
[ZIP file]: https://github.com/bovender/ExcelAddinInstaller/archive/master.zip
[Git for Windows]: http://git-scm.com/downloads
[VstoAddinInstaller]: https://github.com/bovender/VstoAddinInstaller

<!-- vim: set tw=70 ts=4 :-->
