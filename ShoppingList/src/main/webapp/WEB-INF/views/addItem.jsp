<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Item</title>
<p>
	<spring:message code="language.language" />
	: <a href="?language=en"><spring:message code="language.english" /></a>
	| <a href="?language=da"><spring:message code="language.danish" /></a>
</p>
<p>
	<a href="/hot/"><spring:message code="home.home" /></a>
</p>

<style type="text/css">
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>

</head>
<body>
	<form:form commandName="item">
		<table>
			<tr>
				<td><spring:message code="shoppinglist.addNewItem" />:</td>
			</tr>
			<tr>
				<td><spring:message code="shoppinglist.itemName" /></td>
				<td><form:input path="name" cssClass="error" /></td>
				<td><form:errors path="name" cssClass="error" /></td>
			</tr>
			<tr>
				<td><spring:message code="shoppinglist.price" /></td>
				<td><form:input path="price" cssClass="error" /></td>
				<td><form:errors path="price" cssClass="error" /></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit"
					value="<spring:message code="shoppinglist.addNewItem" />" /></td>
			</tr>

		</table>

	</form:form>
</body>
</html>