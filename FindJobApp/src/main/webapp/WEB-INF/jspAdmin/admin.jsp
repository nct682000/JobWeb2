<%-- 
    Document   : customers
    Created on : Aug 19, 2021, 3:43:35 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>




<div>
    <div class="container-fluid">
        <h1 style="text-align: center; padding: 30px">Thống kê số liệu trong năm ${year}</h1>
        <div class="row col-md-12">
            <!--    biểu đồ vòng cung    -->
            <div class="col-md-5 " >
                <div class="col-md-12 " style="margin-bottom: 50px">
                    <canvas id="Apply_City"  style="background-color: #d9fab6; margin-bottom: 10px"></canvas>
                </div >
                <div class="col-md-12 " style="margin-bottom: 5 0px">
                    <canvas id="Apply_Company"  style="background-color: #d9fab6; margin-bottom: 10px"></canvas>
                </div >
                <div class="col-md-12 ">
                    <canvas id="rateChart" style="background-color: #dff5cc; margin-bottom: 20px"></canvas>
                </div >
            </div>

            <!--    các biểu đồ còn lại    -->
            <div class="col-md-7 " >
                <div class="row" style="margin-bottom: 50px">
                    <!--    form nhập request     -->
                    <form action="/FindJobApp/admin"  class="col-md-12" style="text-align: center">
                        <div class="row">
                            <!--    thống kê ứng tuyển theo tháng || quý     -->
                            <div class="container">
                                <c:if test="${sortBy == 'thang'}">
                                    <input type="text" checked id="true" name="sort" value="thang" class="form-control" style="display: none"/>                                          
                                    <div class="col-3 btn btn-lg btn-outline-success active">Theo tháng</div>    
                                    <a class="col-3 btn btn-lg btn-outline-success" href="<c:url value="/admin" />?sort=quy">Theo quý</a>                                                   
                                </c:if>
                                <c:if test="${sortBy == 'quy'}">
                                    <a class="col-3 btn btn-lg btn-outline-success" href="<c:url value="/admin" />?sort=thang">Theo tháng</a>                                                            
                                    <input type="text" checked id="true" name="sort" value="quy" class="form-control" style="display: none"/>
                                    <div class="col-3 btn btn-lg btn-outline-success active">Theo quý</div>                                                         
                                </c:if>

                                <!--    thống kê ứng tuyển theo năm     -->
                                <div class="col-5" style="float: right">
                                    <div class="input-group input-group-lg ">
                                        <input type="text" name="year"  placeholder="năm . . ." class="form-control">
                                        <button class="btn btn-outline-success fa fa-search"></button>         
                                    </div>
                                </div>
                            </div>

                            <!--    Số liệu     -->
                            <div class="container " style="padding: 0 45px 0 45px">
                                <c:if test="${sortBy == 'thang'}">
                                    <div class="row" style="justify-content: center; text-align-last: center; margin-top: 20px; margin-bottom: 50px">
                                        <div class="col-5">
                                            <div class="input-group input-group-lg ">
                                                <input type="text" readonly value="Trong năm tổng có: ${total}" class="form-control col-5"/>
                                            </div>
                                        </div>
                                        <div class="col-5">
                                            <div class="input-group input-group-lg ">
                                                <input type="text" readonly value="Trung bình mỗi tháng: ${Math.ceil(avg * 100) / 100}" class="form-control col-5"/>
                                            </div>
                                        </div>
                                    </div>

                                </c:if>
                                <c:if test="${sortBy == 'quy'}">
                                    <div class="input-group input-group-lg ">
                                        <input type="text" readonly value="Trong năm tổng có: ${total}" class="form-control col-5"/>
                                    </div>
                                    <div class="input-group input-group-lg ">
                                        <input type="text" readonly value="Trung bình mỗi quý: ${Math.ceil(avg * 100) / 100}" class="form-control col-5"/>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </form>

                    <div class="col-md-12 ">
                        <canvas id="myChart"style="background-color: blanchedalmond;"></canvas>
                    </div >
                </div>

                <!--    form nhập request     -->
                <form action="/FindJobApp/admin"  class="col-md-12" style="text-align: center; margin-bottom: 30px; margin-top: 70px ">
                    <div class="row">
                        <!--    thống kê ứng tuyển theo tháng || quý     -->
                        <div class="container">
                            <!--<div class="row">-->
                            <c:if test="${sortBy2 == 'thang'}">
                                <a class="col-2 btn btn-lg btn-outline-success" href="<c:url value="/admin" />?sort2=nam">Theo năm</a>                                                   
                                <input type="text" checked id="true" name="sort2" value="thang" class="form-control" style="display: none"/>                                          
                                <div class="col-2 btn btn-lg btn-outline-success active">Theo tháng</div>    
                            </c:if>
                            <c:if test="${sortBy2 == 'nam'}">
                                <input type="text" checked id="true" name="sort2" value="nam" class="form-control" style="display: none"/>
                                <div class="col-2 btn btn-lg btn-outline-success active">Theo năm</div>                                                         
                                <a class="col-2 btn btn-lg btn-outline-success" href="<c:url value="/admin" />?sort2=thang">Theo tháng</a>                                                            
                            </c:if>

                            <!--    thống kê ứng tuyển theo tháng     -->
                            <c:if test="${sortBy2 == 'thang'}">
                                <div class="col-4" style="float:  right; margin-left: -150px; margin-right: 100px">
                                    <div class="input-group input-group-lg ">
                                        <input type="text" name="sortMonth"  placeholder="tháng . . ." class="form-control">
                                        <button class="btn btn-outline-success fa fa-search"></button>         
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <!--</div>-->
                    </div>
                </form>

                <div class="col-md-12 ">
                    <canvas id="Apply_Job"  style="background-color: #d9fab6; margin-bottom: 50px"></canvas>
                </div >
            </div>
        </div>

    </div>
