//
//  AnimeTableViewCell.swift
//  fidelity
//
//  Created by Aaron Levy on 4/23/21.
//

import UIKit

class AnimeTableViewCell: UITableViewCell, APIHandler {

    @IBOutlet weak var animeImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var airingLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var episodesLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var startLbl: UILabel!
    @IBOutlet weak var endLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var synopsisLbl: UILabel!
    
    func setUpCell(animObj: AnimeModel){
        titleLbl.text = animObj.title
        animObj.airing == true ? (airingLbl.text = "Airing: Yes") : (airingLbl.text = "Airing: No")
        typeLbl.text = "Type: " + (animObj.type ?? "NA")
        startLbl.text = "First Season: " + (animObj.start_date ?? "NA").prefix(4)
        endLbl.text = "Last Season: " + (animObj.end_date ?? "NA").prefix(4)
        ratingLbl.text = "Rating: " + (animObj.rated ?? "NA")
        synopsisLbl.text = animObj.synopsis
        
        if let score = animObj.score {
            scoreLbl.text = "Score: " + String(score)
        }else{
            scoreLbl.text = "Score: NA"
        }
        
        if let members = animObj.members {
            membersLbl.text = "Members: " + String(members)
        }else{
            membersLbl.text = "Members: NA"
        }
        
        if let episodes = animObj.episodes {
            episodesLbl.text = "Episodes: " + String(episodes)
        }else{
            episodesLbl.text = "Episodes: NA"
        }
        
        if let imageURLString = animObj.image_url{
            getImageData(url: imageURLString) { (data) in
                let image = UIImage.init(data: data)
                self.animeImage.image = image
            }
        }
    }
    
}
