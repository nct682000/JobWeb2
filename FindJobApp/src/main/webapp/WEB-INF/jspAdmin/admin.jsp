<%-- 
    Document   : customers
    Created on : Aug 19, 2021, 3:43:35 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>




<div id="main">
    <h1 style="text-align: center; padding: 30px">Báo cáo thống kê hoạt động ứng tuyển trong năm ${year}</h1>
    <div class="container">
        <div class="row " >
            <div class="col-md-8 ">
                <canvas id="myChart" width="800" height="500"  style="background-color: blanchedalmond;"></canvas>
            </div >
            <form action="/FindJobApp/admin"  class="col-md-4">
                <div class="row" style="justify-content: space-around">
                    <!--    thống kê ứng tuyển theo tháng || quý     -->
                    <div class="col-12">
                        <div class="row ">
                            <c:if test="${sortBy == 'thang'}">
                                <input type="text" checked id="true" name="sort" value="thang" class="form-control" style="display: none"/>                                          
                                <div class="col btn btn-lg btn-outline-success active">Theo tháng</div>    
                                <a class="col btn btn-lg btn-outline-success" href="<c:url value="/admin" />?sort=quy">Theo quý</a>                                                   
                            </c:if>
                            <c:if test="${sortBy == 'quy'}">
                                <a class="col btn btn-lg btn-outline-success" href="<c:url value="/admin" />?sort=thang">Theo tháng</a>                                                            
                                <input type="text" checked id="true" name="sort" value="quy" class="form-control" style="display: none"/>
                                <div class="col btn btn-lg btn-outline-success active">Theo quý</div>                                                         
                            </c:if>
                        </div>
                    </div>

                    <!--    thống kê ứng tuyển theo năm     -->
                    <div class="col-10">
                        <div class="input-group input-group-lg col-10">
                            <input type="text" name="year"  placeholder="năm . . ." class="form-control">
                            <button class="btn btn-outline-success fa fa-search"></button>         
                        </div>
                    </div>
                    <div id="show">
                        tổng trong năm, cột cao nhất -> %, thấp nhất -> %, trung bình -> so sánh với năm trước
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    var chartData = [];
    <c:forEach items="${counterApples}" var="a">
    chartData.push(${a});
    </c:forEach>


    var ctx = document.getElementById('myChart').getContext('2d');

    <c:if test="${sortBy == 'thang'}">
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["tháng 1", "tháng 2", "tháng 3", "tháng 4", "tháng 5", "tháng 6", "tháng7", "tháng 8", "tháng 9", "tháng 10", "tháng 11", "tháng 12"],
            datasets: [{
                    label: '# Số lượng ứng tuyển',
                    data: chartData,
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                    ],
                    borderWidth: 5
                }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    </c:if>
    <c:if test="${sortBy == 'quy'}">
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["quý 1", "quý 2", "quý 3", "quý 4"],
            datasets: [{
                    label: '# Số lượng ứng tuyển',
                    data: chartData,
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(54, 162, 235, 1)',
                    ],
                    borderWidth: 5
                }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    </c:if>



</script>

