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
    
    private let tabBarView = FilterTopView()
    
    private let reviewTableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(ReviewCell.self, forCellReuseIdentifier: "ReviewCell")
        return tableView
    }()
    
    override func makeUI() {
        // TODO: 분리할 base func 필요할듯
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        
        setup()
        initConstraints()
    }
    
    private func setup() {
        view.addSubviews([tabBarView,
                          reviewTableView])
    }
    
    private func initConstraints() {
        tabBarView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
        }
        
        reviewTableView.snp.makeConstraints { make in
            make.top.equalTo(tabBarView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = reviewTableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewCell else { return UITableViewCell() }
        cell.setCollectionViewHeight()
        return cell
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
