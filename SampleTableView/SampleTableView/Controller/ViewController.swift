//
//  ViewController.swift
//  SampleTableView
//
//  Created by Vijay Vikram Singh on 04/10/20.
//  Copyright © 2020 Vijay Vikram Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SampleManagerDelegate {
    
    func DidUpdateUi(finalData: SampleModel) {
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    

    @IBOutlet weak var sampleTableView: UITableView!
    
    
    var sampleManager = SampleManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sampleManager.delegate = self
        sampleManager.getData()
    }


}
// Mark:- DataSourceProtocol

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sampleTableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath) as! CustomTableViewCell
        upda
    }
}

//Mark:- Delegate

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
