# counting-words
Create a web-based word counting service, using the web app framework or the standard libraries of the language of your choice.  There should be an index page, a form page, and a result/form response page. If you want, the index page can contain the form page as well.

The form page should request a URL as the only field, with some amount of validation.

The result/form response page should:
* Check to see if this URL has previously been scanned,  If so, display the stored results from the previous scan (see below).
* Otherwise, read the URL and provide a list of the 10 most common words that appear as text at that URL with the number of times they appear and store the result.

The index page should list the previously scanned URLs, the most common word at the URL and the number of times it appeared, and a way to get to the result page for that particular URL.

We are not looking for a designer, but a bit of CSS to make the pages look better than the default would be appreciated! It's also a generally good idea to make sure your code will run, and that we know how to run it. Please also include some tests to verify things work without running the whole web application.

Please deliver your code in the form of a tarball containing a directory or a Git repository. A link to a public repository will also work.

This application is found at https://safe-tor-1782.herokuapp.com/