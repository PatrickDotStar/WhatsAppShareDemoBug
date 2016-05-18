import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// These 2 lines occur the bug
		UINavigationBar.appearance().backIndicatorImage = UIImage(named: "back")
		UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "back")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func shareButtonClicked(sender: UIButton) {
		
		let textToShare = "WhatsApp Bug"
		
		if let websiteToShare = NSURL(string: "http://www.whatsapp.com") {
			let objectsToShare = [textToShare, websiteToShare]
			let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
			
			activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]

			activityVC.popoverPresentationController?.sourceView = sender
			self.presentViewController(activityVC, animated: true, completion: nil)
		}
	}

}

