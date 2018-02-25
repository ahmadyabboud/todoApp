
import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var textee: UILabel!
    @IBOutlet weak var imagee: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
}

