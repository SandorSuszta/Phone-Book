import UIKit

struct User {
    let name: String
    let phoneNumber: String
    let avatar: UIImage
    
    init(
        name: String,
        phoneNumber: String,
        avatar: UIImage = UIImage(systemName: "person.crop.circle") ?? UIImage()
    ){
        self.name = name
        self.phoneNumber = phoneNumber
        self.avatar = avatar
    }
}
