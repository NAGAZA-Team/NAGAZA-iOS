//
//  RegionFilterViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/19.
//

import UIKit

import RxSwift
import RxCocoa

final class RegionSettingViewModel: ViewModelType {
    private let regionSettingUseCase: RegionSettingUseCase!
        
    private var firstSubRegion = ""
    
    struct Input {
        let viewWillAppearTrigger: Driver<Void>
        let mainRegionSelected: Driver<Int>
        let subRegionSelected: Driver<String>
    }
    
    struct Output {
        let viewWillAppearTrigger: Driver<Void>
        let mainRegins: Driver<[MainRegion]>
        let subRegions: Driver<[SubRegion]>
        let mainRegionSelected: Driver<Void>
        let subRegionsUpdated: Driver<Void>
    }
    
    init(
        regionSettingUseCase: RegionSettingUseCase,
        firstSubRegion: String = ""
    ) {
        self.regionSettingUseCase = regionSettingUseCase
        self.firstSubRegion = firstSubRegion
    }
    
    func transform(input: Input) -> Output {
        let mainRegions = BehaviorRelay<[MainRegion]>(value: [])
        let subRegions = BehaviorRelay<[SubRegion]>(value: [])
        
        let viewWillAppearTrigger = input.viewWillAppearTrigger
            .do(onNext: { [weak self] in
                guard let self = self else { return }
                let regions = self.regionSettingUseCase.loadMainRegions(with: firstSubRegion)
                mainRegions.accept(regions)
            })
            .asDriver()
        
        let mainRegionSelected = input.mainRegionSelected
            .do(onNext: { index in
                var regions = mainRegions.value
                
                for i in 0..<regions.count {
                    regions[i].isSelected = i == index
                }
                
                mainRegions.accept(regions)
            })
            .map { _ in }
            .asDriver()
        
        let subRegionsUpdated = mainRegions.asDriver()
            .map { [weak self] mainRegions in
                guard let self = self,
                      let selectedRegion = mainRegions
                          .first(where: { $0.isSelected })
                else { return }
                
                let regions = self.regionSettingUseCase
                    .loadSubRegions(with: selectedRegion.region)
                
                subRegions.accept(regions)
                
                return
            }
            .asDriver()
        
        let mainRegionsDriver = mainRegions.asDriver()
        let subRegionsDriver = subRegions.asDriver()
        
        return Output(
            viewWillAppearTrigger: viewWillAppearTrigger,
            mainRegins: mainRegionsDriver,
            subRegions: subRegionsDriver,
            mainRegionSelected: mainRegionSelected,
            subRegionsUpdated: subRegionsUpdated
        )
    }
    
}
