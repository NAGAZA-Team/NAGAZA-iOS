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
    
}

final class MyPageViewModel {
    
    private let actions: MyPageViewModelActions!
    
    private var disposeBag = DisposeBag()
    
    struct Input {
        let initialTrigger: Driver<Void>
    }
    
    struct Output {
        let sectionItems: Driver<[MyPageInfoSection]>
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
            .flatMapLatest {
                var sectionItems = [MyPageInfoSection]()
                
                let myReview = MyPageInfo(title: "내가 작성한 리뷰", count: 15)
                let like = MyPageInfo(title: "찜 목록", count: 23)
                let appSetting = MyPageInfo(title: "앱 설정")
                let inquiry = MyPageInfo(title: "문의/제안하기")
                
                let myDataSection = MyPageInfoSection.myData([myReview, like])
                let appSettingSection = MyPageInfoSection.appSetting([appSetting])
                let inquirySection = MyPageInfoSection.inquiry([inquiry])
                
                sectionItems.append(myDataSection)
                sectionItems.append(appSettingSection)
                sectionItems.append(inquirySection)
                                                                
                return Driver.just(sectionItems)
            }
        
        return Output(sectionItems: sectionItems)
    }
}
