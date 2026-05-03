import Foundation

struct AuthenticatedUser: Codable, Equatable {
    let fullName: String
    let email: String
    let phoneNumber: String?
}
