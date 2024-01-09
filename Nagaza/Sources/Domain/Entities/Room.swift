//
//  Room.swift
//  Nagaza
//
//  Created by SeungMin on 1/3/24.
//

// TODO: 지울 예정
// Default - 방이름    매장명    지점    스토리    장르    제한 시간    주소(위도)    주소(경도)    주소(도로명)    예약 페이지(url)    이미지(url)    전화번호    적정 인원    총점
// Details - 난이도    활동성    인테리어    장치 / 자물쇠    장르 연출 / 스토리    인생 테마    조도(방해)    볼륨(방해)    밀어내기    npc    직렬식/병렬식    노후도    삑딱쿵/분위기    공포도 (공포테마일때만 해당)    기타

import Foundation

struct Room {
    let identifier = UUID()
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
}

struct RoomsPage {
    let roomsList: [[Room]]
    let page: Int
    let totalPages: Int
}

extension Room: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: Room, rhs: Room) -> Bool {
        lhs.identifier == rhs.identifier
    }
}
