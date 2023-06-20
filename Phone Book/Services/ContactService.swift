import UIKit

final class ContactService {
    
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    private var contactsDirectory: URL { documentsDirectory.appendingPathComponent("Contacts")
    }
    
    private var photosDirectory: URL {
        documentsDirectory.appendingPathComponent("Photos")
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
                   let id = contactDict["id"] as? String {
                    let image = loadImage(name: id)
                    let contact = Contact(id: id, name: firstName, phoneNumber: phoneNumber, avatar: image)
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
        
        let filename = "\(contact.id).plist"
        let fileURL = contactsDirectory.appendingPathComponent(filename)
        
        let contactDict: [String: Any] = [
            "id": contact.id,
            "firstName": contact.name,
            "phoneNumber": contact.phoneNumber,
        ]
        
        let plistData = NSDictionary(dictionary: contactDict)
        plistData.write(to: fileURL, atomically: true)
        
        saveImage(name: contact.id, image: contact.avatar)
    }
    
    //MARK: - Private methods
    
    private func saveImage(name: String, image: UIImage?) {
        guard let image = image else { return }
        
        if !FileManager.default.fileExists(atPath: photosDirectory.path) {
            do {
                try FileManager.default.createDirectory(at: photosDirectory, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error creating photos directory: \(error.localizedDescription)")
                return
            }
        }
        
        let fileURL = photosDirectory.appendingPathComponent("\(name).jpg")
        if let imageData = image.jpegData(compressionQuality: 1) {
            do {
                try imageData.write(to: fileURL)
            } catch {
                print("Error saving image: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadImage(name: String) -> UIImage? {
        let fileURL = photosDirectory.appendingPathComponent("\(name).jpg")
        if let imageData = try? Data(contentsOf: fileURL) {
            return UIImage(data: imageData)
        }
        return nil
    }
}
