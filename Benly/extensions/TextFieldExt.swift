import UIKit

extension UITextField {
    func isValid() -> Bool {
        guard let text = self.text,
              !text.isEmpty else {
            print("Please fill the field.")
            return false
        }

        return true
    }
}
