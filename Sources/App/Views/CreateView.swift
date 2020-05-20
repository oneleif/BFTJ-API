//
//  CreateView.swift
//  App
//
//  Created by Zach Eriksen on 5/20/20.
//

import Plot

struct CreateView: View {
    var body: Node<HTML.BodyContext> {
        .div(
            .h1("BFTJ Post"),
            .p("Add a Post"),
            .form(
                .method(.post),
                .action("/post"),
                .fieldset(
                    .label(.for("title"), "Title"),
                    .input(
                        .required(true),
                        .name("title"),
                        .type(.text)
                    ),
                    .br(),
                    .label(.for("content"), "Content"),
                    .input(
                        .required(true),
                        .name("content"),
                        .type(.text)
                    ),
                    .br(),
                    .label(.for("socialMediaLinks"), "Social Media Links (URLs Separated by comma)"),
                    .input(
                        .required(false),
                        .name("socialMediaLinks"),
                        .type(.text)
                    ),
                    .br(),
                    .label(.for("image"), "Image URL"),
                    .input(
                        .required(false),
                        .name("image"),
                        .type(.url)
                    ),
                    .br(),
                    .label(.for("timeOfEvent"), "Time of Event"),
                    .input(
                        .required(false),
                        .name("timeOfEvent"),
                        .type(.number)
                    )
                ),
                .input(.type(.submit), .value("Create"))
            )
        )
        
    }
}
