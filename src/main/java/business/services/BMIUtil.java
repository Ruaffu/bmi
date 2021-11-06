package business.services;

public class BMIUtil
{
    public static Double calcBMI(Double height, Double weight)
    {
        return weight / ((height / 100) * (height / 100));
    }

    public static String getCategory(Double bmi)
    {
        String category = "";
        if (bmi > 30){
            category = "Obese";
        }else if (bmi < 18.50){
            category = "Underweight";
        }else if (bmi < 25.0){
            category = "a Normal weight";
        }else{
            category = "Overweight";
        }

        return category;
    }
}
