//
//  ReviewViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

import SnapKit

final class ReviewViewController: NagazaBaseViewController {
    
    private var viewModel: ReviewViewModel!
    
    static func create(with viewModel: ReviewViewModel) -> ReviewViewController {
        let vc = ReviewViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    private lazy var tabBarView: FilterTopView = {
        let vc = FilterTopView.create(with: viewModel)
        return vc
    }()
    
    private lazy var tabBarContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        add(child: tabBarView, container: view)
        return view
    }()
    
    override func makeUI() {
        view.addSubview(tabBarContainer)
        
        tabBarContainer.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(100)
        }
    }
}
//
//#if DEBUG
//import SwiftUI
//
//struct ReviewViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        let viewController = ReviewViewController()
//        return viewController.toPreView()
//    }
//}
//#endif
