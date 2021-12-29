//
//  ViewController.swift
//  NSWindow
//
//  Created by EZen on 2021/12/29.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var modalBtn: NSButton!
    
    /// 将被模态展示的 NSWindow 对象
    private lazy var modalWindow: NSWindow = {
        let rect = NSRect.init(origin: .zero, size: CGSize(width: 400, height: 280))
        let styleMask: NSWindow.StyleMask = [.titled, .closable, .resizable]
        let window = NSWindow(contentRect: rect,
                              styleMask: styleMask,
                              backing: NSWindow.BackingStoreType.buffered,
                              defer: false)
        /// 设置 title
        window.title = "Modal window"
        /// 设置 icon
        window.representedURL = URL(string: "WindowTitle")
        let image = NSImage(named: NSImage.Name.init("logo"))
        window.standardWindowButton(.documentIconButton)?.image = image
        /// 阻止 close 后内存释放
        window.isReleasedWhenClosed = false
        /// 在标题栏区域加一个子视图
        let titleView = window.standardWindowButton(.closeButton)?.superview
        let button = NSButton()
        let x = (window.contentView?.frame.width)! - 100
        let frame = CGRect(x: x, y: 0, width: 80, height: 24)
        button.frame = frame
        button.title = "Register"
        button.bezelStyle = .roundRect
        titleView?.addSubview(button)
        /// 居中展示
        window.center()
        return window
    }()
    

    @IBAction func modalTap(_ sender: NSButton) {
        print("点击按钮")
        NSApplication.shared.runModal(for: modalWindow)
    }
    
}


extension ViewController {
    
    func addButtonToTitleBar() {
        
    }
}
