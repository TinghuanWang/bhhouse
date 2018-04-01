<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var phoneDataGrid;
    $(function() {
        phoneDataGrid = $('#phoneDataGrid').datagrid({
            url : '${path }/phone/dataGrid',
            striped : true,
            idField : 'id',
            sortName:'sysTime',
            pagination : true,
            sortOrder : 'asc',
            singleSelect:true,
            pageSize : 10,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            nowrap:false,
            fit : true,
            fitColumns : false,
            border : false,
            columns : [ [ {
                field : 'index',
                title : '编号',
                width : 40,
                formatter:function(v,r,index){
                    return index+1;
                }
            },{
                field : 'phone',
                title : '联系方式',
                width : 180
            },{
                width : '180',
                title : '留言',
                field : 'message'
            }, {
                field : 'sysTime',
                title : '留言时间',
                width : 180
            },{
                field : 'action',
                title : '操作',
                width : 160,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/phone/delete">
                            str += $.formatString('<a href="javascript:void(0)" class="phone-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deletephoneFun(\'{0}\');" >删除</a>', row.id);
                        </shiro:hasPermission>
                    return str;
                }
            } ] ],
            onLoadSuccess:function(data){
                $('.phone-easyui-linkbutton-del').linkbutton({text:'删除'});
            }
        });
    });
    
    function deletephoneFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = phoneDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            phoneDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }

        parent.$.messager.confirm('询问', '您是否要删除当前资源？', function(b) {
            if (b) {
                progressLoad();
                $.post('${path }/phone/delete', {
                    id : id
                }, function(result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        phoneDataGrid.datagrid('reload');
                    }else{
                        parent.$.messager.alert('提示', result.msg, 'info');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false,title:'楼盘列表'"  style="overflow: hidden;">
        <table id="phoneDataGrid"></table>
    </div>
</div>