import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

open class BaseView: UIView {
    public let disposeBag = DisposeBag()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        attribute()
        layout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func attribute() {
        // 부가적인 것을 여기에 넣습니다.
    }
    
    open func layout() {
        // 서브뷰를 구성하고 SnapKit을 사용해서 layout을 하는 함수입니다.
    }
}