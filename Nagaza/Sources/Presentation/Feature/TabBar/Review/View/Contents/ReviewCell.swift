//
//  ReviewCell.swift
//  Nagaza
//
//  Created by 강조은 on 2/25/24.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class ReviewCell: UITableViewCell {
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = NagazaAsset.Images.dummy.image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "아기고양이별이"
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 14)
        return label
    }()
    
    private let ratingView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = NagazaAsset.Images.icLv5.image
        return imageView
    }()
    
    private let starImageView = RatingView()
    
    private let lifeBadgeView = BadgeIconView(type: .life)
    
    private let writeDateLabel: UILabel = {
        let label = UILabel()
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 14)
        label.textColor = NagazaAsset.Colors.gray4.color
        label.text = "23.04.27"
        return label
    }()
    
    private let contentsLabel: UILabel = {
        let label = UILabel()
        label.text = "진짜 오랜만에 나온 감성테마 꽃길 테마입니다!!!드림 이스케이프 매장 아무도 모르게 해주시고... 돌핀 테마도 많이 많이 해주시면 좋을 것 같아요~ 예약은 네이버"
        label.numberOfLines = 0
        label.font = NagazaFontFamily.Pretendard.regular.font(size: 15)
        label.textColor = NagazaAsset.Colors.gray1.color
        return label
    }()
    
    private lazy var tagCollcetionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(
            FilterTagCollectionViewCell.self,
            forCellWithReuseIdentifier: "FilterTagCollectionViewCell"
        )
        
        return collectionView
    }()
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = 16
        layout.scrollDirection = .vertical

        return layout
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = NagazaAsset.Colors.gray8.color.cgColor
        stackView.layer.cornerRadius = 16
        return stackView
    }()
    
    private let themeView = UIView()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = NagazaAsset.Colors.gray8.color
        return view
    }()
    
    private let cafeView = UIView()
    
    private let themeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = NagazaAsset.Images.dummy.image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let themeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "리그오브디저트"
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 12)
        label.textColor = NagazaAsset.Colors.black1.color
        return label
    }()
    
    private let themeMoreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = NagazaAsset.Images.icArrowRightGray.image
        return imageView
    }()
    
    private let cafeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "꿈소풍 2호점"
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 12)
        label.textColor = NagazaAsset.Colors.black1.color
        return label
    }()
    
    private let cafeRatingView = RatingView()
    
    private let cafeReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "리뷰 25개"
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 10)
        label.textColor = NagazaAsset.Colors.gray3.color
        return label
    }()
    
    private let barLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 10)
        label.textColor = NagazaAsset.Colors.gray3.color
        return label
    }()
    
    private let themeLabel: UILabel = {
        let label = UILabel()
        label.text = "테마 4개"
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 10)
        label.textColor = NagazaAsset.Colors.gray3.color
        return label
    }()
    
    private let cafeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = NagazaAsset.Images.dummy.image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let cafeTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private let cafeInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let cafeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        return stackView
    }()
    
    private let cafeMoreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = NagazaAsset.Images.icArrowRightGray.image
        return imageView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        afterViewLayout = true
    }
    
    private var afterViewLayout: Bool = true
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0,
                                                                     left: 0,
                                                                     bottom: 0,
                                                                     right: 0))
        
        if afterViewLayout {
            setCollectionViewHeight()
            afterViewLayout.toggle()
        }
        setCollectionViewHeight()
    }
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        setup()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        tagCollcetionView.delegate = self
        tagCollcetionView.dataSource = self
        
        contentView.addSubviews([profileImageView,
                                 nicknameLabel,
                                 ratingView,
                                 starImageView,
                                 lifeBadgeView,
                                 writeDateLabel,
                                 contentsLabel,
                                 tagCollcetionView,
                                 infoStackView])
        
        infoStackView.addArrangedSubviews([themeView,
                                           lineView,
                                           cafeView])
        
        themeView.addSubviews([themeImageView,
                               themeTitleLabel,
                               themeMoreImageView])
        
        cafeView.addSubviews([cafeImageView,
                              cafeStackView,
                              cafeMoreImageView])
        
        cafeStackView.addArrangedSubviews([cafeTitleStackView,
                                           cafeInfoStackView])
        
        cafeTitleStackView.addArrangedSubviews([cafeTitleLabel,
                                                cafeRatingView])
        
        cafeInfoStackView.addArrangedSubviews([cafeReviewLabel,
                                               barLabel,
                                               themeLabel])
    }
    
    private func initConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.top.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(24)
            make.bottom.equalTo(starImageView.snp.top).offset(-17)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView)
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.trailing.equalTo(ratingView.snp.leading).offset(-10)
        }
        
        ratingView.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView)
            make.size.equalTo(30)
        }
        
        starImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalTo(lifeBadgeView.snp.leading).offset(-10)
        }
        
        lifeBadgeView.snp.makeConstraints { make in
            make.centerY.equalTo(starImageView)
        }
        
        writeDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImageView)
            make.trailing.equalToSuperview().inset(24)
        }
        
        contentsLabel.snp.makeConstraints { make in
            make.top.equalTo(starImageView.snp.bottom).offset(17)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalTo(tagCollcetionView.snp.top).offset(-20)
        }
        
        tagCollcetionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalTo(infoStackView.snp.top).offset(-20)
            collectionViewHeight = make.height.equalTo(0).constraint
        }
        
        infoStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(21)
            make.bottom.equalToSuperview().inset(30)
        }
        
        themeImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
            make.trailing.equalTo(themeTitleLabel.snp.leading).offset(-10)
            make.bottom.equalToSuperview().inset(5)
            make.size.equalTo(40)
        }

        themeTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(themeImageView)
            make.trailing.equalTo(themeMoreImageView.snp.leading).offset(-5)
        }
        
        themeMoreImageView.snp.makeConstraints { make in
            make.size.equalTo(16)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(-10)
        }
        
        cafeImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.top.equalToSuperview().inset(5)
            make.leading.bottom.equalToSuperview().inset(10)
            make.trailing.equalTo(cafeStackView.snp.leading).offset(-10)
        }
        
        cafeStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        
        cafeMoreImageView.snp.makeConstraints { make in
            make.size.equalTo(16)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        setCollectionViewHeight()
    }
    
    var dataList: [String] = ["성공", "힌트1개", "4명", "난이도 보통", "활동성 보통", "스토리 보통", "장치80%", "장치80%", "장치80%"]
    
    var collectionViewHeight: Constraint!
    
    func setCollectionViewHeight() {
        var count = 0
        
        let screenWidth = contentView.bounds.width
        let tagWidth: CGFloat = "#".widthOfFont(usingFont: NagazaFontFamily.Pretendard.regular.font(size: 12))
        var totalWidth: CGFloat = 0
        
        for (index, dao) in dataList.enumerated() {
            
            var itemWidth = dao.widthOfFont(usingFont: NagazaFontFamily.Pretendard.regular.font(size: 12)) + 20
            itemWidth += tagWidth
            
            if screenWidth <= itemWidth {
                count += 1
                totalWidth = 0
                
            } else {
                totalWidth += itemWidth
                if screenWidth <= totalWidth {
                    count += 1
                    totalWidth = itemWidth
                }
            }
            
            if index == dataList.count - 1 {
                count += totalWidth > 0 ? 1 : 0
            }
        }
        
        let itemHeight = dataList[0].heightOfFont(usingFont: NagazaFontFamily.Pretendard.regular.font(size: 12)) + 20
        let height = CGFloat(count) * itemHeight + CGFloat((count - 1) * 10)
        
        collectionViewHeight.update(offset: height)
    }
}

extension ReviewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = FilterTagCollectionViewCell.fittingSize(availableHeight: 24,
                                                           name: "#\(dataList[indexPath.row])")
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = tagCollcetionView.dequeueReusableCell(
            withReuseIdentifier: FilterTagCollectionViewCell.identifier,
            for: indexPath) as? FilterTagCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(name: "#\(dataList[indexPath.row])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
