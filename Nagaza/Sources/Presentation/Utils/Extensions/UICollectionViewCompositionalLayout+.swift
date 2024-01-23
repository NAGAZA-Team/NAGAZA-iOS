//
//  UICollectionViewCompositionalLayout+.swift
//  Nagaza
//
//  Created by SeungMin on 1/23/24.
//

import UIKit

struct ElementKind {
    static let badge = "badge-element-kind"
    static let background = "background-element-kind"
    static let sectionHeader = "section-header-element-kind"
    static let sectionFooter = "section-footer-element-kind"
    static let layoutHeader = "layout-header-element-kind"
    static let layoutFooter = "layout-footer-element-kind"
}

extension UICollectionViewCompositionalLayout {
    static func listLayout(withEstimatedHeight estimatedHeight: CGFloat = 100) -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout(section: .listSection(withEstimatedHeight: estimatedHeight))
    }
    
    static func listLayoutAutomaticHeight(withEstimatedHeight estimatedHeight: CGFloat = 100) -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout(section:
                .listEstimatedHeightSection(withEstimatedHeight: estimatedHeight))
    }
}

extension NSCollectionLayoutSection {
    static func listSection(withEstimatedHeight estimatedHeight: CGFloat = 100) -> NSCollectionLayoutSection {
        let itemWidth: CGFloat = 100
        let itemCount = 10
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(itemWidth * CGFloat(itemCount)),
            heightDimension: .estimated(estimatedHeight)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, 
            subitem: item,
            count: itemCount
        )
        group.interItemSpacing = .fixed(16)
        
        let sectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(45))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: sectionHeaderSize,
            elementKind: ElementKind.sectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 20,
            bottom: 0,
            trailing: 20
        )
//        section.interGroupSpacing = 20 // 적용이 안 됨
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    static func listEstimatedHeightSection(withEstimatedHeight estimatedHeight: CGFloat = 100) -> NSCollectionLayoutSection {
        let itemWidth: CGFloat = 100
        let itemCount = 10
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(estimatedHeight)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(itemWidth * CGFloat(itemCount)),
            heightDimension: .estimated(estimatedHeight)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: itemCount
        )
        group.interItemSpacing = .fixed(16)
        
        let sectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(45))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: sectionHeaderSize,
            elementKind: ElementKind.sectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 20,
            bottom: 0,
            trailing: 20
        )
//        section.interGroupSpacing = 20 // 적용이 안 됨
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
}

