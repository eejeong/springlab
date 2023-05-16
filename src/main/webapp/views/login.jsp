<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let login_form = {
        init: function () {
            $('#login_btn').click(function () {
                login_form.send();
            });
        },
        send: function () {
            $('#login_form').attr({
                'action': '/loginimpl',
                'method': 'post'
            });
            $('#login_form').submit();
        }
    };
    $(function () {
        login_form.init();
    });
</script>

<!-- Login Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Welcome</span></h2>
    </div>
    <div class="row px-xl-5" style="display: flex; justify-content: center">
        <div class="col-lg-6 mb-5 align-content-center">
            <div class="contact-form">
                <form name="login_form" id="login_form" novalidate="novalidate">
                    <div class="control-group" style="display: block">
                        <div class="form-group">
                            <label for="id">ID:</label>
                            <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password"
                                   name="pwd">
                        </div>
                        <div class="checkbox">
                            <label><input type="checkbox" name="remember"> Remember me</label>
                        </div>
                    </div>
                    <div style="display: flex; justify-content: center">
                        <button class="btn btn-primary py-2 px-4" type="button" id="login_btn">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Login End -->