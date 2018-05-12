<p align="center">
  <img src="modern_v2/Assets/APEXCHANGE%20logo.png" alt="APEXCHANGE Logo" width="250" />
</p>

# APEXCHANGE

> This repository tracks the evolution of the APEXCHANGE platform.
> * **legacy_v1**: The original iOS application.
> * **modern_v2**: The completely redesigned SwiftUI modern version.


APEXCHANGE is an iOS mobile application built with Swift that facilitates currency exchange deals and bidding. 

## Features
- **User Accounts:** Secure login and account management.
- **Currency Exchange Deals:** Create, view, and manage currency exchange deals.
- **Bidding System:** Make bids on available deals and view accepted bids.
- **Supported Currencies:** USD, NGN, GBP, EUR, CAD.
- **Live Exchange Rates:** Fetch current exchange rates for deals.

## Technical Details
- **Platform:** iOS (Deployment Target: 10.0)
- **Language:** Swift
- **Dependency Manager:** CocoaPods

### Dependencies
- `libPhoneNumber-iOS` (~> 0.8)
- `ObjectMapper` (~> 2.2)

## API Integration
The app communicates with the APEXCHANGE backend API (`https://api.apexchange.com/v1/`) for real-time data on deals, exchange rates, and user authentication.

## Author
Bobby Laleye
