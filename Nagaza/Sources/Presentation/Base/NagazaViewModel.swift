//
//  ViewModelType.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import Foundation

import RxSwift

protocol CoordinatorActions: AnyObject { }

protocol NagazaViewModel {
    associatedtype CoordinatorActions

    associatedtype Input
    associatedtype Output
        
    func setCoordinatorActions(with actions: CoordinatorActions)
    
    func transform(input: Input) -> Output
}

