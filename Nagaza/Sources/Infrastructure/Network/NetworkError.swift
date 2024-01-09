//
//  NetworkError.swift
//  Nagaza
//
//  Created by SeungMin on 1/8/24.
//

enum NetworkError: Error {
    case invalidURL
    case badConnection
    case invalidResponse
    case requestFailed
    case requestTimeout
    case noData
    case decodingError
    case unknown
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .badConnection:
            return "Bad Connection"
        case .invalidResponse:
            return "Invalid Response"
        case .requestFailed:
            return "Network request failed"
        case .requestTimeout:
            return "Request timed out."
        case .noData:
            return "No data received"
        case .decodingError:
            return "Error decoding data"
        default:
            return "Unknown Error"
        }
    }
}
