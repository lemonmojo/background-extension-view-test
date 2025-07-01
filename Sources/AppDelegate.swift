import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    private let windowCtrl = WindowController()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        windowCtrl.showWindow(nil)
    }
}
