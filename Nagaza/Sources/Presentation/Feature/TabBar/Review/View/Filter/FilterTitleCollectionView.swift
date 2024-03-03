//
//  FilterTitleCollectionView.swift
//  Nagaza
//
//  Created by 강조은 on 2/18/24.
//

import UIKit

final class FilterTitleCollectionView: UIView {
    
    var filterTitle: [String] = ["난이도", "활동성", "인테리어", "장치/자물쇠", "장르 연출/스토리", "인생 테마", "조도(방해)", "볼륨(방해)", "밀어내기", "npc", "직렬식/병렬식", "노후도", "삑딱쿵/분위기", "공포도"]
    
    private lazy var filterTitleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = 16
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FilterTitleCollectionViewCell.self,
                                forCellWithReuseIdentifier: FilterTitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
        
    private func setupView() {
        addSubview(filterTitleCollectionView)
    }
    
    private func setupLayout() {
        filterTitleCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
extension FilterTitleCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterTitleCollectionViewCell.identifier, for: indexPath) as? FilterTitleCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(name: filterTitle[indexPath.row])
        return cell
    }
}

extension FilterTitleCollectionView: UICollectionViewDelegateFlowLayout {
    
}

extension FilterTitleCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = FilterTitleCollectionViewCell.fittingSize(availableHeight: 40,
                                                             name: filterTitle[indexPath.item])
        return size
    }
}
