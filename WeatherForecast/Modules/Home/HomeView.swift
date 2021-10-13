//
//  HomeView.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import UIKit

// Contains ref to presenter
class HomeView: UIViewController, ViewProtocol {
    
    var presenter: HomePresenter!
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblTempUnit: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCloud: UILabel!
    @IBOutlet weak var lblWind: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblPressure: UILabel!
    
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionView()
        presenter.viewDidLoad()
    }
    
    @IBAction func btnSettingAction(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func btnTodayAction(_ sender: UIButton) {
        presenter.getHourlyWeather()
    }
    
    @IBAction func btnNextSevenDaysAction(_ sender: UIButton){
        presenter.getDailyWeather()
    }
    
    func onLoading() {
        
    }
    
    func updateCurrent(current: CurrentWeatherModel) {
        lblDate.text = current.date
        lblTemp.text = current.temp
        lblTempUnit.text = current.tempUnit
        imgStatus.sd_setImage(with: current.imgStatusURL, completed: nil)
        lblLocation.text = current.location
        lblCloud.text = current.cloud
        lblWind.text = current.wind
        lblHumidity.text = current.humidity
        lblPressure.text = current.pressure
    }
    
    func onSuccess() {
        self.weatherCollectionView.reloadData()
    }
    
    func onError(error: Error) {
        
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func registerCollectionView() {
        self.weatherCollectionView.delegate = self
        self.weatherCollectionView.dataSource = self
        self.weatherCollectionView.register(UINib(nibName: Constants.Cells.homeCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cells.homeCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numOfWeatherCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cells.homeCell, for: indexPath) as! HomeCell
        presenter.configure(cell: cell, index: indexPath.row)
        return cell
    }
}
