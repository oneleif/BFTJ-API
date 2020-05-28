//
//  CreateView.swift
//  App
//
//  Created by Zach Eriksen on 5/20/20.
//

import Plot

struct CreateView: View {
    var post: Post?
    var image: ImageUploadData?
    
    var body: Node<HTML.BodyContext> {
        .div(
            .style("display: flex;"),
            
            addPostView,
            imageUploadView
        )
        
    }
    
    var addPostView: Node<HTML.BodyContext> {
        .div(
            .h1("BFTJ Post"),
            .h3("Add a Post"),
            .form(
                .method(.post),
                .action("/post"),
                .fieldset(
                    .label(.for("title"), "Title"),
                    .input(
                        .required(true),
                        .name("title"),
                        .value("\(post?.title ?? "")"),
                        .type(.text)
                    ),
                    .br(),
                    .label(.for("content"), "Content"),
                    .textarea(
                        .name("content"),
                        .text(""),
                        .required(true)
                    ),
                    .br(),
                    .label(.for("socialMediaLinks"), "Social Media Links (URLs Separated by comma)"),
                    .input(
                        .required(false),
                        .name("socialMediaLinks"),
                        .value("\(post?.socialMediaLinks ?? "")"),
                        .type(.text)
                    ),
                    .br(),
                    .label(.for("timeOfEvent"), "Time of Event"),
                    .input(
                        .required(true),
                        .name("timeOfEvent"),
                        .value("\(post?.timeOfEvent ?? 0)"),
                        .type(HTMLInputType.date)
                    )
                ),
                .input(
                    .type(.submit),
                    .value("Create")
                )
            )
        )
    }
    
    var imageUploadView: Node<HTML.BodyContext> {
        .div(
            .h3("Upload Post Image"),
            .img(
                .src("image/\(image?.path ?? "")")
                ),
            .form(
                .enctype(.multipartData),
                .method(.post),
                .action("/image"),
                .fieldset(
                    .label(.for("imageName"), "Image Name"),
                    .input(
                        .required(true),
                        .name("name"),
                        .type(.text)
                        ),
                    .label(.for("image"), "Image"),
                    .input(
                        .required(true),
                        .name("image"),
                        .type(.file)
                    )
                ),
                .input(
                    .type(.submit),
                    .value("Upload")
                )
            )
        )
        
    }
}
