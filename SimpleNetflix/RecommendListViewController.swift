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
    enum RecommendingType {
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
    
    var numOfItems: Int{
        return items.count
    }
    
    func item(at index: Int) -> DummItem {
        return items[index]
    }
    
    func updateType(_ type: RecommendingType) {
        self.type = type
    }
    
    func fetchItems() {
        self.items = MovieFetcher.fetch(type)
    }
}

class MovieFetcher {
    static func fetch(_ type: RecommentListViwModel.RecommendingType) -> [DummItem] {
        switch type {
        case .award:
            let movies = (1..<10).map {DummItem(thumbNail: UIImage(named: "img_movie_\($0)")!)}
            return movies
        case .hot:
            let movies = (1..<10).map { DummItem(thumbNail: UIImage(named: "img_movie_\($0)")!)}
            return movies
        case .my:
            let movies = (1..<10).map { $0 * 2 }.map { DummItem(thumbNail: UIImage(named: "img_movie_\($0)")!)}
            return movies
        }
    }
}

struct DummItem {
    let thumbNail: UIImage
}
