<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Contact</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
            <li class="breadcrumb-item active">Contact</li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                DataTables is a third party plugin that is used to generate the demo table below. For more information
                about DataTables, please visit the
                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                .
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable Example
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>이메일</th>
                        <th>내용</th>
                        <th>등록일자</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>이메일</th>
                        <th>내용</th>
                        <th>등록일자</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${clist}">
                        <tr>
                            <td>${obj.id}</td>
                            <td>${obj.cust_id}</td>
                            <td>${obj.email}</td>
                            <td>${obj.msg}</td>
                            <td>${obj.rdate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>