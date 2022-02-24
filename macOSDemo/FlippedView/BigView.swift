//
//  BigView.swift
//  FlippedView
//
//  Created by EZen on 2022/2/24.
//

import AppKit

class BigView: NSScrollView {

    func saveScrollViewAsImage() {
        let pdfData = dataWithPDF(inside: bounds)
        let imageRep = NSPDFImageRep(data: pdfData)!
        let count = imageRep.pageCount
        for i in 0...count {
            imageRep.currentPage = i
            let tempImage = NSImage()
            tempImage.addRepresentation(imageRep)
            let rep = NSBitmapImageRep(data: tempImage.tiffRepresentation!)
            let imageData = rep?.representation(using: .png, properties: [:])
            let path = "/Users/shenyj/Downloads/scrollViewCapture.png"
            FileManager.default.createFile(atPath: path, contents: imageData, attributes: nil)
            
            // 保存结束后 Finder 中自动定位到文件路径
            let fileURL = URL(fileURLWithPath: path)
            NSWorkspace.shared.activateFileViewerSelecting([fileURL])
        }
    }
    
    
    // drawRect 内绘制
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        NSColor.blue.setFill()
        let frame = self.bounds
        let path = NSBezierPath()
        path.appendRoundedRect(frame, xRadius: 20, yRadius: 20)
        path.fill()
    }

}