</div>

<script>

    <c:if test="${sortBy2 == 'nam'}">
    var titleRate = 'Top nhà tuyển dụng được đánh giá cao trong năm ${year}';
    var title_Apply_Company = 'Top nhà tuyển dụng được ứng tuyển nhiều trong năm ${year}';
    var title_Apply_Job = 'Top công việc được ứng tuyển nhiều trong năm ${year}';
    var title_Apply_City = 'Top thành phố có lượng ứng tuyển nhiều trong năm ${year}';
    </c:if>
    <c:if test="${sortBy2 == 'thang'}">
    var titleRate = 'Top nhà tuyển dụng được đánh giá cao trong tháng ${month}';
    var title_Apply_Company = 'Top nhà tuyển dụng được ứng tuyển nhiều trong tháng ${month}';
    var title_Apply_Job = 'Top công việc được ứng tuyển nhiều trong tháng ${month}';
    var title_Apply_City = 'Top thành phố có lượng ứng tuyển nhiều trong tháng ${month}';
    </c:if>

//  biểu đồ thống kê hoạt động ứng tuyển
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
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 5
                }]
        },
        options: {
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    position: 'top',
                    padding: 20,
                    text: 'Số lượng ứng tuyển đã thực hiện trong năm ${year}',
                    color: 'blue',
                    font: {
                        size: 20,
                    },
                },
            },
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
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 5
                }]
        },
        options: {
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    position: 'top',
                    padding: 20,
                    text: 'Số lượng ứng tuyển đã thực hiện trong năm ${year}',
                    color: 'blue',
                    font: {
                        size: 20,
                    },
                },
            },
        }
    });
    </c:if>


//  biểu đồ top nhà tuyển dụng được đánh giá
    var rateLabels = [];
    <c:forEach items="${rateChart}" var="r">
    rateLabels.push(`${r[2]}`);
    </c:forEach>

    var rateDatas = [];
    <c:forEach items="${rateChart}" var="r">
    rateDatas.push(${r[0]});
    </c:forEach>

    var rateSl = [];
    <c:forEach items="${rateChart}" var="r">
    rateSl.push(${r[1]});
    </c:forEach>

    new Chart("rateChart", {
        type: "bar",
        data: {
            labels: rateLabels,
            datasets: [
                {
                    label: 'rating',
                    backgroundColor: 'rgba(255, 206, 86, 0.2)',
                    borderColor: 'rgba(255, 206, 86, 1)',
                    borderWidth: 5,
                    data: rateDatas
                },
                {
                    type: "line",
                    label: 'sl',
                    backgroundColor: 'rgba(255, 206, 86, 0)',
                    borderColor: 'rgba(54, 162, 235, 0)',
                    data: rateSl,
                    display: false
                },
            ]
        },
        options: {
            responsive: true,
            interaction: {
                intersect: false,
                mode: 'index',
            },
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: titleRate,
                    color: 'blue',
                    font: {
                        size: 20,
//                        family: 'tahoma',
//                        weight: 'normal',
//                        style: 'italic'
                    },
//                    padding: {
//                        bottom: 10
//                    }
                },
            },
            scales: {
                x: {
                    title: {
                        display: false,
                        text: 'Công ty'
                    }
                },
                y: {
//                    stacked: true,
                    title: {
                        display: true,
                        text: 'Rating'
                    },
                }
            }
        },

    });


