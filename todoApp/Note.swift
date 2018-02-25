

import Foundation
import UIKit

class Note {
    var title:String
    var text:String
    var image:UIImage

    init(titiee:String,textt:String,imagee:UIImage) {
        self.image = imagee
        self.text = textt
        self.title = titiee
    }
}
