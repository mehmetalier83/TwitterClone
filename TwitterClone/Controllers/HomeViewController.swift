//
//  HomeViewController.swift
//  TwitterClone
//
//  Created by Mehmet Ali Er on 15.01.2024.
//

import UIKit

class HomeViewController: UIViewController {

    private let timelineTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timelineTableView)
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.bounds
    }


}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
          return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: TweetTableViewCellDelegate{
    func tweetTableViewCellDidTapReply() {
        print("tweetTableViewCellDidTapReply")
    }
    
    func tweetTableViewCellDidTapRetweet() {
        print("tweetTableViewCellDidTapRetweet")

    }
    
    func tweetTableViewCellDidTapLike() {
        print("tweetTableViewCellDidTapLike")

    }
    
    func tweetTableViewCellDidTapShare() {
        print("tweetTableViewCellDidTapShare")

    }
    
    
}
