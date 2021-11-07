<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Results page for calculations of BMI
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${true}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

        <div>
        <div class="row">
        <div class="col-sm-4"></div>

        <div class="col-sm-4">
            <h2>BMI result</h2>

            <p>
                Your height is ${requestScope.height} cm<br/>
                Your weight is ${requestScope.weight} kg
            </p>
            <p>
                Your BMI is ${requestScope.bmi}
            </p>
            <p>
                You are ${requestScope.category}
            </p>
            <p>
                Gender: ${requestScope.gender}
            </p>
            <p>Exercise_id: ${requestScope.exercise_id}</p>

            <c:forEach var="hobbyItem" items="${requestScope.hobbies}">
                hobby: ${hobbyItem} <br/>
            </c:forEach>

            <div class="col-sm-4"></div>
            </div>

        </div>

    </jsp:body>
</t:genericpage>