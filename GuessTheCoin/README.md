# Find The Coin

**Find The Coin** is a fun trivia game about crypto coins and tokens. Play the game and see how many coins / tokens you can guess correctly, but beware, you get only 3 lives!

## Demo

![Demo Vide](./Documents/FindTheCoin.gif)

## Challenges faced

1. Data Collection
   - Could not find a single place from where I could download logos for crypto coins and tokens in desired format (PNG and no background)
   - So decided to scrape data from some website. Found one website but the website was made using some framework like React because of which its `HTML` was not available at source - hence `beautifoulsoup` was not an option.
   - I then used `JS` inside browser's console to target all divs with a certain class name and then extracted the inner text of these
     divs in a file
   - File contained names of coin as - <coin-name-coinSymbol>
   - Created URL from these names and download images using `Py`'s `request` package
   - Then finally used appicon.com to create 2x and 3x images :)

## Concepts learnt from this poject

1. Stacks - ZStack, VStack, HStack
2. Spacer and Group views
3. Background - Gradient, Agular and using Material Styleed backgrounds
4. Alert
5. Programatically closing the app
6. Creating time delay
7. SF Symbols

## Improvements

1. In the alert view
   - Remove / Hide the cancel button
   - Show Quit and Continue button side-by-side, HStack not working :(
