import Foundation

struct LocalStore {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    func save(_ value: Data, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }

    func loadData(forKey key: String) -> Data? {
        userDefaults.data(forKey: key)
    }

    func removeValue(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
