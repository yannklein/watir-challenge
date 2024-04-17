# Here is the website we will try to scrape. Open it on Chrome to see how it looks like.
url = "https://yannklein.github.io/react-workshop-ref/"

# First try: with Nokogiri
# TODO: use Nokogiri to display what is in the body of the "Matcha and keyboard" html page.

require 'open-uri'
require 'nokogiri'

raw_html = URI.open(url)
doc = Nokogiri::HTML.parse(raw_html)

p doc.search("title").text.strip
p doc.search("body").text.strip


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
require 'watir'
browser = Watir::Browser.new
browser.goto(url)

# 3. Display the title and body content with Watir, what do you notice?
p browser.title
p browser.body.text

# 4. You are right! The body content is still empty. The reason is because we get its content before 
#    the page JS actually populate it (with React). We need to tell Watir to wait for some content to
#    show up!
#    Try to wait until at least an element with a class: 'cafe-card' is present on the page. (Hint: Watir::Wait.until and .present?)
#    Reference: https://www.rubydoc.info/gems/watir/Watir%2FWait.until
#    Then check the body content again.
Watir::Wait.until { browser.element(class: "cafe-card").present? }
p browser.body.text


# We finally got some data! Now, find the appropriate html elements containing the cafe names and stor them in an array. Display the array
p browser.h5s.map { |el| el.text}

# 5. Optional: make Watir click on the "Show the map" link of the 3 first card and try to get 
#    the Google maps review score for each cafe!
cafe_infos = browser.elements(class: "cafe-card")[..3].map do |card|
  title = card.h5.text
  gmaps_url = card.link.href
  {title: title, gmaps_url: gmaps_url}
end

cafe_infos.each do |cafe_info|
  browser.goto(cafe_info[:gmaps_url])
  Watir::Wait.until { browser.span(class: 'MW4etd').present? }
  cafe_info[:review_score] = browser.span(class: 'MW4etd').text
end

puts cafe_infos