//
//  ImageController.swift
//  App
//
//  Created by Zach Eriksen on 5/27/20.
//

import Vapor
import Plot

struct ImageUploadData: Content {
    var name: String
    var image: Data
    var path: String?
}

/// Controls basic CRUD operations on `Post`s.
final class ImageController: RouteCollection {
    let imageFolder = "PostImages/"
    
    func boot(router: Router) throws {
        router.post("image", use: addPostImageHandler)
        router.get("image", String.parameter, use: getPostImageHandler)
    }
    
    func addPostImageHandler(_ req: Request) throws -> Future<Response> {
        // 1
        //        return try flatMap(
        //          to: Response.self,
        //          req.parameters.next(User.self),
        try req.content.decode(ImageUploadData.self).flatMap {
            //        ) {
            //            user,
            imageData in
            var imageData = imageData
            // 2
            let workPath =
                try req.make(DirectoryConfig.self).workDir
            // 3
            let name = "\(imageData.name)-\(UUID().uuidString).jpg"
            imageData.path = name
            //              try "\(user.requireID())-\(UUID().uuidString).jpg"
            // 4
            let path = workPath + self.imageFolder + name
            // 5
            FileManager().createFile(
                atPath: path,
                contents: imageData.image,
                attributes: nil)
            // 6
            //            user.profilePicture = name
            // 7
            //            let redirect =
            //              try req.redirect(to: "/users/\(user.requireID())")
            //            return user.save(on: req).transform(to: redirect)
//            return req.redirect(to: "/post")
            return try HTML(
                .head(
                    .title("My website"),
                    .stylesheet("styles.css"),
                    .stylesheet("https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css")
                ),
                .body(
                    CreateView(post: nil, image: imageData).body
                )
            ).encode(for: req)
        }
    }
    
    func getPostImageHandler(_ req: Request) throws -> Future<Response> {
        let fileName = try req.parameters.next(String.self)
        
        let path = try req.make(DirectoryConfig.self)
            .workDir + self.imageFolder + fileName
        
        return try req.streamFile(at: path)
    }
}
