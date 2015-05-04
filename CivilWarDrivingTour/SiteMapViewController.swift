//
//  SiteMapViewController.swift
//  CivilWarDrivingTour
//
//  Created by Laura Avakian on 4/13/15.
//  Copyright (c) 2015 KoolKatz. All rights reserved.
//

import UIKit
import MapKit

class SiteMapViewController: UIViewController {
    var siteName: String = ""
    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = siteName

        // Do any additional setup after loading the view.
                // 1
        let location = CLLocationCoordinate2D(
            latitude: 37.141370,
            longitude: -80.404672
        )
        let location2 = CLLocationCoordinate2D(
            latitude: 37.142584,
            longitude: -80.416724
        )
        let location3 = CLLocationCoordinate2D(
            latitude: 37.128554,
            longitude: -80.410726
        )
        let location4 = CLLocationCoordinate2D(
            latitude: 37.326034,
            longitude: -80.735324
        )
        let location5 = CLLocationCoordinate2D(
            latitude: 37.226124,
            longitude: -80.426778
        )
        let location6 = CLLocationCoordinate2D(
            latitude: 37.199882,
            longitude: -80.564695
        )
        let location7 = CLLocationCoordinate2D(
            latitude: 37.217744,
            longitude: -80.432033
        )
        let location8 = CLLocationCoordinate2D(
            latitude: 37.132590,
            longitude: -80.561152
        )
        let location9 = CLLocationCoordinate2D(
            latitude: 37.131270,
            longitude: -80.406373
        )
        let location10 = CLLocationCoordinate2D(
            latitude: 37.131270,
            longitude: -80.406373
        )
        let location11 = CLLocationCoordinate2D(
            latitude: 37.129758,
            longitude: -80.408812
        )
        
        // 2
        
        
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Cambria Depot"
        annotation.subtitle = "Christiansburg"
        var AN = [AnyObject]()
        AN.append(annotation)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = location2
        annotation2.title = "Christiansburg Institute"
        annotation2.subtitle = "Christiansburg"
        AN.append(annotation2)
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = location3
        annotation3.title = "Christiansburg Presbyterian Church"
        annotation3.subtitle = "Christiansburg"
        AN.append(annotation3)
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = location4
        annotation4.title = "Pearisburg"
        annotation4.subtitle = "Virginia"
        AN.append(annotation4)
        
        let annotation5 = MKPointAnnotation()
        annotation5.coordinate = location5
        annotation5.title = "Solitude"
        annotation5.subtitle = "Blacksburg"
        AN.append(annotation5)
        
        let annotation6 = MKPointAnnotation()
        annotation6.coordinate = location6
        annotation6.title = "Kentland Plantation"
        annotation6.subtitle = "Blacksburg"
        AN.append(annotation6)
        
        let annotation7 = MKPointAnnotation()
        annotation7.coordinate = location7
        annotation7.title = "Smithfield Plantation"
        annotation7.subtitle = "Blacksburg"
        AN.append(annotation7)
        
        let annotation8 = MKPointAnnotation()
        annotation8.coordinate = location8
        annotation8.title = "Battle of New River Bridge"
        annotation8.subtitle = "Radford"
        AN.append(annotation8)
        
        let annotation9 = MKPointAnnotation()
        annotation9.coordinate = location9
        annotation9.title = "Montague House"
        annotation9.subtitle = "Christiansburg"
        AN.append(annotation9)
        
        let annotation10 = MKPointAnnotation()
        annotation10.coordinate = location10
        annotation10.title = "Montgomery White Sulphur Springs"
        annotation10.subtitle = "Christiansburg"
        AN.append(annotation10)
        
        let annotation11 = MKPointAnnotation()
        annotation11.coordinate = location11
        annotation11.title = "Montgomery County Confederate Monument"
        annotation11.subtitle = "Christiansburg"
        AN.append(annotation11)

        
        println(AN)
        mapView.addAnnotations(AN)
        
        
        let span = MKCoordinateSpanMake(0.5, 0.5)
        let region = MKCoordinateRegion(center: location2, span: span)
        mapView.setRegion(region, animated: true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
