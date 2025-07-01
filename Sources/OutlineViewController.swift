import Cocoa

class OutlineViewController: NSViewController {
    @IBOutlet weak var outlineView: NSOutlineView!
    
    init() {
        super.init(nibName: "OutlineViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outlineView.delegate = self
        outlineView.dataSource = self
        
        outlineView.reloadData()
    }
}

extension OutlineViewController: NSOutlineViewDelegate, NSOutlineViewDataSource {
    func outlineView(_ outlineView: NSOutlineView,
                     numberOfChildrenOfItem item: Any?) -> Int {
        if item == nil {
            return 100
        } else {
            return 0
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView,
                     child index: Int,
                     ofItem item: Any?) -> Any {
        return "Item No. \(index)"
    }
    
    func outlineView(_ outlineView: NSOutlineView,
                     viewFor tableColumn: NSTableColumn?,
                     item: Any) -> NSView? {
        guard let title = item as? String else {
            return nil
        }
        
        guard let view = outlineView.makeView(withIdentifier: .init("DataCell"), owner: nil) as? NSTableCellView else {
            return nil
        }
        
        view.textField?.stringValue = title
        
        return view
    }
}
