# Firefox plugin blocklist

Firefox uses this plugin blocklist to determine which plugin content should be prevented from loading. See the following bugs for more information:

* [Firefox bug 1237198](https://bugzilla.mozilla.org/show_bug.cgi?id=1237198) for the SWF blocklist.
* [Firefox bug 1307604](https://bugzilla.mozilla.org/show_bug.cgi?id=1307604) for the 1st-party and 3rd-party domain blocklist.
* [Firefox bug 1369160](https://bugzilla.mozilla.org/show_bug.cgi?id=1369160) for the 1st-party infobar suppressing list.

### SWF blocklist ###

This blocklist is small and covers some Flash SWF files. The criteria for adding content to the blocklist are:

* Blocking the content will not be noticeable to the Firefox user.
* It is possible to reimplement the basic functionality of the content in HTML without Flash.

To create the blocklist, we used a web crawler to analyze the SWFs on the home pages of the Alexa Top 10,000 websites. We will periodically repeat this crawl and add new entries to the list which match our criteria. We categorized SWFs as fingerprinting SWFs if they were smaller than 5x5 pixels and called Flash's `enumerateFonts()` and `ExternalInterface` APIs to obtain a list of all fonts unique to the user’s machine. We categorized SWFs as "supercookie" SWFs if they were smaller than 5x5 pixels, called Flash’s `SharedObject` API, and contained the string "cookie". In future versions of Firefox, we will expand the list to cover more types of plugin content.

mozplugin-block.txt is a plain text list of suffix/prefix expressions as documented in Google's [Safe Browsing API Developer's Guide](https://developers.google.com/safe-browsing/v4/urls-hashing#canonicalization). Lines beginning with a `#` character are comments. The blocklist is imported into Mozilla's Shavar service and then distributed to Firefox clients (as Shavar table `mozplugin-block-digest256`).

### Domain blocklist ###

These blocklists control the automatic blockling of Flash from certain domains, which can be configured to be blocked only when in a 3rd-party context (i.e., subframe from a different origin), or also when in a 1st-party context (top-level webpage or any iframe). This blocking is controlled by the option "Block dangerous and intrusive Flash content" in the Plugins settings.

The 3rd-party domain blocklist (flashsubdoc.txt) is based in part on one which is Copyright 2010-2016 Disconnect, Inc., to whom we are most grateful. This file is licensed under the GNU General Public License version 3 (see LICENSE-GPL3).

### Infobar suppressing ###

This list contains websites that are not blocked from using Flash, but to which we'll avoid displaying the Flash infobar to the user. The user can still access the Flash content by clicking on a Flash element with a visible surface area, or by clicking on the Plugin icon in the URL bar.

## LICENSE ##

All files on this repository, with the exception of flashsubdoc.txt, are licensed under the Creative Commons CC0 1.0 Universal (see LICENSE-CC0). The file flashsubdoc.txt is licensed under the GPLv3 (see LICENSE-GPL3).