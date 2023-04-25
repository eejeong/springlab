<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
  $(function (){

  })
</script>

<div class="col-sm-8 text-left">
  <div class="container">
    <h3>CHART01</h3>

    <%--금액 표시--%>
    <h3><fmt:parseNumber integerOnly="true" type="number" value="${num}" /></h3>
    <%--통화 + 금액 표시--%>
    <h3><fmt:formatNumber value="${num}" type="currency" /></h3>
    <%--달러 + 금액 표시--%>
    <h3><fmt:formatNumber type="number" pattern="###.###$" value="${num}" /></h3>
    <h3><fmt:formatDate  value="${cdate}" pattern="yyyy-MM-dd:hhmmss" /></h3>

    <h3><c:out value="${cust.id}"/></h3>
    <h3><c:out value="${cust.name}"/></h3>

    <h3>${num * 2}</h3>
    <c:set var="mynum" value="${num * 3}"/>
    <h5><c:out value="${mynum}"/></h5>
  </div>
</div>