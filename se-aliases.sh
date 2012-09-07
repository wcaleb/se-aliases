# http://ruslanspivak.com/2010/06/02/urlencode-and-urldecode-from-a-command-line/

alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'

function scholar
{
	QUERY=$(urlencode "$1")
	open "http://scholar.google.com/scholar?hl=en&q=$QUERY"
}

function books
{
	QUERY=$(urlencode "$1")
	open "http://books.google.com/books?hl=en&q=$QUERY"
}

function images
{
	QUERY=$(urlencode "$1")
	open "http://images.google.com/images?q=$QUERY"
}

function images
{
	QUERY=$(urlencode "$1")
	open "http://images.google.com/images?q=$QUERY"
}

function amazon
{
	QUERY=$(urlencode "$1")
	open "http://www.amazon.com/s/?url=search-alias%3Daps&field-keywords=$QUERY"
}

