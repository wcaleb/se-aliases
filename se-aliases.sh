# Search Engine Aliases
# by W. Caleb McDaniel, 2012

# The idea for this was suggested by Lincoln Mullen's post on
# configuring Chrome for specific search engines. I source this file 
# in my bashrc, and then use DTerm or the Terminal to quickly search. 
# This method makes Mullen's ideas browser-independent on the Mac.
# Search engines can be tied to specific browsers using the -a flag for
# the open command. Feel free to fork and use however you see fit.
#
# For more context, see:
# http://chronicle.com/blogs/profhacker/how-to-hack-urls-for-faster-searches-in-your-browser/42304


# To prepare plain-text queries for URLs, use python.
# http://ruslanspivak.com/2010/06/02/urlencode-and-urldecode-from-a-command-line/

alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

# Use these at the command line by typing the function's name and the
# query. Queries with more than one word should be enclosed in double
# quotes. Literal quotes can be added to queries with the escape slash.
#
# E.g.
#
# scholar abolitionists
# scholar "American abolitionists"
# scholar "\"American abolitionists\""

function scholar
{
	open "http://scholar.google.com/scholar?hl=en&q=`urlencode "$1"`"
}

function books
{
	open "http://books.google.com/books?hl=en&q=`urlencode "$1"`"
}

function images
{
	open "http://images.google.com/images?q=`urlencode "$1"`"
}

function amazon
{
	open "http://www.amazon.com/s/?url=search-alias%3Daps&field-keywords=`urlencode "$1"`"
}

function imdb
{
	open "http://www.imdb.com/find?q=`urlencode "$1"`&s=all"
}

function spanish
{
	open "http://translate.google.com/#en/es/`urlencode "$1"`"
}

function english
{
	open "http://translate.google.com/#es/en/`urlencode "$1"`"
}

function wikipedia
{
	open "http://en.wikipedia.org/w/index.php?search=`urlencode "$1"`"
}

# Search Flickr for Creative Commons pictures
# http://yubnub.org/kernel/man?args=fliccr
# s=int sorts the results by "interesting"
function flickr
{
	open "http://flickr.com/search/?q=`urlencode "$1"`&l=cc&ss=1&ct=6&s=int"
}

function youtube
{
	open "http://www.youtube.com/results?search_query=`urlencode "$1"`"
}

# Note: Handbook of Texas Online uses %20 instead of + for spaces
function hotx
{
	open "http://www.tshaonline.org/search/node/`echo "$1" | sed 's/ /%20/g'`"
}

function stack
{
	open "http://stackoverflow.com/search?q=`urlencode "$1"`"
}

function super
{
	open "http://superuser.com/search?q=`urlencode "$1"`"
}

# The rest of these probably will not work for everyone.

function ebsco
{
	open "http://ehis.ebscohost.com/eds/results?bquery=`urlencode "$1"`&bdata=JnR5cGU9MCZzaXRlPWVkcy1saXZlJnNjb3BlPXNpdGU%3d"
}

function clio
{
	open "http://web.ebscohost.com.ezproxy.rice.edu/ehost/results?&bquery=`urlencode "$1"`&bdata=JmRiPWFobCZ0eXBlPTAmc2l0ZT1laG9zdC1saXZlJnNjb3BlPXNpdGU%3d"
}

function anb
{
	open "http://www.anb.org.ezproxy.rice.edu/articles/asearch.html?which_index=both&meta-dc=10&func=simple_search&field-Name=`urlencode "$1"`&Login=Quick+Search"
}

function jstor
{
	open "http://www.jstor.org/action/doBasicSearch?Query=`urlencode "$1"`"
}
