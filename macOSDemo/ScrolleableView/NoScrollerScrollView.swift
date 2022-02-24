//
//  NoScrollerScrollView.swift
//  ScrolleableView
//
//  Created by EZen on 2022/2/24.
//

import AppKit

class NoScrollerScrollView: NSScrollView {
    
    override func tile() {
        super.tile()
        
        var hFrame = horizontalScroller?.frame
        hFrame?.size.height = 0
        if let hFrame = hFrame { horizontalScroller?.frame = hFrame }
        
        var vFrame = verticalScroller?.frame
        vFrame?.size.width = 0
        if let vFrame = vFrame { verticalScroller?.frame = vFrame }
    }
}
