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
        let cellDatas: Driver<[MypageInfo]>
    }
    
    init(
        actions: MyPageViewModelActions
    ) {
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let response = input.initialTrigger
        // TODO: 서버 데이터 가져오기
        
        let cellDatas = Driver.just(makeCellDatas())
        return Output(cellDatas: cellDatas)
    }
    
    private func makeCellDatas() -> [MypageInfo] {
        let myReview = MypageInfo(title: "내가 작성한 리뷰", count: 15)
        let like = MypageInfo(title: "찜 목록", count: 23)
        let appSetting = MypageInfo(title: "앱 설정")
        let inquiry = MypageInfo(title: "문의/제안하기")
        
        return [myReview, like, appSetting, inquiry]
    }
}
