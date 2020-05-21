//
//  HTML+ResponseEncodable.swift
//  App
//
//  Created by Zach Eriksen on 5/20/20.
//

import Plot
import Vapor

// ACK: https://gist.github.com/bellots/1d3d4642a657a4e35539561dab967c34#file-html-extension-swift
// extension HTML: ResponseEncodable {
//     public func encode(for req: Request) throws -> EventLoopFuture<Response> {
//         let res = Response(http: .init(headers: ["content-type": "text/html; charset=utf-8"], body: self.render()), using: req.sharedContainer)
//         return req.sharedContainer.eventLoop.newSucceededFuture(result: res)
//     }
// }

// Modified
extension HTML {
    public func encode(for req: Request) throws -> EventLoopFuture<Response> {
        let res = Response(http: .init(headers: ["content-type": "text/html; charset=utf-8"], body: self.render()), using: req.sharedContainer)
        return req.sharedContainer.eventLoop.newSucceededFuture(result: res)
    }
}
