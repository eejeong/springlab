<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    let register_form = {
        init: function () {
            $('#register_btn').addClass('disabled');

            $('#register_btn').click(function () {
                register_form.send();
            });
            $('#name').keyup(function () {
                var id = $('#id').val();
                var pwd = $('#pwd').val();
                var name = $('#name').val();
                if (id != '' && pwd != '' && name != '') {
                    $('#register_btn').removeClass('disabled');
                }
            });
            $('#id').keyup(function () {
                var txt_id = $(this).val();
                if (txt_id.length <= 3) {
                    return;
                }
                $.ajax({
                    url: '/checkid',
                    data: {'id': txt_id},
                    success: function (result) {
                        if (result == 0) {
                            $('#check_id').text('사용 가능한 ID 입니다.');
                            $('#pwd').focus();
                        } else {
                            $('#check_id').text('사용 불가능합니다.');
                        }
                    }
                });
            });
        },
        send: function () {
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var name = $('#name').val();
            if (id.length <= 3) {
                $('#check_id').text("ID는 4자리 이상이어야 합니다.");
                $('#id').focus();
                return;
            }
            if (pwd == '') {
                $('#pwd').focus();
                return;
            }
            if (name == '') {
                $('#name').focus();
                return;
            }

            $('#register_form').attr({
                'action': '/registerimpl',
                'method': 'post'
            });
            $('#register_form').submit();
        }
    };

    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = roadAddr;
            }
        }).open();
    }

    $(function () {
        register_form.init();
    });
</script>

<!-- Register Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Welcome</span></h2>
    </div>
    <div class="row px-xl-5" style="display: flex; justify-content: center">
        <div class="col-lg-6 mb-5 align-content-center">
            <div class="contact-form">
                <form name="register_form" id="register_form" novalidate="novalidate">
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
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
                        </div>
                        <input type="hidden" name="address" id="address" value="">
                        <div class="form-group">
                            <label for="name">Address:</label>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호"
                                       style="margin-right: 10px">
                                <div class="input-group-append">
                                    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="address1" name="address1" placeholder="도로명주소">
                            <span id="guide" style="color:#999;display:none"></span>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="address2" name="address2" placeholder="상세주소">
                        </div>

                        <div class="form-group">
                            <label for="phone">Phone:</label>
                            <input type="text" class="form-control" id="phone" placeholder="Enter phone" name="phone">
                        </div>
                        <div class="form-group">
                            <label>Gender:</label>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="gender1" name="gender" value="F"
                                       checked>여성 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" class="form-check-input" id="gender2" name="gender"
                                       value="M">남성
                            </div>
                        </div>

                    </div>
                    <div style="display: flex; justify-content: center">
                        <button class="btn btn-primary py-2 px-4" type="button" id="register_btn">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Register End -->