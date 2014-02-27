<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping List</title>
<p>
	<spring:message code="language.language" />
	: <a href="?language=en"><spring:message code="language.english" /></a>
	| <a href="?language=da"><spring:message code="language.danish" /></a>
</p>
<p>
	<a href="/ShoppingList/"><spring:message code="home.home" /></a>
</p>

<style type="text/css">
table,td,th {
	border: 1px solid green;
}

th {
	background-color: red;
	color: white;
}

table {
	width: 400px;
}

input.update {
    width: 2cm;  height: 2em;
}

input.add {
    width: 3cm;  height: 2em;
}

</style>

</head>
<body>
	<h1>
		<spring:message code="shoppinglist.title" />
	</h1>
	<form:form method="POST" action="shoppingList.html">
		<table>
			<tr>
				<th width="40%"><spring:message code="shoppinglist.itemName" /></th>
				<th width="30%"><spring:message code="shoppinglist.price" /></th>
				<th width="15%"><spring:message code="shoppinglist.bought" /></th>
				<th width="15%"><spring:message code="shoppinglist.delete" /></th>
			</tr>
			<u1> <c:forEach var="i" items="${items}">
				<tr>
					<td>${i.name }</td>
					<td>${i.price }</td>

					<td align="center"><input type="checkbox" name="bought"
						value="${i.id}"
						<c:if test="${i.bought == true}">checked="${i.bought}"</c:if> /></td>

					<td align="center"><input type="checkbox" name="deleted"
						value="${i.id}" /></td>
				</tr>
			</c:forEach> </u1>
		</table>
		<input type="submit" class="update" value="<spring:message code="button.update" />" />
	</form:form>
	<br>
	<form name="addNew" action="addItem.html">
		<input type="submit"
			value="<spring:message code="button.addNewItem" />" class="add"/>
	</form>
</body>
</html>