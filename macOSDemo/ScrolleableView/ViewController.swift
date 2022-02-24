//
//  ViewController.swift
//  ScrolleableView
//
//  Created by EZen on 2022/2/24.
//

import Cocoa

class ViewController: NSViewController {
    
    private lazy var scrollView: NSScrollView = {
        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        let scrollV = NSScrollView(frame: frame)
        scrollV.contentView.backgroundColor = NSColor.green
        
        guard let image = NSImage(named: NSImage.Name.init("rfwDB3L")) else { return scrollV }
        let imageViewFrame = CGRect(x: 0, y: 0, width: (image.size.width), height: (image.size.height))
        let imageView = NSImageView(frame: imageViewFrame)
        imageView.image = image
        
        /// 我说之前怎么 .show 带不出来呢, 是has开头
        scrollV.hasVerticalScroller = true
        scrollV.hasHorizontalRuler = true
        scrollV.documentView = imageView
        return scrollV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
        
        view.addSubview(scrollView)
    }

    func scroll() {
        let contentView: NSClipView = scrollView.contentView
        var newScrollOrigin: NSPoint
        if view.isFlipped {
            newScrollOrigin = NSPoint(x: 0, y: 0)
        }
        else {
            newScrollOrigin = NSPoint(x: 0, y: 200)
        }
        contentView.scroll(to: newScrollOrigin)
    }
    
    override func mouseUp(with event: NSEvent) {
        scroll()
    }
}

