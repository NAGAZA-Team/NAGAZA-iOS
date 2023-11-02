//
//  NetworkLoggerPluggin.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import Moya

// Log 확인 용도
struct NetworkLoggerPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        guard let httpRequest = request.request else {
            print("Invalid request:")
            return
        }
        
        let url = httpRequest.description
        let method = httpRequest.httpMethod ?? "unknown method"
        
        /// HTTP Request Summary
        var httpLog = """
                        [HTTP Request]
                        URL: \(url)
                        TARGET: \(target)
                        METHOD: \(method)\n
                        """
        /// HTTP Request Header
        httpLog.append("HEADER: [\n")
        httpRequest.allHTTPHeaderFields?.forEach {
            httpLog.append("\t\($0): \($1)\n")
        }
        httpLog.append("]\n")
        
        /// HTTP Request Body
        if let body = httpRequest.httpBody, let bodyString = String(bytes: body, encoding: String.Encoding.utf8) {
            httpLog.append("BODY: \n\(bodyString)\n")
        }
        httpLog.append("[HTTP Request End]")
        
        print(httpLog)
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case let .success(response):
            onSuceed(response, target: target, isFromError: false)
        case let .failure(error):
            onFail(error, target: target)
        }
    }
    
    func onSuceed(_ response: Response, target: TargetType, isFromError: Bool) {
        let request = response.request
        let url = request?.url?.absoluteString ?? "nil"
        let statusCode = response.statusCode
        
        /// HTTP Response Summary
        var httpLog = """
                        [HTTP Response]
                        TARGET: \(target)
                        URL: \(url)
                        STATUS CODE: \(statusCode)\n
                        """
        
        /// HTTP Response Header
        httpLog.append("HEADER: [\n")
        response.response?.allHeaderFields.forEach {
            httpLog.append("\t\($0): \($1)\n")
        }
        httpLog.append("]\n")
        
        /// HTTP Response Data
        httpLog.append("RESPONSE DATA: \n")
        if let responseString = String(bytes: response.data, encoding: String.Encoding.utf8) {
            httpLog.append("\(responseString)\n")
        }
        httpLog.append("[HTTP Response End]")
        
        print(httpLog)
    }
    
    func onFail(_ error: MoyaError, target: TargetType) {
        if let response = error.response {
            onSuceed(response, target: target, isFromError: true)
            return
        }
        /// HTTP Error Summary
        var httpLog = """
                        [HTTP Error]
                        TARGET: \(target)
                        ERRORCODE: \(error.errorCode)\n
                        """
        httpLog.append("MESSAGE: \(error.failureReason ?? error.errorDescription ?? "unknown error")\n")
        httpLog.append("[HTTP Error End]")
        
        print(httpLog)
        
    }
}

