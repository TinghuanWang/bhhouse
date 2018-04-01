<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<div style="padding: 3px;">
    <form id="houseImgForm" method="post" enctype="multipart/form-data">
        <input type="hidden" name="lpId" value="${lpId}">
        <table class="grid">
            <tr>
                <td rowspan="3">上传图片</td>
                <td style="width: 30%">上传图片</td>
                <td style="width: 60%">
                    <input style="width:250px;" name="file" class="easyui-filebox" data-options="required:true">
                </td>
            </tr>
            <tr>
                <td>图片类型</td>
                <td>
                    <select name="imgType" class="easyui-combobox" data-options="width:250,height:29,editable:false,panelHeight:'auto'">
                        <option value="0">首页轮转图片</option>
                        <option value="1">热门推荐图片</option>
                        <option value="2">列表图片</option>
                        <option value="3">详情图片</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>图片描述</td>
                <td>
                    <textarea name="imgInfo" id="" cols="80" rows="5" class="easyui-validatebox" data-options="required:true"></textarea>
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
    $(function() {
        $('#houseImgForm').form({
            url : '${path }/image/save',
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
                }else{
                    parent.$.messager.alert('提示', result.msg, 'warning');
                    parent.$.modalDialog.handler.dialog('close');
                }
            },error:function(){
                parent.$.modalDialog.handler.dialog('close');
            }
        });

    });
</script>