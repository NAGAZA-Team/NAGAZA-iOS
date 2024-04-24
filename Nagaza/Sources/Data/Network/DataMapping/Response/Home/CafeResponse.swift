//
//  CafeResponse.swift
//  Nagaza
//
//  Created by SeungMin on 1/7/24.
//

struct CafeResponse: Decodable {
    let cafes: [CafeResponseDTO]
    let page: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case cafes
        case page
        case totalPages = "total_pages"
    }
}

struct CafeResponseDTO: Decodable {
    let id: Int
    let name: String
    let branch: String
    let area: String
    let address: String
    let location: LocationDTO
    let storeUrlString: String
    let storeImageUrlString: String
    let totalNumberOfThemes: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, branch, area, address, location
        case storeUrlString = "store_url_string"
        case storeImageUrlString = "store_image_url_string"
        case totalNumberOfThemes = "total_number_of_themes"
    }
}

struct LocationDTO: Decodable {
    let latitude: Double
    let longitude: Double
}

extension CafeResponse {
    func toDomain() -> CafesPage {
        return CafesPage(
            cafes: self.cafes.map { $0.toDomain() }, 
            page: self.page,
            totalPages: totalPages
        )
    }
}

extension CafeResponseDTO {
    func toDomain() -> Cafe {
        return Cafe(
            id: self.id,
            name: self.name,
            branch: self.branch,
            area: self.area,
            address: self.address,
            location: self.location.toDomain(),
            storeUrlString: self.storeUrlString,
            storeImageUrlString: self.storeImageUrlString,
            totalNumberOfThemes: self.totalNumberOfThemes
        )
    }
}

extension LocationDTO {
    func toDomain() -> Location {
        return Location(
            latitude: self.latitude,
            longitude: self.longitude
        )
    }
}
