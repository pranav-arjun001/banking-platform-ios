import Foundation

struct AccountDTO: Decodable {
    let id: UUID
    let name: String
    let balance: Decimal

    func toDomain() -> Account {
        Account(id: id, name: name, balance: balance)
    }
}
