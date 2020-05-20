//
//  Post.swift
//  App
//
//  Created by Zach Eriksen on 5/20/20.
//

import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class Post: SQLiteModel {
    typealias Database = SQLiteDatabase
    /// The unique identifier for this `Post`.
    var id: Int?

    /// A title describing what this `Post` entails.
    var title: String
    
    /// The content of the `Post`.
    var content: String
    
    /// A CSV of the urls for the different social media platform posts of this `Post`.
    var socialMediaLinks: String?
    
    /// A Image URL for this `Post`.
    var image: String?
    
    /// Time of the Event for the `Post`.
    var timeOfEvent: Double?
    
    
    /// Creates a new `Post`.
    init(id: Int? = nil,
         title: String,
         content: String,
         socialMediaLinks: String?,
         image: String? = nil,
         timeOfEvent: Double? = nil) {
        self.id = id
        self.title = title
        self.content = content
        self.socialMediaLinks = socialMediaLinks
        self.image = image
        self.timeOfEvent = timeOfEvent
    }
}

/// Allows `Post` to be used as a dynamic migration.
extension Post: Migration { }

/// Allows `Post` to be encoded to and decoded from HTTP messages.
extension Post: Content { }

/// Allows `Post` to be used as a dynamic parameter in route definitions.
extension Post: Parameter { }
