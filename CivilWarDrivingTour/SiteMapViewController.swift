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

    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

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
        println(AN)
        mapView.addAnnotations(AN)
        
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
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