//  biểu đồ top nhà tuyển dụng được ứng tuyển nhiều nhất trong năm
    var Apply_Company_Labels = [];
    <c:forEach items="${countApplyByCompany}" var="r">
    Apply_Company_Labels.push(`${r[1]}`);
    </c:forEach>

    var Apply_Company_Sl = [];
    <c:forEach items="${countApplyByCompany}" var="r">
    Apply_Company_Sl.push(${r[0]});
    </c:forEach>

    new Chart("Apply_Company", {
        type: "bar",
        data: {
            labels: Apply_Company_Labels,
            datasets: [
                {
                    label: 'số lượng ứng tuyển',
                    backgroundColor: 'rgba(153, 102, 255, 0.2)',
                    borderColor: 'rgba(153, 102, 255, 1)',
                    borderWidth: 5,
                    data: Apply_Company_Sl
                },
            ]
        },
        options: {
            responsive: true,
            interaction: {
                intersect: false,
                mode: 'index',
            },
            plugins: {
                legend: {
//                    position: 'bottom',
                },
                title: {
                    display: true,
                    position: 'top',
                    padding: 20,
                    text: title_Apply_Company,
                    color: 'blue',
                    font: {
                        size: 20,
                    },
                },
            },
        },

    });

//  biểu đồ top công việc được ứng tuyển nhiều nhất
    var Apply_Job_Labels = [];
    var Apply_Job_Labels2 = [];

    <c:forEach items="${countApplyByJob}" var="r">
        <c:if test="${r[1].length() >= 20}">
    Apply_Job_Labels.push(`${r[1].substring(0, 20)}...`);
        </c:if>
        <c:if test="${r[1].length() < 20}">
    Apply_Job_Labels.push(`${r[1]}`);
        </c:if>
    Apply_Job_Labels2.push(`${r[1]}`);
    </c:forEach>

    var Apply_Job_Sl = [];
    <c:forEach items="${countApplyByJob}" var="r">
    Apply_Job_Sl.push(${r[0]});
    </c:forEach>

    new Chart("Apply_Job", {
        type: "bar",
        data: {
            labels: Apply_Job_Labels,
            datasets: [
                {
                    label: 'số lượng ứng tuyển',
                    backgroundColor:  'rgba(75, 192, 192, 0.2)',
                    borderColor:  'rgba(75, 192, 192, 1)',
                    borderWidth: 5,
                    data: Apply_Job_Sl,
                },
            ],
            marginLeft: 20
        },
        options: {
            responsive: true,
            interaction: {
                intersect: false,
                mode: 'index',
            },
            plugins: {
                legend: {
//                    position: 'bottom',
                },
                title: {
                    display: true,
                    position: 'top',
                    padding: 20,
                    text: title_Apply_Job,
                    color: 'blue',
                    font: {
                        size: 20,
                    },
                },
            },
        },

    });


//  biểu đồ top thành phố có lượng ứng tuyển nhiều nhất
    var Apply_City_Labels = [];
    <c:forEach items="${countApplyByCity}" var="r">
    Apply_City_Labels.push(`${r[1]}`);
    </c:forEach>

    var Apply_City_Sl = [];
    <c:forEach items="${countApplyByCity}" var="r">
    Apply_City_Sl.push(${r[0]});
    </c:forEach>

    new Chart("Apply_City", {
        type: "bar",
        data: {
            labels: Apply_City_Labels,
            datasets: [
                {
                    label: 'số lượng ứng tuyển',
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                        borderColor:   'rgba(255, 99, 132, 1)',
borderWidth: 5,
                    data: Apply_City_Sl,
                },
            ],
            marginLeft: 20
        },
        options: {
            responsive: true,
            interaction: {
                intersect: false,
                mode: 'index',
            },
            plugins: {
                legend: {
//                    position: 'bottom',
                },
                title: {
                    display: true,
                    position: 'top',
                    padding: 20,
                    text: title_Apply_City,
                    color: 'blue',
                    font: {
                        size: 20,
                    },
                },
            },
        },

    });


</script>

