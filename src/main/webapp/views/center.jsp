<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    $(function () {
        charts1.init();
        $('#month_val').change(function () {
            charts1.getdatasales();
        });
        charts2.init();
    })

    let charts1 = {
        init: function () {
            this.getdatasales();
        },
        getdatasales: function () {
            var month_val = $('#month_val').val();
            $.ajax({
                url: '/getdatasales',
                data: {month: month_val},
                success: function (result) {
                    charts1.display(result);
                }
            });
        },
        display: function (result) {
            Highcharts.chart('myAreaChart1', {
                chart: {
                    type: 'line'
                },
                title: {
                    text: '일매출'
                },
                xAxis: {
                    categories: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
                },
                yAxis: {
                    title: {
                        text: '매출액(단위:원)'
                    }
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true
                        },
                        enableMouseTracking: false
                    }
                },
                series: [{
                    name: '일매출액',
                    data: result
                }]
            });
        }
    }

    let charts2 = {
        init: function () {
            this.getdatasales();
        },
        getdatasales: function () {
            $.ajax({
                url: '/getdatasalessum',
                success: function (result) {
                    charts2.display(result);
                }
            });
        },
        display: function (result) {
            Highcharts.chart('myBarChart2', {
                title: {
                    text: '남여 별 월매출 추이',
                    align: 'left'
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yAxis: {
                    title: {
                        text: '매출액(단위:백만)'
                    }
                },
                tooltip: {
                    valueSuffix: ' 백만'
                },
                plotOptions: {
                    series: {
                        borderRadius: '25%'
                    }
                },
                series: [{
                    type: 'column',
                    name: '남성',
                    data: result.Male
                }, {
                    type: 'column',
                    name: '여성',
                    data: result.Female
                }, {
                    type: 'spline',
                    name: '합계',
                    data: result.Sum,
                    marker: {
                        lineWidth: 2,
                        lineColor: Highcharts.getOptions().colors[3],
                        fillColor: 'white'
                    }
                }]
            });
        }
    }
</script>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">6 Shoppers Admin System</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body"><fmt:formatNumber type="number" value="${salesData.sum}"
                                                             pattern="###,###원"/></div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">누적 매출액</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body"><fmt:formatNumber type="number" value="${salesData.avg}"
                                                             pattern="###,###원"/></div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">일매출 평균액</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body"><fmt:formatNumber type="number" value="${salesData.max}"
                                                             pattern="###,###원"/></div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">일매출 최고액</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body"><fmt:formatNumber type="number" value="${salesData.min}"
                                                             pattern="###,###원"/></div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">일매출 최저액</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header" style="display: flex; justify-content: space-between">
                        <div>
                            <i class="fas fa-chart-area me-1"></i>
                            일자별 매출
                        </div>
                        <div class="col-sm-1.5">
                            <select class="form-control" id="month_val" name="month_val" style="font-size: 8pt">
                                <option value="01">1월</option>
                                <option value="02">2월</option>
                                <option value="03">3월</option>
                                <option value="04">4월</option>
                                <option value="05">5월</option>
                                <option value="06">6월</option>
                                <option value="07">7월</option>
                                <option value="08">8월</option>
                                <option value="09">9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                            </select>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="myAreaChart1" width="100%" height="40"></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-bar me-1"></i>
                        Bar Chart Example
                    </div>
                    <div class="card-body">
                        <div id="myBarChart2" width="100%" height="40"></div>
                    </div>
                </div>
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
                        <th>ID</th>
                        <th>NAME</th>
                        <th>ADDRESS</th>
                        <th>PHONE</th>
                        <th>GENDER</th>
                        <th>RESET PASSWORD</th>
                    </tr>
                    </thead>
                    <%--                    <tfoot>--%>
                    <%--                    <tr>--%>
                    <%--                        <th>Name</th>--%>
                    <%--                        <th>Position</th>--%>
                    <%--                        <th>Office</th>--%>
                    <%--                        <th>Age</th>--%>
                    <%--                        <th>Start date</th>--%>
                    <%--                        <th>Salary</th>--%>
                    <%--                    </tr>--%>
                    <%--                    </tfoot>--%>
                    <tbody>
                    <c:forEach var="obj" items="${custList}">
                        <tr>
                            <td>${obj.id}</td>
                            <td>${obj.name}</td>
                            <td>${obj.address}</td>
                            <td>${obj.phone}</td>
                            <td>${obj.gender}</td>
                            <td>
                                <a href="/cust/updateimpl/?id=${obj.id}" class="btn btn-danger" role="button">초기화</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

