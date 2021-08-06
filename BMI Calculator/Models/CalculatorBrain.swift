import UIKit

struct CalculatorBrain
{
    var bmi: BMI?
    
    func getBMIValue() -> String
    {
        let bmiFinal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiFinal
    }
    
    mutating func calculateBmiValue(H: Float, W: Float)
    {
        let bmiValue = W / (H*H)
        
        if bmiValue < 18.5
        {
            bmi = BMI(value: bmiValue, advive: "eat more snacks", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
        else if bmiValue < 24.5
        {
            bmi = BMI(value: bmiValue, advive: "perfect weight, keep it", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        }
        else
        {
            bmi = BMI(value: bmiValue, advive: "eat less snacks", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
    }
    
    func getAdvice() -> String
    {
        return bmi?.advive ?? "No Advice"
    }
    
    func getColor() -> UIColor
    {
        return bmi?.color ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
