//
//  SearchViewController.swift
//  SimpleNetflix
//
//  Created by 이민지 on 2022/02/07.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 검색 시작
        
        print("--> 검색어: \(searchBar.text)")
    }
}
