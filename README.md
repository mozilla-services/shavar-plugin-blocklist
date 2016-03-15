# Firefox plugin blocklist

Firefox uses this plugin blocklist to determine which plugin content should be prevented from loading. See [Firefox bug 1237198](https://bugzilla.mozilla.org/show_bug.cgi?id=1237198) for more information.

mozplugin-block.txt is a plain text list of Shavar suffix/prefix expressions as documented in Google's [Safe Browsing API Developer's Guide](https://developers.google.com/safe-browsing/developers_guide_v2#ListContents) (v2.2). Lines proceeded by a `#` character are comments. The blocklist is imported into Mozilla's Shavar service and then distributed to Firefox clients (as Shavar table `mozplugin-block-digest256`).
