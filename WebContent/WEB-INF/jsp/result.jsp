<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Spring MVC Form Handling</title>
</head>
<body>

<h2>Submitted Student Information</h2>
   <table>
    <tr>
        <td>username</td>
        <td>${username}</td>
    </tr>
    <tr>
        <td>password</td>
        <td>${password}</td>
    </tr>
    <tr>
        <td>email</td>
        <td>${email}</td>
    </tr>
    <tr>
        <td>phone</td>
        <td>${phone}</td>
    </tr>
</table>  
</body>
</html>