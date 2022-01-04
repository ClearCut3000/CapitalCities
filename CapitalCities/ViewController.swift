//
//  ViewController.swift
//  CapitalCities
//
//  Created by Николай Никитин on 03.01.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

  //MARK - Properties
  @IBOutlet var mapView: MKMapView!

  //MARK: - ViewController lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics", wiki: "https://en.wikipedia.org/wiki/London")
    let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.75, longitude: 10.75), info: "Founded over 1000 years ago.", wiki: "https://en.wikipedia.org/wiki/Oslo")
    let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light", wiki: "https://en.wikipedia.org/wiki/Paris")
    let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Yas a whole country inside it.", wiki: "https://en.wikipedia.org/wiki/Rome")
    let washington = Capital(title: "Washington,_D.C.", coordinate: CLLocationCoordinate2D(latitude: 38.89511, longitude: -77.036667), info: "Named afted George himself.", wiki: "https://en.wikipedia.org/wiki/Washington,_D.C.")
    mapView.addAnnotations([london, oslo, paris, rome, washington])

    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose , target: self, action: #selector(chooseMapType))
  }

  //MARK: - Methods
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard annotation is Capital else { return nil }
    let identifier = "Capital"
    var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
    if annotationView == nil {
      annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
      annotationView?.canShowCallout = true

      let button = UIButton(type: .detailDisclosure)
      annotationView?.rightCalloutAccessoryView = button
    } else {
      annotationView?.annotation = annotation
    }
    if let pin = annotationView as? MKPinAnnotationView { pin.pinTintColor = UIColor(red: 0, green: 0.4, blue: 0, alpha: 1) }
    return annotationView
  }

  func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    guard let capital = view.annotation as? Capital else { return }
    let placeName = capital.title
    let placeInfo = capital.info
    let alert = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default))
    alert.addAction(UIAlertAction(title: "Go to Wiki!", style: .default, handler: { [weak self] action in
      let viewController = WikiViewController()
      viewController.wiki = capital.wiki
      self?.navigationController?.pushViewController(viewController, animated: true)
    }))
    present(alert, animated: true)
  }

  @objc func chooseMapType(){
    let alert = UIAlertController(title: "Choose map type", message: nil, preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: "Satellite", style: .default, handler: { [weak self] action in
      self?.mapView.mapType = .satellite
    }))
    alert.addAction(UIAlertAction(title: "Standard", style: .default, handler: { [weak self] action in
      self?.mapView.mapType = .standard
    }))
    alert.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { [weak self] action in
      self?.mapView.mapType = .hybrid
    }))
    alert.addAction(UIAlertAction(title: "Hybrid Flyover", style: .default, handler: { [weak self] action in
      self?.mapView.mapType = .hybridFlyover
    }))
    alert.addAction(UIAlertAction(title: "Muted Standard", style: .default, handler: { [weak self] action in
      self?.mapView.mapType = .mutedStandard
    }))
    alert.addAction(UIAlertAction(title: "Satellite Flyover", style: .default, handler: { [weak self] action in
      self?.mapView.mapType = .satelliteFlyover
    }))
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    present(alert, animated: true)
  }
}

