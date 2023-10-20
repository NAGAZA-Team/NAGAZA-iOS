//
//  DefaultPosterImagesRepository.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

// MARK: - 여기에서 DTO 구조체는 도메인으로 매핑되며, Domain에 있는 Repository Protocol에는 DTO가 포함되어 있지 않습니다.
import Foundation

final class DefaultPosterImagesRepository {
    
}

extension DefaultPosterImagesRepository: PosterImagesRepository {
    func fetchImage(with imagePath: String, width: Int, completion: @escaping (Result<Data, Error>) -> Void) {
        
    }
}
