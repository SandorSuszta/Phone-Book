import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private let switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Switch Theme"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var themeSwitch: UISwitch = {
        let themeSwitch = UISwitch()
        themeSwitch.isOn = false
        themeSwitch.addTarget(self, action: #selector(switchThemeChanged), for: .valueChanged)
        return themeSwitch
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        setupVC()
        setupViewHierarchy()
        setupConstriants()
    }
    
    //MARK: - Private
    
    private func setupVC() {
        title = "Settings"
        view.backgroundColor = .secondarySystemBackground
    }
    
    //MARK: - Selectors
    
    @objc private func switchThemeChanged() {
        
    }
}
    //MARK: - Setup Views

extension SettingsViewController {
    
    private func setupViewHierarchy() {
        view.addSubview(switchLabel)
        view.addSubview(themeSwitch)
    }
    
    private func setupConstriants() {
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        themeSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Theme switch
            themeSwitch.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            themeSwitch.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            themeSwitch.heightAnchor.constraint(equalToConstant: 200),
            
            //Switch label
            switchLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            switchLabel.bottomAnchor.constraint(equalTo: themeSwitch.topAnchor, constant: -8)
        ])
    }
    
}
