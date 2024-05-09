//
//  RegionSettingTarget+SampleData.swift
//  Nagaza
//
//  Created by 전성훈 on 4/30/24.
//

import Foundation

import Moya

extension RegionSettingTarget {
    var sampleData: Data {
        switch self {
        case .fetchRegionsThemeCount:
            return Data(
    """
    {
      "regions": [
        {
          "mainRegion": "전국",
          "subRegions": [
            {
              "region": "전국",
              "themeCount": 2855
            }
          ]
        },
        {
          "mainRegion": "서울",
          "subRegions": [
            {"region": "서울", "themeCount": 625},
            {"region": "강남", "themeCount": 120},
            {"region": "건대", "themeCount": 90},
            {"region": "홍대", "themeCount": 85},
            {"region": "신촌", "themeCount": 75},
            {"region": "대학로", "themeCount": 60},
            {"region": "강북", "themeCount": 45},
            {"region": "신림", "themeCount": 30},
            {"region": "서울 기타", "themeCount": 20}
          ]
        },
        {
          "mainRegion": "경기도",
          "subRegions": [
            {"region": "경기도", "themeCount": 880},
            {"region": "인천", "themeCount": 150},
            {"region": "부천", "themeCount": 130},
            {"region": "일산", "themeCount": 140},
            {"region": "수원", "themeCount": 90},
            {"region": "안양", "themeCount": 80},
            {"region": "경기도 기타", "themeCount": 70}
          ]
        },
        {
          "mainRegion": "충청도",
          "subRegions": [
            {"region": "충청도", "themeCount": 710},
            {"region": "대전", "themeCount": 180},
            {"region": "천안", "themeCount": 160},
            {"region": "청주", "themeCount": 140},
            {"region": "충청도 기타", "themeCount": 120}
          ]
        },
        {
          "mainRegion": "경상도",
          "subRegions": [
            {"region": "경상도", "themeCount": 560},
            {"region": "대구", "themeCount": 180},
            {"region": "부산", "themeCount": 200},
            {"region": "경상도 기타", "themeCount": 160}
          ]
        },
        {
          "mainRegion": "전라도",
          "subRegions": [
            {"region": "전라도", "themeCount": 550},
            {"region": "광주", "themeCount": 190},
            {"region": "전주", "themeCount": 170},
            {"region": "전라도 기타", "themeCount": 150}
          ]
        },
        {
          "mainRegion": "강원도",
          "subRegions": [
            {"region": "강원도", "themeCount": 100}
          ]
        },
        {
          "mainRegion": "제주도",
          "subRegions": [
            {"region": "제주도", "themeCount": 250}
          ]
        }
      ]
    }
    """.utf8)
        }
    }
}
