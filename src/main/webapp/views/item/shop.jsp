<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let category_search = {
        init: function () {
            $('#top_search_btn').click(function () {
                $('#top_search_form').attr({
                    method: 'post',
                    action: '/item/search'
                });
                $('#top_search_form').submit();
            });
            $('#search_btn').click(function () {
                $('#search_form').attr({
                    method: 'post',
                    action: '/item/search'
                });
                $('#search_form').submit();
            });
            $('#category').change(function () {
                $('#search_form').attr({
                    method: 'get',
                    action: '/item/searchcategory'
                });
                $('#search_form').submit();
            });
        }
    };

    let shop_cart = {
        init: function () {
            $('.cartplus_btn').click(function () {
                    var eventbtn = $(this);
                    if (${logincust != null}) {
                        var item_id = eventbtn.prev().prev().prev().val();
                        $.ajax({
                            url: '/cartcheck',
                            data: {cust_id: "${logincust.id}", item_id: item_id},
                            success: function (result) {
                                if (result != 0) {
                                    eventbtn.prev().prev().val(result);
                                    eventbtn.parent().attr(
                                        {
                                            method: 'post',
                                            action: '/cart/update_shop'
                                        });
                                    eventbtn.parent().submit();
                                } else {
                                    eventbtn.parent().attr(
                                        {
                                            method: 'post',
                                            action: '/cart/insert'
                                        });
                                    eventbtn.parent().submit();
                                }
                            }
                        });

                    } else {
                        location.href = "/login";
                    }

                }
            );
        }
    }

    $(function () {
        category_search.init();
        shop_cart.init();
    })
</script>
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="/">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shop</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Shop Start -->
<div class="container-fluid pt-5" style="display:flex; justify-content: center">

    <!-- Shop Product Start -->
    <div class="col-lg-9 col-md-12">
        <div class="row pb-3">
            <div class="col-12 pb-1">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <form id="search_form" class="form-inline well">
                        <div class="input-group">
                            <input type="text" name="name" id="name" class="form-control" value="${csearch.name}"
                                   placeholder="Search by name">
                            <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <button type="button" id="search_btn" class="fa fa-search"></button>
                                        </span>
                            </div>
                        </div>

                        <div class="dropdown ml-4">
                            <select class="form-control" id="category" name="category">
                                <option value="">category</option>
                                <option value="shirts" <c:if test="${csearch.category=='shirts'}">selected</c:if>>Shirts
                                </option>
                                <option value="pants" <c:if test="${csearch.category=='pants'}">selected</c:if>>Pants
                                </option>
                                <option value="shoes" <c:if test="${csearch.category=='shoes'}">selected</c:if>>Shoes
                                </option>
                            </select>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Product start -->
            <c:forEach var="obj" items="${clist}">
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">

                    <div class="card product-item border-0 mb-4">

                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <a href="#" data-toggle="modal" data-target="#target${obj.id}">
                                <img class="img-fluid w-100" src="/uimg/${obj.imgname}" alt="">
                            </a>
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">${obj.name}</h6>
                            <div class="d-flex justify-content-center">
                                <h6><fmt:formatNumber type="number" pattern="###,###원" value="${obj.price}"/></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="/item/detail?id=${obj.id}" class="btn btn-sm text-dark p-0"><i
                                    class="fas fa-eye text-primary mr-1"></i>View
                                Detail</a>
                            <form id="cart_form_${obj.id}" class="cart_form">
                                <input type="hidden" name="cust_id" value="${logincust.id}">
                                <input type="hidden" name="item_id" value="${obj.id}">
                                <input type="hidden" name="detail_cnt" value=0>
                                <input type="hidden" name="cnt" value=1>
                                <button type="button" class="btn btn-sm text-dark p-0 cartplus_btn"
                                        id="cartplus_btn_${obj.id}">
                                    <i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart
                                </button>
                            </form>
                        </div>

                    </div>
                </div>
            </c:forEach>
            <!-- Product end -->

            <!-- pagination start -->
            <div class="col-12 pb-1">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center mb-3">
                        <c:choose>
                            <c:when test="${cpage.getPrePage() != 0}">
                                <li class="page-item">
                                    <a class="page-link" href="/item/shop?pageNo=${cpage.getPrePage()}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage() }"
                                   var="page">
                            <c:choose>
                                <c:when test="${cpage.getPageNum() == page}">
                                    <li class="page-item active">
                                        <a class="page-link" href="/item/shop?pageNo=${page}">${page }</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a class="page-link" href="/item/shop?pageNo=${page}">${page }</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${cpage.getNextPage() != 0}">
                                <li class="page-item">
                                    <a class="page-link" href="/item/shop?pageNo=${cpage.getNextPage()}"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                    </ul>
                </nav>
            </div>
            <!-- pagination end -->
        </div>
    </div>
    <!-- Shop Product End -->
</div>
</div>
<!-- Shop End -->