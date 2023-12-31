import Foundation
import UIKit

public enum MaeumGaGymProfileType {
    case smallProfile
    case middleProfile
    case bigProfile
    
    var size: CGFloat {
        switch self {
        case .smallProfile:
            return 36.0
        case .middleProfile:
            return 40.0
        case .bigProfile:
            return 48.0
        }
    }
    
    var radius: CGFloat {
        switch self {
        case .smallProfile:
            return 18.0
        case .middleProfile:
            return 20.0
        case .bigProfile:
            return 24.0
        }
    }
}

public enum MaeumGaGymProfileImageType: Int {
    case custom
}

public struct MaeumGaGymProfileImage {
    public let type: MaeumGaGymProfileImageType
    public let customImage: UIImage?
    
    public init(type: MaeumGaGymProfileImageType, customImage: UIImage?) {
        self.type = type
        self.customImage = customImage
    }
    
    var image: UIImage {
        switch type {
        case .custom:
            guard let customImage = customImage else {
                return DSKitAsset.Assets.basicProfile.image
            }
            
            return customImage
        }
    }
}
