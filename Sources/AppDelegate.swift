import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet var window: NSWindow!
    
    private let splitViewCtrl = NSSplitViewController()
    private let outlineViewCtrl = OutlineViewController()
    private let contentViewCtrl = ContentViewController()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        guard let contentView = window.contentView else {
            fatalError()
        }
        
        // Create the split view
        let splitView = splitViewCtrl.view
        splitView.frame = contentView.bounds
        splitView.autoresizingMask = [ .minXMargin, .maxXMargin, .minYMargin, .maxYMargin, .width, .height ]
        contentView.addSubview(splitView)
        
        // Create the sidebar split item
        let sidebarSplitViewItem = NSSplitViewItem(sidebarWithViewController: outlineViewCtrl)
        splitViewCtrl.addSplitViewItem(sidebarSplitViewItem)
        
        // Create Background Extension View
        let bgExtensionView = NSBackgroundExtensionView(frame: contentView.bounds)
        bgExtensionView.contentView = contentViewCtrl.view
        
        // Create a view controller for it
        let bgContentViewCtrl = NSViewController()
        bgContentViewCtrl.view = bgExtensionView
        
        // Create a split view item for the content
        let contentSplitViewItem = NSSplitViewItem(contentListWithViewController: bgContentViewCtrl)
        // This makes the content flow under the sidebar
        contentSplitViewItem.automaticallyAdjustsSafeAreaInsets = true
        splitViewCtrl.addSplitViewItem(contentSplitViewItem)
    }
}
