import UIKit
import DSKit
import Core
import MGLogger

public enum ButtonType: String, CaseIterable {
    case agree
    case auth
    case icon
    case check
    case timer
    case toggle
    case seemore
    case camera
}

public class ButtonTableViewController: BaseDesignSystemTableViewController<ButtonType> {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        designSystems = ButtonType.allCases
    }

    public override func showDetailViewController(for designSystem: ButtonType) {
        switch designSystem {
        case .agree:
            MGLogger.verbose("Agree Button")
            self.navigationController?.pushVC(DSAgreeButtonVC.self)
        case .auth:
            MGLogger.verbose("Auth Button")
            self.navigationController?.pushVC(DSAuthButtonVC.self)
        case .icon:
            MGLogger.verbose("Icon Button")
            self.navigationController?.pushVC(DSIconButtonVC.self)
        case .check:
            MGLogger.verbose("Check Button")
            self.navigationController?.pushVC(DSCheckButtonVC.self)
        case .timer:
            MGLogger.verbose("Timer Button")
            self.navigationController?.pushVC(DSTimerButtonVC.self)
        case .toggle:
            MGLogger.verbose("Toggle Button")
            self.navigationController?.pushVC(DSToggleButtonVC.self)
        case .seemore:
            MGLogger.verbose("seemore Button")
            self.navigationController?.pushVC(DSSeeMoreButtonVC.self)
        case .camera:
            MGLogger.verbose("camera featrure Button")
            self.navigationController?.pushVC(DSCameraButtonVC.self)
        }
    }
}
