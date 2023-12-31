import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

open class MaeumGaGymToggleView: UIView {
    
    var toggle: Bool = true
    let disposeBag = DisposeBag()
    
    let view1 = UIView().then {
        $0.backgroundColor = .red
    }
    
    let view2 = UIView().then {
        $0.backgroundColor = .blue
    }
    
    private let imageToggleButton = MaeumGaGymToggleButton(type: .image)
    private let albumToggleButton = MaeumGaGymToggleButton(type: .album)
    
    public init(
        width: Double? = 430.0,
        height: Double? = 845.0
        
    ) {
        super.init(frame: .zero)
        
        setupUI(width: width ?? 430.0, height: height ?? 845.0)
        isToggleLR()
        buttonTap()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(width: Double, height: Double) {
        addSubviews([view2, view1, imageToggleButton, albumToggleButton])
        
        view1.snp.makeConstraints {
            $0.width.equalTo(430.0)
            $0.height.equalTo(721.0)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(0.0)
        }
        
        view2.snp.makeConstraints {
            $0.width.equalTo(430.0)
            $0.height.equalTo(721.0)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(0.0)
        }
         
        snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(height)
        }
        
        imageToggleButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(124.0)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-16.0)
        }
        
        albumToggleButton.snp.makeConstraints {
            $0.leading.equalTo(imageToggleButton.snp.trailing).offset(16.0)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-16.0)
        }
        
    }
    
    private func isToggleLR() {
        if toggle == true {
            
            view2.removeFromSuperview()
            addSubviews([view1])
            
            view1.snp.makeConstraints {
                $0.width.equalTo(430.0)
                $0.height.equalTo(721.0)
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview().offset(0.0)
            }
            
            imageToggleButton.buttonYesChecked()
            albumToggleButton.buttonNoChecked()
        } else {
            
            view1.removeFromSuperview()
            addSubviews([view2])
            
            view2.snp.makeConstraints {
                $0.width.equalTo(430.0)
                $0.height.equalTo(721.0)
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview().offset(0.0)
            }

            albumToggleButton.buttonYesChecked()
            imageToggleButton.buttonNoChecked()
        }
    }

    private func buttonTap() {
        imageToggleButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.toggle = true
                self?.isToggleLR()
            }).disposed(by: disposeBag)
        
        albumToggleButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.toggle = false
                self?.isToggleLR()
            }).disposed(by: disposeBag)
    }
    
}
