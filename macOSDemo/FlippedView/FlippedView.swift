//
//  FlippedView.swift
//  FlippedView
//
//  Created by EZen on 2022/1/2.
//

import AppKit

class FlippedView: NSView {
    override var isFlipped: Bool { true }

    // drawRect 之外绘制
    func drawViewShape() {
        lockFocus()
        let text: NSString = "RoundedRect"
        let font = NSFont(name: "Palatino-Roman", size: 12)
        let attrs = [NSAttributedString.Key.font: font!,
                     NSAttributedString.Key.foregroundColor: NSColor.blue,
                     NSAttributedString.Key.backgroundColor: NSColor.red
        ]
        let location = NSPoint(x: 50, y: 50)
        text.draw(at: location, withAttributes: attrs)
        unlockFocus()
    }
    
    func saveSelfAsImage() {
        let image = NSImage(data: dataWithPDF(inside: bounds))
        
        let imageData = image!.tiffRepresentation
        let fileManager = FileManager.default
        let path = "/Users/shenyj/Downloads/myCapture.png"
        fileManager.createFile(atPath: path, contents: imageData, attributes: nil)
        
        // 保存结束后 Finder 中自动定位到文件路径
        let fileURL = URL(fileURLWithPath: path)
        NSWorkspace.shared.activateFileViewerSelecting([fileURL])
    }
}
