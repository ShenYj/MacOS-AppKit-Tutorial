//
//  AppDelegate.swift
//  NSWindow
//
//  Created by EZen on 2021/12/29.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(windowClose(notification:)),
                         name: NSWindow.willCloseNotification,
                         object: nil)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        NotificationCenter.default.removeObserver(self)
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }

    @objc func windowClose(notification: Notification) {
        NSApplication.shared.stopModal()
    }
}

