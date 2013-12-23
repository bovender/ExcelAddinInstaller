ExcelAddinInstaller
===================

[InnoSetup][] script to install and activate Excel addins.

Features
--------

- Works with native Excel addins for Excel 2000-2003 (`.XLA` files) as well as
  Excel 2007-2013 (`.XLAM` files).
- Automatically registers and activates the addin.
- Checks if Excel is running and can automatically shut it down before
  proceeding with the installation process.
- Can be used with an /UPDATE switch to silently shut down and restart Excel
  after the installation.
- Modular structure makes it easy to keep custom configuration separate from
  the core functionality.

The script is based on the installer used by [Daniel's XL Toolbox][].


Planned features
----------------

- Ability to install binary addins (e.g., .NET/VSTO addins).


Usage
-----

You can either download a ZIP file containing all files, or clone the Git
repository.

Copy or rename the distributed configuration files:
- `config.dist.iss` &rarr; `config.iss`
- `files.dist.iss` &rarr; `files.iss`

Adjust the configuration by editing the configuration files. Never edit the
files containing "dist" in their file name directly, as they will be
overwritten whenever you update the ExcelAddinInstaller.

To generate a setup file, double-click the file `addin-installer.iss` and
compile it using InnoSetup.


Demo
----

The preconfigured configuration files install simple (empty) Excel addins.
Successful installation can be verified using Excel's addin manager, and by
looking at the Add/Remove Software applet in the Windows Control Panel.

Published under the [GPL v3 license](LICENSE).


[InnoSetup]: http://www.jrsoftware.org/isinfo.php
[Daniel's XL Toolbox]: http://xltoolbox.sf.net

vim: set tw=70 ts=4 
