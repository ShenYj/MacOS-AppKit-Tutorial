//
//  DisableVerticalScrollView.swift
//  ScrolleableView
//
//  Created by EZen on 2022/2/24.
//

import AppKit

class DisableVerticalScrollView: NSScrollView {
    
    override func scrollWheel(with event: NSEvent) {
        let f = abs(event.deltaY)
        if event.deltaX == 0.0 && f >= 0.01 {
            return
        }
        else if event.deltaX == 0.0 && f == 0.0 {
            return
        }
        else {
            super.scrollWheel(with: event)
        }
    }
}
