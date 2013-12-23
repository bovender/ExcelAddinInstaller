; =============================================
; == DEMO FILE THAT INSTALLS AN EMPTY ADDIN  ==
; == You may delete this file, then copy the ==
; == config.dist.iss file to config.iss and  ==
; == insert your own information.            ==
; =============================================

#define VERSION "1.0"                ; The version number
#define LONGVERSION "1.0.0.0"        ; The version in four-number format
#define YEARSPAN "2014"              ; The year(s) of publication
                                     ; (e.g., 2014-2015)
#define PRODUCT "DemoAddin"
#define COMPANY "ExcelAddinInstaller"

#define SOURCEDIR "demo"             ; The folder with the addin files
                                     ; (relative path)

#define LOGFILE "INST-LOG.TXT"       ; The name of the log file. 

AppPublisherURL=http://github.com/bovender/ExcelAddinInstaller
AppSupportURL=http://github.com/bovender/ExcelAddinInstaller
AppUpdatesURL=http://github.com/bovender/ExcelAddinInstaller
OutputBaseFilename=demo_{#version}
OutputDir=deploy

; Specific AppID
; Use InnoSetup's Generate UID command from the Tools menu
; to generate a unique ID. Make sure to have this ID start
; with TWO curly brackets.
; Never change this UID after the addin has been deployed.

; DO NOT USE THIS UID! IT BELONGS TO THE DEMO PROJECT.
; REPLACE IT WITH YOUR OWN UID.
AppId={{402BD661-8D74-4DA5-B1F3-36B5B9477898}

; vim: set ts=2 sts=2 sw=2 noet tw=60 fo+=lj cms=;%s 
