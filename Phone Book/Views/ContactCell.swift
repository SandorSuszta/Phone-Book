import UIKit

final class ContactCell: UITableViewCell {
    
    static let identifier = String(describing: ContactCell.self)
    static let prefferedHeight: CGFloat = 60
    
    //MARK: - UI Elements
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
}

    //MARK: - Setup Views

extension ContactCell {
    
    private enum Constants {
        static let padding: CGFloat = 16
        static let smallPadding: CGFloat = 8
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
            avatarImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -Constants.smallPadding),
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

