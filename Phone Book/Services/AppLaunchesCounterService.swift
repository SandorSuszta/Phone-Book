import UIKit

final class AppLaunchesCounterService {
    
    static let shared = AppLaunchesCounterService()
    
    private init() {}
    
    
    private let appLaunchesDefaultsKey = "OpenCountUserDefaultsKey"
    
    func incrementOpenCount() {
        let launchesCount = getLaunchesCount()
        UserDefaults.standard.set(launchesCount + 1, forKey: appLaunchesDefaultsKey)
    }
    
    func getLaunchesCount() -> Int {
        UserDefaults.standard.integer(forKey: appLaunchesDefaultsKey)
    }
    
    func shouldShowAlert() -> Bool {
        let launchesCount = getLaunchesCount()
        return launchesCount > 0 && launchesCount % 3 == 0
    }
    
    func showOpenCountAlert(in viewController: UIViewController) {
        let launchesCount = getLaunchesCount()
        let alertController = UIAlertController(title: "Info", message: "You have opened the app \(launchesCount) times", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
