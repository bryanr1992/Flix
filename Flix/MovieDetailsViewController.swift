//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Bryan Rivas on 10/24/19.
//  Copyright © 2019 Bryan Rivas. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView:UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movies = [[String:Any]]()
    var movie: [String:Any]!
    var movieTrailer: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        
        let posterURL = URL(string: baseURL + posterPath)
        
        posterView.af_setImage(withURL: posterURL!)
        
        let backdropPath = movie["backdrop_path"] as! String
        
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropView.af_setImage(withURL: backdropURL!)
        
        let movieID = movie["id"] as! Int
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
             let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
             let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
             let task = session.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                   print(error.localizedDescription)
                } else if let data = data {
                   let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                 self.movies = dataDictionary["results"] as! [[String:Any]]
                    
                
                 self.movieTrailer = self.movies[0]
                    
                    
                
        
                }
             }
             task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! WebViewController
        
        destination.key = movieTrailer["key"] as! String
        
    }
    

}
