//
//  ViewController.swift
//  CapitalCities
//
//  Created by Николай Никитин on 03.01.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController {

  //MARK - Properties
  @IBOutlet var mapView: MKMapView!

  //MARK: - ViewController lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics")
    let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.75, longitude: 10.75), info: "Founded over 1000 years ago.")
    let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light")
    let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Yas a whole country inside it.")
    let washington = Capital(title: "Washington", coordinate: CLLocationCoordinate2D(latitude: 38.89511, longitude: -77.036667), info: "Named afted George himself.")
    mapView.addAnnotations([london, oslo, paris, rome, washington])
  }


}

