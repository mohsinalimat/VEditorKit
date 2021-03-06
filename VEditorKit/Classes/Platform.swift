//
//  Platform.swift
//  VEditorKit
//
//  Created by Geektree0101 on 01/02/19.
//  Copyright © 2019 Geektree0101. All rights reserved.
//

import BonMot

public typealias VEditorStyleAttribute = BonMot.StyleAttributes
public typealias VEditorStyle = BonMot.StringStyle

public enum VEditorParserResultScope {
    case error(Error?)
    case success([VEditorContent])
}

extension NSAttributedString: VEditorContent { }
public let VEditorAttributeKey: NSAttributedString.Key = .init(rawValue: "VEditorKit.AttributeKey")

public protocol VEdiorMediaContent: VEditorContent {
    var xmlTag: String { get }
    init(_ xmlTag: String, attributes: [String: String])
    func parseAttributeToXML() -> [String: String] // parseto xml attribute from media content
}

public protocol VEditorRule {
    var allXML: [String] { get }
    var defaultStyleXMLTag: String { get }
    func paragraphStyle(_ xmlTag: String, attributes: [String: String]) -> VEditorStyle?
    func build(_ xmlTag: String, attributes: [String: String]) -> VEdiorMediaContent?
    func parseAttributeToXML(_ xmlTag: String, attributes: [NSAttributedString.Key: Any]) -> [String: String]?
    
    func enableTypingXMLs(_ inActiveXML: String) -> [String]?
    func disableTypingXMLs(_ activeXML: String) -> [String]?
    func inactiveTypingXMLs(_ activeXML: String) -> [String]?
    func activeTypingXMLs(_ inactiveXML: String) -> [String]?
}

extension VEditorRule {
    
    func defaultAttribute() -> [NSAttributedString.Key: Any] {
        guard let attr = self.paragraphStyle(self.defaultStyleXMLTag, attributes: [:]) else {
            fatalError("Please setup default:\(self.defaultStyleXMLTag) xml tag style")
        }
        return attr.attributes
    }
}
