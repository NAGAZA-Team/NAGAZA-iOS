//
//  HomeTarget+SampleData.swift
//  Nagaza
//
//  Created by SeungMin on 1/7/24.
//

import Foundation

import Moya

extension HomeTarget {
    var sampleData: Data {
        switch self {
        case .fetchCafesList:
            return Data(
    """
    {
      "cafes": [
        {
          "id": 1,
          "name": "마스터 키",
          "branch": "플레이포인트랩강남점",
          "area": "강남",
          "address": "서울특별시 강남구 강남대로98길 11 3F",
          "location": {
            "latitude": 37.5519,
            "longitude": 126.9905
          },
          "store_url_string": "http://www.master-key.co.kr/home",
          "store_image_url_string": "http://www.master-key.co.kr/images/logo.png",
          "total_number_of_themes": 7
        },
        {
          "id": 2,
          "name": "마스터 키",
          "branch": "프라임신촌퍼플릭",
          "area": "신촌",
          "address": "서울특별시 강남구 강남대로98길 11 3F",
          "location": {
            "latitude": 37.5530,
            "longitude": 126.9871
          },
          "store_url_string": "http://www.keybeanscafe.com",
          "store_image_url_string": "http://www.keybeanscafe.com/images/logo.png",
          "total_number_of_themes": 4
        },
        {
          "id": 3,
          "name": "마스터 키",
          "branch": "프라임신촌퍼플릭",
          "area": "신촌",
          "address": "서울특별시 강남구 강남대로98길 11 3F",
          "location": {
            "latitude": 37.5530,
            "longitude": 126.9871
          },
          "store_url_string": "http://www.keybeanscafe.com",
          "store_image_url_string": "http://www.keybeanscafe.com/images/logo.png",
          "total_number_of_themes": 4
        }
      ],
      "page": 1,
      "total_pages": 1
    }
    """.utf8)
        case .fetchRoomsList:
            return Data(
    """
      {
        "roomsList": [
        [
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          }
        ],
        [
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          }
        ],
        [
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          }
        ],
        [
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          }
        ],
        [
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          }
        ],
        [
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          }
        ],
        [
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          },
          {
            "name": "리허설",
            "area": "플레이포인트랩강남점",
            "story": "Fantasy_Floor",
            "genre": "Adventure",
            "time_limit": 60,
            "address": "789_Central_Ave_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/193_img1.gif",
            "appropriate_number_of_people": 4,
            "total": 4.5
          },
          {
            "name": "갱생",
            "area": "플레이포인트랩강남점",
            "story": "Secret_Floor",
            "genre": "Mystery",
            "time_limit": 75,
            "address": "456_Oak_St_City",
            "reservation_url_string": "http://www.master-key.co.kr/booking/bk_detail?bid=35",
            "image_url_string": "http://www.master-key.co.kr/upload/room/194_img1.gif",
            "appropriate_number_of_people": 6,
            "total": 9.1
          }
        ]
      ],
      "page": 1,
      "total_pages": 1
    }
    """.utf8)
        }
    }
}
