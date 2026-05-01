import Foundation

@Observable
final class OnboardingViewModel {
    let pages: [OnboardingPage] = [
        OnboardingPage(
            imageName: "onboarding_payment_easy",
            title: "Paying for Everything is\nEasy and Convenient",
            subtitle: "Built-in Fingerprint, face recognition\nand more, keeping you completely safe"
        ),
        OnboardingPage(
            imageName: "onboarding_secure_platform",
            title: "The most Secoure\nPlatform for Customer",
            subtitle: "Built-in Fingerprint, face recognition\nand more, keeping you completely safe"
        ),
        OnboardingPage(
            imageName: "onboarding_fastest_payment",
            title: "Fastest Payment in\nthe world",
            subtitle: "Integrate multiple payment methods\nto help you up the process quickly"
        )
    ]

    var currentPage = 0
    var showsAuth = false

    var currentContent: OnboardingPage {
        pages[currentPage]
    }

    func handleNext() {
        if currentPage < pages.count - 1 {
            currentPage += 1
        } else {
            showsAuth = true
        }
    }
}

struct OnboardingPage: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
}
