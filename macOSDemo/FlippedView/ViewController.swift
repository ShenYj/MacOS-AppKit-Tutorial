//
//  ViewController.swift
//  FlippedView
//
//  Created by EZen on 2022/1/2.
//

import Cocoa

class ViewController: NSViewController {
    
    private let flippedView: FlippedView = {
        let view = FlippedView()
        view.frame = NSRect(x: 10, y: 10, width: 200, height: 200)
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.orange.cgColor
        return view
    }()
    
    private let scrollView: BigView = {
        let view = BigView()
        view.frame = NSRect(x: 0, y: 0, width: 400, height: 700)
        view.contentView.wantsLayer = true
        view.contentView.layer?.backgroundColor = NSColor.blue.cgColor
        view.contentView.backgroundColor = NSColor.red
        view.scrollerStyle = .legacy
        view.postsFrameChangedNotifications = true
        return view
    }()
    
    private let subView: NSTextView = {
        let tv = NSTextView(frame: NSRect(x: 10, y: 10, width: 100, height: 20))
        tv.string = "测试"
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        flippedView.addSubview(subView)
        scrollView.addSubview(flippedView)
        view.addSubview(scrollView)
        
    }
    
    override func mouseUp(with event: NSEvent) {
        print("\(#function)")
        scrollView.saveScrollViewAsImage()
    }
    
    
    /// 监听 frame 变化
    func registerNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(recieveFrameChangeNotification(_:)),
                                               name: NSView.frameDidChangeNotification,
                                               object: scrollView)
        
    }
    @objc
    func recieveFrameChangeNotification(_ notification: Notification) {
        
    }
}


