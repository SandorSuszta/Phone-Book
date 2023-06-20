import UIKit

final class NewContactViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle.badge.plus")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        return label
    }()
    
    private let nameTextField = {
        let textField = UITextField()
        textField.placeholder = "e.g. Sam Smith"
        textField.backgroundColor = .systemBackground
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private let phoneTextField = {
        let textField = UITextField()
        textField.placeholder = "e.g 447491927343"
        textField.backgroundColor = .systemBackground
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add New Contact", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupNavBar()
        setupViewHierarchy()
        setupConstraints()
    }
}

//MARK: - Private methods

extension NewContactViewController {
    
    private func setupVC() {
        view.backgroundColor = .secondarySystemBackground
        nameTextField.becomeFirstResponder()
    }
    
    private func setupNavBar() {
        title = "Add New Contact"
    }
    
    private func addGestureRecogniserToAvatarView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapAvatar))
        avatarImageView.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - Selectors
    
    @objc private func didTapAvatar() {
    }
    
    
    @objc private func didTapButton() {
    }
}

//MARK: - Setub Views

extension NewContactViewController {
    
    private enum Constants {
        static let padding: CGFloat =          12
        static let smallPadding: CGFloat =     8
        static let avatarSize: CGFloat =       100
        static let textFieldHeight: CGFloat =  44
    }
    
    private func setupViewHierarchy() {
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(phoneLabel)
        view.addSubview(phoneTextField)
    }
    
    private func setupConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Avatar image view constraints
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.avatarSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.avatarSize),
            
            // Name label constraints
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Constants.padding),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            
            // Name text field constraints
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.smallPadding),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            nameTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight),
            
            // Phone label constraints
            phoneLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: Constants.padding),
            phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            phoneLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            
            // Phone text field constraints
            phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: Constants.smallPadding),
            phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            phoneTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight)
        ])
    }
}
