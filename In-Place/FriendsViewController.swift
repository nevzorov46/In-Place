//
//  FriendsViewController.swift
//  In-Place
//
//  Created by Иван Карамазов on 21.05.2021.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var friendsInterests: UITableView!
    @IBOutlet weak var storiesCollection: UICollectionView!
    
    var friendsPost = [
        FriendsPost(image: "Friends Post 2", postText: "labellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabe", avatar: "Avatar 4", nickname: "Nelson Semedo", date: "21.06.2021"),
        FriendsPost(image: "Friends Post 1", postText: "labellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabel", avatar: "Friends Post Image", nickname: "Steven Brooke", date: "18 July"),
        FriendsPost(image: "Friends Post 2", postText: "labellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabe", avatar: "Avatar 4", nickname: "Nelson Semedo", date: "21.06.2021")
    
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell: ViewRepresenation = tableView.dequeueReusableCell(withIdentifier: "ViewRepresentation", for: indexPath) as! ViewRepresenation
            return cell
            
        default:
            let cell: FriendsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Friends", for:indexPath) as! FriendsTableViewCell
            let friendPost = friendsPost[indexPath.row]
            cell.postText.text = friendPost.postText
            cell.friendName.text = friendPost.nickname
            cell.dateOfPost.text = friendPost.date
            cell.postImage.image = UIImage(named: friendPost.image)
            cell.friendAvatarPost.image = UIImage(named: friendPost.avatar)
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FriendsStoriesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsStories", for: indexPath) as! FriendsStoriesCollectionViewCell
        cell.story.image = UIImage(named: "avatar 2")
        return cell
    }
    
    
    override func viewDidLoad() {
        friendsInterests.delegate = self
        friendsInterests.dataSource = self
        
        storiesCollection.delegate = self
        storiesCollection.dataSource = self
    }
    
}
