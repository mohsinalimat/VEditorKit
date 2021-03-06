//
//  VEditorTextCellNode.swift
//  VEditorKit
//
//  Created by Geektree0101 on 01/02/19.
//  Copyright © 2019 Geektree0101. All rights reserved.
//

import Foundation
import AsyncDisplayKit
import RxSwift
import RxCocoa

public class VEditorTextCellNode: ASCellNode {
    
    public var insets: UIEdgeInsets = .zero
    public var isEdit: Bool = true
    public var textNode: VEditorTextNode
    public let disposeBag = DisposeBag()
    
    public required init(_ insets: UIEdgeInsets,
                         isEdit: Bool,
                         placeholderText: String?,
                         attributedText: NSAttributedString,
                         rule: VEditorRule) {
        self.insets = insets
        self.isEdit = isEdit
        self.textNode = VEditorTextNode(rule,
                                        isEdit: isEdit,
                                        placeholderText: placeholderText,
                                        attributedText: attributedText)
        super.init()
        self.automaticallyManagesSubnodes = true
        self.selectionStyle = .none
    }
    
    override public func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: insets, child: self.textNode)
    }
}
