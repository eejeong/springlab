<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function (){

    });
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-8 text-left">
                <h1>Detail Page</h1>
                <form id="update_form" class="well" style="margin-top: 30px">
                    <div class="form-group">
                        <label for="id">ID:</label>
                        <input type="text" class="form-control" id="id" name="id" value="${gcust.id}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password" class="form-control" id="pwd" name="pwd" value="${gcust.pwd}">
                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="name" class="form-control" id="name" name="name" value="${gcust.name}">
                    </div>
                    <button type="button" class="btn btn-default" id="update_btn" >Update</button>
                    <button type="button" class="btn btn-default" id="remove_btn" >Remove</button>
                </form>
            </div>
        </div>
    </div>
</div>
