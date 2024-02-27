//
//  RegionFilterViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/19.
//

import UIKit

import RxSwift
import RxCocoa

struct RegionFilterViewModelActions {
    
}

final class RegionFilterViewModel: ViewModelType {
    private let actions: RegionFilterViewModelActions!
    
    var mainRegions: [(Region, Bool)] = [
        (.nationwide, true),
        (.seoul, false),
        (.gyeonggi, false),
        (.chungcheong, false),
        (.gyeongsang, false),
        (.jeolla, false),
        (.gangwon, false),
        (.jeju, false)
    ] {
        didSet {
            print(mainRegions)
        }
    }
    struct Input {
        let mainRegionSelection: Driver<Int>
        let subRegionSelection: Driver<String>
    }
    
    struct Output {
        let reloadMainRegions: Driver<Void>
        let subRegions: Driver<[String]>
    }
    
    init(actions: RegionFilterViewModelActions) {
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let reloadMainRegions = input.mainRegionSelection
            .map { [unowned self] index -> Void in
                for i in 0..<self.mainRegions.count {
                    self.mainRegions[i].1 = i == index
                }
            }
            .asDriver(onErrorDriveWith: .empty())
        
        let subRegions = input.mainRegionSelection
              .map { [unowned self] index -> [String] in
                  let selectedRegion = self.mainRegions[index].0
                  return selectedRegion.cities
              }
              .asDriver(onErrorJustReturn: [])
        
        return Output(
            reloadMainRegions: reloadMainRegions,
            subRegions: subRegions
        )
    }
    
    func loadMainRegions() -> Driver<[(Region, Bool)]> {
        print(self.mainRegions)
        return Observable.just(mainRegions)
            .asDriver(onErrorJustReturn: [])
    }
}
