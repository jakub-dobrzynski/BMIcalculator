import UIKit

class CalculateViewController: UIViewController
{
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabels: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func heightSliderChange(_ sender: UISlider)
    {
        let height = String(format: "%.2f", sender.value)
        heightLabels.text = "\(height)m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider)
    {
        let weight = String(format: "%.1f", sender.value)
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton)
    {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBmiValue(H: height, W: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "goToResult"
        {
            let destination = segue.destination as! ResultViewController
            destination.bmiValue = calculatorBrain.getBMIValue()
            destination.advice = calculatorBrain.getAdvice()
            destination.color =  calculatorBrain.getColor()
        }
    }
}

