import SwiftUI

enum AppDimensions {
    enum PrimaryButton {
        static let titleFontSize: CGFloat = 20
        static let height: CGFloat = 56
        static let cornerRadius: CGFloat = 16
    }

    enum AuthInputField {
        static let containerSpacing: CGFloat = 10
        static let titleFontSize: CGFloat = 14
        static let contentSpacing: CGFloat = 12
        static let iconFontSize: CGFloat = 16
        static let iconWidth: CGFloat = 18
        static let textFontSize: CGFloat = 18
        static let bottomPadding: CGFloat = 10
        static let dividerHeight: CGFloat = 1
    }

    enum AuthView {
        static let backButtonFontSize: CGFloat = 18
        static let backButtonSize: CGFloat = 44
        static let backButtonTopPadding: CGFloat = 12
        static let titleSectionSpacing: CGFloat = 12
        static let titleFontSize: CGFloat = 32
        static let subtitleFontSize: CGFloat = 15
        static let subtitleLineSpacing: CGFloat = 4
        static let titleTopPadding: CGFloat = 48
        static let formSpacing: CGFloat = 18
        static let formTopPadding: CGFloat = 36
        static let errorFontSize: CGFloat = 14
        static let errorTopPadding: CGFloat = 18
        static let submitTopPadding: CGFloat = 36
        static let switchPromptSpacing: CGFloat = 6
        static let switchPromptFontSize: CGFloat = 16
        static let switchPromptTopPadding: CGFloat = 28
        static let horizontalPadding: CGFloat = 20
        static let bottomPadding: CGFloat = 34
    }

    enum OnboardingPageIndicator {
        static let spacing: CGFloat = 6
        static let inactiveIndicatorWidth: CGFloat = 6
        static let inactiveIndicatorHeight: CGFloat = 6
        static let activeIndicatorWidth: CGFloat = 18
        static let activeIndicatorHeight: CGFloat = 6
        static let itemWidth: CGFloat = 18
        static let itemHeight: CGFloat = 6
    }

    enum OnboardingPageView {
        static let topSpacerMinLength: CGFloat = 36
        static let imageMaxWidth: CGFloat = 300
        static let imageMaxHeight: CGFloat = 300
        static let bottomSpacerMinLength: CGFloat = 24
    }

    enum OnboardingView {
        static let contentSpacing: CGFloat = 28
        static let textSpacing: CGFloat = 12
        static let titleFontSize: CGFloat = 28
        static let subtitleFontSize: CGFloat = 16
        static let subtitleLineSpacing: CGFloat = 4
        static let textHorizontalPadding: CGFloat = 24
        static let horizontalPadding: CGFloat = 20
        static let topPadding: CGFloat = 16
        static let bottomPadding: CGFloat = 34
    }

    enum HeaderView {
        static let containerSpacing: CGFloat = 14
        static let avatarFontSize: CGFloat = 34
        static let avatarSize: CGFloat = 56
        static let textSpacing: CGFloat = 4
        static let subtitleFontSize: CGFloat = 16
        static let titleFontSize: CGFloat = 31
    }

    enum CardView {
        static let cornerRadius: CGFloat = 30
        static let borderLineWidth: CGFloat = 1
        static let contentSpacing: CGFloat = 24
        static let chipFontSize: CGFloat = 22
        static let contactlessFontSize: CGFloat = 18
        static let cardNumberFontSize: CGFloat = 22
        static let cardNumberTracking: CGFloat = 1.1
        static let detailsSpacing: CGFloat = 14
        static let cardholderFontSize: CGFloat = 22
        static let metaSpacing: CGFloat = 30
        static let contentPadding: CGFloat = 24
        static let cardHeight: CGFloat = 220
        static let metaTextSpacing: CGFloat = 6
        static let metaTitleFontSize: CGFloat = 12
        static let metaValueFontSize: CGFloat = 22
        static let brandSpacing: CGFloat = 6
        static let brandCircleSize: CGFloat = 26
        static let brandOffset: CGFloat = 8
        static let brandFrameWidth: CGFloat = 50
        static let brandFrameHeight: CGFloat = 26
        static let brandFontSize: CGFloat = 12
    }

