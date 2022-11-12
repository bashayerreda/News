//
//  ViewController.swift
//  NewsRXswiftDemo
//
//  Created by bashayer reda on 11/12/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay
import SDWebImage

class ViewController: UIViewController, Storyboarded {
    @IBOutlet weak var lbl: UILabel!
      let disposeBag = DisposeBag()
      //make observable of type behavior that interested in last info to continue
      let articles = BehaviorRelay<[ArticlesViewModel]>(value: [])
      //assign the observable to attach to observer
      var observer : Observable<[ArticlesViewModel]> {
          return articles.asObservable()
      }
      
      weak var coordinator : MainCoordinator?
      var rootViewModel : RootViewModel!
      
      private lazy var collectionView : UICollectionView = {
          let collectionV = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
          collectionV.delegate = self
          collectionV.dataSource = self
          return collectionV
      }()
      static func instantiateWithViewModel(rootViewModel : RootViewModel) -> ViewController {
                
                           let id = String(describing: self)
                                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
          let vc = storyboard.instantiateViewController(identifier: id)as! ViewController
                
                       vc.rootViewModel = rootViewModel
                          return vc
                
        }
     override func viewDidLoad() {
           super.viewDidLoad()
 
        title = "News"
          configurationParentCollectionView()
           configureUi()
           returnAllArticles()
           subscribe()
           // Do any additional setup after loading the view.
       }

       //call method from viewmodel which will go to service and bring data from rxalmofire
       //make observable data  from type behaviorRelay
       func returnAllArticles() {
           rootViewModel!.returnAllArticles().subscribe(onNext:{ articles in
               self.articles.accept(articles)
               print(articles.last?.description)
           
               
              // print (articles.first?.title!)
              // self.lbl.text = articles.first?.description
               
               }).disposed(by: disposeBag)
       }
       //attach observable to observer and select on next to bring data
       func subscribe(){
           self.observer.subscribe(onNext:{ articles in
               DispatchQueue.main.async {
                   
               self.collectionView.reloadData()
               }
       }).disposed(by: disposeBag)
   }
       func configurationParentCollectionView(){
           self.collectionView.register(CustomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
          }
       func configureUi(){
   
           view.addSubview(collectionView)
           collectionView.translatesAutoresizingMaskIntoConstraints = false
           collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
           collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
           collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
           collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.backgroundColor = .none

   }
   }
   extension ViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return self.articles.value.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for:indexPath) as! CustomeCollectionViewCell
           let articlesData = self.articles.value[indexPath.row]
           cell.articlesObservable.onNext(articlesData)
           return cell
           
           
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: view.frame.width, height: 120)
       }

       
   }
             



