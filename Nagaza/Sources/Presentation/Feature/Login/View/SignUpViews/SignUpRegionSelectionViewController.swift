//
//  SignUpRegionSelectionViewController.swift
//  Nagaza
//
//  Created by Nat Kim on 2024/03/20.
//

import UIKit

import SnapKit

final class SignUpRegionSelectionViewController: UIViewController {
    let signUpAction: SignUpViewModel! = nil
    
    private lazy var areaSettingLabel: UILabel = {
        let label = UILabel()
        
        label.text = "관심 지역을 설정해 주세요!"
        label.textAlignment = .center
        label.font = UIFont.ngaH4M

        return label
    }()
    
    private lazy var areaNoticeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "추후 관심 지역은 변경할 수 있어요"
        label.textAlignment = .center
        label.textColor = NagazaAsset.Colors.gray5.color
        label.font = UIFont.ngaP1M

        return label
    }()
    
    private lazy var choiceRegionButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("선택하기", for: .normal)
        button.titleLabel?.font = UIFont.ngaH4M
        button.setTitleColor(
            NagazaAsset.Colors.gray3.color,
            for: .normal
        )
        
        button.layer.borderColor = NagazaAsset.Colors.gray3.color.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(moveNextView), for: .touchUpInside)
        
        return button
    }()
   
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("다음", for: .normal)
        button.setTitleColor(NagazaAsset.Colors.gray3.color, for: .normal)
        button.titleLabel?.font = UIFont.ngaH5M
        button.backgroundColor = NagazaAsset.Colors.gray7.color
        button.clipsToBounds = true
        button.layer.cornerRadius = 16

        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    @objc private func nextButtonTapped() {
        let vc = SignUpRegionSelectionViewController()

        self.navigationController?.pushViewController(
            vc,
            animated: true
        )
    }
    
    
    /// signUpAction인 `SignUpViewModel`를 선언하는 과정이 없어서 해당 버튼을 클릭하면 Fatal error가 발생합니다. `static` 키워드를 활용한 `create` 메서드를 생성해서 해당 메서드에서 `ViewModel`을 주입하는 방식으로 구현 해주세용
    @objc private func moveNextView() {
        signUpAction.viewAction.moveView()
    }
    
    private func setupUI() {
        view.addSubviews([
            areaSettingLabel,
            areaNoticeLabel,
            choiceRegionButton,
            nextButton
        ])
        
        areaSettingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(324)
            $0.centerX.equalToSuperview()
        }
        
        areaNoticeLabel.snp.makeConstraints {
            $0.top.equalTo(areaSettingLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        choiceRegionButton.snp.makeConstraints {
            $0.top.equalTo(areaNoticeLabel.snp.bottom).offset(40)
            $0.left.right.equalToSuperview().inset(120)
            $0.height.equalTo(44)
            $0.width.equalTo(150)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().inset(54)
            $0.height.equalTo(44)
        }
    }
    
}

#if DEBUG
import SwiftUI

struct ChoiceRegionOfInterestViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = SignUpRegionSelectionViewController()
        return viewController.toPreView()
    }
}
#endif

