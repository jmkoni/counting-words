# counting-words

###Deployed at:
https://safe-tor-1782.herokuapp.com/

###Running locally:

Clone application then:

    rake db:create
    rake db:migrate
    rails s

###Problem Description:
Create a web-based word counting service, using the web app framework or the standard libraries of the language of your choice.  There should be an index page, a form page, and a result/form response page. If you want, the index page can contain the form page as well.

The form page should request a URL as the only field, with some amount of validation.

The result/form response page should:
* Check to see if this URL has previously been scanned,  If so, display the stored results from the previous scan (see below).
* Otherwise, read the URL and provide a list of the 10 most common words that appear as text at that URL with the number of times they appear and store the result.

The index page should list the previously scanned URLs, the most common word at the URL and the number of times it appeared, and a way to get to the result page for that particular URL.

###Assumptions made:
To be useful, I excluded all common English words (see `ScrapedURL::COMMON_WORDS`). I also excluded numbers, since this was only looking for words. However, if looking over a code blog, it will still include tags/code like 'li'.

