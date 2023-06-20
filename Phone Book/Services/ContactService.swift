import Foundation

final class ContactService {
    
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    private var contactsDirectory: URL { documentsDirectory.appendingPathComponent("Contacts")
    }
    
    //MARK: -  API
    
    
    func loadAllContacts() -> [Contact] {
        var contacts: [Contact] = []
        
        let fileManager = FileManager.default
        do {
            let fileList = try fileManager.contentsOfDirectory(at: contactsDirectory, includingPropertiesForKeys: nil)
            
            for fileURL in fileList {
                if let contactDict = NSDictionary(contentsOf: fileURL) as? [String: Any],
                   let firstName = contactDict["firstName"] as? String,
                   let phoneNumber = contactDict["phoneNumber"] as? String,
                   let avatarURL = contactDict["avatarURL"] as? String {
                    let contact = Contact(name: firstName, phoneNumber: phoneNumber, avatarURL: URL(string: avatarURL))
                    contacts.append(contact)
                } else {
                    print("Error creating contact model")
                }
            }
        } catch {
            print("Error loading contacts: \(error.localizedDescription)")
        }
        
        return contacts
    }

    func saveContact(contact: Contact) {
        
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
            "phoneNumber": contact.phoneNumber,
            "avatarURL": contact.avatarURL?.absoluteString ?? ""
        ]
        
        let plistData = NSDictionary(dictionary: contactDict)
        plistData.write(to: fileURL, atomically: true)
    }
}
