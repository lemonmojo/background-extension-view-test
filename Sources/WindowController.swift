import Cocoa

class WindowController: NSWindowController {
    override var windowNibName: NSNib.Name? { "WindowController" }
    
    private let mainViewCtrl = MainViewController()
    
    override func windowDidLoad() {
        super.windowDidLoad()

        guard let contentView = window?.contentView else {
            fatalError()
        }
        
        mainViewCtrl.view.frame = contentView.bounds
        
        contentView.addSubview(mainViewCtrl.view)
    }
}
