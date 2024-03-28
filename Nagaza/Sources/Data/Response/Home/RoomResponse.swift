//
//  RoomsResponse.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

struct RoomsResponse: Decodable {
    let roomsList: [[RoomResponseDTO]]
    let page: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case roomsList
        case page
        case totalPages = "total_pages"
    }
}

struct RoomResponseDTO: Decodable {
    let name: String
    let area: String
    let story: String
    let genre: String
    let timeLimit: Int
    let address: String
    let reservationUrlString: String
    let imageUrlString: String
    let appropriateNumberOfPeople: Int
    let total: Double
    
    enum CodingKeys: String, CodingKey {
        case name, area, story, genre
        case timeLimit = "time_limit"
        case address
        case reservationUrlString = "reservation_url_string"
        case imageUrlString = "image_url_string"
        case appropriateNumberOfPeople = "appropriate_number_of_people"
        case total
    }
}

extension RoomsResponse {
    func toDomain() -> RoomsPage {
        return RoomsPage(
            roomsList: self.roomsList.map { $0.map { $0.toDomain() } },
            page: self.page,
            totalPages: self.totalPages
        )
    }
}

extension RoomResponseDTO {
    func toDomain() -> Room {
        return Room(
            name: self.name,
            area: self.area,
            story: self.story,
            genre: self.genre,
            timeLimit: self.timeLimit,
            address: self.address,
            reservationUrlString: self.reservationUrlString,
            imageUrlString: self.imageUrlString,
            appropriateNumberOfPeople: self.appropriateNumberOfPeople,
            total: self.total
        )
    }
}
