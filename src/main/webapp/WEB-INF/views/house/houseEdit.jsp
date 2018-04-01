<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<div style="padding: 3px;">
    <form id="houseEditForm" method="post">
        <input type="hidden" name="id" value="${house.id}">
        <table class="grid">
            <tr>
                <td>楼盘名称</td>
                <td>
                    <input style="width:250px;" name="lpName" type="text" placeholder="请输入楼盘名称" class="easyui-validatebox" data-options="required:true" value="${house.lpName}">
                </td>
                <td>楼盘类型</td>
                <td>
                    <input style="width:150px;" data-options="required:true" class="easyui-combobox" id="lpType1" name="lpType"
                           url="${path }/dict/getDictsByClass?vcClass=lp_type"
                           valueField="id"
                           textField="dictName"
                           editable="false"/>
                </td>
            </tr>
            <tr>
                <td>楼盘区域</td>
                <td>
                    <input style="width:250px;" data-options="required:true" class="easyui-combobox" id="lparea1" name="lparea"
                           url="${path }/dict/getDictsByClass?vcClass=lp_area"
                           valueField="id"
                           textField="dictName"
                           editable="false"/>
                </td>
                <td>楼盘价格</td>
                <td>
                    <input style="width:150px;" name="lpPrice" type="text" placeholder="请输入楼盘价格" class="easyui-numberbox" data-options="required:true" value="${house.lpPrice}">
                </td>
            </tr>
            <tr>
                <td>销售状态</td>
                <td>
                    <input style="width:250px;" data-options="required:true" class="easyui-combobox" id="payState" name="payState"
                           url="${path }/dict/getDictsByClass?vcClass=xs_state"
                           valueField="id"
                           textField="dictName"
                           editable="false"/>
                </td>
                <td>浏览次数</td>
                <td>
                    <input style="width:150px;" name="looktimes" type="text" placeholder="请输入浏览次数" class="easyui-numberbox" data-options="required:true" value="${house.looktimes}">
                </td>
            </tr>
            <tr>
                <td>楼盘基础信息</td>
                <td colspan="3">
                    <textarea name="lpInfo" placeholder="请输入楼盘基础信息" id="" cols="83" rows="15" class="easyui-validatebox" data-options="required:true">${house.lpInfo}</textarea>
                </td>
            </tr>
            <tr>
                <td>开盘日期</td>
                <td>
                    <input style="width: 250px;" id="kptime"  name="kptime" placeholder="点击选择开盘日期" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                </td>
                <td>楼盘地址</td>
                <td>
                    <input style="width:150px;" name="lpDizhi" type="text" placeholder="请输入楼盘地址" class="easyui-validatebox" data-options="required:true" value="${house.lpDizhi}">
                </td>
            </tr>
            <tr>
                <td>交房日期</td>
                <td>
                    <input style="width: 250px;" name="jftime" id="jftime" placeholder="点击选择交房时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                </td>
                <td>咨询人员</td>
                <td>
                    <input style="width:150px;" name="zxUser" type="text" placeholder="请输入咨询人员" class="easyui-validatebox" data-options="required:true" value="${house.zxUser}">
                </td>
            </tr>
            <tr>
                <td>咨询人联系方式</td>
                <td>
                    <input style="width:250px;" name="zxPhone" type="text" placeholder="请输入咨询人联系方式" class="easyui-validatebox" data-options="required:true" value="${house.zxPhone}">
                </td>
                <td>是否是热门</td>
                <td>
                    <select style="width: 150px;" id="isHot" name="isHot" class="easyui-combobox" data-options="width:300,height:29,editable:false,panelHeight:'auto'">
                        <option value="0">不热门</option>
                        <option value="1" >热门</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>是否推荐</td>
                <td colspan="3">
                    <select name="isTuijian" id="isTuijian" class="easyui-combobox" data-options="width:450,height:29,editable:false,panelHeight:'auto'">
                        <option value="0">不推荐</option>
                        <option value="1" >推荐</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>户型介绍</td>
                <td>
                    <input style="width:250px;" name="huxing" type="text" placeholder="请输入户型介绍" class="easyui-validatebox" data-options="required:true" value="${house.huxing}">
                </td>
                <td>排序</td>
                <td>
                    <input style="width:150px;" name="seq" type="text" placeholder="请输入排序" class="easyui-numberbox" data-options="required:true" value="${house.seq}">
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
    $(function() {
        $('#lpType1').combobox({
            onLoadSuccess: function () {
                $(this).combobox('select', '${house.lpType}');
            }
        });

        $('#lparea1').combobox({
            onLoadSuccess: function () {
                $(this).combobox('select', '${house.lparea}');
            }
        });

        $('#isTuijian').combobox({
            onLoadSuccess:function(){
                $('#isTuijian').combobox('setValue','${house.isTuijian}');
            }
        });

        $('#payState').combobox({
            onLoadSuccess:function(){
                $('#payState').combobox('setValue','${house.payState}');
            }
        });

        $('#isHot').combobox({
            onLoadSuccess:function(){
                $('#isHot').combobox('setValue','${house.isHot}');
            }
        });

        $('#houseEditForm').form({
            url : '${path }/house/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_treeGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为organization.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                }
            }
        });

    });
</script>