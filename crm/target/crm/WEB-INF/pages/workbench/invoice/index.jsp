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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="generator" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
    <link href="css/haiersoft.css" rel="stylesheet" type="text/css" media="screen,print" />
    <link href="css/print.css" rel="stylesheet" type="text/css"  media="print" />
    <script src="js/jquery-1.10.1.min.js"></script>
    <script src="js/side.js" type="text/javascript"></script>

    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
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
    <![endif]-->

</head>


<body>

<!-- MainForm -->
<div id="MainForm">
    <script type="text/javascript">
        $(function(){
            $(".select").each(function(){
                var s=$(this);
                var z=parseInt(s.css("z-index"));
                var dt=$(this).children("dt");
                var dd=$(this).children("dd");
                var _show=function(){dd.slideDown(200);dt.addClass("cur");s.css("z-index",z+1);};
                var _hide=function(){dd.slideUp(200);dt.removeClass("cur");s.css("z-index",z);};
                dt.click(function(){dd.is(":hidden")?_show():_hide();});
                dd.find("a").click(function(){dt.html($(this).html());_hide();});
                $("body").click(function(i){ !$(i.target).parents(".select").first().is(s) ? _hide():"";});})
           });
        
        function shuilvchengfa() {
            var temp1=document.getElementById("create_invoicemoney").value;
            var temp2=document.getElementById("create_shuilv").value;
            var result1=parseFloat(temp1)*parseFloat(temp2);
            var result2=parseFloat(temp1)-parseFloat(temp1)*parseFloat(temp2);
            if ((!isNaN(temp1))&&(!isNaN(temp2))){
                document.getElementById("create_shuie").value=result1;
                document.getElementById("create_wushuimoney").value=result2;
            }
        }
    </script>
    <div class="form_boxC" >
        <table cellpadding="0" cellspacing="0">
            <tr><th><strong>开票信息</strong></th></tr>
            <tr>
                <th width="200">财务组织 <span class="f_cB">*</span></th>
                <td><!-- selectbox -->
                    <div class="selectbox" style="width:400px">
                        <select class="select" id="create_invoice_organization" style="width: 400px;height:36px">
                            <option value="  山西财智会计师事务所（普通合伙）">  山西财智会计师事务所（普通合伙）</option>
                            <option value="  华审国际山西会计事务所（特殊普通合伙）">  华审国际山西会计事务所（特殊普通合伙）</option>
                        </select>
                    </div>
                    <!-- /selectbox --></td>

            </tr>
            <tr>
                <th>发票类型</th>
                <td><div class="selectbox" style="width:320px">
                    <select class="select" id="create_invoice_type" style="width: 320px;height:36px">
                        <option value="增值税专用发票">增值税专用发票</option>
                        <option value="增值税电子专用发票">增值税电子专用发票</option>
                        <option value="增值税普通发票">增值税普通发票</option>
                        <option value="增值税电子普通发票">增值税电子普通发票</option>
                        <option value="增值税普通发票（卷式）">增值税普通发票（卷式）</option>
                        <option value="电子发票（增值税专用发票）">电子发票（增值税专用发票）</option>
                        <option value="电子发票（普通发票）">电子发票（普通发票）</option>
                        <option value="货运运输业增值税专用发票">货运运输业增值税专用发票</option>
                        <option value="机动车销售统一发票">机动车销售统一发票</option>
                        <option value="捐赠票据">捐赠票据</option>
                        <option value="其他发票">其他发票</option>
                    </select>

                </div></td>
                <th>报告名称</th>
                <td><div class="txtbox floatL"><input id="create_baogaoname" type="text" size="40"></div></td>
            </tr>
            <tr>
                <th>单据日期</th>
                <td>
                    <div class="txtbox floatL" >
                            <input type="date" id="create_danjuriqi" size="15" onchange="showdanjutDate()">
                        </div>
                    </td>

                <th>审批人</th>
                <td>
                    <div class="selectbox" style="width:200px">
                        <select class="select" id="create_shenpiren" style="width: 200px;height:36px">
                            <c:forEach items="${userList}" var="u">
                                <option value="${u.id}">${u.name}</option>
                            </c:forEach>
                        </select>
                    </div></td>

            </tr>
