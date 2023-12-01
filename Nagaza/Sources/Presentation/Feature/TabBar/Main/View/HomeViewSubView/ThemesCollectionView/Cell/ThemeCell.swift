//
//  HomeThemeCell.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/01.
//

import UIKit

import SnapKit
import RxSwift

final class ThemeCell: UICollectionViewCell {
    static let identifier = String(describing: ThemeCell.self)
    
    private var viewModel: ThemeCollectionItemViewModel!
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var newIcon: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var heartButton: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    private lazy var newAndHeartStackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var branchLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var starIcon: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var ratedLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var starAndRatedStackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    
    private lazy var categoryIcon: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var ratedAndCategoryStackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    
    func fill(with viewModel: ThemeCollectionItemViewModel) {
        self.viewModel = viewModel
    }
}
