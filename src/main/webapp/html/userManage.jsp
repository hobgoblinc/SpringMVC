<%--
  Created by IntelliJ IDEA.
  User: sjj
  Date: 2015/10/24 0024
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->--%>
    <title>用户管理</title>

    <%--    <!-- 新 Bootstrap 核心 CSS 文件 -->--%>
    <link rel="stylesheet" href="<%= path%>/css/bootstrap.min.css">
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"--%>
    <%--          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>

    <%--    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"--%>
    <%--          rel="stylesheet">--%>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="<%=path%>/css/toastr.css">
    <link rel="stylesheet" href="<%=path%>/css/jquery-ui.min.css">

    <style type="text/css">
        /*翻页*/
        .jump_text {
            float: right;
            margin: 0 0 0 5px;
            line-height: 33px;
        }

        .jump_text input {
            width: 40px;
            border: rgba(212, 212, 212, 1.00) 1px solid;
            height: 30px;
            line-height: 33px;
            background: #fff;
        }

        .form-group {
            margin-bottom: 12px;
        }

        .datetime-group {
            margin-left: -20px;
            padding-left: 5px;
        }

        html {
            height: 100%;
        }

        body {
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        header {
            /* 我们希望 header 采用固定的高度，只占用必须的空间 */
            /* 0 flex-grow, 0 flex-shrink, auto flex-basis */
            flex: 0 0 auto;
        }

        .main-content {
            /* 将 flex-grow 设置为1，该元素会占用全部可使用空间
               而其他元素该属性值为0，因此不会得到多余的空间*/
            /* 1 flex-grow, 0 flex-shrink, auto flex-basis */
            flex: 1 0 auto;
        }

        footer {
            /* 和 header 一样，footer 也采用固定高度*/
            /* 0 flex-grow, 0 flex-shrink, auto flex-basis */
            flex: 0 0 auto;
        }

        table {
            /*table-layout: fixed;*/
            table-border-color-dark: #2b2b2b;
        }

        td {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;

        }

        .input-margin-bottom {
            margin-bottom: 12px;
        }
    </style>


</head>
<body>
<header>
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-collapse collapse" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand">Live With It</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Portfolio</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<section class="main-content">
    <div class="container">
        <h3 class="text-center">专利申报管理系统</h3>
        <hr/>
        <div class="row form-group">
            <label class="col-lg-1 col-md-1 col-xs-4 col-sm-2" for="userId">机会号#:</label>
            <div class="col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <input type="number" class="form-control" id="userId" name="userId" placeholder=""/>
            </div>
            <label class="col-lg-1 col-md-1 col-xs-4 col-sm-2" for="company">公司名称:</label>
            <div class="col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <input type="text" class="form-control" id="company" name="company" placeholder=""/>
            </div>
            <label class="col-lg-1 col-md-1 col-xs-4 col-sm-2" for="name">联系人:</label>
            <div class="col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <input type="text" class="form-control" id="name" name="name" placeholder=""/>
            </div>
            <label class="col-lg-1 col-md-1 col-xs-4 col-sm-2" for="phone">联系电话:</label>
            <div class="col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <input type="text" class="form-control" id="phone" name="phone" placeholder=""/>
            </div>
        </div>
        <div class="row form-group">
            <label class="col-lg-1 col-md-1 col-xs-4 col-sm-2" for="state">跟进状态:</label>
            <div class="col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <select class="selectpicker form-control" id="state">
                    <option value="">&nbsp;&nbsp;请选择</option>
                    <option value="1">1&nbsp;&nbsp;待受理</option>
                    <option value="2">2&nbsp;&nbsp;跟进中</option>
                    <option value="3">3&nbsp;&nbsp;已付款</option>
                    <option value="4">4&nbsp;&nbsp;已放弃</option>
                </select>
            </div>
            <label class="col-lg-1 col-md-1 col-xs-4 col-sm-2" for="business">业务类型:</label>
            <div class="col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <select class="selectpicker form-control" id="business">
                    <option value="">&nbsp;&nbsp;请选择</option>
                    <option value="1">1&nbsp;&nbsp;商标注册</option>
                    <option value="2">2&nbsp;&nbsp;商标转让</option>
                    <option value="3">3&nbsp;&nbsp;商标续展</option>
                    <option value="4">4&nbsp;&nbsp;商标变更</option>
                    <option value="5">5&nbsp;&nbsp;驳回复审</option>
                    <option value="6">6&nbsp;&nbsp;重庆版权</option>
                    <option value="7">7&nbsp;&nbsp;国家版权</option>
                    <option value="8">8&nbsp;&nbsp;计算机软件著作权</option>
                    <option value="9">9&nbsp;&nbsp;撤三</option>
                    <option value="10">10&nbsp;&nbsp;商标证补证</option>
                    <option value="11">11&nbsp;&nbsp;商标异议</option>
                    <option value="12">12&nbsp;&nbsp;商标交易</option>
                    <option value="13">13&nbsp;&nbsp;商标许可备案</option>
                    <option value="14">14&nbsp;&nbsp;答辩</option>
                </select>
            </div>
            <label class="col-lg-1 col-md-1 col-xs-4 col-sm-2" for="source">来源:</label>
            <div class="col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <select class="selectpicker form-control" id="source">
                    <option value="">&nbsp;&nbsp;请选择</option>
                    <option value="1">1&nbsp;&nbsp;直客</option>
                    <option value="2">2&nbsp;&nbsp;合伙人</option>
                    <option value="3">3&nbsp;&nbsp;同行</option>
                    <option value="4">4&nbsp;&nbsp;搜客宝</option>
                    <option value="5">5&nbsp;&nbsp;转介绍</option>
                </select>
            </div>
            <label class="col-lg-1 col-md-1 col-xs-4 col-sm-2" for="counselor">销售顾问:</label>
            <div class="col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <input type="text" class="form-control" id="counselor" name="counselor" placeholder=""/>
            </div>
        </div>
        <div class="row form-group">
            <label class="col-lg-1 col-md-1 col-xs-4 col-sm-2" for="service_type">服务类型:</label>
            <div class="col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <select class="selectpicker form-control" id="service_type">
                    <option value="">&nbsp;&nbsp;请选择</option>
                    <option value="1">1&nbsp;&nbsp;普通</option>
                    <option value="2">2&nbsp;&nbsp;双享</option>
                    <option value="3">3&nbsp;&nbsp;担保</option>
                    <option value="4">4&nbsp;&nbsp;无忧</option>
                    <option value="5">5&nbsp;&nbsp;加急</option>
                </select>
            </div>
            <label class="col-lg-1 col-md-1 col-xs-4 col-sm-2" for="customer_type">客户类型:</label>
            <div class="col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <select class="selectpicker form-control" id="customer_type">
                    <option value="">&nbsp;&nbsp;请选择</option>
                    <option value="A">A 类</option>
                    <option value="B">B 类</option>
                    <option value="C">C 类</option>
                    <option value="D">D 类</option>
                    <option value="E">E 类</option>
                </select>
            </div>
            <label class="col-lg-1 col-md-1 col-xs-4 col-sm-2" for="income_start">金额区间:</label>
            <div class="col-lg-2 col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <input type="text" class="form-control" id="income_start" name="income_start" maxLength="10"
                       placeholder=""/>
            </div>
            <div class="col-sm-offset-1 col-xs-offset-4 col-md-offset-1 col-lg--2 col-md-2 col-xs-8 col-sm-4 input-margin-bottom">
                <input type="text" class="form-control" id="income_end" name="income_end" maxLength="10"
                       placeholder=""/>
            </div>
        </div>
        <div class="row form-group">
            <div class='col-lg-3 col-md-5 col-sm-6'>
                    <label for="datetimepicker1" class="col-lg-4 col-md-4 col-sm-5 control-label">起止日期：</label>
                    <!--指定 date标记-->
                    <div class='input-group date form_datetime col-lg-8 col-md-8 col-sm-7' id='datetimepicker1'>
                        <input type='text' class="form-control" readonly="readonly" id="start_time"/>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                    </div>
            </div>
            <div class='col-lg-3 col-md-5 col-sm-6'>
                    <%--<label for="datetimepicker2" class="col-md-4 control-label"></label>--%>
                    <!--指定 date标记-->
                    <div class='input-group date form_datetime col-md-8 col-sm-7' id='datetimepicker2'>
                        <input type='text' class="form-control" readonly="readonly" id="end_time"/>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                    </div>
            </div>
        </div>
        <div class="form-group col-md-12 col-sm-12" style="align-content: center">
            <div class="col-lg-4 col-sm-4 col-xs-4"></div>
            <div class="col-lg-4 col-sm-4 col-xs-4">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <button type="button" class="btn btn-sm" style="background-color: #E46E2E"
                            onclick="clearn_data()">
                        <span class="glyphicon glyphicon-remove"></span>复位
                    </button>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <button type="button" class="btn btn-sm" style="background-color: #E46E2E"
                            onclick="search_Users()">
                        <span class="glyphicon glyphicon-search"></span>查询
                    </button>
                </div>
                <div class="col-sm-3"></div>
            </div>
            <div class="col-lg-4 col-sm-4 col-xs-4"></div>
        </div>
        <h3>用户列表
            <a href="javascript:void(0)" class="btn btn-default btn-sm" onclick="openMotai()"><span
                    class="	glyphicon glyphicon-plus"></span>添加</a>
        </h3>
        <%--    <!-- 模态框（Modal） -->--%>
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog " style="width:90%; height: 80%; margin-top: 48px; max-width: 1280px">
                <div class="modal-content ">
                    <div class="modal-header">
                        　　　　　　　　　　　　　　<!-- 关闭符号(叉号) -->
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            新增用户信息和跟进记录
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="container" style="width: inherit">
                            <h4>添加客户<span style="font-size: small; color: red; font-weight: bold">（提交后会自动记录创建时间格式为yyyy-MM-dd HH:mm:ss。）</span>
                            </h4>
                            <hr/>
                            <div class="form-group col-md-12 col-sm-12">
                                <label for="company_model" class="col-sm-1 control-label">公司名称:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="company_model" name="company_model"
                                           placeholder=""/>
                                </div>
                                <label for="name_model" class="col-sm-1 control-label">联系人:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="name_model" name="name_model"
                                           placeholder=""/>
                                </div>
                                <label for="phone_model" class="col-sm-1 control-label">联系电话:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="phone_model" name="phone_model"
                                           placeholder=""/>
                                </div>
                            </div>
                            <div class="form-group col-md-12 col-sm-12">
                                <label for="state_model" class="col-sm-1 control-label">状态:</label>
                                <div class="col-sm-3">
                                    <%--                                <input type="text" class="form-control" id="state_model" name="state_model"--%>
                                    <%--                                       placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="state_model">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;待受理</option>
                                        <option value="2">2&nbsp;&nbsp;跟进中</option>
                                        <option value="3">3&nbsp;&nbsp;已付款</option>
                                        <option value="4">4&nbsp;&nbsp;已放弃</option>
                                    </select>
                                </div>
                                <label for="business_model" class="col-sm-1 control-label">业务类型:</label>
                                <div class="col-sm-3">
                                    <%--                                <input type="text" class="form-control" id="business_model" name="business_model"--%>
                                    <%--                                       placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="business_model">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;商标注册</option>
                                        <option value="2">2&nbsp;&nbsp;商标转让</option>
                                        <option value="3">3&nbsp;&nbsp;商标续展</option>
                                        <option value="4">4&nbsp;&nbsp;商标变更</option>
                                        <option value="5">5&nbsp;&nbsp;驳回复审</option>
                                        <option value="6">6&nbsp;&nbsp;重庆版权</option>
                                        <option value="7">7&nbsp;&nbsp;国家版权</option>
                                        <option value="8">8&nbsp;&nbsp;计算机软件著作权</option>
                                        <option value="9">9&nbsp;&nbsp;撤三</option>
                                        <option value="10">10&nbsp;&nbsp;商标证补证</option>
                                        <option value="11">11&nbsp;&nbsp;商标异议</option>
                                        <option value="12">12&nbsp;&nbsp;商标交易</option>
                                        <option value="13">13&nbsp;&nbsp;商标许可备案</option>
                                        <option value="14">14&nbsp;&nbsp;答辩</option>
                                    </select>
                                </div>
                                <label for="source_model" class="col-sm-1 control-label">来源:</label>
                                <div class="col-sm-3">
                                    <%--                                <input type="text" class="form-control" id="source_model" name="source_model"--%>
                                    <%--                                       placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="source_model">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;直客</option>
                                        <option value="2">2&nbsp;&nbsp;合伙人</option>
                                        <option value="3">3&nbsp;&nbsp;同行</option>
                                        <option value="4">4&nbsp;&nbsp;搜客宝</option>
                                        <option value="5">5&nbsp;&nbsp;转介绍</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group col-md-12 col-sm-12">
                                <label for="service_type_model" class="col-sm-1 control-label">服务类型:</label>
                                <div class="col-sm-3">
                                    <%--<input type="text" class="form-control" id="counselor_model" name="counselor_model"--%>
                                    <%--placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="service_type_model">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;普通</option>
                                        <option value="2">2&nbsp;&nbsp;双享</option>
                                        <option value="3">3&nbsp;&nbsp;担保</option>
                                        <option value="4">4&nbsp;&nbsp;无忧</option>
                                        <option value="5">5&nbsp;&nbsp;加急</option>
                                    </select>
                                </div>
                                <label for="customer_type_model" class="col-sm-1 control-label">客户类型:</label>
                                <div class="col-sm-3">
                                    <%--<input type="text" class="form-control" id="customer_type_model" name="income_model"--%>
                                    <%--placeholder="" maxLength="10"/>--%>
                                    <select class="selectpicker form-control" id="customer_type_model">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="A">A 类</option>
                                        <option value="B">B 类</option>
                                        <option value="C">C 类</option>
                                        <option value="D">D 类</option>
                                        <option value="E">E 类</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group col-md-12 col-sm-12">
                                <label for="counselor_model" class="col-sm-1 control-label">销售顾问:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="counselor_model" name="counselor_model"
                                           placeholder=""/>
                                </div>
                                <label for="income_model" class="col-sm-1 control-label">销售金额:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="income_model" name="income_model"
                                           placeholder="" maxLength="10"/>
                                </div>
                            </div>
                            <h4>跟进信息</h4>
                            <hr/>
                            <div class="form-group col-md-12 col-sm-12 datetime-group">
                                <div class='col-md-4'>
                                    <div class="col-sm-12" style="">
                                        <label for="datetimepicker1" class="col-md-4 control-label">下次跟进时间:</label>
                                        <!--指定 date标记-->
                                        <div class='input-group date form_datetime col-sm-8' id='datetimepicker3'>
                                            <input type='text' class="form-control" readonly="readonly"
                                                   id="next_time_model"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-remove"></span></span>
                                            <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                                        </div>
                                    </div>
                                </div>
                                <div class='col-md-4'>
                                    <div class="col-sm-12">
                                        <label for="datetimepicker2" class="col-md-4 control-label">付款时间:</label>
                                        <!--指定 date标记-->
                                        <div class='input-group date form_datetime col-sm-8' id='datetimepicker4'>
                                            <input type='text' class="form-control" readonly="readonly"
                                                   id="pay_time_model"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-remove"></span></span>
                                            <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                                        </div>
                                    </div>
                                </div>
                                <div class='col-md-4'>
                                    <div class="col-sm-12">
                                        <label for="datetimepicker2" class="col-md-4 control-label">放弃时间:</label>
                                        <!--指定 date标记-->
                                        <div class='input-group date form_datetime col-sm-8' id='datetimepicker5'>
                                            <input type='text' class="form-control" readonly="readonly"
                                                   id="giveUp_model"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-remove"></span></span>
                                            <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container-fluid">
                                <div class="col-md-12 col-sm-12">
                                    <form role="form">
                                        <div class="form-group">
                                            <label for="text_model">跟进记录（<span id="num">0</span>/255字）</label>
                                            <textarea oninput="wordStatic(this);" maxlength="255" class="form-control"
                                                      id="text_model" rows="3"></textarea>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <hr/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button onclick="submit_model()" type="button" class="btn btn-primary">
                            提交更改
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>

        <div class="table-responsive">
            <table id="users_show" class="table table-striped table-bordered table-condensed table-hover">
                <thead>
                <tr style="text-align: center">
                    <th>机会号</th>
                    <th>公司名称</th>
                    <th>联系人</th>
                    <th>联系电话</th>
                    <th>状态</th>
                    <th>业务类型</th>
                    <th>服务类型</th>
                    <th>客户分类</th>
                    <th>来源</th>
                    <th>销售顾问</th>
                    <th>创建时间</th>
                    <th>销售金额</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_1"
             aria-hidden="true">
            <div class="modal-dialog" style="width:80%; height: 60%; margin-top: 50px; max-width: 1200px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel_1">用户信息和跟进记录详情</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container" style="width: inherit">
                            <h4>客户信息详情<span style="font-size: small; color: red; font-weight: bold">（本页可更新客户信息。）</span>
                                <button onclick="refresh_detail()" type="button" class="close" aria-hidden="true"><span class="glyphicon glyphicon-repeat"></span></button>
                            </h4>
                            <hr/>
                            <div class="form-group col-md-12 col-sm-12">
                                <label class="col-sm-1 control-label" for="userId_detail">机会号#:</label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control" id="userId_detail" name="userId"
                                           placeholder="" readonly/>
                                </div>
                                <label for="company_model_detail" class="col-sm-1 control-label">公司名称:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="company_model_detail"
                                           name="company_model"
                                           placeholder=""/>
                                </div>
                                <label for="name_model_detail" class="col-sm-1 control-label">联系人:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="name_model_detail" name="name_model"
                                           placeholder=""/>
                                </div>
                            </div>
                            <div class="form-group col-md-12 col-sm-12">
                                <label for="state_model_detail" class="col-sm-1 control-label">状态:</label>
                                <div class="col-sm-3">
                                    <%--                                <input type="text" class="form-control" id="state_model" name="state_model"--%>
                                    <%--                                       placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="state_model_detail">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;待受理</option>
                                        <option value="2">2&nbsp;&nbsp;跟进中</option>
                                        <option value="3">3&nbsp;&nbsp;已付款</option>
                                        <option value="4">4&nbsp;&nbsp;已放弃</option>
                                    </select>
                                </div>
                                <label for="business_model_detail" class="col-sm-1 control-label">业务类型:</label>
                                <div class="col-sm-3">
                                    <%--                                <input type="text" class="form-control" id="business_model" name="business_model"--%>
                                    <%--                                       placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="business_model_detail">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;商标注册</option>
                                        <option value="2">2&nbsp;&nbsp;商标转让</option>
                                        <option value="3">3&nbsp;&nbsp;商标续展</option>
                                        <option value="4">4&nbsp;&nbsp;商标变更</option>
                                        <option value="5">5&nbsp;&nbsp;驳回复审</option>
                                        <option value="6">6&nbsp;&nbsp;重庆版权</option>
                                        <option value="7">7&nbsp;&nbsp;国家版权</option>
                                        <option value="8">8&nbsp;&nbsp;计算机软件著作权</option>
                                        <option value="9">9&nbsp;&nbsp;撤三</option>
                                        <option value="10">10&nbsp;&nbsp;商标证补证</option>
                                        <option value="11">11&nbsp;&nbsp;商标异议</option>
                                        <option value="12">12&nbsp;&nbsp;商标交易</option>
                                        <option value="13">13&nbsp;&nbsp;商标许可备案</option>
                                        <option value="14">14&nbsp;&nbsp;答辩</option>
                                    </select>
                                </div>
                                <label for="source_model_detail" class="col-sm-1 control-label">来源:</label>
                                <div class="col-sm-3">
                                    <%--                                <input type="text" class="form-control" id="source_model" name="source_model"--%>
                                    <%--                                       placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="source_model_detail">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;直客</option>
                                        <option value="2">2&nbsp;&nbsp;合伙人</option>
                                        <option value="3">3&nbsp;&nbsp;同行</option>
                                        <option value="4">4&nbsp;&nbsp;搜客宝</option>
                                        <option value="5">5&nbsp;&nbsp;转介绍</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group col-md-12 col-sm-12">
                                <label for="service_type_model_detail" class="col-sm-1 control-label">服务类型:</label>
                                <div class="col-sm-3">
                                    <%--<input type="text" class="form-control" id="counselor_model" name="counselor_model"--%>
                                    <%--placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="service_type_model_detail">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;普通</option>
                                        <option value="2">2&nbsp;&nbsp;双享</option>
                                        <option value="3">3&nbsp;&nbsp;担保</option>
                                        <option value="4">4&nbsp;&nbsp;无忧</option>
                                        <option value="5">5&nbsp;&nbsp;加急</option>
                                    </select>
                                </div>
                                <label for="customer_type_model_detail" class="col-sm-1 control-label">客户类型:</label>
                                <div class="col-sm-3">
                                    <%--<input type="text" class="form-control" id="customer_type_model" name="income_model"--%>
                                    <%--placeholder="" maxLength="10"/>--%>
                                    <select class="selectpicker form-control" id="customer_type_model_detail">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="A">A 类</option>
                                        <option value="B">B 类</option>
                                        <option value="C">C 类</option>
                                        <option value="D">D 类</option>
                                        <option value="E">E 类</option>
                                    </select>
                                </div>
                                <label for="phone_model_detail" class="col-sm-1 control-label">联系电话:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="phone_model_detail" name="phone_model"
                                           placeholder=""/>
                                </div>
                            </div>
                            <div class="form-group col-md-12 col-sm-12">
                                <label for="counselor_model_detail" class="col-sm-1 control-label">销售顾问:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="counselor_model_detail"
                                           name="counselor_model"
                                           placeholder=""/>
                                </div>
                                <label for="income_model_detail" class="col-sm-1 control-label">销售金额:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="income_model_detail" name="income_model"
                                           placeholder="" maxLength="10"/>
                                </div>
                                <label for="create_model_detail" class="col-sm-1 control-label">创建时间:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="create_model_detail" name="income_model"
                                           placeholder="" readonly/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <h4>跟进记录
                                    </h4>
                                </div>
                                <div class="col-sm-10">
                                    <div class="col-sm-4"></div>
                                    <div class="col-sm-3">
                                        <button onclick="update_userInfo()" type="button" class="btn btn-primary">
                                            提交更改
                                        </button>
                                    </div>
                                    <div class="col-sm-3"></div>

                                </div>
                            </div>
                            <hr/>
                            <table style="table-layout:fixed" id="follow_detail"
                                   class="table table-striped table-bordered table-condensed table-hover">
                                <thead>
                                <tr style="text-align: center">
                                    <th>#</th>
                                    <th>内容</th>
                                    <th>更新时间</th>
                                    <th>放弃时间</th>
                                    <th>下次跟进时间</th>
                                    <th>付款时间</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                            <nav aria-label="Page navigation" class="text-right" id="naviga_model"
                                 style="display: block;">
                                <ul class="pagination">
                                    <li>
                                        <a href="javaScript:void(0)" onclick="pageUp_detail()"><span
                                                class="glyphicon glyphicon-chevron-left"> </span></a>
                                    </li>
                                    <li class="disabled">
                                        <a href="javaScript:void(0)"><span id="indexOfPage_model"></span> of <span
                                                id="indexOfTotalPage_model"></span></a>
                                    </li>
                                    <li>
                                        <a href="javaScript:void(0)" onclick="pageDown_detail()"><span
                                                class="glyphicon glyphicon-chevron-right"></span></a>
                                    </li>
                                </ul>
                                <div class="pagination">
                                    <span class="jump_text">共有<span id="span_totalPage_model"></span>页，<span
                                            id="span_totalElement_model"></span>条记录
                                    </span>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_2"
             aria-hidden="true">
            <div class="modal-dialog" style="width:80%; height: 60%; margin-top: 50px; max-width: 1200px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel_2">更新用户信息和新增跟进记录</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container" style="width: inherit">
                            <h4>客户信息详情<span style="font-size: small; color: red; font-weight: bold">（本页会同时更新客户信息和新增跟进记录。）</span>
                            </h4>
                            <hr/>
                            <div class="form-group col-md-12 col-sm-12">
                                <label class="col-sm-1 control-label" for="userId_detail_fellow">机会号#:</label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control" id="userId_detail_fellow" name="userId"
                                           placeholder="" readonly/>
                                </div>
                                <label for="company_model_detail" class="col-sm-1 control-label_fellow">公司名称:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="company_model_detail_fellow"
                                           name="company_model"
                                           placeholder=""/>
                                </div>
                                <label for="name_model_detail" class="col-sm-1 control-label_fellow">联系人:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="name_model_detail_fellow"
                                           name="name_model"
                                           placeholder=""/>
                                </div>
                            </div>
                            <div class="form-group col-md-12 col-sm-12">
                                <label for="state_model_detail" class="col-sm-1 control-label_fellow">状态:</label>
                                <div class="col-sm-3">
                                    <%--                                <input type="text" class="form-control" id="state_model" name="state_model"--%>
                                    <%--                                       placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="state_model_detail_fellow">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;待受理</option>
                                        <option value="2">2&nbsp;&nbsp;跟进中</option>
                                        <option value="3">3&nbsp;&nbsp;已付款</option>
                                        <option value="4">4&nbsp;&nbsp;已放弃</option>
                                    </select>
                                </div>
                                <label for="business_model_detail" class="col-sm-1 control-label_fellow">业务类型:</label>
                                <div class="col-sm-3">
                                    <%--                                <input type="text" class="form-control" id="business_model" name="business_model"--%>
                                    <%--                                       placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="business_model_detail_fellow">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;商标注册</option>
                                        <option value="2">2&nbsp;&nbsp;商标转让</option>
                                        <option value="3">3&nbsp;&nbsp;商标续展</option>
                                        <option value="4">4&nbsp;&nbsp;商标变更</option>
                                        <option value="5">5&nbsp;&nbsp;驳回复审</option>
                                        <option value="6">6&nbsp;&nbsp;重庆版权</option>
                                        <option value="7">7&nbsp;&nbsp;国家版权</option>
                                        <option value="8">8&nbsp;&nbsp;计算机软件著作权</option>
                                        <option value="9">9&nbsp;&nbsp;撤三</option>
                                        <option value="10">10&nbsp;&nbsp;商标证补证</option>
                                        <option value="11">11&nbsp;&nbsp;商标异议</option>
                                        <option value="12">12&nbsp;&nbsp;商标交易</option>
                                        <option value="13">13&nbsp;&nbsp;商标许可备案</option>
                                        <option value="14">14&nbsp;&nbsp;答辩</option>
                                    </select>
                                </div>
                                <label for="source_model_detail" class="col-sm-1 control-label_fellow">来源:</label>
                                <div class="col-sm-3">
                                    <%--                                <input type="text" class="form-control" id="source_model" name="source_model"--%>
                                    <%--                                       placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="source_model_detail_fellow">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;直客</option>
                                        <option value="2">2&nbsp;&nbsp;合伙人</option>
                                        <option value="3">3&nbsp;&nbsp;同行</option>
                                        <option value="4">4&nbsp;&nbsp;搜客宝</option>
                                        <option value="5">5&nbsp;&nbsp;转介绍</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group col-md-12 col-sm-12">
                                <label for="service_type_model_detail"
                                       class="col-sm-1 control-label_fellow">服务类型:</label>
                                <div class="col-sm-3">
                                    <%--<input type="text" class="form-control" id="counselor_model" name="counselor_model"--%>
                                    <%--placeholder=""/>--%>
                                    <select class="selectpicker form-control" id="service_type_model_detail_fellow">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="1">1&nbsp;&nbsp;普通</option>
                                        <option value="2">2&nbsp;&nbsp;双享</option>
                                        <option value="3">3&nbsp;&nbsp;担保</option>
                                        <option value="4">4&nbsp;&nbsp;无忧</option>
                                        <option value="5">5&nbsp;&nbsp;加急</option>
                                    </select>
                                </div>
                                <label for="customer_type_model_detail"
                                       class="col-sm-1 control-label_fellow">客户类型:</label>
                                <div class="col-sm-3">
                                    <%--<input type="text" class="form-control" id="customer_type_model" name="income_model"--%>
                                    <%--placeholder="" maxLength="10"/>--%>
                                    <select class="selectpicker form-control" id="customer_type_model_detail_fellow">
                                        <option value="">&nbsp;&nbsp;请选择</option>
                                        <option value="A">A 类</option>
                                        <option value="B">B 类</option>
                                        <option value="C">C 类</option>
                                        <option value="D">D 类</option>
                                        <option value="E">E 类</option>
                                    </select>
                                </div>
                                <label for="phone_model_detail" class="col-sm-1 control-label_fellow">联系电话:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="phone_model_detail_fellow"
                                           name="phone_model"
                                           placeholder=""/>
                                </div>
                            </div>
                            <div class="form-group col-md-12 col-sm-12">
                                <label for="counselor_model_detail" class="col-sm-1 control-label_fellow">销售顾问:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="counselor_model_detail_fellow"
                                           name="counselor_model"
                                           placeholder=""/>
                                </div>
                                <label for="income_model_detail" class="col-sm-1 control-label">销售金额:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="income_model_detail_fellow"
                                           name="income_model"
                                           placeholder="" maxLength="10"/>
                                </div>
                                <label for="create_model_detail" class="col-sm-1 control-label">创建时间:</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="create_model_detail_fellow"
                                           name="income_model"
                                           placeholder="" readonly/>
                                </div>
                            </div>
                            <div class="form-group col-md-12 col-sm-12 datetime-group">
                                <div class='col-md-4'>
                                    <div class="col-sm-12" style="">
                                        <label for="datetimepicker3_fellow"
                                               class="col-md-4 control-label">下次跟进时间:</label>
                                        <!--指定 date标记-->
                                        <div class='input-group date form_datetime col-md-8'
                                             id='datetimepicker3_fellow'>
                                            <input type='text' class="form-control" readonly="readonly"
                                                   id="next_time_model_fellow"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-remove"></span></span>
                                            <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class='col-md-4'>
                                    <div class="col-sm-12">
                                        <label for="datetimepicker4_fellow" class="col-md-4 control-label">付款时间:</label>
                                        <!--指定 date标记-->
                                        <div class='input-group date form_datetime col-md-8'
                                             id='datetimepicker4_fellow'>
                                            <input type='text' class="form-control" readonly="readonly"
                                                   id="pay_time_model_fellow"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-remove"></span></span>
                                            <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class='col-md-4'>
                                    <div class="col-sm-12">
                                        <label for="datetimepicker5_fellow" class="col-md-4 control-label">放弃时间:</label>
                                        <!--指定 date标记-->
                                        <div class='input-group date form_datetime col-md-8'
                                             id='datetimepicker5_fellow'>
                                            <input type='text' class="form-control" readonly="readonly"
                                                   id="giveUp_model_fellow"/>
                                            <span class="input-group-addon"><span
                                                    class="glyphicon glyphicon-remove"></span></span>
                                            <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container-fluid">
                                <div class="col-md-12 col-sm-12">
                                    <form role="form">
                                        <div class="form-group">
                                            <label for="text_model_fellow">跟进记录（<span
                                                    id="num_fellow">0</span>/255字）</label>
                                            <textarea oninput="wordStatic_fellow(this);" maxlength="255"
                                                      class="form-control"
                                                      id="text_model_fellow" rows="3"></textarea>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button onclick="submit_model_fellow()" type="button" class="btn btn-primary">
                            提交更改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
        <nav aria-label="Page navigation" class="text-right" id="naviga" style="display: none;">
            <ul class="pagination">
                <li>
                    <a href="javaScript:void(0)" onclick="pageUp()">上一页</a>
                </li>
                <li class="disabled">
                    <a href="javaScript:void(0)"><span id="indexOfPage"></span> of <span
                            id="indexOfTotalPage"></span></a>
                </li>
                <li>
                    <a href="javaScript:void(0)" onclick="pageDown()">下一页</a>
                </li>
            </ul>
            <div class="pagination">
            <span class="jump_text">共有<span id="span_totalPage"></span>页，<span id="span_totalElement"></span>条记录，跳到
            <input type="number" name="jumpPage" id="jumpPage" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');">页
            <button type="button" class="btn btn-sm btn-success" onclick="goPage()">GO</button>
        </span>
            </div>
        </nav>
    </div>
</section>
<footer class="footer navbar navbar-default" style="margin-bottom: 0px">
    <div class="container">
        <div class="collapse navbar-collapse">
            <div class="col-sm-4"></div>
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <p style="margin-top: 10px;">Copyright © 2019 - 2099 H.C. All Rights Reserved.</p>
            </div>
        </div>
    </div>
</footer>
<%--<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->--%>
<script src="<%= path%>/js/jquery.min.js"></script>
<%--<script src="<%= path%>/js/moment-with-locales.min.js"></script>--%>
<%--<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->--%>
<script src="<%= path%>/js/bootstrap.min.js"></script>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"--%>
<%--            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"--%>
<%--            crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>--%>

<script src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=path%>/js/toastr.min.js"></script>
<script src="<%=path%>/js/jquery-ui.min.js"></script>
<%--<script src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>--%>
<%--<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>--%>
<script type="text/javascript">
    toastr.options = {
        positionClass: "toast-top-center",
    };
    var page = 1;
    var pageSize = 10;
    var totalPage = 0;
    var totalElement = 0;
    var currentPage = 0;

    var _page_records_model = 1;
    var _pageSize_records_model = 5;
    var _totalPage_records_model = 0;
    var _totalElement_records_model = 0;
    var _currentPage_records_model = 0;

    //客户来源
    var _source = {};
    _source[''] = '';
    _source['0'] = '';
    _source['1'] = '1-直客';
    _source['2'] = '2-合伙人';
    _source['3'] = '3-同行';
    _source['4'] = '4-搜客宝';
    _source['5'] = '5-转介绍';

    //跟进状态
    var _state = {};
    _state[''] = '';
    _state['0'] = '';
    _state['1'] = '1-待受理';
    _state['2'] = '2-跟进中';
    _state['3'] = '3-已付款';
    _state['4'] = '4-已放弃';

    //业务类型
    var _business = {};
    _business[''] = '';
    _business['0'] = '';
    _business['1'] = '1-商标注册';
    _business['2'] = '2-商标转让';
    _business['3'] = '3-商标续展';
    _business['4'] = '4-商标变更';
    _business['5'] = '5-驳回复审';
    _business['6'] = '6-重庆版权';
    _business['7'] = '7-国家版权';
    _business['8'] = '8-计算机软件著作权';
    _business['9'] = '9-撤三';
    _business['10'] = '10-商标证补证';
    _business['11'] = '11-商标异议';
    _business['12'] = '12-商标交易';
    _business['13'] = '13-商标许可备案';
    _business['14'] = '14-答辩';

    var _service_type = {};
    _service_type[''] = '';
    _service_type['0'] = '';
    _service_type['1'] = '1-普通';
    _service_type['2'] = '2-双享';
    _service_type['3'] = '3-担保';
    _service_type['4'] = '4-无忧';
    _service_type['5'] = '5-加急';

    var _customer_type = {};
    _customer_type[''] = '';
    _customer_type['0'] = '';
    _customer_type['A'] = 'A 类';
    _customer_type['B'] = 'B 类';
    _customer_type['C'] = 'C 类';
    _customer_type['D'] = 'D 类';
    _customer_type['E'] = 'E 类';

    $(document).ready(function () {
        bindKeyEvent($("#income"));
        bindKeyEvent($("#income_end"));
        bindKeyEvent($("#income_start"));
        bindKeyEvent($("#income_model"));
    });

    function bindKeyEvent(obj) {
        obj.keyup(function () {
            var reg = $(this).val().match(/\d+\.?\d{0,2}/);
            var txt = '';
            if (reg != null) {
                txt = reg[0];
            }
            $(this).val(txt);
        }).change(function () {
            $(this).keypress();
            var v = $(this).val();
            if (/\.$/.test(v)) {
                $(this).val(v.substr(0, v.length - 1));
            }
        });
    }

    function pageTo(pageNumber) {
        var jumpPage = 1;
        if (pageNumber == -1) {
            jumpPage = Number(currentPage) - 1;
        } else if (pageNumber == -2) {
            jumpPage = Number(currentPage) + 1;
        } else {
            jumpPage = Number(pageNumber);
        }
        getUsersInfo(pageNumber, pageSize);
    }

    function submit_model_fellow() {
        var id = $("#userId_detail_fellow").val();
        var company = $("#company_model_detail_fellow").val();
        var name = $("#name_model_detail_fellow").val();
        var phone = $("#phone_model_detail_fellow").val();
        var state = $("#state_model_detail_fellow").val();
        var business = $("#business_model_detail_fellow").val();
        var source = $("#source_model_detail_fellow").val();
        var counselor = $("#counselor_model_detail_fellow").val();
        var createTime = $("#create_model_detail_fellow").val();
        var income = $("#income_model_detail_fellow").val();
        var service_type = $("#service_type_model_detail_fellow").val();
        var customer_type = $("#customer_type_model_detail_fellow").val();

        var nexttime = $("#next_time_model_fellow").val();
        var paytime = $("#pay_time_model_fellow").val();
        var giveuptime = $("#giveUp_model_fellow").val();
        var content = $("#text_model_fellow").val();

        if (content.trim() == "") {
            toastr.warning("请输入跟进内容！");
            return;
        }
        $.ajax({
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify([{
                id: id,
                company: company,
                name: name,
                phone: phone,
                state: state,
                business: business,
                source: source,
                counselor: counselor,
                createTime: createTime,
                income: income,
                service_type: service_type,
                customer_type: customer_type
            }, {
                content: content,
                date: "",
                nextDate: nexttime,
                giveUpDate: giveuptime,
                payDate: paytime
            }]),
            type: "post",
            dataType: 'json',
            async: false,
            timeout: 15000,
            url: "<%=path%>/addRecord",
            success: function (result) {
                toastr.info("提交成功！");
            },
            error: function (result) {
                toastr.error("更新失败" + result.statusText);
            },
            complete: function (XMLHttpRequest, status) {
                if (status == 'timeout') {
                    toastr.error("请求超时");
                }
            }

        });
    }

    function submit_model() {
        var company = $.trim($("#company_model").val());
        var name = $.trim($("#name_model").val());
        var phone = $.trim($("#phone_model").val());
        var state = $.trim($("#state_model").val());
        var business = $.trim($("#business_model").val());
        var source = $.trim($("#source_model").val());
        var income = $.trim($("#income_model").val());
        var counselor = $.trim($("#counselor_model").val());
        var next_time = $.trim($("#next_time_model").val());
        var pay_time = $.trim($("#pay_time_model").val());
        var giveup_time = $.trim($("#giveUp_model").val());
        var content = $.trim($("#text_model").val());
        var service_type = $.trim($("#service_type_model").val());
        var customer_type = $.trim($("#customer_type_model").val());
        if (company == "") {
            toastr.warning('请输入公司名称！');
            return;
        }
        if (name == "") {
            toastr.warning('请输入联系人');
            return;
        }
        $.ajax({
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            type: "post",
            timeout: 30000,
            data: JSON.stringify([{
                company: company,
                name: name,
                phone: phone,
                state: state,
                business: business,
                source: source,
                income: income,
                counselor: counselor,
                service_type: service_type,
                customer_type: customer_type
            }, {
                content: content,
                date: "",
                nextDate: next_time,
                giveUpDate: giveup_time,
                payDate: pay_time
            }]),
            url: "<%=path%>/addUserPost/",
            success: function (data) {
                console.log(data);
                $('#myModal1').modal('hide');
                toastr.success('提交成功，刷新查询。')
            },
            error: function (data) {
                console.log(data);
            }
        });
    }

    function openMotai() {
        $("#myModal1").modal({backdrop: 'static', keyboard: false});
        $('#myModal1').draggable();
        clearForm($("#myModal1"));
    }

    //清空文本框内容
    function clearForm(form) {
        // input清空
        $(':input', form).each(function () {
            var type = this.type;
            var tag = this.tagName.toLowerCase(); // normalize case
            if (type == 'text' || type == 'password' || tag == 'textarea')
                this.value = "";
            // 多选checkboxes清空
            // select 下拉框清空
            else if (tag == 'select')
                this.selectedIndex = 0;
        });
    };

    function clearTable() {
        $("#follow_detail tbody").html("");
    }

    function clearn_data() {
        $("#userId").val('');
        $("#company").val('');
        $("#name").val('');
        $("#phone").val('');
        $("#state").val('');
        $("#business").val('');
        $("#source").val('');
        $("#counselor").val('');
        $("#service_type").val('');
        $("#customer_type").val('');
        $("#income_start").val('');
        $("#income_end").val('');
        $("#start_time").val('');
        $("#end_time").val('');
    }

    function getUsersInfo(page, pageSize) {
        var userId = $.trim($("#userId").val());
        var company = $.trim($("#company").val());
        var name = $.trim($("#name").val());
        var phone = $.trim($("#phone").val());
        var state = $("#state").val();
        var business = $("#business").val();
        var source = $("#source").val();
        var counselor = $.trim($("#counselor").val());
        var service_type = $.trim($("#service_type").val());
        var customer_type = $.trim($("#customer_type").val());
        var income_start = $.trim($("#income_start").val());
        var income_end = $.trim($("#income_end").val());
        var start_time = $.trim($("#start_time").val());
        var end_time = $.trim($("#end_time").val());

        $("#users_show tbody").html("");
        $("#naviga").hide();
        $.ajax({
            contentType: "application/json;charset=utf-8",
            type: "post",
            data: JSON.stringify(
                [{
                    company: company,
                    userId: userId,
                    name: name,
                    phone: phone,
                    state: state,
                    business: business,
                    source: source,
                    income_start: income_start,
                    income_end: income_end,
                    start_time: start_time,
                    end_time: end_time,
                    counselor: counselor,
                    service_type: service_type,
                    customer_type: customer_type
                }, {
                    page: page,
                    pageSize: pageSize
                }]
            ),
            url: "<%=path%>/userPages?page=",
            async: false,
            dataType: "json",
            timeout: 15000,
            success: function (result) {
                console.info("Send get request address：" + this.url + " succeed!");
                console.log(result);
                //更新缓存信息
                totalPage = result.totalPages;
                totalElement = result.totalElements;
                currentPage = result.currentPage;
                document.getElementById("span_totalPage").innerHTML = totalPage;
                document.getElementById("indexOfPage").innerHTML = currentPage;
                document.getElementById("span_totalElement").innerHTML = totalElement;
                document.getElementById("indexOfTotalPage").innerHTML = totalPage;
                var json = eval(result);
                var tdBody = "";
                var infos = json.userList;
                if (infos.length <= 0 || infos == null || infos == "undefined") {
                    toastr.warning("查询无记录！");
                    return;
                }
                $.each(json.userList, function (index, item) {
                    var id = item.id;
                    var company = item.company;
                    var name = item.name;
                    var phone = item.phone;
                    var state = item.state;
                    var business = item.business;
                    var source = item.source;
                    var counselor = item.counselor;
                    var createTime = item.createTime;
                    var income = item.income;
                    var service_type = item.service_type;
                    var customer_type = item.customer_type;
                    tdBody += "<tr><td>" + removeNull(id) + "</td>";
                    tdBody += "<td>" + removeNull(company) + "</td>";
                    tdBody += "<td>" + removeNull(name) + "</td>";
                    tdBody += "<td>" + removeNull(phone) + "</td>";
                    tdBody += "<td>" + _state[removeNull(state)] + "</td>";
                    tdBody += "<td>" + _business[removeNull(business)] + "</td>";
                    tdBody += "<td>" + _service_type[removeNull(service_type)] + "</td>";
                    tdBody += "<td>" + _customer_type[removeNull(customer_type)] + "</td>";
                    tdBody += "<td>" + _source[removeNull(source)] + "</td>";
                    tdBody += "<td>" + removeNull(counselor) + "</td>";
                    tdBody += "<td>" + getsubString(removeNull(createTime)) + "</td>";
                    tdBody += "<td>" + removeNull(income) + "</td>";
                    tdBody += "<td>" + "<button style=\"margin-right:6px\" onClick=\"showDetail(" + id + ")\" type=\"button\" class=\"btn btn-sm btn-success\">详情</button>";
                    // tdBody += "<button style=\"margin-right:6px\" onClick=\"modifyDetail(" + id + ")\" type=\"button\" class=\"btn btn-sm btn-warning\">修改</button>";
                    tdBody += "<button onClick=\"addRecordDetail(" + id + ")\" type=\"button\" class=\"btn btn-sm btn-danger\">跟进</button>" + "</td></tr>";
                });
                $("#users_show tbody").append(tdBody);
                $("#naviga").show();
            },
            error: function (result) {
                console.error("Send get request address ：" + this.url + " failed!");
                console.error("Reason: " + result);
                toastr.error(result.statusText);
            }

        });
    }

    function getsubString(val) {
        if (val != null) {
            if (val.length > 10) {
                val = val.substring(0, 10);
            }
        }
        return val;
    }

    function addRecordDetail(val) {

        $("#myModal2").modal({backdrop: 'static', keyboard: false});
        $('#myModal2').draggable();
        clearForm($("#myModal2"));
        queryUserInfoDetail_1(val);
    }

    //刷新
    function refresh_detail() {
        var val = $("#userId_detail").val();
        clearForm($("#myModal"));
        queryUserInfoDetail(val);
        queryDetail(val, _page_records_model, _pageSize_records_model);
    }
    function queryUserInfoDetail_1(val) {
        $.ajax({
            contentType: "application/json;charset=utf-8",
            type: "post",
            data: JSON.stringify(
                [{
                    company: "",
                    userId: val,
                    name: "",
                    phone: "",
                    state: "",
                    business: "",
                    source: "",
                    income_start: "",
                    income_end: "",
                    start_time: "",
                    end_time: "",
                    counselor: "",
                    service_type: "",
                    customer_type: ""
                }, {
                    page: page,
                    pageSize: pageSize
                }]
            ),
            url: "<%=path%>/userPages?page=",
            async: false,
            dataType: "json",
            timeout: 15000,
            success: function (result) {
                console.info("Send get request address：" + this.url + " succeed!");
                console.log(result);
                var json = eval(result);
                var tdBody = "";
                var infos = json.userList;
                if (infos.length <= 0 || infos == null || infos == "undefined") {
                    toastr.warning("客户信息查询失败，请稍候重试！");
                    return;
                }
                $.each(json.userList, function (index, item) {
                    var id = item.id;
                    var company = item.company;
                    var name = item.name;
                    var phone = item.phone;
                    var state = item.state;
                    var business = item.business;
                    var source = item.source;
                    var counselor = item.counselor;
                    var createTime = item.createTime;
                    var income = item.income;
                    var service_type = item.service_type;
                    var customer_type = item.customer_type;
                    $("#userId_detail_fellow").val(id);
                    $("#company_model_detail_fellow").val(company);
                    $("#name_model_detail_fellow").val(name);
                    $("#phone_model_detail_fellow").val(phone);
                    $("#state_model_detail_fellow").val(state);
                    $("#business_model_detail_fellow").val(business);
                    $("#source_model_detail_fellow").val(source);
                    $("#counselor_model_detail_fellow").val(counselor);
                    $("#create_model_detail_fellow").val(createTime);
                    $("#income_model_detail_fellow").val(income);
                    $("#service_type_model_detail_fellow").val(service_type);
                    $("#customer_type_model_detail_fellow").val(customer_type);
                });
            },
            error: function (result) {
                console.error("Send get request address ：" + this.url + " failed!");
                console.error("Reason: " + result);
                toastr.error(result.statusText);
            }

        });
    }

    function showDetail(val) {
        $("#myModal").modal({backdrop: 'static', keyboard: false});
        $('#myModal').draggable();
        clearForm($("#myModal"));
        queryUserInfoDetail(val);
        queryDetail(val, _page_records_model, _pageSize_records_model);
    }

    //详情按钮事件
    function queryUserInfoDetail(val) {
        $.ajax({
            contentType: "application/json;charset=utf-8",
            type: "post",
            data: JSON.stringify(
                [{
                    company: "",
                    userId: val,
                    name: "",
                    phone: "",
                    state: "",
                    business: "",
                    source: "",
                    income_start: "",
                    income_end: "",
                    start_time: "",
                    end_time: "",
                    counselor: "",
                    service_type: "",
                    customer_type: ""
                }, {
                    page: page,
                    pageSize: pageSize
                }]
            ),
            url: "<%=path%>/userPages?page=",
            async: false,
            dataType: "json",
            timeout: 15000,
            success: function (result) {
                console.info("Send get request address：" + this.url + " succeed!");
                console.log(result);
                var json = eval(result);
                var tdBody = "";
                var infos = json.userList;
                if (infos.length <= 0 || infos == null || infos == "undefined") {
                    toastr.warning("客户信息查询失败，请稍候重试！");
                    return;
                }
                $.each(json.userList, function (index, item) {
                    var id = item.id;
                    var company = item.company;
                    var name = item.name;
                    var phone = item.phone;
                    var state = item.state;
                    var business = item.business;
                    var source = item.source;
                    var counselor = item.counselor;
                    var createTime = item.createTime;
                    var income = item.income;
                    var service_type = item.service_type;
                    var customer_type = item.customer_type;
                    $("#userId_detail").val(id);
                    $("#company_model_detail").val(company);
                    $("#name_model_detail").val(name);
                    $("#phone_model_detail").val(phone);
                    $("#state_model_detail").val(state);
                    $("#business_model_detail").val(business);
                    $("#source_model_detail").val(source);
                    $("#counselor_model_detail").val(counselor);
                    $("#create_model_detail").val(createTime);
                    $("#income_model_detail").val(income);
                    $("#service_type_model_detail").val(service_type);
                    $("#customer_type_model_detail").val(customer_type);
                });
            },
            error: function (result) {
                console.error("Send get request address ：" + this.url + " failed!");
                console.error("Reason: " + result);
                toastr.error(result.statusText);
            }

        });
    }

    //记录信息翻页
    function pageUp_detail() {
        if (_currentPage_records_model <= 1) {
            toastr.error("已经是第一页！");
            return;
        }

        queryDetail($("#userId_detail").val(), --_currentPage_records_model, _pageSize_records_model);
    }

    function pageDown_detail() {
        if (_currentPage_records_model >= _totalPage_records_model) {
            toastr.error("已经是最后一页！");
            return;
        }

        queryDetail($("#userId_detail").val(), ++_currentPage_records_model, _pageSize_records_model);
    }

    function queryDetail(val, page, pageSize) {
        clearTable();
        $.ajax({
            url: "<%=path%>/userDetail/" + val + "?page=" + page + "&pageSize=" + pageSize,
            async: false,
            dataType: "json",
            timeout: 15000,
            success: function (result) {
                console.log("Succeed to get userDetail ：");
                console.log(result);
                //更新缓存信息，模态框关闭后需要重置翻页数据，防止下次点击详情出错。
                _totalPage_records_model = result.totalPages_record;//总页数
                _totalElement_records_model = result.totalElements_record;//总记录数
                _currentPage_records_model = result.currentPage_record;//当前页数

                document.getElementById("span_totalPage_model").innerHTML = _totalPage_records_model;
                document.getElementById("indexOfPage_model").innerHTML = _currentPage_records_model;
                document.getElementById("span_totalElement_model").innerHTML = _totalElement_records_model;
                document.getElementById("indexOfTotalPage_model").innerHTML = _totalPage_records_model;
                var recordLists = result.recordLists;
                if (recordLists.length == 0 || recordLists == null || recordLists == "undefined") {
                    toastr.error("没有跟进记录信息");
                    return;
                }
                var tdBody = "";
                $.each(recordLists, function (index, item) {
                    var content = item.content;
                    var create_time = item.date;
                    var giveUp_date = item.giveUpDate;
                    var next_date = item.nextDate;
                    var pay_date = item.payDate;
                    var i = +index + 1;
                    tdBody += "<tr><td>" + i + "</td>";
                    tdBody += "<td>" + removeNull(content) + "</td>";
                    tdBody += "<td>" + removeNull(create_time) + "</td>";
                    tdBody += "<td>" + removeNull(giveUp_date) + "</td>";
                    tdBody += "<td>" + removeNull(next_date) + "</td>";
                    tdBody += "<td>" + removeNull(pay_date) + "</td>";
                });
                $("#follow_detail tbody").append(tdBody);
            },
            error: function (result) {
                console.error("Send get request for userDetail：" + this.url + " Failed!");
                console.error("Reason: " + result);
                toastr.error(result.statusText);
            }

        });
    }

    function modifyDetail(val) {
        alert(val);
    }

    function deleteDetail(val) {
        alert(val);
    }

    function removeNull(val) {
        if (val == null) {
            val = "";
        }
        return val;
    }

    function pageUp() {
        if (currentPage <= 1) {
            toastr.error("已经是第一页！");
            return;
        }

        getUsersInfo(--currentPage, pageSize);
    }

    function pageDown() {
        if (currentPage >= totalPage) {
            toastr.error("已经是最后一页！");
            return;
        }

        getUsersInfo(++currentPage, pageSize);
    }

    function goPage() {
        var jumpPage = document.getElementById("jumpPage").value;
        if (isNaN(jumpPage)) {
            toastr.warning("请输入数字！");
            return;
        } else if (jumpPage.length == 0) {
            toastr.warning("请输入页码！");
            return;
        } else if (jumpPage <= 0 || Number(jumpPage) > Number(totalPage)) {
            toastr.error("非法的页码【" + jumpPage + "】！");
            document.getElementById("jumpPage").value = "";
            return;
        } else {

            getUsersInfo(parseInt(jumpPage), pageSize);
        }
    }

    $(function () {
        $('#datetimepicker1').datetimepicker({
            format: 'yyyy-mm-dd',
            startView: 2,
            autoclose: 1,
            todayBtn: 1,
            todayHighlight: 1,
            minView: 2
        });
        $('#datetimepicker2').datetimepicker({
            format: 'yyyy-mm-dd',
            startView: 2,
            autoclose: 1,
            todayBtn: 1,
            todayHighlight: 1,
            minView: 2,
            useCurrent: false
        });
        $('#datetimepicker3').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:ss',
            timePicker12Hour: false,
            startView: 2,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            timePicker: true,
            minView: 2
        });
        $('#datetimepicker4').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:ss',
            startView: 2,
            autoclose: 1,
            todayBtn: 1,
            todayHighlight: 1,
            minView: 2
        });
        $('#datetimepicker5').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:ss',
            startView: 2,
            autoclose: 1,
            todayBtn: 1,
            todayHighlight: 1,
            minView: 2
        });

        $('#datetimepicker3_fellow').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:ss',
            timePicker12Hour: false,
            startView: 2,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            timePicker: true,
            minView: 2
        });
        $('#datetimepicker4_fellow').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:ss',
            startView: 2,
            autoclose: 1,
            todayBtn: 1,
            todayHighlight: 1,
            minView: 2
        });
        $('#datetimepicker5_fellow').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:ss',
            startView: 2,
            autoclose: 1,
            todayBtn: 1,
            todayHighlight: 1,
            minView: 2
        });
