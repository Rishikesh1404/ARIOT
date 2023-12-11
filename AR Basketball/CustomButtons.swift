
import UIKit

class CustomButtons: UIButton {

   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeButtons()
    }
    
    func customizeButtons() {
        backgroundColor = UIColor.brown
        layer.cornerRadius = 11.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
    }

}
