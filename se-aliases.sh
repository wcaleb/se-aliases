# Search Engine Aliases
# by W. Caleb McDaniel, 2012

# The idea for this was suggested by Lincoln Mullen's post on
# configuring Chrome for specific search engines. I source this file 
# in my bashrc, and then use DTerm or the Terminal to quickly search. 
# This method makes Mullen's ideas browser-independent. Mullen also
# suggested some changes to the functions that make these work in any
# Unix environment too. Feel free to fork and use however you see fit.
#
# For more context, see:
# http://chronicle.com/blogs/profhacker/how-to-hack-urls-for-faster-searches-in-your-browser/42304


# To prepare plain-text queries for URLs, use python.
# http://ruslanspivak.com/2010/06/02/urlencode-and-urldecode-from-a-command-line/

alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

# Your academic library probably has a proxy system. For example, to 
# access JSTOR through Brandeis University's libraries, the url
#      http://www.jstor.org/
# becomes http://www.jstor.org.resources.library.brandeis.edu/
# Fill in the variable below with the value of your proxy. Using the 
# example above:
#      myproxy='.resources.library.brandeis.edu'
#  Then in the # search functions which you want to run through the 
#  library proxy, add the following:
#     http://www.jstor.org$myproxy/
# If you don't have a library proxy, leave the string empty:
# 	  myproxy=''
# Even the searches which other users have provided will still work
# without a proxy.

myproxy='.ezproxy.rice.edu'


# Different OSes have different commands for opening a URL in a browser 
# from a command line. Change the alias below to the proper command for 
# your OS. The default 'open' works on Macs. On Ubuntu the command would 
# be 'gnome-open' instead. You could also use this alias to change the 
# browser that opened the URL. And if you wished to change the flags for 
# the open command, you could do it in one place by changing the alias.

alias searchopen='open'


# If you want to see a list of all the search engines available using
# these functions, this alias allows you to type "searchlist" at the
# command-line. You'll also need to set the SEPATH variable to
# the location of this file on your computer.

SEPATH=$HOME/.bashfiles/se-aliases/se-aliases.sh
alias searchlist="awk '/^function/ {print \$2}' $SEPATH | sort" 

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
	searchopen "http://scholar.google.com$myproxy/scholar?hl=en&q=`urlencode "$1"`"
}

function books
{
	searchopen "http://books.google.com/books?hl=en&q=`urlencode "$1"`"
}

# Searches for media type "texts" in archive.org
function archiveorg
{
	searchopen "http://archive.org/search.php?query=`urlencode "$1"`%20AND%20mediatype%3Atexts"
}

function images
{
	searchopen "http://images.google.com/images?q=`urlencode "$1"`"
}

function jstor
{
	searchopen "http://www.jstor.org$myproxy/action/doBasicSearch?Query=`urlencode "$1"`"
}

function clio
{
	searchopen "http://web.ebscohost.com$myproxy/ehost/results?&bquery=`urlencode "$1"`&bdata=JmRiPWFobCZ0eXBlPTAmc2l0ZT1laG9zdC1saXZlJnNjb3BlPXNpdGU%3d"
}

function anb
{
	searchopen "http://www.anb.org$myproxy/articles/asearch.html?which_index=both&meta-dc=10&func=simple_search&field-Name=`urlencode "$1"`&Login=Quick+Search"
}

function amazon
{
	searchopen "http://www.amazon.com/s/?url=search-alias%3Daps&field-keywords=`urlencode "$1"`"
}

function imdb
{
	searchopen "http://www.imdb.com/find?q=`urlencode "$1"`&s=all"
}

function spanish
{
	searchopen "http://translate.google.com/#en/es/`urlencode "$1"`"
}

function english
{
	searchopen "http://translate.google.com/#es/en/`urlencode "$1"`"
}

function wikipedia
{
	searchopen "http://en.wikipedia.org/w/index.php?search=`urlencode "$1"`"
}

