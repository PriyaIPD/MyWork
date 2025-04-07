//
//  GithubModel.swift
//  SpeerAssignment
//
//  Created by Priya Gandhi on 2025-04-05.
//

import Foundation
struct GithubUser: Identifiable, Codable {
    var id: Int
    var login: String
    var avatarURL: String
    var followersURL: String
    var followingURL: String
    var gistsURL: String
    var starredURL: String
    var subscriptionsURL: String
    var organizationsURL: String
    var reposURL: String
    var eventsURL: String
    var receivedEventsURL: String
    var type: String
    var siteAdmin: Bool

    var name: String?
    var bio: String?
    
    // Add properties for followers and following counts
    var followersCount: Int?
    var followingCount: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case name
        case bio
        case followersCount = "followers_count"  // Add this field to the API response mapping
        case followingCount = "following_count"  // Add this field to the API response mapping
    }
}

struct GithubFollower: Codable {
    var login: String
    var avatarURL: String?  // Make avatarURL optional
    var id: Int

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case id
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        login = try container.decode(String.self, forKey: .login)
        avatarURL = try container.decodeIfPresent(String.self, forKey: .avatarURL)  // Handle missing key by allowing nil
        id = try container.decode(Int.self, forKey: .id)
    }
}

struct GithubFollowing: Codable {
    var login: String
    var avatarURL: String?  // Make avatarURL optional
    var id: Int

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case id
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        login = try container.decode(String.self, forKey: .login)
        avatarURL = try container.decodeIfPresent(String.self, forKey: .avatarURL)  // Handle missing key by allowing nil
        id = try container.decode(Int.self, forKey: .id)
    }
}

