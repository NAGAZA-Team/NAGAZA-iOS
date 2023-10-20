//
//  PosterImagesRepository.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import Foundation

protocol PosterImagesRepository {
    func fetchImage(
        with imagePath: String,
        width: Int,
        completion: @escaping (Result<Data, Error>) -> Void
    )
}
