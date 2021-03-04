//
//  SearchModel.swift
//  SampleAlamofire
//
//  Created by 三浦　登哉 on 2021/03/04.
//

import Foundation

struct SearchModel<Item:Codable>: Codable {
    var totalCount: Int
    var items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
// GitHubのユーザー
struct User: Codable {
    var id: Int
    var login: String
}
// GitHubのリポジトリ
struct  Repository: Codable {
    var id: Int
    var name: String
    var fullName: String
    var owner: User
    
    // JSONではfull_nameとなっているので対応関係を少し明確にする
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name" // JSONではfull_name
        case owner
    }
}
