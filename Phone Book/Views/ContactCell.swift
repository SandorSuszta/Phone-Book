import UIKit

final class ContactCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: ContactCell.self)
    static let prefferedHeight: CGFloat = 64
    
    //MARK: - UI Elements
    
    private let avatarImageView: RoundedImageView = {
        let imageView = RoundedImageView()
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - API
    
    func configure(with model: Contact) {
        nameLabel.text = model.name
        phoneLabel.text = model.phoneNumber
        
        
        if let image = UIImage(contentsOfFile: model.avatarURL?.path() ?? "") {
            avatarImageView.image = image
        } else {
            avatarImageView.image = UIImage(systemName: "person.crop.circle")
        }
    }
}

    //MARK: - Setup Views

extension ContactCell {
    
    private enum Constants {
        static let padding: CGFloat =       8
        static let smallPadding: CGFloat =  4
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneLabel)
    }
    
    private func setupConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Avatar image view constraints
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -2 * Constants.smallPadding),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),
            
            // Name label constraints
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.padding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding),
            
            // Phone label constraints
            phoneLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.smallPadding),
            phoneLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.padding)
        ])
    }
}

