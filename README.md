se-aliases
==========

Most of this README is reproduced at <http://wcm1.web.rice.edu/search-engines-from-command-line.html>.

* * * *

This repo was inspired by Lincoln Mullen's post about [How to Hack URLs for Faster Searches in Your Browser](http://chronicle.com/blogs/profhacker/how-to-hack-urls-for-faster-searches-in-your-browser/42304). His tips showed how to add different search engines to Google Chrome, but it got me thinking about how I could do something similar from the command line. A few bash functions later, I now have an easy way to search Google Scholar, Flickr, IMDb, and even proprietary databases in my university library---all in the browser of my choice. For example, say I want to search Google Scholar. At the command line, I can now just type this:

	$ scholar "benedict anderson imagined communities"

And I get [this](http://scholar.google.com/scholar?hl=en&q=benedict+anderson+imagined+communities). Or if I want to search the Handbook of Texas Online, I type this:

	$ hotx "monroe edwards"

And I get [these results](http://www.tshaonline.org/search/node/monroe%20edwards). I can even use Google Translate to get Spanish translations of English words. I type:

	$ spanish "it's hot outside"

And I get a [quick translation](http://translate.google.com/#en/es/it%27s+hot+outside).

My method is basically to create a series of bash functions that use the built-in Mac OS X [open command](http://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man1/open.1.html). I've put these functions in a [GitHub repository](http://github.com/wcaleb/se-aliases). To use them yourself, just copy the `se-aliases.sh` file to your computer, and then add this line to your `.bashrc` file (or create one if you don't have one):

	$ source path/to/se-aliases.sh

* * * * *

P.S. I did a little googling after my initial post and found [someone else](http://www.if-not-true-then-false.com/2009/google-search-from-linux-and-unix-command-line/) doing exactly the same thing, with some slight variations in the way input is handled. Check it out!


