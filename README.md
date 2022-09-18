# # Hacking With Swift - SwiftUI

This repository contains all the apps 📱 that I created while taking the **100 days of swiftUI** course from [HackingWithSwift](https://www.hackingwithswift.com/100/swiftui) website - definitely with my own twists 😁 - not just copy & paste Paul's Code.

I am trying to complete the course ASAP 🏃🏻, **My Approach -**
Watch all the videos 🎥 for a mini project and then build 🏗 an app that can be made using the concepts and learnings of the mini project :)

If stuck at any point - use official docs / stackoverflow / tech-twitter / reddit - try & avoid to re-watch the video !

## ## App 1 : WeSplit 🪙

Paul created a simple single screen app that takes user input (bill amount, number of people and tip %) to calculate the final bill amount for each person.

### ### Concepts Introduced in This App :

1.  Understanding the basic structure of a SwiftUI app
2.  Creating a form
3.  Adding a navigation bar
4.  Modifying program state
5.  Binding state to user interface controls
6.  Creating views in a loop
7.  Reading text from the user with TextField
8.  Creating pickers and sliders in a form
9.  Hiding the keyboard

### ### What I Created - SIP Returns Calculator

A simple single screen app where user inputs his / hers monthly SIP amount, time period in years and get the amount that they will finally get.

![myfile](./Documents/App%2001%20SIPReturnsCalculator/Demo_Light.gif)
![myfile](./Documents/App%2001%20SIPReturnsCalculator/Demo_Dark.gif)

---

## ## App 2 : Find The Coin

**Find The Coin** is a fun trivia game about crypto coins and tokens. Play the game and see how many coins / tokens you can guess correctly, but beware, you get only 3 lives!

### ### Demo

![Demo Vide](./Documents/App%2002%20FindTheCoin/FindTheCoin.gif)

### ### Challenges faced

1. Data Collection
   - Could not find a single place from where I could download logos for crypto coins and tokens in desired format (PNG and no background)
   - So decided to scrape data from some website. Found one website but the website was made using some framework like React because of which its `HTML` was not available at source - hence `beautifoulsoup` was not an option.
   - I then used `JS` inside browser's console to target all divs with a certain class name and then extracted the inner text of these
     divs in a file
   - File contained names of coin as - <coin-name-coinSymbol>
   - Created URL from these names and download images using `Py`'s `request` package
   - Then finally used appicon.com to create 2x and 3x images :)

### ### Concepts learnt from this poject

1. Stacks - ZStack, VStack, HStack
2. Spacer and Group views
3. Background - Gradient, Agular and using Material Styleed backgrounds
4. Alert
5. Programatically closing the app
6. Creating time delay
7. SF Symbols

### ### Improvements

1. In the alert view
   - Remove / Hide the cancel button
   - Show Quit and Continue button side-by-side, HStack not working :(
