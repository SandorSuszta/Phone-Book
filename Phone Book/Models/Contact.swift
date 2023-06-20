import UIKit

struct Contact {
    let id: String
    let name: String
    let phoneNumber: String
    let avatar: UIImage?
    
    init(
        id: String,
        name: String,
        phoneNumber: String,
        avatar: UIImage? = nil
    ){
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.avatar = avatar
    }
}
