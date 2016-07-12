# Firefox plugin blocklist

Firefox uses this plugin blocklist to determine which plugin content should be prevented from loading. See [Firefox bug 1237198](https://bugzilla.mozilla.org/show_bug.cgi?id=1237198) for more information.

This blocklist is small and covers some Flash SWF files. The criteria for adding content to the blocklist are:

* Blocking the content will not be noticeable to the Firefox user.
* It is possible to reimplement the basic functionality of the content in HTML without Flash.

To create the blocklist, we used a web crawler to analyze the SWFs on the home pages of the Alexa Top 10,000 websites. We will periodically repeat this crawl and add new entries to the list which match our criteria. We categorized SWFs as fingerprinting SWFs if they were smaller than 5x5 pixels and called Flash's `enumerateFonts()` and `ExternalInterface` APIs to obtain a list of all fonts unique to the user’s machine. We categorized SWFs as "supercookie" SWFs if they were smaller than 5x5 pixels, called Flash’s `SharedObject` API, and contained the string "cookie". In future versions of Firefox, we will expand the list to cover more types of plugin content.

mozplugin-block.txt is a plain text list of suffix/prefix expressions as documented in Google's [Safe Browsing API Developer's Guide](https://developers.google.com/safe-browsing/v4/urls-hashing#canonicalization). Lines beginning with a `#` character are comments. The blocklist is imported into Mozilla's Shavar service and then distributed to Firefox clients (as Shavar table `mozplugin-block-digest256`).
