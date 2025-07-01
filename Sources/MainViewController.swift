import Cocoa

class MainViewController: NSViewController {
    private let splitViewCtrl = NSSplitViewController()
    private let outlineViewCtrl = OutlineViewController()
    private let contentViewCtrl = ContentViewController()
    
    init() {
        super.init(nibName: "MainViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the split view
        let splitView = splitViewCtrl.view
        splitView.frame = view.bounds
        splitView.autoresizingMask = [ .minXMargin, .maxXMargin, .minYMargin, .maxYMargin, .width, .height ]
        view.addSubview(splitView)
        
        // Create the sidebar split item
        let sidebarSplitViewItem = NSSplitViewItem(sidebarWithViewController: outlineViewCtrl)
        splitViewCtrl.addSplitViewItem(sidebarSplitViewItem)
        
        // Create Background Extension View
        let bgExtensionView = NSBackgroundExtensionView(frame: view.bounds)
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
