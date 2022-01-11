//
//  TasksModel.swift
//  AlhanoufAlghayhab_BucketlistAPI
//
//  Created by administrator on 22/10/2021.
//

import Foundation

struct Tasksmodel: Codable {
    let id: Int
    var objective: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, objective
        case createdAt = "created_at"
    }
}

