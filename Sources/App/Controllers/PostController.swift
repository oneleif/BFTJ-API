import Vapor

/// Controls basic CRUD operations on `Post`s.
final class PostController {
    /// Returns a list of all `Post`s.
    func index(_ req: Request) throws -> Future<[Post]> {
        return Post.query(on: req).all()
    }

    /// Saves a decoded `Post` to the database.
    func create(_ req: Request) throws -> Future<Post> {
        return try req.content.decode(Post.self).flatMap { Post in
            return Post.save(on: req)
        }
    }

    /// Deletes a parameterized `Post`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Post.self).flatMap { Post in
            return Post.delete(on: req)
        }.transform(to: .ok)
    }
}
