//
//  CustomCell.swift
//  UIKitProg
//
//  Created by Muhammad Fawwaz Mayda on 10/07/21.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var character: Character? {
        didSet {
            setContent()
        }
    }
    
    lazy var imgView: UIImageView = {
       let imgView = UIImageView()
        imgView.layer.cornerRadius = 24.0
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var armyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Inserting views into cell")
        contentView.addSubview(imgView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(armyLabel)
        contentView.addSubview(genderLabel)
        
        // Setup constraint
        // imgView
        
        imgView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        imgView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        imgView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        // nameLabel
        nameLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 15).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        
        // armyLabel
        armyLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 15).isActive = true
        armyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15).isActive = true
        
        // genderLabel
        genderLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        genderLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        print("You select : \(String(describing: character))")
    }
    
    private func setContent() {
        if let character = character {
            print("Filling with Annie")
            nameLabel.text = character.name
            genderLabel.text = character.gender
            armyLabel.text = character.army
            imgView.image = UIImage(named: character.imgName)
        }
    }

}
