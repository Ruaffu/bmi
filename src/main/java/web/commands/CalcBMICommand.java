package web.commands;

import business.exceptions.UserException;
import business.services.BMIUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

public class CalcBMICommand extends CommandUnprotectedPage
{
    public CalcBMICommand(String pageToShow)
    {
        super(pageToShow);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException
    {
        Double height = 0.0;
        Double weight = 0.0;
        Double bmi = 0.0;
        String category = "";
        String gender = request.getParameter("gender");
        int sport_id = Integer.parseInt(request.getParameter("exercise"));

        String[] hobbies = request.getParameterValues("hobby");
        List<String> hobbyList = null;
        if (hobbies != null)
        {
            hobbyList = Arrays.asList(hobbies);
        }

        try
        {
            height = Double.parseDouble(request.getParameter("height"));
            weight = Double.parseDouble(request.getParameter("weight"));
        }catch (NumberFormatException ex)
        {
            request.setAttribute("error","Remember to input two whole numbers in the from");
            return "index";
//            throw  new UserException("Remember to input two whole numbers in the from");
        }

        bmi = BMIUtil.calcBMI(height, weight);
        category = BMIUtil.getCategory(bmi);

        request.setAttribute("bmi",String.format("%.2f",bmi));
        request.setAttribute("height", height);
        request.setAttribute("weight", weight);
        request.setAttribute("category", category);
        request.setAttribute("gender", gender);
        request.setAttribute("exercise_id", sport_id);
        request.setAttribute("hobbies", hobbyList);

        return pageToShow;
    }
}
