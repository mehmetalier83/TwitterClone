//
//  TweetTableViewCell.swift
//  TwitterClone
//
//  Created by Mehmet Ali Er on 16.01.2024.
//

import UIKit

protocol TweetTableViewCellDelegate : AnyObject {
      func tweetTableViewCellDidTapReply()
      func tweetTableViewCellDidTapRetweet()
      func tweetTableViewCellDidTapLike()
      func tweetTableViewCellDidTapShare()
}

class TweetTableViewCell: UITableViewCell {

    static let identifier = "TweetTableViewCell"
    private let actionSpacing : CGFloat = 60
    
    weak var delegate : TweetTableViewCellDelegate?
    
    private let avatarImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName:"person")
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private let displayNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Mehmet Ali Er"
        label.font = .systemFont(ofSize: 18,weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.text = "@mehmetalier83"
        label.font = .systemFont(ofSize: 14,weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let tweetTextContentLabel : UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.text = "This is my Mockup tweet."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14,weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let replyButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    private let retweetButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName:"arrow.2.squarepath"),for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    private let likeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName:"heart"),for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    private let shareButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName:"square.and.arrow.up"),for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(tweetTextContentLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        configureButtons()
        configureConstraints()
    }
    @objc private func didTapReply() {
        delegate?.tweetTableViewCellDidTapReply()
    }
    
    @objc private func didTapRetweet() {
        delegate?.tweetTableViewCellDidTapRetweet()
    }
    
    @objc private func didTapLike() {
        delegate?.tweetTableViewCellDidTapLike()
    }
    
    @objc private func didTapShare() {
        delegate?.tweetTableViewCellDidTapShare()
    }
    
    private func configureButtons() {
           replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
           retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
           likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
           shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
       }
    private func configureConstraints() {
            
            let avatarImageViewConstraints = [
                avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
                avatarImageView.heightAnchor.constraint(equalToConstant: 50),
                avatarImageView.widthAnchor.constraint(equalToConstant: 50)
            ]
            
            
            let displayNameLabelConstraints = [
                displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
                displayNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
            ]
            
            let usernameLabelConstraints = [
                usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor, constant: 10),
                usernameLabel.centerYAnchor.constraint(equalTo: displayNameLabel.centerYAnchor)
            ]
            
            let tweetTextContentLabelConstraints = [
                tweetTextContentLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
                tweetTextContentLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 10),
                tweetTextContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            ]
            
            let replyButtonConstraints = [
                replyButton.leadingAnchor.constraint(equalTo: tweetTextContentLabel.leadingAnchor),
                replyButton.topAnchor.constraint(equalTo: tweetTextContentLabel.bottomAnchor, constant: 10),
                replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
            ]
            
            
            let retweetButtonConstraints = [
                retweetButton.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor, constant: actionSpacing),
                retweetButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor),
            ]
            
            
            let likeButtonConstraints = [
                likeButton.leadingAnchor.constraint(equalTo: retweetButton.trailingAnchor, constant: actionSpacing),
                likeButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
            ]
            
            let shareButtonConstraints = [
                
                shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: actionSpacing),
                shareButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
            
            ]
            
            NSLayoutConstraint.activate(avatarImageViewConstraints)
            NSLayoutConstraint.activate(displayNameLabelConstraints)
            NSLayoutConstraint.activate(usernameLabelConstraints)
            NSLayoutConstraint.activate(tweetTextContentLabelConstraints)
            NSLayoutConstraint.activate(replyButtonConstraints)
            NSLayoutConstraint.activate(retweetButtonConstraints)
            NSLayoutConstraint.activate(likeButtonConstraints)
            NSLayoutConstraint.activate(shareButtonConstraints)
            
            
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