# Search Flickr for Creative Commons pictures
# http://yubnub.org/kernel/man?args=fliccr
# s=int sorts the results by "interesting"
function flickr
{
	searchopen "http://flickr.com/search/?q=`urlencode "$1"`&l=cc&ss=1&ct=6&s=int"
}

function youtube
{
	searchopen "http://www.youtube.com/results?search_query=`urlencode "$1"`"
}

# Note: Handbook of Texas Online uses %20 instead of + for spaces
function hotx
{
	searchopen "http://www.tshaonline.org/search/node/`echo "$1" | sed 's/ /%20/g'`"
}

function stackover
{
	searchopen "http://stackoverflow.com/search?q=`urlencode "$1"`"
}

function superuser
{
	searchopen "http://superuser.com/search?q=`urlencode "$1"`"
}

function wikipedia
{
	searchopen "http://en.wikipedia.org/wiki/Special:Search?search=`urlencode "$1"`"
}

# Bookfinder for book price comparison
function bookfinder   
{
	searchopen "http://www.bookfinder.com/search/?keywords=`urlencode "$1"`&st=xl&ac=qr&src=opensearch"
}

function oed
{
	searchopen "http://www.oed.com$myproxy/search?searchType=dictionary&q=`urlencode "$1"`&_searchBtn=Search"
}

# Library of Congress catalog
function lcongress    
{
	searchopen "http://catalog.loc.gov/vwebv/search?searchArg=`urlencode "$1"`&searchCode=GKEY%5E*&searchType=0&recCount=100&sk=en_US"
}

# Amazon Video on Demand
function vod
{
	searchopen "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Damazontv&field-keywords=`urlencode "$1"`&x=0&y=0"
}

function profhacker
{
	searchopen "http://chronicle.com$myproxy/search/?contextId=5&searchQueryString=`urlencode "$1"`&facetName%5B0%5D=content&facetName%5B1%5D=blog&facetValue%5B0%5D=blogPost&facetValue%5B1%5D=27&facetCaption%5B0%5D=Blog+Post&facetCaption%5B1%5D=ProfHacker&omni_mfs=true"
}


function google
{
	searchopen "http://www.google.com/search?q=`urlencode "$1"`"
}

#Christian Classics Ethereal Library
function ccel
{
	searchopen "http://www.ccel.org/search?qu=`urlencode "$1"`"
}

function cnet
{
	searchopen "http://cnet.com/1770-5_1-0-{startPage?}.html?query=`urlencode "$1"`&tag=opensearch"
}

# ESV Bible
function esv
{
	searchopen "http://www.esvbible.org/search/`urlencode "$1"`/"
}

# WordPress codex
function wordpress
{
	searchopen "http://wordpress.org/search/do-search.php?search=`urlencode "$1"`"
}

function worldcat
{
	searchopen "http://www.worldcat.org$myproxy/search?q=`urlencode "$1"`"
}

function docsouth
{
	searchopen "http://www.googlesyndicatedsearch.com/u/docsouth?q=`urlencode "$1"`&sa=Search"
}

# The following search engines are probably useful only to the author.
# You can delete to the end of the file without breaking anything.

# This is the engine for the Rice University library's OneSearch tool.
# It may not work universally.
function ebsco
{
	searchopen "http://ehis.ebscohost.com/eds/results?bquery=`urlencode "$1"`&bdata=JnR5cGU9MCZzaXRlPWVkcy1saXZlJnNjb3BlPXNpdGU%3d"
}

# Rice University online directory
function ricedir
{
	searchopen "http://search.rice.edu/html/people/p/0/0/?q=`urlencode "$1"`"
}

# Rice University website
function rice
{
	searchopen "http://search.rice.edu/?q=`urlencode "$1"`"
}

# Rice University library website
function fondren
{
	searchopen "http://library.rice.edu/search/?SearchableText=`urlencode "$1"`"
}