//        //动态设置最小值
//        $('#datetimepicker1').on('dp.change', function (e) {
//            $('#datetimepicker2').data('DateTimePicker').minDate(e.date);
//        });
//        //动态设置最大值
//        $('#datetimepicker2').on('dp.change', function (e) {
//            $('#datetimepicker1').data('DateTimePicker').maxDate(e.date);
//        });


    });


    function search_Users() {
        getUsersInfo(page, pageSize);
    }

    $("#applyCertNum").keydown(function (e) {
        if (e.keyCode == 13) {
            goPage();
        }
    });

    function wordStatic_fellow(input) {
        // 获取要显示已经输入字数文本框对象
        var content = document.getElementById('num_fellow');
        if (content && input) {
            // 获取输入框输入内容长度并更新到界面
            var value = input.value;
            // 将换行符不计算为单词数
            value = value.replace(/\n|\r/gi, "");
            // 更新计数
            content.innerText = value.length;
        }
    }

    function wordStatic(input) {
        // 获取要显示已经输入字数文本框对象
        var content = document.getElementById('num');
        if (content && input) {
            // 获取输入框输入内容长度并更新到界面
            var value = input.value;
            // 将换行符不计算为单词数
            value = value.replace(/\n|\r/gi, "");
            // 更新计数
            content.innerText = value.length;
        }
    }

    //更新客户信息
    function update_userInfo() {
        var id = $("#userId_detail").val();
        var company = $("#company_model_detail").val();
        var name = $("#name_model_detail").val();
        var phone = $("#phone_model_detail").val();
        var state = $("#state_model_detail").val();
        var business = $("#business_model_detail").val();
        var source = $("#source_model_detail").val();
        var counselor = $("#counselor_model_detail").val();
        var createTime = $("#create_model_detail").val();
        var income = $("#income_model_detail").val();
        var service_type = $("#service_type_model_detail").val();
        var customer_type = $("#customer_type_model_detail").val();
        $.ajax({
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({
                id: id,
                company: company,
                name: name,
                phone: phone,
                state: state,
                business: business,
                source: source,
                counselor: counselor,
                createTime: createTime,
                income: income,
                service_type: service_type,
                customer_type: customer_type
            }),
            type: "post",
            dataType: 'json',
            async: false,
            timeout: 15000,
            url: "<%=path%>/updateUserPost",
            success: function (result) {
                toastr.info("更新成功，请刷新查看！");
            },
            error: function (result) {
                toastr.error("更新失败" + result.statusText);
            },
            complete: function (XMLHttpRequest, status) {
                if (status == 'timeout') {
                    toastr.error("请求超时");
                }
            }

        });
    }



</script>
<script type="text/javascript">
    /*第二步，写js代码，超出部分用鼠标悬停时，tooltip显示完整内容*/
    $(document).on('mouseenter', "#follow_detail td", function () {

        if (this.offsetWidth < this.scrollWidth) {
            $(this).attr('data-toggle', 'tooltip').attr('title', $(this).text());
        }
    });
    //鼠标离开时，tooltip消失
    $(document).on('mouseleave', '#follow_detail td', function () {
        $(this).attr('data-toggle', '');
    });
</script>
</body>
</html>
