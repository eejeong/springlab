<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    $(function (){
        register_form.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-8 text-left">
                <h1>Register Page</h1>
                <form id="register_form" class="well" style="margin-top: 30px">
                    <div class="form-group">
                        <label for="id">ID:</label>
                        <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="name" class="form-control" id="name" placeholder="Enter name" name="name">
                    </div>
                    <button type="button" class="btn btn-default" id="register_btn" >register</button>
                </form>
            </div>
        </div>
    </div>
</div>
