# Advanced scraping: the WATIR challenge

## Challenge objectives

Time for advanced scraping! In this challenge, we’ll be using a real browser to scrape. You will see that this technique can be used to perform web automation (like submitting forms for instance!)

Some websites don’t work the way HTTP & HTML were intended to work. They use a technique called client-side rendering where the HTML starts almost empty, and all the DOM on the page is generated thanks to JavaScript (through React for example).

This means that if you use the traditional technique where you look into the HTML (like Nokogiri), you won’t find anything! You need the JavaScript to be fully rendered, and to do so you need a browser, like Chrome.

To drive Chrome from code, you need a pilot. We will use Watir. With Watir, you can navigate to a page, scroll down, click on a link, fill in a few inputs, click on a button, etc. Anything a human can do with a browser can also be done with Selenium.


## Instructions

We will scrape the data out of ["Matcha and keyboard" a website](https://yannklein.github.io/react-workshop-ref/) listing co-work cafes in Tokyo.

![alt text](image.png)

### First try: with Nokogiri

Go to `app.rb` and use Nokogiri to display the content of the `<title>` and the  `<body>` HTML elements of the "Matcha and keyboard" html page.

Ref: https://kitt.lewagon.com/knowledge/cheatsheets/nokogiri

You should see "React Workshop" from the `<title>` content, as expected.

But what is the `<body>` content? and why?

### Second try: with Watir

Install the watir gem, in the terminal: `gem install watir`

Install the terminal chromedriver:
- For Mac: `brew install --cask chromedriver`
- For Win: `sudo apt-get install chromium-chromedriver`

if troubles to use the above install it from the website: https://chromedriver.chromium.org/

Read the watir doc: https://www.rubyguides.com/2019/01/ruby-watir-gem/

Follow the instructions in `app.rb` and complete the code

### Solution

Check `app_solution.rb` for the complete challenge solution.