//
//  ViewController.swift
//  VisualEffectView
//
//  Created by EZen on 2022/2/24.
//

import Cocoa

class ViewController: NSViewController {
    
    lazy var effectVIew: NSVisualEffectView = {
        let effectView = NSVisualEffectView()
        effectView.wantsLayer = true
        effectView.material = .light
        effectView.state = .active
        effectView.blendingMode = .withinWindow
        return effectView
    }()

    override func viewDidAppear() {
        super.viewDidAppear()
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
        effectVIew.frame = view.bounds
        view.addSubview(effectVIew, positioned: .below, relativeTo: view.subviews.first)
    }
}

