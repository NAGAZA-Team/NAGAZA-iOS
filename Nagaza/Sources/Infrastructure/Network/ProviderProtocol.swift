//
//  ProviderProtocol.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import Foundation

import Moya
import RxMoya
import RxSwift

protocol ProviderProtocol: AnyObject, Networkable {
    var provider: MoyaProvider<Target> { get set }
    init(isStub: Bool, sampleStatusCode: Int, customEndpointClosure: ((Target) -> Endpoint)?)
}

extension ProviderProtocol {
    static func consProvider(
        _ isStub: Bool = false,
        _ sampleStatusCode: Int = 200,
        _ customendpointClosure: ((Target) -> Endpoint)? = nil) -> MoyaProvider<Target> {
            if isStub == false {
                return makeProvider()
            } else {
                let endPointClosure = { (target: Target) -> Endpoint in
                    let sampleResponseClosure: () -> EndpointSampleResponse = {
                        EndpointSampleResponse.networkResponse(sampleStatusCode, target.sampleData)
                    }
                    
                    return Endpoint(
                        url: URL(target: target).absoluteString,
                        sampleResponseClosure: sampleResponseClosure,
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers
                    )
                }
                return MoyaProvider<Target>(
                    endpointClosure: customendpointClosure ?? endPointClosure,
                    stubClosure: MoyaProvider.immediatelyStub(_:)
                )
            }
        }
    
    func request<D: Decodable>(type: D.Type, target: Target) -> Single<D> {
        provider.rx.request(target)
            .map(type)
    }
    
    func requestWithNoContent(target: Target) -> Single<Void> {
        provider.rx.request(target)
            .map { _ in }
    }
}

