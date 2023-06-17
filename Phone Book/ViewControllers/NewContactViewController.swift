import UIKit

final class NewContactViewController: UIViewController {
    
    //MARK: - UI Elements
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

    //MARK: - Private methods

extension ContactsViewController {
    
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
