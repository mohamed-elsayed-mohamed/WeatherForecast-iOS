//
//  HomeCell.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 06/09/2021.
//

import UIKit
import SDWebImage

class HomeCell: UICollectionViewCell, WeatherCellProtocol {

    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblUnit: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(weatherCellModel: WeatherCellModel) {
        imgStatus.sd_setImage(with: weatherCellModel.imageURL, completed: nil)
        lblDate.text = weatherCellModel.date
        lblStatus.text = weatherCellModel.status
        lblTemp.text = weatherCellModel.temp
        lblUnit.text = weatherCellModel.tempUnit
    }

}
