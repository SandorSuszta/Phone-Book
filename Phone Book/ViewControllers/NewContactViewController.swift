import UIKit

final class NewContactViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(chooseAvatar))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        return label
    }()
    
    private var nameTextField = {
        let textField = UITextField()
        textField.placeholder = "e.g. Sam"
        return textField
    }()
    
    private var phoneTextField = {
        let textField = UITextField()
        textField.placeholder = "e.g 447491927343"
        return textField
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
    }
}

//MARK: - Private methods

extension NewContactViewController {
    
    private func setupVC() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavBar() {
        title = "Add new contact"
    }
}

//MARK: - Selectors

extension ContactsViewController {
    
}

//MARK: - Setub Views

extension NewContactViewController {
    
    private func setupViewHierarchy() {
        view.addSubview(avatarImageView)
            view.addSubview(nameLabel)
            view.addSubview(nameTextField)
            view.addSubview(phoneLabel)
            view.addSubview(phoneTextField)
    }
    
    private func setupConstraints() {
        
    }
}