    enum DashboardView {
        static let contentSpacing: CGFloat = 28
        static let horizontalPadding: CGFloat = 16
        static let topPadding: CGFloat = 12
        static let bottomPadding: CGFloat = 120
        static let settingsSpacing: CGFloat = 24
        static let settingsTitleFontSize: CGFloat = 32
        static let settingsPadding: CGFloat = 24
        static let placeholderSpacing: CGFloat = 12
        static let placeholderTitleFontSize: CGFloat = 32
        static let placeholderSubtitleFontSize: CGFloat = 16
        static let placeholderPadding: CGFloat = 24
        static let tabItemSpacing: CGFloat = 6
        static let selectedBackgroundCornerRadius: CGFloat = 16
        static let selectedBackgroundWidth: CGFloat = 40
        static let selectedBackgroundHeight: CGFloat = 30
        static let tabIconFontSize: CGFloat = 20
        static let tabLabelFontSize: CGFloat = 13
        static let tabBarHorizontalPadding: CGFloat = 18
        static let tabBarTopPadding: CGFloat = 14
        static let tabBarBottomPadding: CGFloat = 18
    }

    enum TransactionListView {
        static let containerSpacing: CGFloat = 18
        static let titleFontSize: CGFloat = 24
        static let actionFontSize: CGFloat = 16
        static let listSpacing: CGFloat = 6
    }

    enum QuickActionsView {
        static let containerSpacing: CGFloat = 18
        static let itemSpacing: CGFloat = 10
        static let iconContainerSize: CGFloat = 62
        static let iconFontSize: CGFloat = 24
        static let titleFontSize: CGFloat = 15
    }

    enum TransactionRowView {
        static let containerSpacing: CGFloat = 14
        static let iconContainerSize: CGFloat = 46
        static let iconFontSize: CGFloat = 18
        static let textSpacing: CGFloat = 4
        static let titleFontSize: CGFloat = 17
        static let subtitleFontSize: CGFloat = 14
        static let amountFontSize: CGFloat = 17
        static let verticalPadding: CGFloat = 10
    }

    enum CardsView {
        static let horizontalPadding: CGFloat = 20
        static let topPadding: CGFloat = 18
        static let bottomPadding: CGFloat = 34
        static let headerHeight: CGFloat = 44
        static let titleFontSize: CGFloat = 18
        static let cardSpacing: CGFloat = 16
        static let addButtonBottomPadding: CGFloat = 24
        static let addButtonIconFontSize: CGFloat = 20
        static let addButtonSpacing: CGFloat = 10
    }

    enum AddCardView {
        static let horizontalPadding: CGFloat = 20
        static let topPadding: CGFloat = 18
        static let headerHeight: CGFloat = 44
        static let backButtonSize: CGFloat = 44
        static let backButtonFontSize: CGFloat = 18
        static let titleFontSize: CGFloat = 18
        static let contentSpacing: CGFloat = 28
        static let fieldSpacing: CGFloat = 20
        static let rowSpacing: CGFloat = 96
    }

    enum PaymentCardView {
        static let cornerRadius: CGFloat = 22
        static let height: CGFloat = 198
        static let contentPadding: CGFloat = 20
        static let topIconSize: CGFloat = 24
        static let numberFontSize: CGFloat = 25
        static let cardholderFontSize: CGFloat = 15
        static let metaTitleFontSize: CGFloat = 10
        static let metaValueFontSize: CGFloat = 14
        static let brandFontSize: CGFloat = 14
        static let visaFontSize: CGFloat = 20
        static let contentSpacing: CGFloat = 18
        static let metaSpacing: CGFloat = 30
        static let brandCircleSize: CGFloat = 19
        static let brandCircleOffset: CGFloat = 6
        static let brandMarkWidth: CGFloat = 38
        static let brandMarkHeight: CGFloat = 19
        static let backgroundIconSize: CGFloat = 120
    }

    enum CardFormField {
        static let titleFontSize: CGFloat = 15
        static let valueFontSize: CGFloat = 15
        static let iconFontSize: CGFloat = 18
        static let iconWidth: CGFloat = 22
        static let contentSpacing: CGFloat = 14
        static let titleBottomPadding: CGFloat = 10
        static let dividerTopPadding: CGFloat = 12
        static let dividerHeight: CGFloat = 1
    }
}
