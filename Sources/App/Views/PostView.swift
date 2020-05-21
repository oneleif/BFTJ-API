//
//  PostView.swift
//  App
//
//  Created by Zach Eriksen on 5/20/20.
//

import Plot

struct PostView: View {
    let post: Post
    
    var body: Node<HTML.BodyContext> {
        .div(
            .div(
                post.image.map {
                    .img(
                        .src($0)
                    )
                    } ?? .br(),
                .h1("\(post.title)"),
                .text(post.content),
                .text(post.socialMediaLinks ?? "No Links"),
                post.timeOfEvent.map {
                    .text("timeOfEvent Epoch: \($0)")
                } ?? .br()
            ),
            post.id.map {
                .div(
                    .id("right-div"),
                    .form(
                        .method(.post),
                        .action("delete/\($0)"),
                        .button(.text("Delete"))
                    )
                )
            } ?? .br()
        )
    }
}
