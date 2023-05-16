<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    let contact_form={
        init:function(){
            $('#contact_btn').click(function (){
                $('#contactForm').attr({
                    'action':'/contactimpl',
                    'method':'post'
                });
                $('#contactForm').submit();
            });
        }
    };
    $(function(){
        contact_form.init();
    })
</script>



<!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Contact Us</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="/">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Contact</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Contact For Any Queries</span></h2>
        </div>
        <div  style="display: flex;justify-content: center;">
            <div class="col-lg-7 mb-5 align-content-center" >
                <div class="contact_form">
                    <form name="contactForm" id="contactForm" novalidate="novalidate">
                        <input type="hidden" value="${logincust.id}" name="cust_id">
                        <div class="control-group">
                            <label for="email">답변 받으실 메일 주소</label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="Your Email"
                                   required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <label for="msg">궁금하신 내용을 입력해 주세요</label>
                            <textarea class="form-control" rows="6" name="msg" id="msg" placeholder="Message"
                                                               required="required"
                                                               data-validation-required-message="Please enter your message">
                            </textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div  style="display: flex;justify-content: center;">
                            <button class="btn btn-primary py-2 px-4" id="contact_btn">Send Message</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->



