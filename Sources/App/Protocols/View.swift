//
//  View.swift
//  App
//
//  Created by Zach Eriksen on 5/20/20.
//

import Plot

protocol View {
    var body: Node<HTML.BodyContext> { get }
}
