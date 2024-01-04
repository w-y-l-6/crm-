<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //	设置一个动态变量，无论其协议+ip+端口号+应用名字怎么改 改成什么都可动态获取
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">

<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="jquery/bs_pagination-master/css/jquery.bs_pagination.min.css">
<script type="text/javascript" src="jquery/bs_pagination-master/js/jquery.bs_pagination.min.js"></script>
<script type="text/javascript" src="jquery/bs_pagination-master/localization/en.js"></script>
<script type="text/javascript">
    $(function() {

            queryInvoiceForPageByCondition(1,10);


        //当页面加载完成之后，显示所有数据的第一页，默认每页显示10条
        // queryActivityForPageByCondition(1, 10);
    //     var pageNo=1;
    //     var pageSize=10;
    //     var owner=$("#create_owner").val();
    //     var organization=$.trim($("#create_invoice_organization").val());
    //     var danjuriqi=$("#create_danjuriqi").val();
    //     var shenpiren=$("#create_shenpiren").val();
    //     var djbianma=$.trim($("#create_djbianma").val());
    //     var sqbumen=$.trim($("#create_sqbumen").val());
    //     var contractname=$.trim($("#create_contractname").val());
    //     var invoicetype=$.trim($("#create_invoice_type").val());
    //     var name=$.trim($("#create_name").val());
    //     var custom=$.trim($("#create_custom").val());
    //     var start_date=$.trim($("#create_start_date").val());
    //     var end_date=$.trim($("#create_end_date").val());
    //     var kaihuhang=$.trim($("#create_kaihuhang").val());
    //     var kaihuID=$.trim($("#create_kaihuID").val());
    //     var qyshuihao=$.trim($("#create_qyshuihao").val());
    //     var adress=$.trim($("#create_adress").val());
    //     var phone=$.trim($("#create_phone").val());
    //     var context=$.trim($("#create_context").val());
    //     var baogaoname=$.trim($("#create_baogaoname").val());
    //     var earn=$.trim($("#create_earn").val());
    //     var invoicemoney=$.trim($("#create_invoicemoney").val());
    //     var shuilv=$.trim($("#create_shuilv").val());
    //     var shuie=$.trim($("#create_shuie").val());
    //     var wushuimoney=$.trim($("#create_wushuimoney").val());
    //     //发送请求
    //     $.ajax({
    //         url:'workbench/invoice/queryInvoiceForPageByCondition.do',
    //         data:{
    //             pageNo:pageNo,
    //             pageSize:pageSize,
    //             organization:organization,
    //             danjuriqi:danjuriqi,
    //             owner:owner,
    //             shenpiren:shenpiren,
    //             djbianma:djbianma,
    //             sqbumen:sqbumen,
    //             contractname:contractname,
    //             invoicetype:invoicetype,
    //             name:name,
    //             custom:custom,
    //             start_date:start_date,
    //             end_date:end_date,
    //             kaihuhang:kaihuhang,
    //             kaihuID:kaihuID,
    //             qyshuihao:qyshuihao,
    //             adress:adress,
    //             phone:phone,
    //             context:context,
    //             baogaoname:baogaoname,
    //             earn:earn,
    //             invoicemoney:invoicemoney,
    //             shuilv:shuilv,
    //             shuie:shuie,
    //             wushuimoney:wushuimoney
    //         },
    //         type:'post',
    //         dataType:'json',
    //         success:function (data) {
    //             //显示总条数。功能由pagination插件替代
    //             //$("#totalRowsB").text(data.totalRows);
    //             //遍历data.acitivtyList,显示数据列表
    //             var htmlStr = "";
    //             $.each(data.invoiceList, function (index, obj) {
    //                 // htmlStr+="<td>"+obj.description+"</td>";
    //                 htmlStr += "<tr class=\"active\">";
    //                 htmlStr += "<td><input type=\"checkbox\"  value=\"" + obj.id + "\"/></td>";
    //                 htmlStr += "<td><a style=\"text-decoration: none; cursor: pointer;\" onclick=\"window.location.href='workbench/activity/detailActivity.do?id=" + obj.id + "'\">" + obj.contractname + "</a></td>";
    //                 htmlStr += "<td>" + obj.organization + "</td>";
    //                 htmlStr += "<td>" + obj.danjuriqi + "</td>";
    //                 htmlStr += "<td>" + obj.owner + "</td>";
    //                 htmlStr += "<td>" + obj.shenpiren + "</td>";
    //                 htmlStr += "<td>" + obj.djbianma + "</td>";
    //                 htmlStr += "<td>" + obj.sqbumen + "</td>";
    //                 htmlStr += "<td>" + obj.contractname + "</td>";
    //                 htmlStr += "<td>" + obj.invoicetype + "</td>";
    //                 htmlStr += "<td>" + obj.name + "</td>";
    //                 htmlStr += "<td>" + obj.custom + "</td>";
    //                 htmlStr += "<td>" + obj.start_date + "</td>";
    //                 htmlStr += "<td>" + obj.end_date + "</td>";
    //                 htmlStr += "<td>" + obj.kaihuhang + "</td>";
    //                 htmlStr += "<td>" + obj.kaihuID + "</td>";
    //                 htmlStr += "<td>" + obj.qyshuihao + "</td>";
    //                 htmlStr += "<td>" + obj.adress + "</td>";
    //                 htmlStr += "<td>" + obj.phone + "</td>";
    //                 htmlStr += "<td>" + obj.context + "</td>";
    //                 htmlStr += "<td>" + obj.baogaoname + "</td>";
    //                 htmlStr += "<td>" + obj.earn + "</td>";
    //                 htmlStr += "<td>" + obj.invoicemoney + "</td>";
    //                 htmlStr += "<td>" + obj.shuilv + "</td>";
    //                 htmlStr += "<td>" + obj.shuie + "</td>";
    //                 htmlStr += "<td>" + obj.wushuimoney + "</td>";
    //                 htmlStr += "</tr>";
    //             });
    //
    //             //把htmlStr显示在tbody
    //             $("#tBody1").html(htmlStr);
    //
    //
    //         }
    // });
    });


    function queryInvoiceForPageByCondition(pageNo,pageSize) {
        //收集参数
        // var pageNo=1;
        // var pageSize=10;
        var owner=$("#create_owner").val();
        var organization=$.trim($("#create_invoice_organization").val());
        var danjuriqi=$("#create_danjuriqi").val();
        var shenpiren=$("#create_shenpiren").val();
        var djbianma=$.trim($("#create_djbianma").val());
        var sqbumen=$.trim($("#create_sqbumen").val());
        var contractname=$.trim($("#create_contractname").val());
        var invoicetype=$.trim($("#create_invoice_type").val());
        var name=$.trim($("#create_name").val());
        var custom=$.trim($("#create_custom").val());
        var startDate=$.trim($("#create_start_date").val());
        var endDate=$.trim($("#create_end_date").val());
        var kaihuhang=$.trim($("#create_kaihuhang").val());
        var kaihuid=$.trim($("#create_kaihuID").val());
        var qyshuihao=$.trim($("#create_qyshuihao").val());
        var adress=$.trim($("#create_adress").val());
        var phone=$.trim($("#create_phone").val());
        var context=$.trim($("#create_context").val());
        var baogaoname=$.trim($("#create_baogaoname").val());
        var earn=$.trim($("#create_earn").val());
        var invoicemoney=$.trim($("#create_invoicemoney").val());
        var shuilv=$.trim($("#create_shuilv").val());
        var shuie=$.trim($("#create_shuie").val());
        var wushuimoney=$.trim($("#create_wushuimoney").val());
        //发送请求
        $.ajax({
            url:'workbench/invoice/queryInvoiceForPageByCondition.do',
            data:{
                pageNo:pageNo,
                pageSize:pageSize,
                organization:organization,
                danjuriqi:danjuriqi,
                owner:owner,
                shenpiren:shenpiren,
                djbianma:djbianma,
                sqbumen:sqbumen,
                contractname:contractname,
                invoicetype:invoicetype,
                name:name,
                custom:custom,
                startDate:startDate,
                endDate:endDate,
                kaihuhang:kaihuhang,
                kaihuid:kaihuid,
                qyshuihao:qyshuihao,
                adress:adress,
                phone:phone,
                context:context,
                baogaoname:baogaoname,
                earn:earn,
                invoicemoney:invoicemoney,
                shuilv:shuilv,
                shuie:shuie,
                wushuimoney:wushuimoney
            },
            type:'post',
            dataType:'json',
            success:function (data) {
                //显示总条数。功能由pagination插件替代
                //$("#totalRowsB").text(data.totalRows);
                //遍历data.acitivtyList,显示数据列表
                var htmlStr="";
                $.each(data.invoiceList,function (index,obj) {

                    //投射到前端的标签为5个，点击详细才能查看详情
                    // htmlStr+="<td>"+obj.description+"</td>";
                    htmlStr+="<tr class=\"active\">";
                    htmlStr+="<td><input type=\"checkbox\"  value=\""+obj.id+"\"/></td>";
                    htmlStr+="<td><a style=\"text-decoration: none; cursor: pointer;\" onclick=\"window.location.href='workbench/activity/detailActivity.do?id="+obj.id+"'\">"+obj.name+"</a></td>";
                    htmlStr+="<td>"+obj.organization+"</td>";
                    // htmlStr+="<td>"+obj.danjuriqi+"</td>";
                    htmlStr+="<td>"+obj.owner+"</td>";
                    // htmlStr+="<td>"+obj.shenpiren+"</td>";
                    htmlStr+="<td>"+obj.djbianma+"</td>";
                    // htmlStr+="<td>"+obj.sqbumen+"</td>";
                    htmlStr+="<td>"+obj.contractname+"</td>";
                    htmlStr+="<td>"+obj.invoicetype+"</td>";
                    htmlStr+="<td>"+obj.name+"</td>";
                    htmlStr+="<td>"+obj.custom+"</td>";
                    htmlStr+="<td>"+obj.startDate+"</td>";
                    htmlStr+="<td>"+obj.endDate+"</td>";
                    // htmlStr+="<td>"+obj.kaihuhang+"</td>";
                    // htmlStr+="<td>"+obj.kaihuid+"</td>";
                    // htmlStr+="<td>"+obj.qyshuihao+"</td>";
                    // htmlStr+="<td>"+obj.adress+"</td>";
                    // htmlStr+="<td>"+obj.phone+"</td>";
                    // htmlStr+="<td>"+obj.context+"</t d>";
                    // htmlStr+="<td>"+obj.baogaoname+"</td>";
                    htmlStr+="<td>"+obj.earn+"</td>";
                    // htmlStr+="<td>"+obj.invoicemoney+"</td>";
                    // htmlStr+="<td>"+obj.shuilv+"</td>";
                    // htmlStr+="<td>"+obj.shuie+"</td>";
                    htmlStr+="<td>"+obj.wushuimoney+"</td>";
                    htmlStr+="</tr>";
                });
                //把htmlStr显示在tbody
                $("#tBody1").html(htmlStr);

                //计算总页数
                var totalPages=1;
                if (data.totalRows%pageSize==0){
                    totalPages=data.totalRows/pageSize;
                }else{
                    totalPages=parseInt(data.totalRows/pageSize)+1;
                }

                //显示翻页信息
                $("#demo_pag1").bs_pagination({
                    currentPage:pageNo,//当前页

                    rowsPerPage:pageSize,//每页显示条数
                    totalRows:data.totalRows,//总条数
                    totalPages: totalPages,//总页数


                    visiblePageLinks:5,//显示的翻页卡片数


                    showGoToPage:true,//是否显示"跳转到第几页"
                    showRowsPerPage:true,//是否显示"每页显示条数"
                    showRowsInfo:true,//是否显示"记录的信息"

                    //每次切换页号都会自动触发此函数，函数能够返回切换之后的页号和每页显示条数
                    onChangePage: function(e,pageObj) { // returns page_num and rows_per_page after a link has clicked
                        //alert(pageObj.currentPage);
                        //alert(pageObj.rowsPerPage);
                        queryInvoiceForPageByCondition(pageObj.currentPage,pageObj.rowsPerPage);
                    }
                });
            }
        });
    }
</script>
</head>
<body>
<div style="position: relative;top: 10px;">
    <table class="table table-hover">
        <thead>
        <tr style="color: #B3B3B3;">
            <td><input type="checkbox" id="chked_all"/></td>
            <td>项目名称</td>
            <td>负责人</td>
            <td>开始日期</td>
            <td>结束日期</td>
            <%--					<td>参与人员</td>--%>
            <td>合同状态</td>
            <td>开票状态</td>
            <td>业务性质</td>
            <td>审计业务类型</td>
            <td>审计年度</td>
        </tr>
        </thead>
        <tbody id="tBody1">
        </tbody>
    </table>
    <!--创建容器-->
    <div id="demo_pag1"></div>
</div>
<div>
    <button id="queryinvoice" type="button" class="btn btn-primary">查询</button>
</div>

</body>
</html>

