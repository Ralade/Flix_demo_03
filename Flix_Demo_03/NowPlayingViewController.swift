//
//  NowPlayingViewController.swift
//  Flix_Demo_03
//
//  Created by Temi Alade on 10/12/18.
//  Copyright © 2018 Rasheedat Alade. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string:   "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when network requests return
            if let error = error {
        print(error.localizedDescription)
            } else if let data = data{
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: [])as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                for movie in movies
                {let title = movie["title"] as! String
                    print(title)
                }
                print(dataDictionary)
            }
        }
        task.resume()
    }
    

    

}