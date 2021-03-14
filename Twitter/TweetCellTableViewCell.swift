//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Rudransh Singh on 3/6/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    var favorite:Bool = false
    var tweetId:Int = -1
    var Retweete:Bool = false
    
    
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    @IBAction func OnFavTweet(_ sender: Any) {
        
        let toBeFavorite = !favorite
        
        if(toBeFavorite){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else{
            TwitterAPICaller.client?.UnFavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("UnFavorited did not succeed: \(error)")
            })
        }
        
        
    }
    
    
    @IBAction func OnRetweet(_ sender: Any) {
        let getRetweet = !Retweete
        
        if(getRetweet) {
            TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
                self.setRetweete(true)
            }, failure: { (error) in
                print("Retweeting is not successful \(error)")
            })
            
        } else {
            TwitterAPICaller.client?.Unretweet(tweetId: tweetId, success: {
                self.setRetweete(false)
            }, failure: { (error) in
                print("Unretweeting is not successful \(error)")
            })
            
        }
        
        
        
    }
    
    func setFavorite(_ isFavorite:Bool){
        favorite = isFavorite
        if(favorite) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweete(_ isRetweet:Bool){
        Retweete = isRetweet
        if(Retweete){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            
            retweetButton.isEnabled = false
        } else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            
            retweetButton.isEnabled = true
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
