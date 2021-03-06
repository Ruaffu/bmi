<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Front page
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col-sm-4"></div>

            <div class="col-sm-4">

                <h2>BMI calculator</h2>

                <form method="post" action="${pageContext.request.contextPath}/fc/bmiresult">
                    <div class="form-group">
                        <label for="height">Height in cm: </label>
                        <input id="height" name="height" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="weight">Weight in kg: </label>
                        <input id="weight" name="weight" type="text" class="form-control"/><br/>
                    </div>

                        <input type="radio" id="male" name="gender" value="male">
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="gender" value="female">
                        <label for="female">Female</label><br>

                    <label for="exercise">Your primary form of exercise:</label>
                    <select id="exercise" name="exercise">
                        <option value="1">Football</option>
                        <option value="2">Gymnastics</option>
                        <option value="3">Yoga</option>
                        <option value="4">Badminton</option>
                    </select>

                    <br/>
                    <input type="checkbox" id="hobby1" name="hobby" value="I'm into healthy eating">
                    <label for="hobby1"> I'm into healthy eating</label><br>
                    <input type="checkbox" id="hobby2" name="hobby" value="I own a cottage">
                    <label for="hobby2"> I own a cottage</label><br>
                    <input type="checkbox" id="hobby3" name="hobby" value="I have a pet">
                    <label for="hobby3"> I have a pet</label>
                    <br/>

                    <c:if test="${requestScope.error != null}">
                        <p style="color: red">
                                ${requestScope.error}
                        </p>
                    </c:if>
                    <button type="submit" class="btn btn-primary">Calculate BMI</button>
                </form>

            </div>

            <div class="col-sm-4"></div>

        </div>



        <div>
            <c:if test="${sessionScope.role == 'employee' }">
            <p style="font-size: larger">This is what you can do,
                since your are logged in as an employee</p>
            <p><a href="fc/employeepage">Employee Page</a>
                </c:if>

                <c:if test="${sessionScope.role == 'customer' }">
            <p style="font-size: larger">This is what you can do, since your
                are logged in as a customer</p>
            <p><a href="fc/customerpage">Customer Page</a>
                </c:if>

        </div>

    </jsp:body>
</t:genericpage>