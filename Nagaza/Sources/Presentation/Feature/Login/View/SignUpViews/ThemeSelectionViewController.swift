//
//  ThemeSelectionViewController.swift
//  Nagaza
//
//  Created by Nat Kim on 2024/02/19.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    private let themes = ["공포", "판타지/감성", "서스펜스", "코믹", "드라마/로맨스", "SF/액션", "19+", "기타"]
    private var themeButtons: [UIButton] = []
    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 수평 스택 뷰 설정
        let horizontalStackView1 = createHorizontalStackView(themes: Array(themes[0..<4]))
        let horizontalStackView2 = createHorizontalStackView(themes: Array(themes[4..<8]))

        // 수직 스택 뷰 설정
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.addArrangedSubview(horizontalStackView1)
        stackView.addArrangedSubview(horizontalStackView2)

        // 전체 스택 뷰를 뷰에 추가
        view.addSubview(stackView)

        // 스택 뷰의 오토레이아웃 설정
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 417),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -309)
        ])
    }

    private func createHorizontalStackView(themes: [String]) -> UIStackView {
        // 수평 스택 뷰 설정
        let horizontalStackView = UIStackView()

        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 7

        // 버튼 생성 및 설정
        for (index, theme) in themes.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(theme, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(themeButtonTapped(_:)), for: .touchUpInside)

            // 버튼 스타일 등 설정
            button.layer.borderColor = NagazaAsset.Colors.mainOrange.color.cgColor
            button.setTitleColor(NagazaAsset.Colors.mainOrange.color, for: .normal)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 8
         

            // 배열에 추가
            themeButtons.append(button)

            // 수평 스택 뷰에 버튼 추가
            horizontalStackView.addArrangedSubview(button)
        }

        return horizontalStackView
    }

    @objc private func themeButtonTapped(_ sender: UIButton) {
        // 버튼이 탭되었을 때 동작할 로직을 여기에 추가
        let selectedTheme = themes[sender.tag]
        print("Selected Theme: \(selectedTheme)")
        
        // 버튼의 선택 상태 변경
        sender.isSelected = !sender.isSelected
        
        // 선택된 버튼의 스타일 변경
        if sender.isSelected {
            sender.backgroundColor = NagazaAsset.Colors.mainOrange.color
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.tintColor = NagazaAsset.Colors.mainOrange.color
            
        } else {
            sender.backgroundColor = .clear
            sender.setTitleColor(NagazaAsset.Colors.mainOrange.color, for: .normal)
            sender.layer.borderColor = NagazaAsset.Colors.mainOrange.color.cgColor
            sender.layer.borderWidth = 1
        }
    }
}


#if DEBUG
import SwiftUI

struct ThemeSelectionViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = ThemeSelectionViewController()
        return viewController.toPreView()
    }
}
#endif