<%--            //单据编码需要写成自增--%>
            <tr>
                <th>单据编码</th>
                <td>
                    <div class="txtbox floatL" >
                        <input type="text" id="create_djbianma" readonly="true" size="20" onblur="generateDateTimeNumber();" >
                    </div>
                </td>
                <th>合同名称</th>
                <td><div class="txtbox floatL"><input id="create_contractname" type="text" size="40"></div></td>
            </tr>

            <tr>
<%--                <th>项目名称</th>--%>
<%--                <td><!-- selectbox -->--%>
<%--                    <div class="selectbox" style="width:400px;">--%>
<%--                        <select class="select" id="create_name" style="width: 200px;height:36px">--%>
<%--                            <option value="未签合同">未签合同</option>--%>
<%--                            <option value="已签合同">已签合同</option>--%>
<%--                            <option value="正签合同">正签合同</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <!-- /selectbox --></td>--%>
                    <th>业务人员</th>
                <td>
                    <div class="selectbox" style="width: 200px">
                            <select class="select" id="create_owner" style="width: 200px;height:36px">
                                <c:forEach items="${userList}" var="u">
                                    <option value="${u.id}">${u.name}</option>
                                </c:forEach>
                            </select>
                    </div></td>
            </tr>
            <tr>
                        <th>合同单据号</th>
                        <td><!-- selectbox -->
                            <div class="txtbox floatL" >
                                <input type="text" id="create_contractID" size="20" >
                            </div>
                            <!-- /selectbox --></td>

                <th>申请部门</th>
                <td>
                    <div class="selectbox" style="width:200px">
                        <select class="select" id="create_sqbumen" style="width: 200px;height:36px">
                            <option value="业务部一">业务部一</option>
                            <option value="业务部二">业务部二</option>
                            <option value="综合部">综合部</option>
                            <option value="质量控制部">质量控制部</option>
                        </select>
                    </div></td>
            </tr>
            <tr>
                <th>客户名称</th>
                <td><div class="txtbox floatL"><input id="create_custom" type="text" size="50"></div></td>
                <th>预计开票日</th>
                <td><!-- selectbox -->
                    <div class="txtbox floatL" >
                        <input type="date" id="create_start_date" size="20" onchange="showstartDate()" >
                    </div>
                    <!-- /selectbox --></td>
            </tr>
            <tr>
                <th>预计收款日</th>
                <td><div class="txtbox floatL"><input id="create_end_date" type="date" size="20" onchange="showendtDate()"></div></td>
                <th>企业税号</th>
                <td><div class="txtbox floatL"><input id="create_qyshuihao" type="text" size="30"></div></td>
            </tr>
            <tr>
                <th>开户行</th>
                <td><div class="txtbox floatL"><input id="create_kaihuhang" type="text" size="30"></div></td>
                <th>开户行账号</th>
                <td><div class="txtbox floatL"><input id="create_kaihuID" type="text" size="30"></div></td>
            </tr>

            <tr>
                <th>地址</th>
                <td><div class="txtbox floatL"><input id="create_adress" type="text" size="30"></div></td>
                <th>电话</th>
                <td><div class="txtbox floatL"><input id="create_phone" type="text" size="30"></div></td>
            </tr>


            <tr>
                <th>开票内容</th>
                <td><div class="txtbox floatL"><input id="create_context" type="text" size="55"></div></td>

            </tr>

            <tr><th><strong>开票申请明细</strong></th></tr>
            <tr>
                <th width="200">项目名称 <span class="f_cB">*</span></th>
                <td><!-- selectbox -->
                    <div class="selectbox" style="width:400px">
                        <select class="select" id="create_name" style="width: 400px;height:36px">
                            <c:forEach items="${activityList}" var="a">
                                <option value="${a.id}">${a.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <!-- /selectbox --></td>
                <th>收入</th>
                <td><div class="txtbox floatL"><input id="create_earn" type="text" size="30"></div></td>
            </tr>
    </div>
</div>

<table>
    <tr>
        <td>申请开票金额<div class="txtbox floatL"><input id="create_invoicemoney" name="create_invoicemoney" type="text" size="30" onblur="shuilvchengfa();"></div></td>
        <td>税率<div class="txtbox floatL"><input id="create_shuilv" name="create_shuilv" type="text" size="30" onblur="shuilvchengfa();"></div></td>
        <td>税额<div class="txtbox floatL"><input id="create_shuie" type="text" size="30"></div></td>
        <td>无税金额<div class="txtbox floatL"><input id="create_wushuimoney" type="text" size="30" ></div></td>
    </tr>
</table>

<!-- /MainForm -->
<table>
    <title>添加附件</title>
    <script>
        function uploadFile() {
            var input = document.getElementById('fileInput');
            var file = input.files[0];

            // 检查文件类型
            var allowedTypes = ['application/pdf', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.openxmlformats-officedocument.wordprocessingml.template', 'image/png', 'image/jpeg'];
            if (!allowedTypes.includes(file.type)) {
                alert('请选择PDF、Word文档、DOCX、DOC、图片文件！');
                return;
            }

            // 创建FormData对象
            var formData = new FormData();
            formData.append('file', file);

            // 发送文件到服务器
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '/upload', true); // 替换为你的上传接口地址
            xhr.send(formData);
        }


        //添加日期组件
        // 获取输入元素
        function showdanjutDate() {
            var dateInput = document.getElementById("create_danjuriqi");
        }
        function showstartDate() {
            var dateInput = document.getElementById("create_start_date");
        }
        function showendtDate() {
            var dateInput = document.getElementById("create_end_date");
        }

        //实现单据编码的实时获取
        function generateDateTimeNumber() {
            var today = new Date();
            var year = today.getFullYear();
            var month = String(today.getMonth() + 1).padStart(2, '0'); // 格式化为两位数
            var day = String(today.getDate()).padStart(2, '0'); // 格式化为两位数
            var hours = String(today.getHours()).padStart(2, '0'); // 格式化为两位数
            var minutes = String(today.getMinutes()).padStart(2, '0'); // 格式化为两位数
            var dateTimeNumber = year + month + day + hours + minutes; // 连接成一个纯数字字符串
            document.getElementById("create_djbianma").value = dateTimeNumber; // 将生成的日期和时间编号设置为输入文本框的值
        }

    //为保存按钮提供控件
        $(function () {

            //给"保存"按钮添加单击事件
            $("#Savecreateinovice").click(function () {
                //收集参数
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
                //表单验证
                if (owner==""){
                    alert("所有者不能为空");
                    return;
                }
                if (name==""){
                    alert("名称不能为空");
                    return;
                }
                if (startDate!=""&&endDate!=""){
                    //验证开始日期和结束日期
                    if (startDate>endDate){
                        alert("结束日期不能比开始日期小");
                        return;
                    }
                }


                //发送请求
                $.ajax({
                    url:'workbench/invoice/saveCreateinvoice.do',
                    data:{
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
                        if (data.code=="1"){
                            // //关闭模态窗口
                            // $("#createActivityModal").modal("hide");
                            // //刷新市场活动列表
                            // //alert("创建工程，局部刷新市场活动列表");
                            // queryActivityForPageByCondition(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
                            alert("保存成功");
                        }else{
                            //提示信息
                            alert(data.message);
                            // //模态窗口不关闭
                            // $("#createActivityModal").modal("show");//只要去掉了data-dismiss属性，此行代码可以不写，但是建议写上。
                        }
                    }
                });
            });

        });
    </script>
    <h1>添加附件</h1>
    <input type="file" id="fileInput" accept=".pdf, .doc, .docx, .png, .jpg">
    <button onclick="uploadFile()">上传文件</button>
    <div class="btn_box floatR mag_l20"><input name="" id="Savecreateinovice" type="button" value="保存" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'"></div>
</table>
</body>
</html>