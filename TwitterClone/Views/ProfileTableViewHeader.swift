//
//  ProfileTableViewHeader.swift
//  TwitterClone
//
//  Created by Mehmet Ali Er on 16.01.2024.
//

import UIKit

class ProfileTableViewHeader: UIView {
    private let followersTextLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.text = "Followers"
           label.textColor = .secondaryLabel
           label.font = .systemFont(ofSize: 14, weight: .regular)
           return label
       }()
       
       var followersCountLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.textColor = .label
           label.font = .systemFont(ofSize: 14, weight: .bold)
           return label
       }()
       
       private let followingTextLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.text = "Following"
           label.textColor = .secondaryLabel
           label.font = .systemFont(ofSize: 14, weight: .regular)
           return label
       }()
    var followingCountLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .label
         label.font = .systemFont(ofSize: 14, weight: .bold)
         return label
     }()
    private let joinedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Joined May 2023"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14,weight: .regular)
        return label
    }()
    
    private let joinDateImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .secondaryLabel
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "calendar",withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        return imageView
    }()
    
    private let userBioLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.textColor = .label
        label.text = "iOS developer"
        return label
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
    
    private let profileAvatarImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private let profileHeaderImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "header")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileHeaderImageView)
        addSubview(profileAvatarImageView)
        addSubview(usernameLabel)
        addSubview(displayNameLabel)
        addSubview(userBioLabel)
        addSubview(joinDateImageView)
        addSubview(joinedDateLabel)
        addSubview(followingCountLabel)
        addSubview(followingTextLabel)
        addSubview(followersCountLabel)
        addSubview(followersTextLabel)
        configureConstraints()
    }
    private func configureConstraints(){
            let profileHeaderImageViewConstraints = [
                profileHeaderImageView.leadingAnchor.constraint(equalTo:leadingAnchor),
                profileHeaderImageView.topAnchor.constraint(equalTo: topAnchor),
                profileHeaderImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                profileHeaderImageView.heightAnchor.constraint(equalToConstant: 180)
            ]
            let profileAvatarImageViewConstraints = [
                profileAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
                profileAvatarImageView.centerYAnchor.constraint(equalTo: profileHeaderImageView.bottomAnchor,constant: 10),
                profileAvatarImageView.widthAnchor.constraint(equalToConstant: 80),
                profileAvatarImageView.heightAnchor.constraint(equalToConstant: 80)
            ]
            let displayNameLabelConstraints = [
                displayNameLabel.leadingAnchor.constraint(equalTo: profileAvatarImageView.leadingAnchor,constant: -12),
                displayNameLabel.topAnchor.constraint(equalTo: profileAvatarImageView.bottomAnchor,constant: 5)
            ]
            let usernameLabelConstraints = [
                usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
                usernameLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor,constant: 5)
            ]
            let userBioLabelConstraints = [
                userBioLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
                userBioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor,constant: 5)
            ]
            let joinDateImageViewConstraints = [
                joinDateImageView.leadingAnchor.constraint(equalTo: userBioLabel.leadingAnchor),
                joinDateImageView.topAnchor.constraint(equalTo: userBioLabel.bottomAnchor,constant: 5)
            ]
            let joinedDateLabelConstraints = [
                joinedDateLabel.leadingAnchor.constraint(equalTo: joinDateImageView.trailingAnchor,constant: 3),
                joinedDateLabel.bottomAnchor.constraint(equalTo: joinDateImageView.bottomAnchor)

            ]
             let followingCountLabelConstraints = [
                   followingCountLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
                   followingCountLabel.topAnchor.constraint(equalTo: joinedDateLabel.bottomAnchor, constant: 10)
               ]
               
               let followingTextLabelConstraints = [
                   followingTextLabel.leadingAnchor.constraint(equalTo: followingCountLabel.trailingAnchor, constant: 4),
                   followingTextLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
               ]
               
               let followersCountLabelConstraints = [
                   followersCountLabel.leadingAnchor.constraint(equalTo: followingTextLabel.trailingAnchor, constant: 8),
                   followersCountLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
               ]
               
               let followersTextLabelConstraints = [
                   followersTextLabel.leadingAnchor.constraint(equalTo: followersCountLabel.trailingAnchor, constant: 4),
                   followersTextLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
               ]
               
        NSLayoutConstraint.activate(profileHeaderImageViewConstraints)
        NSLayoutConstraint.activate(profileAvatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(userBioLabelConstraints)
        NSLayoutConstraint.activate(joinDateImageViewConstraints)
        NSLayoutConstraint.activate(joinedDateLabelConstraints)
        NSLayoutConstraint.activate(followingCountLabelConstraints)
        NSLayoutConstraint.activate(followingTextLabelConstraints)
        NSLayoutConstraint.activate(followersCountLabelConstraints)
        NSLayoutConstraint.activate(followersTextLabelConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
