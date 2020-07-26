//
//  VideoCollectionViewCell.swift
//  TikTok
//
//  Created by Akhadjon Abdukhalilov on 7/16/20.
//  Copyright © 2020 Akhadjon Abdukhalilov. All rights reserved.
//

import UIKit
import  AVFoundation
struct VideoModel {
    let caption:String
    let uzerName:String
    let audioTrackName:String
    let videoFileName:String
    let videoFileFormate:String
}
protocol VideoCollectionViewCellDelegate :AnyObject{
     func didTapLikeButton(with model:VideoModel)
     func didTapProfileButton(with model:VideoModel)
     func didTapShareButton(with model:VideoModel)
     func didTapCommentButton(with model:VideoModel)
    
}
class VideoCollectionViewCell: UICollectionViewCell {
    
    override class func description() -> String {
        return "VideoCollectionViewCell"
    }
    //Labels
    private let userNameLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    private let captionNameLabel:UILabel = {
        let label = UILabel()
        label.textColor  = .label
        label.textColor = .white
        return label
    }()
    private let audioNameLabel:UILabel = {
           let label = UILabel()
           label.textColor  = .label
           label.textColor = .white
           return label
       }()
    //Buttons
    private let profileButton:UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        return button
    }()
    private let likeButton:UIButton = {
          let button = UIButton()
          button.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
           return button
       }()
    private let commentsButton:UIButton = {
          let button = UIButton()
          button.setBackgroundImage(UIImage(systemName: "text.bubble.fill"), for: .normal)
           return button
       }()
    private let shareButton:UIButton = {
          let button = UIButton()
          button.setBackgroundImage(UIImage(systemName: "arrowshape.turn.up.right.fill"), for: .normal)
           return button
       }()
    
    
    private let videoContainer = UIView()
    //Delegates
    weak var delegate:VideoCollectionViewCellDelegate?
    
    
    private  var model : VideoModel?
    var player :AVPlayer?

    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.backgroundColor = .black
        contentView.clipsToBounds = true
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(videoContainer)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(captionNameLabel)
        contentView.addSubview(audioNameLabel)
       
        contentView.addSubview(profileButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentsButton)
        contentView.addSubview(shareButton)
        
        videoContainer.clipsToBounds = true
        contentView.sendSubviewToBack(videoContainer)
        // Add Actions
        likeButton.addTarget(self, action:#selector(didTapLikeButton), for: .touchUpInside)
        profileButton.addTarget(self, action:#selector(didTapProfielButton), for: .touchUpInside)
        commentsButton.addTarget(self, action:#selector(didTapCommentButton), for: .touchUpInside)
        shareButton.addTarget(self, action:#selector(didTapShareButton), for: .touchUpInside)
        
        }
    
    @objc private func didTapLikeButton(){
        guard let model = model else{return}
        delegate?.didTapLikeButton(with: model)
    }
    @objc private func didTapCommentButton(){
          guard let model = model else{return}
        delegate?.didTapCommentButton(with: model)
    }
    @objc private func didTapProfielButton(){
          guard let model = model else{return}
        delegate?.didTapProfileButton(with: model)
    }
    @objc private func didTapShareButton(){
          guard let model = model else{return}
          delegate?.didTapShareButton(with: model)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        videoContainer.frame = contentView.bounds
        let size = contentView.frame.size.width/7
        let height = contentView.frame.size.height - 100
        let width = contentView.frame.size.width
        
        shareButton.frame = CGRect(x: width-size, y: height-size, width: size, height: size)
        commentsButton.frame = CGRect(x: width-size, y: height-(size*2)-10, width: size, height: size)
        likeButton.frame = CGRect(x: width-size, y: height-(size*3)-10, width: size, height: size)
        profileButton.frame = CGRect(x: width-size, y: height-(size*4)-10, width: size, height: size)
        
        //Labels
        //Username, Caption , Audio
        audioNameLabel.frame = CGRect(x: 5, y: height-30, width: width-size-10, height: 50)
        userNameLabel.frame = CGRect(x: 5, y: height-80, width: width-size-10, height: 50)
        captionNameLabel.frame = CGRect(x: 5, y: height-120, width: width-size-10, height: 50)
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        captionNameLabel.text = nil
        audioNameLabel.text = nil
        userNameLabel.text = nil
    }

    public func configure(with model:VideoModel){
        self.model = model
        configureVideo()
        //labels
        captionNameLabel.text = model.caption
        audioNameLabel.text = model.videoFileName
        userNameLabel.text = model.uzerName
    }
    
    private func configureVideo(){
        guard let model = model else{return}
        guard  let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFileFormate) else{
            print("faieled to find video")
            return}
        player = AVPlayer(url:  URL(fileURLWithPath: path))
        
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.frame = contentView.bounds
        playerView.videoGravity = .resizeAspectFill
        videoContainer.layer.addSublayer(playerView)
        player?.volume = .zero
        player?.play()
    }
}

