import SwiftUI

enum AppConstants {
    enum General {
        static let emptyString = ""
        static let defaultCustomerName = "Customer"
    }

    enum Auth {
        static let signInTitle = "Sign In"
        static let signUpTitle = "Sign Up"
        static let signInSubtitle = "Access your accounts securely."
        static let signUpSubtitle = "Create your account to start managing your finances."
        static let loadingTitle = "Please wait..."
        static let newUserPrompt = "I'm a new user."
        static let existingUserPrompt = "Already have an account."
        static let fullNameTitle = "Full Name"
        static let fullNamePlaceholder = "Aimal Naseem"
        static let fullNameValidation = "Enter your full name."
        static let fullNameIcon = "person"
        static let phoneNumberTitle = "Phone Number"
        static let phoneNumberPlaceholder = "+000 00 00 000"
        static let phoneNumberValidation = "Enter your phone number."
        static let phoneNumberIcon = "phone"
        static let emailTitle = "Email Address"
        static let emailPlaceholder = "aimalnaseem@gmail.com"
        static let emailValidation = "Enter a valid email address."
        static let emailIcon = "envelope"
        static let passwordTitle = "Password"
        static let passwordPlaceholder = "Enter password"
        static let passwordValidation = "Password must be at least \(Validation.minimumPasswordLength) characters."
        static let passwordIcon = "lock"
        static let passwordVisibleIcon = "eye.slash"
        static let passwordHiddenIcon = "eye"
        static let completeFieldsValidation = "Complete all required fields."
        static let backIcon = "chevron.left"
        static let accountNotFoundError = "No account found for this email. Create a new account first."
        static let invalidCredentialsError = "The email or password entered is incorrect."
        static let accountAlreadyExistsError = "An account with this email already exists."
    }

    enum Validation {
        static let minimumPasswordLength = 6
        static let requiredEmailPartCount = 2
        static let emailDomainSeparator = "."
        static let emailSeparator = "@"
    }

    enum Storage {
        static let registeredUserKey = "auth.registeredUser"
        static let sessionUserKey = "auth.sessionUser"
    }

    enum Networking {
        static let accountsPath = "/accounts"
        static let authDelayMilliseconds = 250
    }

    enum Onboarding {
        static let nextButtonTitle = "Next"
        static let activeIndicatorID = "activeIndicator"
        static let inactiveIndicatorHex = "#D7DCE4"
    }

    enum Dashboard {
        static let homeTabTitle = "Home"
        static let cardsTabTitle = "My Cards"
        static let statisticsTabTitle = "Statistics"
        static let settingsTabTitle = "Settings"
        static let homeTabIcon = "house"
        static let cardsTabIcon = "creditcard"
        static let statisticsTabIcon = "chart.pie"
        static let settingsTabIcon = "gearshape"
        static let cardsPlaceholderSubtitle = "Card management will appear here."
        static let statisticsPlaceholderSubtitle = "Spending analytics will appear here."
        static let signOutTitle = "Sign Out"
        static let welcomeBackTitle = "Welcome back,"
        static let recentTransactionsTitle = "Recent Transactions"
        static let seeAllTitle = "See All"
        static let userAvatarIcon = "person.crop.circle.fill"
        static let cardChipIcon = "simcard"
        static let cardContactlessIcon = "wave.3.right"
        static let cardExpiryTitle = "Expiry Date"
        static let cardSecurityCodeTitle = "CVV"
        static let cardBrandTitle = "Mastercard"
        static let sampleUserName = "Aimal Naseem"
        static let sampleCardholderName = "AR Jonson"
        static let sampleCardNumber = "4562  1122  4595  7852"
        static let sampleExpiryDate = "24/2000"
        static let sampleCVV = "6986"
    }

    enum Cards {
        static let allCardsTitle = "All Cards"
        static let addNewCardTitle = "Add New Card"
        static let addCardButtonTitle = "Add Card"
        static let cardholderNameTitle = "Cardholder Name"
        static let expiryDateTitle = "Expiry Date"
        static let cardSecurityCodeTitle = "4-digit CVV"
        static let cardNumberTitle = "Card Number"
        static let cardholderIcon = "person.circle"
        static let cardNumberIcon = "creditcard"
        static let cardChipIcon = "simcard"
        static let cardContactlessIcon = "wave.3.right"
        static let cardBackgroundIcon = "map"
        static let backIcon = "chevron.left"
        static let addIcon = "plus"
        static let mastercardTitle = "Mastercard"
        static let visaTitle = "VISA"
        static let sampleCardholderName = "Aimal N"
        static let sampleCardNumber = "4562 1122 4595 7852"
        static let displayCardNumber = "4562   1122   4595   7852"
        static let sampleExpiryDate = "24/2000"
        static let addCardExpiryDate = "09/06/2024"
        static let sampleCVV = "6986"
    }

    enum Features {
        static let paymentsTitle = "Payments"
        static let transactionsTitle = "Transactions"
    }
}
