//@ LogService log

importClass(Packages.ij.Prefs);


log.info("ENABLING autostart of IMCF Toolbar.");
Prefs.set("imcf.show_toolbar", true);
Prefs.savePreferences();
