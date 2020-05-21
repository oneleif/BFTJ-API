//
//  IndexView.swift
//  App
//
//  Created by Zach Eriksen on 5/20/20.
//

import Plot

struct IndexView: View {
    let posts: [Post]

    var body: Node<HTML.BodyContext> {
        .div(
            .h1("Posts"),
            .div(
                .a(
                    .href("post"),
                    .p("Add New Post")
                )
            ),
            .forEach(posts) {
                PostView(post: $0).body
            }
        )
    }
}
