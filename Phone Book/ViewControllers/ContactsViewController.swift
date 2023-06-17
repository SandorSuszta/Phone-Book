import UIKit

final class ContactsViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private lazy var contactsTableView: UITableView = {
        let table = UITableView()
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
