<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    $(function () {

    });
</script>

<div class="col-sm-8 text-left">
    <div class="container">

        <div class="col-sm-6 text-left">
            <h1>OCR1</h1>
            <h2>${result.biznum}</h2>
            <h2>${result.bizname}</h2>
            <h2>${result.bizowner}</h2>
            <h2>${result.bizdate}</h2>
            <h2>${result.bizadd}</h2>
            <form action="/ocr1impl" method="post" enctype="multipart/form-data" id="ocr1_form" class="well"
                  style="margin-top: 30px">
                <div class="form-group">
                    <label for="img">Image:</label>
                    <input type="file" class="form-control" id="img" placeholder="Input Image" name="img">
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default" id="ocr1_btn">Send</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
