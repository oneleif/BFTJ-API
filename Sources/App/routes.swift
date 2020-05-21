import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let postController = PostController()
    router.get("posts", use: postController.index)
    router.post("posts", use: postController.create)
    router.delete("posts", Post.parameter, use: postController.delete)
    
    try router.register(collection: PortalController())
}
