import UIKit

class ViewControllerPhone: UITabBarController, ViewControllerDelegate, SearchViewControllerDelegate {
    var searchController: SearchViewController!
    var diagramController: DiagramViewController!
    var videoController: VideoViewController!
    var historyController: HistoryViewController!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = UIColor.whiteColor()

        searchController = SearchViewController()
        diagramController = DiagramViewController()
        videoController = VideoViewController()
        historyController = HistoryViewController()

        self.viewControllers = [
            searchController,
            historyController,
            diagramController,
            videoController
        ]
        
        searchController.delegate = self
        diagramController.delegate = self
        videoController.delegate = self
        historyController.delegate = self
    }

       override func shouldAutorotate() -> Bool {
        return true
    }

    func didSelectEntry(entry: DictEntry) {
        self.selectedViewController = diagramController
    }

    func returnToSearchView() {
        self.selectedViewController = searchController
    }
}