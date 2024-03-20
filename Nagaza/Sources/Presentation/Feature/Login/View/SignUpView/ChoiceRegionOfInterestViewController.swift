//
//  ChoiceRegionOfInterestViewController.swift
//  Nagaza
//
//  Created by Nat Kim on 2024/03/20.
//

import UIKit

import SnapKit

class ChoiceRegionOfInterestViewController: UIViewController {
    let signUpAction: SignUpViewModel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private lazy var areaSettingLabel: UILabel = {
        let label = UILabel()
        label.text = "관심 지역을 설정해 주세요!"
        label.textAlignment = .center
        label.font = UIFont.ngaH4M
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var areaNoticeLabel: UILabel = {
        let label = UILabel()
        label.text = "추후 관심 지역은 변경할 수 있어요"
        label.textAlignment = .center
        label.textColor = NagazaAsset.Colors.gray5.color
        label.font = UIFont.ngaP1M
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var choiceRegionButton: UIButton = {
        let button = UIButton()
        button.setTitle("선택하기", for: .normal)
        button.titleLabel?.font = UIFont.ngaH4M
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 44)
        button.setTitleColor(NagazaAsset.Colors.gray3.color, for: .normal)
        button.tintColor = .clear
        button.layer.borderColor = NagazaAsset.Colors.gray3.color.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
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
        button.translatesAutoresizingMaskIntoConstraints = false

        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func nextButtonTapped() {
        let vc = ChoiceRegionOfInterestViewController()
        _ = UINavigationController(rootViewController: vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func moveNextView() {
        signUpAction.viewAction.moveView()
    }
    
    private func setupUI() {
        view.addSubview(areaSettingLabel)
        view.addSubview(areaNoticeLabel)
        view.addSubview(choiceRegionButton)
        view.addSubview(nextButton)
        
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
        let viewController = ChoiceRegionOfInterestViewController()
        return viewController.toPreView()
    }
}
#endif

