<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>

    let totalcart = {
        init: function () {
            $('#coupon_btn').click(function () {

                let coupon_code = $('#coupon_code').val();
                if (coupon_code == "six") {
                    $('#coupon').val("0");
                } else {
                    $('#coupon').val("3000");
                }
                $('#ftotal').val(parseInt($('#subtotal').val()) + parseInt($('#coupon').val()));
            });
            $('#order_btn').click(function () {
                $('#order_form').attr({
                    method: "get",
                    action: "/sales"
                })
                $('#order_form').submit()
            });
        }

    }
    $(function () {
        totalcart.init();
    })

</script>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="/">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shopping Cart</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Cart Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5">
            <c:set var="total" value="0"/>
            <p class="m-0"> 수량 변경 시 save하셔야 반영됩니다.</p>
            <table class="table table-bordered text-center mb-0">
                <thead class="bg-secondary text-dark">
                <tr>
                    <th>Products</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Remove</th>
                    <th>Save</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:forEach var="obj" items="${list}">
                    <form id="saveAndDelete_form${obj.id}">
                        <input type="hidden" name="id" value="${obj.id}">
                        <input type="hidden" name="cust_id" value="${logincust.id}">

                        <td class="align-middle" style="width: 200px">
                            <a href="/item/detail?id=${obj.item_id}">
                                <img src="/uimg/${obj.item_imgname}" style="width: 50px">
                                    ${obj.item_name}
                            </a>
                        </td>
                        <td class="align-middle">
                            <fmt:formatNumber value="${obj.item_price}" pattern="###,###원"/>
                        </td>
                        <td class="align-middle">
                            <div class="input-group quantity mx-auto form-group" style="width: 100px;">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-sm btn-primary btn-minus"
                                            id="minus_btn${obj.id}">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input id="cnt${obj.id}" type="text"
                                       class="form-control form-control-sm bg-secondary text-center" name="cnt"
                                       value="${obj.cnt}">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-sm btn-primary btn-plus"
                                            id="plus_btn${obj.id}">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </td>
                        <td class="align-middle">
                            <input pattern="###,###원" readonly id="total${obj.id}" type="text"
                                   class="form-control form-control-sm bg-secondary text-center" name="total"
                                   value="${obj.cnt*obj.item_price}">
                        </td>
                        <td class="align-middle form-group">
                            <button type="submit" formaction="/cart/delete" formmethod="post"
                                    class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button>
                        </td>

                        <td class="align-middle form-group">
                            <button type="submit" formaction="/cart/update" formmethod="get"
                                    class="btn btn-sm btn-primary"><i class="fa fa-check"></i></button>
                        </td>
                    </form>
                    </tr>

                    <script>
                        $('#plus_btn${obj.id}').on('click', function () {
                            var oldValue = $('#cnt${obj.id}').val();
                            var newVal = parseFloat(oldValue) + 1;
                            $('#cnt${obj.id}').val(newVal); //cnt 수량 +1
                            $('#total${obj.id}').val(($('#cnt${obj.id}').val()) * (${obj.item_price}));
                        });
                        $('#minus_btn${obj.id}').on('click', function () {
                            var oldValue = $('#cnt${obj.id}').val();
                            var newVal = parseFloat(oldValue) - 1;
                            if (oldValue == 0) {
                                newVal = 0;
                            }
                            $('#cnt${obj.id}').val(newVal); //cnt 수량 -1
                            $('#total${obj.id}').val(($('#cnt${obj.id}').val()) * (${obj.item_price}));
                        });
                        $('#cnt${obj.id}').change(function () {
                            $('#total${obj.id}').val(($('#cnt${obj.id}').val()) * (${obj.item_price})); //cnt 변경 될때마다 total 변경
                        })

                    </script>

                    <c:set var="total" value="${total + (obj.cnt * obj.item_price)}"/>


                </c:forEach>
                </tbody>
            </table>
        </div>


        <div class="col-lg-4">
            <form>
                <div class="input-group">
                    <input type="text" class="form-control p-4" placeholder="Coupon Code" id="coupon_code"
                           name="coupon_code">
                    <div class="input-group-append">
                        <button type="button" class="btn btn-primary" id="coupon_btn">Apply Coupon</button>
                    </div>
                </div>
            </form>

            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">Subtotal</h6>
                        <input type="text" id="subtotal" class="font-weight-medium" value="${total}" readonly/>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Shipping</h6>
                        <input type="text" value="3000" class="font-weight-medium" id="coupon" readonly/>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <form id="order_form">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <input name="price" type="text" class="font-weight-bold" id="ftotal" value="${total+3000}"
                                   readonly/>
                            <input name="gender" type="hidden" value="${logincust.gender}"/>
                            <input name="cust_id" type="hidden" value="${logincust.id}"/>
                        </div>
                        <button class="btn btn-block btn-primary my-3 py-3" type="button" id="order_btn">Proceed To
                            Order
                        </button>

                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cart End -->