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
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionView()
    }
    
    @IBAction func btnSettingAction(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func btnTodayAction(_ sender: UIButton) {
        presenter.getTodayData()
    }
    
    @IBAction func btnNextSevenDaysAction(_ sender: UIButton){
        presenter.getWeekData()
    }
    
    func reloadData() {
        self.weatherCollectionView.reloadData()
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func registerCollectionView() {
        self.weatherCollectionView.delegate = self
        self.weatherCollectionView.dataSource = self
        self.weatherCollectionView.register(UINib(nibName: Constants.Cells.homeCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cells.homeCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.collectionCellsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cells.homeCell, for: indexPath) as! HomeCell
        
        return cell
    }
}
