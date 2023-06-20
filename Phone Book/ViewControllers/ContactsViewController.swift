import UIKit

final class ContactsViewController: UIViewController {
    
    private let mockUsers: [User] = [
        User(name: "John Doe", phoneNumber: "1234567890"),
        User(name: "Jane Smith", phoneNumber: "0987654321"),
        User(name: "Michael Johnson", phoneNumber: "9876543210"),
        User(name: "Emily Davis", phoneNumber: "0123456789"),
        User(name: "David Wilson", phoneNumber: "5678901234"),
        User(name: "Olivia Brown", phoneNumber: "9012345678"),
        User(name: "James Taylor", phoneNumber: "4567890123"),
        User(name: "Sophia Anderson", phoneNumber: "3456789012"),
        User(name: "Alexander Martinez", phoneNumber: "8901234567"),
        User(name: "Emma Wilson", phoneNumber: "6789012345")
    ]
    
    //MARK: - UI Elements
    
    private lazy var contactsTableView: UITableView = {
        let table = UITableView(frame: view.bounds, style: .insetGrouped)
        table.register(ContactCell.self, forCellReuseIdentifier: ContactCell.reuseIdentifier)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .secondarySystemBackground
        return table
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupNavBar()
    }
}

    //MARK: - Private methods

extension ContactsViewController {
    
    private func setupVC() {
        view.backgroundColor = .systemBackground
        view.addSubview(contactsTableView)
    }
    
    private func setupNavBar() {
        title = "AdressBook"
        addContactButton()
        addSettingsButton()
    }
    
    private func addContactButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapAddContact)
        )
    }
    
    private func addSettingsButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .plain,
            target: self,
            action: #selector(didTapAddCSettings))
    }
}

    //MARK: - Selectors

extension ContactsViewController {
    
    @objc private func didTapAddContact() {
        //TODO: handle tap
    }
    
    @objc private func didTapAddCSettings() {
        //TODO: handle tap
    }
}

    //MARK: - TableView Delegate and DataSource methods

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.reuseIdentifier) as? ContactCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: mockUsers[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ContactCell.prefferedHeight
    }
}
