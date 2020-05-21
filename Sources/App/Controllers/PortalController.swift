//
//  PortalController.swift
//  App
//
//  Created by Zach Eriksen on 5/20/20.
//

import Vapor
import Plot

struct BadPostID: Error {
    let description = "BadID"
}


/// Controls basic CRUD operations on `Post`s.
final class PortalController: RouteCollection {
    func boot(router: Router) throws {
        router.get(use: index)
        router.post("post", use: create)
        router.post("delete", Post.parameter, use: delete)

        router.get("post") {
            try HTML(
                .head(
                    .title("My website"),
                    .stylesheet("styles.css")
                ),
                .body(
                    CreateView().body
                )
            ).encode(for: $0)
        }
    }
    
    /// Returns a list of all `Post`s.
    func index(_ req: Request) throws -> Future<Response> {
        Post.query(on: req).all()
            .flatMap {
            try HTML(
                .head(
                    .title("My website"),
                    .stylesheet("styles.css")
                ),
                .body(
                    .if($0.isEmpty, .h3("Oh No! There are no posts...")),
                    IndexView(posts: $0).body
                )
            ).encode(for: req)
        }
    }
    
    /// Saves a decoded `Post` to the database.
    func create(_ req: Request) throws -> Future<Response> {
        try req.content.decode(Post.self)
        .flatMap { post in
            post.save(on: req)
        }
        .map { _ in
            req.redirect(to: "/")
        }
    }
    
    /// Deletes a parameterized `Post`.
    func delete(_ req: Request) throws -> Future<Response> {
        try req.parameters.next(Post.self)
        .flatMap { post in
            post.delete(on: req)
        }
        .map { _ in
            req.redirect(to: "/")
        }
    }
}
