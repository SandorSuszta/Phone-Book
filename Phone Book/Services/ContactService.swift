import Foundation

final class ContactService {
    
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    private var contactsDirectory: URL { documentsDirectory.appendingPathComponent("Contacts")
    }
    
    //MARK: -  API
    
    
    func loadAllContacts() -> [User] {
        var contacts: [User] = []
        
        let fileManager = FileManager.default
        do {
            let fileList = try fileManager.contentsOfDirectory(at: contactsDirectory, includingPropertiesForKeys: nil)
            
            for fileURL in fileList {
                if let contactDict = NSDictionary(contentsOf: fileURL) as? [String: Any],
                   let firstName = contactDict["firstName"] as? String,
                   let phoneNumber = contactDict["phoneNumber"] as? String {
                    let contact = User(name: firstName, phoneNumber: phoneNumber)
                    contacts.append(contact)
                }
            }
        } catch {
            print("Error loading contacts: \(error.localizedDescription)")
        }
        
        return contacts
    }

    
    func saveContact(contact: User) {
        
        if !FileManager.default.fileExists(atPath: contactsDirectory.path) {
            do {
                try FileManager.default.createDirectory(at: contactsDirectory, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error creating folder: \(error.localizedDescription)")
                return
            }
        }
        
        let filename = "\(UUID().uuidString).plist"
        let fileURL = contactsDirectory.appendingPathComponent(filename)
        
        let contactDict: [String: Any] = [
            "firstName": contact.name,
            "phoneNumber": contact.phoneNumber
        ]
        
        let plistData = NSDictionary(dictionary: contactDict)
        plistData.write(to: fileURL, atomically: true)
    }
}
