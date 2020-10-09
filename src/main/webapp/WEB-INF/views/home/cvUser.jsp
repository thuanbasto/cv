<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Ubuntu" />
    <link rel="stylesheet" href="<c:url value="/static/css/cvUser.css"/>">
    <title>CV Online</title>
</head>
<body>
	<div class="like bg-white">
        <label>${user.likes}</label><span><i class="far fa-thumbs-up"></i></span>
        <security:authorize access="isAuthenticated()">
			<button type="button" onclick="likeCV(this)" class="btnLike btn btn-primary">Like</button>
		</security:authorize>
		<security:authorize access="!isAuthenticated()">
			<button type="button" disabled="disabled" title="Sign in to like" class="btn btn-primary">Like</button>
		</security:authorize>
		<input type="hidden" id="checkLike" value="${checkLike}"> 
    </div>
   	<c:if test="${user.typecv.typecv_ID == 1}">
   		<div class="bg-white">
	        <div class="row m-4 pt-5">
	        	<input type="hidden" id="user_ID" value="${user.user_ID}">
	            <div class="col-auto"> 
	                <img class="rounded-circle" width="120px" height="120px" src="<c:url value="/static/image/${user.imageUrl}"/>">
	            </div>
	            <div class="col ml-3">
	               	<c:if test="${!empty user.name}">
	               		<h2 class="font-weight-bold">${user.name}</h2>
	               	</c:if>
	               	<c:if test="${!empty user.career}">
		                <h4 class="text-primary">${user.career}</h4>
	               	</c:if>
	               	<c:if test="${!empty user.maxim}">
		                <p>${user.maxim}</p>
	               	</c:if>
	            </div>
	        </div>
	        <ul class="midrow nav justify-content-center">
	        	<c:if test="${!empty user.email}">
		            <li class="nav-item">
		                <p class="col-auto ml-4 m-2 text-white"><i class="far fa-envelope"></i> ${user.email}</p>
		            </li>
	        	</c:if>
	        	<c:if test="${!empty user.phone}">
		            <li class="nav-item">
		                <p class="col ml-3 m-2 text-white"><i class="fas fa-mobile-alt"></i> ${user.phone}</p>
		            </li>
	        	</c:if>
	        	<c:if test="${!empty user.address}">
		            <li class="nav-item">
		                <p class="col ml-3 m-2 text-white"><i class="fas fa-map-marker-alt"></i> ${user.address}</p>
		            </li>
	        	</c:if>
	        	<c:if test="${!empty user.birthday}">
		            <li class="nav-item">
		                <p class="col ml-3 m-2 text-white"><i class="far fa-calendar-alt"></i> ${user.birthday}</p>
		            </li>
	        	</c:if>
	  <%--       	<c:if test="${!empty user.facebook}">
		            <li class="nav-item">
		                <p class="col-auto m-2 mr-4 text-white"><i class="fab fa-facebook-f"></i> ${user.facebook}</p>
		            </li>
	        	</c:if> --%>
	        	<c:if test="${!empty user.facebook}">
		            <li class="nav-item">
		                <a href="https://${user.facebook}" target="_blank"><p class="col-auto m-2 mr-4 text-white"><i class="fab fa-facebook-f"></i> ${user.facebook}</p></a>
		            </li>
	        	</c:if>
	        </ul>
	        <div class="row m-1 mt-3">
	            <div class="col">
	            	<c:forEach items="${user.skills}" var="skill">
	                <c:if test="${skill.indexDisplay == 1}">
	                	<c:set var="skillName" value="${skill.skillName}"/>
	                	<h3>${fn:toUpperCase(skillName)}</h3>
	   					<c:if test="${skill.typeDisplay == 1}"> 
		    				<ul class="display1">
		    					<c:forEach items="${skill.detailSkills}" var="detailSkill">
			        				<li class="font-weight-bold">${detailSkill.detailSkill}</li>
								</c:forEach>
					    	</ul>
	   					</c:if>
	   					<c:if test="${skill.typeDisplay == 2}"> 
	        				<ul class="infor mb-3 nav justify-content-left">
		    					<c:forEach items="${skill.detailSkills}" var="detailSkill">
			                        <li class="nav-item">
			                            <p class="col m-2 text-white">${detailSkill.detailSkill}</p>
			                        </li>
								</c:forEach>
	                    	</ul>
	   					</c:if>
	        		</c:if>
	                </c:forEach>
	            </div>
	            <div class="col ml-3">
	                <c:forEach items="${user.skills}" var="skill">
	                <c:if test="${skill.indexDisplay == 2}">
	                	<c:set var="skillName" value="${skill.skillName}"/>
	                	<h3>${fn:toUpperCase(skillName)}</h3>
	   					<c:if test="${skill.typeDisplay == 1}"> 
		    				<ul class="display1">
		    					<c:forEach items="${skill.detailSkills}" var="detailSkill">
			        				<li class="font-weight-bold">${detailSkill.detailSkill}</li>
								</c:forEach>
					    	</ul>
	   					</c:if>
	   					<c:if test="${skill.typeDisplay == 2}"> 
	        				<ul class="infor mb-3 nav justify-content-left">
		    					<c:forEach items="${skill.detailSkills}" var="detailSkill">
			                        <li class="nav-item">
			                            <p class="col m-2 text-white">${detailSkill.detailSkill}</p>
			                        </li>
								</c:forEach>
	                    	</ul>
	   					</c:if>
	        		</c:if>
	                </c:forEach>
	            </div>
	        </div>
	    </div>
   	</c:if>
    
    <c:if test="${user.typecv.typecv_ID == 2}">
    	<div class="bg-white">
	        <div class="typeCV2 m-0 p-0">
	            <div class="row m-4">
	                <div class="col information">
	                    <div class="row m-4">
	                        <div class="row-auto ml-3">
	                            <img class="rounded-circle" width="120px" height="120px" src="<c:url value="/static/image/${user.imageUrl}"/>">
	                        </div>
	                    </div>
	                    <div class="row-auto ml-3">
	                        <div class="row-auto">
	                        	<input type="hidden" id="user_ID" value="${user.user_ID}">
	                            <h2 class="row name font-weight-bold">${user.name}</h2>
	                            <h4 class="row text-primary ">${user.career}</h4>
	                            <p class="row">${user.maxim}</p>
	                        </div>
	                    </div>
	                    <div class="row mb-3">
	                        <div class="midrow ml-4 border rounded">
	                            <p class="ml-4 mt-2 mr-4 text-white"><i class="far fa-envelope"></i> ${user.email}</p>
	                            <p class="ml-4 mt-2 mr-4 text-white"><i class="fas fa-mobile-alt"></i> ${user.phone}</p>
	                            <p class="ml-4 mt-2 mr-4 text-white"><i class="fas fa-map-marker-alt"></i> ${user.address}</p>
	                            <p class="ml-4 mt-2 mr-4 text-white"><i class="far fa-calendar-alt"></i> ${user.birthday}</p>
	                            <p class="ml-4 mt-2 mr-4 text-white"><i class="fab fa-facebook-f"></i> ${user.facebook}</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col detail mt-4 ml-4">
		                <c:forEach items="${user.skills}" var="skill">
	                <c:if test="${skill.indexDisplay == 1}">
	                	<c:set var="skillName" value="${skill.skillName}"/>
	                	<h3>${fn:toUpperCase(skillName)}</h3>
	   					<c:if test="${skill.typeDisplay == 1}"> 
		    				<ul class="display1">
		    					<c:forEach items="${skill.detailSkills}" var="detailSkill">
			        				<li class="font-weight-bold">${detailSkill.detailSkill}</li>
								</c:forEach>
					    	</ul>
	   					</c:if>
	   					<c:if test="${skill.typeDisplay == 2}"> 
	        				<ul class="infor mb-3 nav justify-content-left">
		    					<c:forEach items="${skill.detailSkills}" var="detailSkill">
			                        <li class="nav-item">
			                            <p class="col m-2 text-white">${detailSkill.detailSkill}</p>
			                        </li>
								</c:forEach>
	                    	</ul>
	   					</c:if>
	        		</c:if>
	                </c:forEach>
	                <c:forEach items="${user.skills}" var="skill">
	                <c:if test="${skill.indexDisplay == 2}">
	                	<c:set var="skillName" value="${skill.skillName}"/>
	                	<h3>${fn:toUpperCase(skillName)}</h3>
	   					<c:if test="${skill.typeDisplay == 1}"> 
		    				<ul class="display1">
		    					<c:forEach items="${skill.detailSkills}" var="detailSkill">
			        				<li class="font-weight-bold">${detailSkill.detailSkill}</li>
								</c:forEach>
					    	</ul>
	   					</c:if>
	   					<c:if test="${skill.typeDisplay == 2}"> 
	        				<ul class="infor mb-3 nav justify-content-left">
		    					<c:forEach items="${skill.detailSkills}" var="detailSkill">
			                        <li class="nav-item">
			                            <p class="col m-2 text-white">${detailSkill.detailSkill}</p>
			                        </li>
								</c:forEach>
	                    	</ul>
	   					</c:if>
	        		</c:if>
	                </c:forEach>
	                </div>
	            </div>
	        </div>
	    </div>
   	</c:if>
    <script src='<c:url value="/static/js/cvUser.js"></c:url>'></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
</body>
</html>