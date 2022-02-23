//
//  RecommendListViewController.swift
//  SimpleNetflix
//
//  Created by 이민지 on 2022/02/07.
//

import UIKit

class RecommendListViewController: UIViewController {
    @IBOutlet weak var sectionTitle: UILabel!
    var viewModel = RecommentListViwModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func updateUI() {
        
    }
}

class RecommentListViwModel {
    enum RecommendingType{
        case award
        case hot
        case my
        
        var title: String {
            switch self {
            case .award:
                return "아카데미 호평 영화"
            case .hot:
                return "취향저격 HOT 콘텐츠"
            case .my:
                return "내가 찜한 콘텐츠"
            }
        }
    }
    
    private (set) var type: RecommendingType = .my
    private var items: [DummItem] = []
}

struct DummItem {
    let thumbNail: UIImage
}
