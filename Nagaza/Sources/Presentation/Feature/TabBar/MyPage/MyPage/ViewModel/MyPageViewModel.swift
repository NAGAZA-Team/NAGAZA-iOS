//
//  MyPageViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import Foundation
import RxSwift
import RxCocoa

/// 화면 전환 등 액션, coordinator에서 직접 주입
struct MyPageViewModelActions {
    var moveAppSetting: () -> Void
}

final class MyPageViewModel {
    
    private let actions: MyPageViewModelActions!
    
    private var disposeBag = DisposeBag()
    
    struct Input {
        let initialTrigger: Driver<Void>
        let appSettingTap: ControlEvent<MyPageInfo>
    }
    
    struct Output {
        let sectionItems: Driver<[MySection]>
    }
    
    init(
        actions: MyPageViewModelActions
    ) {
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let response = input.initialTrigger
        // TODO: 서버 데이터 가져오기
        
        let sectionItems = input.initialTrigger
            .flatMap {
                return Driver.just(self.createSectionData())
            }
        
        input.appSettingTap
            .observe(on: MainScheduler.instance)
            .subscribe(with: self, onNext: { owner, event in
                print(event)
                switch event.type {
                case .myReview:
                    break
                    // TODO: 리뷰로 이동
                case .like:
                    break
                    // TODO: 찜으로 이동
                case .appSetting:
                    owner.moveAppSetting()
                case .inquiry:
                    break
                    // TODO: 문의로 이동
                }
            })
            .disposed(by: disposeBag)
        
        return Output(sectionItems: sectionItems)
    }
    
    private func createSectionData() -> [MySection] {
        let myReview = MyPageInfo(type: .myReview, count: 15)
        let like = MyPageInfo(type: .like, count: 23)
        let appSetting = MyPageInfo(type: .appSetting)
        let inquiry = MyPageInfo(type: .inquiry)
        
        var sectionItems: [MySection] = []
        
        let myDataSection = MySection(model: .myData, items: [myReview, like])
        let appSettingSection = MySection(model: .appSetting, items: [appSetting])
        let inquirySection = MySection(model: .inquiry, items: [inquiry])
        
        sectionItems.append(myDataSection)
        sectionItems.append(appSettingSection)
        sectionItems.append(inquirySection)
        
        return sectionItems
    }
}

// MARK: - 화면 전환 함수
extension MyPageViewModel {
    /// 앱 설정으로 이동
    func moveAppSetting() {
        actions.moveAppSetting()
    }
}

enum MyPageRowType {
    case myReview
    case like
    case appSetting
    case inquiry
    
    var title: String {
        switch self {
        case .myReview:
            "내가 작성한 리뷰"
        case .like:
            "찜 목록"
        case .appSetting:
            "앱 설정"
        case .inquiry:
            "문의/제안하기"
        }
    }
}

enum MyPageSectionType {
    case myData
    case appSetting
    case inquiry
}
