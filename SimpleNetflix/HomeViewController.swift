//
//  HomeViewController.swift
//  SimpleNetflix
//
//  Created by 이민지 on 2022/02/07.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    var awardRecommendListViewController: RecommendListViewController!
    var hotRecommendListViewController: RecommendListViewController!
    var myRecommdncListViewController: RecommendListViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "award" {
            let destinationVC = segue.destination as? RecommendListViewController
            awardRecommendListViewController = destinationVC
            awardRecommendListViewController.viewModel.updateType(.award)
            awardRecommendListViewController.viewModel.fetchItems()
        } else if segue.identifier == "hot" {
            let destinationVC = segue.destination as? RecommendListViewController
            hotRecommendListViewController = destinationVC
            hotRecommendListViewController.viewModel.updateType(.hot)
            hotRecommendListViewController.viewModel.fetchItems()
        } else if segue.identifier == "my" {
            let destinationVC = segue.destination as? RecommendListViewController
            myRecommdncListViewController = destinationVC
            myRecommdncListViewController.viewModel.updateType(.my)
            myRecommdncListViewController.viewModel.fetchItems()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        // intersetlla 에 대한 정보를 검색 api로 가져온다.
        // 거기서 intersetlla 객체 하나를 가져온다.
        // 그 객체를 이용해서 playerViewController를 띄운다.
        
        SearchAPI.search("interstella") { movies in
            guard let interstella = movies.first else { return }

            DispatchQueue.main.async {
                let url = URL(string: interstella.previewURL)!
                let item = AVPlayerItem(url: url)
                
                let sb = UIStoryboard(name: "Player", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
                vc.player.replaceCurrentItem(with: item)
                
                self.present(vc, animated: false, completion: nil)
                vc.modalPresentationStyle = .fullScreen
            }
        }
    }
}
