//
//  ViewModelType.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import Foundation

import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

