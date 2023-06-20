import UIKit

struct Contact {
    let name: String
    let phoneNumber: String
    let avatarURL: URL?
    
    init(
        name: String,
        phoneNumber: String,
        avatarURL: URL? = nil
    ){
        self.name = name
        self.phoneNumber = phoneNumber
        self.avatarURL = avatarURL
    }
}
