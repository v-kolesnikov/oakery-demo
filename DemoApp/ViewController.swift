import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let touchMeButton = UIButton()
    touchMeButton.backgroundColor = UIColor.lightGray
    touchMeButton.center = view.center
    touchMeButton.setTitle("Touch me", for: .normal)
    view.addSubview(touchMeButton)
    view.backgroundColor = .white
  }
}
