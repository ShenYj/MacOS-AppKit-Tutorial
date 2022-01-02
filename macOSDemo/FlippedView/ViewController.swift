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
    
    private let subView: NSTextView = {
        let tv = NSTextView(frame: NSRect(x: 10, y: 10, width: 100, height: 20))
        tv.string = "测试"
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        flippedView.addSubview(subView)
        view.addSubview(flippedView)
    }
}
