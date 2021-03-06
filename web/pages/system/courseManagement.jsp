<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="../common/lib.jsp" %>
</head>

<body>
<%@include file="../common/index.jsp" %>
<div id="view-content">
    <%@include file="../common/sidebar.jsp" %>

    <div id="view-content-main">

        <div class="container-fluid">
            <div class="row rowtop">
                <div class="col-md-12">
                    <div class="console-title console-title-border clearfix">
                        <div class="fl">
                            <h5>课程管理</h5>
                        </div>

                        <div class="fr">
                            <button class="btn btn-warning" id="couadd_mod" style="margin-right: 20px;">新增/修改课程信息
                            </button>
                            <button class="btn btn-success" id="add">新增</button>
                            <button class="btn btn-primary" id="edit" disabled>修改</button>
                            <button class="btn btn-danger" id="delete" disabled>删除</button>
                        </div>
                    </div>
                    <div class="alert alert-success margin-top">
                        <a href="#" class="close" data-dismiss="alert"><span class="fa fa-close"></span></a>
                        <strong>提示！</strong>课程信息展示，请选中一条记录进行修改/删除操作.<br/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12" id="dataTable-panel">
                    <%--表格区--%>
                    <div id="dataTable"></div>
                </div>
            </div>
        </div>

    </div>
</div>

<%--添加/修改课程信息--%>
<div class="modal fade" data-backdrop="static" id="createWin">
    <div class="modal-dialog" style="width: auto;max-width: 500px;min-width: 350px;">
        <div class="modal-content">
            <div class="modal-header">

                <span type="button" class="close fa fa-close" data-dismiss="modal" aria-hidden="true"
                      style="float: right; "></span>

                <%--弹出框的标题--%>
                <h5 class="modal-title" id="win_title"></h5>
            </div>
            <div class="modal-body clearfix" style="height: 240px; overflow: auto; width: 100%;">
                <table class="form" width="100%" id="info_form">
                    <tr>
                        <td class='text-right'>课程:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div id="course"></div>
                        </td>
                    </tr>
                    <tr style="height: 10px;"></tr>
                    <tr>
                        <td class='text-right'>学分:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div id="couCredit"></div>
                        </td>
                    </tr>
                    <tr style="height: 10px;"></tr>
                    <tr>
                        <td class='text-right'>学时:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div id="couPeriod"></div>
                        </td>
                    </tr>
                    <tr style="height: 10px;"></tr>
                    <tr>
                        <td class='text-right'>选课人数:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div id="couCounts"></div>
                        </td>
                    </tr>
                    <tr style="height: 10px;"></tr>
                    <tr>
                        <td class='text-right'>授课教师:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div id="couTea"></div>
                        </td>
                    </tr>
                    <tr style="height: 10px;"></tr>
                    <tr>
                        <td class='text-right'>上课班级:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div id="couClz"></div>
                        </td>
                    </tr>
                    <tr style="height: 10px;"></tr>
                    <tr>
                        <td class='text-right'>课程学期:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div id="couTerm"></div>
                        </td>
                    </tr>
                    <tr style="height: 10px;"></tr>
                    <tr>
                        <td class='text-right'>上课时间地点:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <textarea id="timePlace"></textarea>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="modal-footer">
                <a class="btn btn-primary" id="submit">提交</a>
                <a class="btn btn-default" data-dismiss="modal">取消</a>
            </div>
        </div>
    </div>
</div>

<%--课程信息展板--%>
<div id="window">
    <div id="windowHeader">
        <span><i class="fa fa-file" style="margin-right: 5px;"></i>课程信息管理</span>
    </div>
    <div id="windowContent">
        <div id="grid"></div>
    </div>
</div>

<div id="addWindow">
    <div>
        <span id="optTitle"></span>
    </div>
    <div style="padding-left: 28px;">
        <div>
            <table width="100%">
                <tr>
                    <td class="">课程号：</td>
                    <td class="">
                        <input id="course_no">
                    </td>
                </tr>
                <tr style="display: none; " id="add_tips">
                    <td colspan="2" style="padding-top: 10px;">
                        <strong>Tips:</strong>
                        <span style="color: red;">
                            要修改课程号请删除重建！
                        </span>
                    </td>
                    <td></td>
                </tr>
                <tr style="height: 10px;"></tr>
                <tr>
                    <td class="">课程名：</td>
                    <td class="">
                        <input id="course_name">
                    </td>
                </tr>
                <tr style="height: 10px;"></tr>
                <tr>
                    <td class="">开课单位：</td>
                    <td class="">
                        <%--默认为信工院--%>
                        <input id="course_unit" value="信息工程学院">
                    </td>
                </tr>
            </table>
        </div>
        <div class="add_footer" style="margin-top: 120px; margin-left: 48px;">
            <a class="btn btn-primary" id="optCou">提交</a>
            <a class="btn btn-default" style="margin-left: 30px;" id="cancel">取消</a>
        </div>
    </div>
</div>


<script src="${ctx}/js/system/courseManagement.js"></script>

</body>
</html>
