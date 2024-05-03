//
//  RegionFilterViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/19.
//

import UIKit

import RxSwift
import RxCocoa

protocol RegionSettingCoordinatorActions: CoordinatorActions {
    func popViewController()
}

final class RegionSettingViewModel: NagazaViewModel {
    private weak var actions: RegionSettingCoordinatorActions?
    
    private let regionSettingUseCase: RegionSettingUseCaseProtocol!
    
    struct Input {
        let viewWillAppearTrigger: Driver<Void>
        let mainRegionSelected: Driver<Int>
        let regionSelectedModel: Driver<Region>
        let popViewControler: Driver<Void>
    }
    
    struct Output {
        let viewWillAppearTrigger: Driver<Void>
        let mainRegins: Driver<[MainRegion]>
        let subRegions: Driver<[SubRegion]>
        let mainRegionSelected: Driver<Void>
        let regionSelected: Driver<Void>
        let popViewController: Driver<Void>
        let error: Driver<Error>
    }
    
    private let mainRegions = BehaviorRelay<[MainRegion]>(value: [])
    private let subRegions = BehaviorRelay<[SubRegion]>(value: [])
    private var isRequestThemeCount: Bool!
    
    private let errorSubject = PublishSubject<Error>()
    
    init(
        isRequestThemeCount: Bool,
        regionSettingUseCase: RegionSettingUseCaseProtocol
    ) {
        self.isRequestThemeCount = isRequestThemeCount
        self.regionSettingUseCase = regionSettingUseCase
    }
    
    func setCoordinatorActions(with actions: CoordinatorActions) {
        self.actions = actions as? RegionSettingCoordinatorActions
    }
    
    func transform(input: Input) -> Output {
        let viewWillAppearTrigger = input.viewWillAppearTrigger
            .flatMapLatest { [weak self] _ -> Driver<Void> in
                 guard let self = self else { return .just(()) }
                return self.fetchRegions(
                    isRequest: self.isRequestThemeCount
                )
             }
        
        let mainRegionSelected = input.mainRegionSelected
             .withLatestFrom(mainRegions.asDriver()) { index, regions -> [MainRegion] in
                 regions.enumerated().map { (i, region) in
                     var region = region
                     region.isSelected = i == index
                     return region
                 }
             }
             .do(onNext: { [weak self] regions in
                 self?.mainRegions.accept(regions)
                 self?.updateSubRegions(for: regions)
             })
             .map { _ in }
        
        let regionSelected = input.regionSelectedModel
            .flatMapLatest { [weak self] region -> Driver<Void> in
                guard let self = self else { return .just(()) }
                
                return self.saveSelectedRegion(region: region)
            }
        
        let popViewControler = input.popViewControler
            .do(onNext: { [weak self] in
                self?.popViewController()
            })
            .asDriver()
        
        let mainRegionsDriver = mainRegions.asDriver()
        let subRegionsDriver = subRegions.asDriver()
        
        return Output(
            viewWillAppearTrigger: viewWillAppearTrigger,
            mainRegins: mainRegionsDriver,
            subRegions: subRegionsDriver,
            mainRegionSelected: mainRegionSelected,
            regionSelected: regionSelected,
            popViewController: popViewControler,
            error: errorSubject.asDriverOnErrorJustEmpty()
        )
    }
    
    private func fetchRegions(isRequest: Bool) -> Driver<Void> {
        Observable.create { [weak self] observer in
            self?.regionSettingUseCase.fetchRegions(isRequestThemesCount: isRequest) { result in
                switch result {
                case .success(let regions):
                    self?.mainRegions.accept(regions.mainRegion)
                    self?.updateSubRegions(for: regions.mainRegion)
                    observer.onCompleted()                
                case .failure(let error):
                    self?.errorSubject.onNext(error)
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
        .observe(on: MainScheduler.instance)
        .asDriverOnErrorJustEmpty()
    }
    
    private func updateSubRegions(for regions: [MainRegion]) {
        if let selectedRegion = regions.first(where: { $0.isSelected }) {
            subRegions.accept(selectedRegion.subRegions)
        }
    }
    
    private func saveSelectedRegion(region: Region) -> Driver<Void> {
        return Observable.create { [weak self] observer in
            self?.regionSettingUseCase.saveRegion(
                newRegion: region
            ) { result in
                switch result {
                case .success(_):
                    observer.onNext(())
                case .failure(let error):
                    self?.errorSubject.onNext(error)
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
        .observe(on: MainScheduler.instance)
        .do(onCompleted: { [weak self] in
            self?.popViewController()
        })
        .asDriverOnErrorJustEmpty()
    }
        
    private func popViewController() {
        actions?.popViewController()
    }
}
