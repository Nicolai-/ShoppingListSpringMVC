<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<html>
<head>
<title><spring:message code="welcome.home" /></title>
<p>
	<spring:message code="language.language" />
	: <a href="?language=en"><spring:message code="language.english" /></a>
	| <a href="?language=da"><spring:message code="language.danish" /></a>
</p>
</head>
<body>
	<h1>
		<spring:message code="welcome.title" />
	</h1>

	<P>
		<a href="shoppingList.html"><spring:message
				code="shoppinglist.title" /> </a>
	</P>
</body>
</html>
