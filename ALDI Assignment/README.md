# ALDI Assignment App

Try to cover all the functional requirmnets.

## Features

- Displays a list of the top ten ranked cryptocurrencies.
- Shows key information for each cryptocurrency, including name, symbol, price, and change percentage.
- Users can tap on a cryptocurrency to view detailed information, including price, change percentage, market capitalization, exchange volume, and supply.
- Supports asynchronous loading and refreshing of cryptocurrency data.
- Provides formatted abbreviations for decimal values (K for thousands, M for millions, B for billions).
- Utilizes MVVM architecture for clean separation of concerns.
- Implements async/await for efficient asynchronous programming.
- Uses SwiftUI for building the user interface.

## Installation and Setup

1. Open the project in Xcode 15.2 or later.

2. Build and run the project on a simulator or a physical device running iOS 17.2 or later.

## Dependencies

The Crypto Market App has no external dependencies beyond standard iOS SDK frameworks.

## Usage

Upon launching the app, users will see a list of the top ten ranked cryptocurrencies. Each list item displays key information about the cryptocurrency, including name, symbol, price, and change percentage.

Users can tap on a cryptocurrency to view detailed information about it. The detail view includes additional information such as market capitalization, exchange volume, and supply.

## Unit Testing

The project includes unit tests to ensure the correctness of key components such as view models and views. These tests cover various scenarios, including successful data fetching, error handling, and computed property correctness.

To run the unit tests, select the appropriate test target in Xcode and execute the tests.

## improvements

- SwiftUI part could be improved. 
- Code could be done in more abstraction and clean way.
- Error handling is missing.
- Design is not implimented pixel perfectly.
- Constant such as borders, margins and font could be handled in separate constant file that acts as source of truth for design.
- Font should be in separate group like Assets but some how there is a bug in loading them from some other resource path. 
