# Here is the website we will try to scrape. Open it on Chrome to see how it looks like.
url = "https://yannklein.github.io/react-workshop-ref/"

# First try: with Nokogiri
# TODO: use Nokogiri to display what is in the body of the "Matcha and keyboard" html page.

# YOUR CODE HERE


# Second try: with Watir
# TODO: use Watir to get the name of each cafe in the "Matcha and keyboard" page.

# 1. Setup:
# Install the watir gem, in the terminal: gem install watir
# Install the terminal chromedriver:
# - For Mac: brew install --cask chromedriver
# - For Win: sudo apt-get install chromium-chromedriver
# if troubles to use the above install it from the website: https://chromedriver.chromium.org/
# Read the watir doc: https://www.rubyguides.com/2019/01/ruby-watir-gem/

# 2. Require watir and open the website

# YOUR CODE HERE

# 3. Display the title and body content with Watir, what do you notice?

# YOUR CODE HERE

# 4. You are right! The body content is still empty. The reason is because we get its content before 
#    the page JS actually populate it (with React). We need to tell Watir to wait for some content to
#    show up!
#    Try to wait until at least an element with a class: 'cafe-card' is present on the page. (Hint: Watir::Wait.until and .present?)
#    Reference: https://www.rubydoc.info/gems/watir/Watir%2FWait.until
#    Then check the body content again.

# YOUR CODE HERE


# We finally got some data! Now, find the appropriate html elements containing the cafe names and stor them in an array. Display the array

# YOUR CODE HERE

# 5. Optional: make Watir click on the "Show the map" link of the 3 first card and try to get 
#    the Google maps review score for each cafe!

# YOUR CODE HERE