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
        sectionTitle.text = viewModel.type.title
    }
}

extension RecommendListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCell", for: indexPath) as? RecommendCell else {
            return UICollectionViewCell()
        }
        
        let movie = viewModel.item(at: indexPath.item)
        cell.updateUI(movie: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfItems
    }
}

extension RecommendListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 160)
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

class RecommendCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    func updateUI(movie: DummItem) {
        thumbnailImage.image = movie.thumbNail
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
