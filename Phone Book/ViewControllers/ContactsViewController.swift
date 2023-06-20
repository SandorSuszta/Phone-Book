import UIKit

final class ContactsViewController: UIViewController, NewContactViewControllerDelegate {
    
    private var contacts: [User] = [] {
        didSet {
            contactsTableView.reloadData()
        }
    }
    
    private let contactService = ContactService()
    
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
        loadContacts()
    }
}

    //MARK: - Private methods

extension ContactsViewController {
    
    private func setupVC() {
        view.backgroundColor = .systemBackground
        view.addSubview(contactsTableView)
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    private func loadContacts() {
        let savedContacts = contactService.loadAllContacts()
        contacts = savedContacts.sorted { $0.name < $1.name }
    }
}

    //MARK: - Selectors

extension ContactsViewController {
    
    @objc private func didTapAddContact() {
        let vc = NewContactViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapAddCSettings() {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    //MARK: - NewContactVC delegate
    
    func didSaveContact() {
        loadContacts()
    }
}

    //MARK: - TableView Delegate and DataSource methods

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.reuseIdentifier) as? ContactCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: contacts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ContactCell.prefferedHeight
    }
}
