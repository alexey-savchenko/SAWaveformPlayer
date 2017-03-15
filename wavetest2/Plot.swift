//
//  Plot.swift
//  requestTest
//
//  Created by Alexey Savchenko on 15.03.17.
//  Copyright © 2017 Alexey Savchenko. All rights reserved.
//

import Foundation
import UIKit

class Plot: UIView {
  
  //var heights: [Int] = []
  var heights: [Float] = [0.0137,0.0414,0.0521,0.0452,0.0382,0.0254,0.023,0.0617,0.0482,0.0162,0.0233,0.0311,0.044,0.0804,0.0468,0.0192,0.0236,0.0436,0.0589,0.0567,0.0213,0.0233,0.0658,0.074,0.0753,0.0444,0.0525,0.0728,0.0757,0.0822,0.0554,0.0597,0.0608,0.0936,0.0688,0.0837,0.0749,0.079,0.0732,0.0912,0.0846,0.0754,0.0594,0.0884,0.065,0.0717,0.0981,0.0625,0.0901,0.0793,0.0923,0.0833,0.0882,0.072,0.0605,0.1024,0.113,0.0714,0.1075,0.0696,0.1002,0.1001,0.0635,0.0999,0.086,0.0668,0.0747,0.0526,0.0524,0.071,0.0539,0.0769,0.0856,0.0856,0.0525,0.0813,0.0808,0.09,0.0824,0.0712,0.0706,0.0833,0.1013,0.0857,0.06,0.0818,0.0941,0.0794,0.0755,0.0984,0.0638,0.0485,0.1198,0.0816,0.0782,0.0765,0.1098,0.0818,0.0616,0.0813,0.0732,0.0853,0.0736,0.0892,0.0482,0.0621,0.0827,0.1057,0.0933,0.0948,0.1074,0.0971,0.0977,0.1183,0.0808,0.059,0.0874,0.1047,0.0861,0.097,0.0806,0.0869,0.0799,0.084,0.0784,0.0758,0.0846,0.0601,0.09,0.08,0.0796,0.1094,0.0929,0.0973,0.123,0.0659,0.0758,0.0868,0.0926,0.1007,0.0734,0.0709,0.0628,0.1027,0.0829,0.0754,0.1231,0.1299,0.0618,0.0847,0.083,0.1488,0.0974,0.078,0.0915,0.1075,0.0921,0.0838,0.0907,0.0985,0.0998,0.1065,0.0887,0.0862,0.1008,0.1022,0.0819,0.0882,0.1099,0.0694,0.0831,0.0906,0.1014,0.0781,0.0926,0.0764,0.0985,0.0869,0.0889,0.0869,0.0934,0.1078,0.1112,0.1276,0.0793,0.0804,0.0786,0.0947,0.0825,0.0982,0.1079,0.095,0.1002,0.0777,0.0811,0.0976,0.0867,0.0964,0.0848,0.0751,0.0849,0.0494,0.0702,0.0862,0.0771,0.0793,0.0861,0.081,0.0811,0.0852,0.0997,0.1182,0.1238,0.1146,0.0705,0.0941,0.1075,0.099,0.0981,0.1067,0.0895,0.094,0.095,0.0843,0.0994,0.0933,0.113,0.0887,0.0979,0.1086,0.1015,0.1084,0.097,0.1236,0.0978,0.1058,0.1049,0.0989,0.0909,0.0968,0.1106,0.1119,0.095,0.0877,0.0638,0.0992,0.0884,0.0734,0.066,0.0814,0.0638,0.0893,0.0641,0.0345,0.0296,0.013]
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    //    for _ in 0..<128{
    //      let item = getrandom(upperBound: Int(self.frame.height - self.frame.height * 0.3))
    //      heights.append(item)
    //    }
  }
  
  func getrandom(upperBound: Int) -> Int{
    
    return Int(arc4random_uniform(UInt32(upperBound)))
    
  }
  
  func populateWithBars(numberOfBars barCount: Int){
    
    DispatchQueue.main.async {
      
      var offset: CGFloat = 0
      
      for index in 0..<barCount{
        
        let view = UIView(frame: CGRect(x: offset,
                                        y:   self.frame.height,
                                        width: self.frame.width / CGFloat(barCount),
                                        height: -(CGFloat)((self.heights[index]) * 500)))
        
        view.backgroundColor = UIColor.orange
        
        self.addSubview(view)
        offset += self.frame.width / CGFloat(barCount)
        
      }
    }
    
  }
  
  func clearPlot(){
    
    for item in self.subviews{
      
      item.removeFromSuperview()
      
    }
    
  }
}
