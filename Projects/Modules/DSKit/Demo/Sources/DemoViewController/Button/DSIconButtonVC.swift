import UIKit
import DSKit
import SnapKit
import Then

public class DSIconButtonVC: UIViewController {
    
    var heartButton = MGOpaqueIconButton(type: .heart, likeCount: 12003)
    var commentButton = MGOpaqueIconButton(type: .comment, likeCount: 1200)
    var dotsButton = MGOpaqueIconButton(type: .dots)
    var shareButton = MGOpaqueIconButton(type: .share)
        
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
    }
    
    func layout() {
        [

            heartButton,
            commentButton,
            dotsButton,
            shareButton
        ].forEach { view.addSubview($0) }
        
        heartButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
        
        commentButton.snp.makeConstraints {
            $0.top.equalTo(heartButton.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
        }
        
        dotsButton.snp.makeConstraints {
            $0.top.equalTo(commentButton.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalTo(dotsButton.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
        }
    }
}
