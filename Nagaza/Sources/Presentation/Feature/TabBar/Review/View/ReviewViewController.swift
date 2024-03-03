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
    
    private lazy var tabBarView = FilterTopView()
    
    private lazy var reviewTableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .clear
        tableView.register(ReviewCell.self, forCellReuseIdentifier: ReviewCell.identifier)
        
        return tableView
    }()
    
    static func create(with viewModel: ReviewViewModel) -> ReviewViewController {
        let vc = ReviewViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func makeUI() {
        // TODO: 분리할 base func 필요할듯
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        view.addSubviews([tabBarView,
                          reviewTableView])
    }
    
    private func setupLayout() {
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

extension ReviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = reviewTableView.dequeueReusableCell(withIdentifier: ReviewCell.identifier, for: indexPath) as? ReviewCell else { return UITableViewCell() }

        return cell
    }
}

extension ReviewViewController: UITableViewDelegate {
    
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
