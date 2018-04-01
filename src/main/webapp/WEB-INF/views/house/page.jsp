<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var houseTreeGrid;
    $(function() {
        alert(1);
        houseTreeGrid = $('#houseTreeGrid').datagrid({
            url : '${path }/house/dataGrid',
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
                field : 'lpName',
                title : '楼盘名称',
                width : 180
            },{
                width : '80',
                title : '楼盘类型',
                field : 'lpType'
            }, {
                field : 'lparea',
                title : '楼盘区域',
                width : 120
            },{
                    field : 'lpInfo',
                    title : '楼盘介绍',
                    width : 250
            },{
                field : 'lpPrice',
                title : '楼盘价格',
                width : 80
            },{
                field : 'huxing',
                title : '户型',
                width : 80
            },{
                field : 'isHot',
                title : '是否热门',
                width : 80,
                formatter:function(value,row,index){
                    if(value == 1){
                        return "<span style='color:green'><u>热门</u></span>";
                    }else{
                        return "<span style='color:red'>不热门</span>";
                    }
                }
            },{
                field : 'isTuijian',
                title : '是否推荐',
                width : 80,
                formatter:function(value,row,index){
                    if(value == 1){
                        return "<span style='color:green'><u>推荐</u></span>";
                    }else{
                        return "<span style='color:red'>不推荐</span>";
                    }
                }
            },{
                field : 'sysTime',
                title : '录入时间',
                width : 80
            },{
                field : 'action',
                title : '操作',
                width : 160,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/house/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="house-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="edithouseFun(\'{0}\');" >编辑</a>', row.id);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/house/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="house-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deletehouseFun(\'{0}\');" >删除</a>', row.id);
                        </shiro:hasPermission>
                    return str;
                }
            } ] ],
            onLoadSuccess:function(data){
                $('.house-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.house-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#houseToolbar'
        });
    });
    
    function edithouseFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = houseTreeGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            houseTreeGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 700,
            height : 600,
            href : '${path }/house/editPage?id=' + id,
            buttons : [ {
                text : '编辑',
                handler : function() {
                    parent.$.modalDialog.openner_treeGrid = houseTreeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#houseEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deletehouseFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = houseTreeGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            houseTreeGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }

        parent.$.messager.confirm('询问', '您是否要删除当前资源？', function(b) {
            if (b) {
                progressLoad();
                $.post('${path }/house/delete', {
                    id : id
                }, function(result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        houseTreeGrid.datagrid('reload');
                    }else{
                        parent.$.messager.alert('提示', result.msg, 'info');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }
    
    function addhouseFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 700,
            height : 600,
            href : '${path }/house/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = houseTreeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#houseAddForm');
                    f.submit();
                }
            } ]
        });
    }

    function searchHouseFun() {
        console.log($.serializeObject($('#searchHouseForm')));
        $('#houseTreeGrid').datagrid('load', $.serializeObject($('#searchHouseForm')));
    }

    function cleanHouseFun() {
        $('#searchHouseForm input').val('');
        houseTreeGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchHouseForm">
            <table>
                <tr>
                    <th>楼盘名称:</th>
                    <td><input name="lpName" placeholder="请输入楼盘名称"/></td>
                    <th>楼盘类型:</th>
                    <td>
                        <input class="easyui-combobox" name="lpType"
                               url="${path }/dict/getDictsByClass?vcClass=lp_type"
                               valueField="id"
                               textField="dictName"
                               editable="false"/>
                    </td>
                    <th>楼盘区域:</th>
                    <td>
                        <input class="easyui-combobox" name="lparea"
                               url="${path }/dict/getDictsByClass?vcClass=lp_area"
                               valueField="id"
                               textField="dictName"
                               editable="false"/>
                    </td>
                    <th>录入时间:</th>
                    <td>
                        <input name="sysTimeStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至
                        <input  name="sysTimeEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchHouseFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanHouseFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:false,title:'楼盘列表'"  style="overflow: hidden;">
        <table id="houseTreeGrid"></table>
    </div>
    <div id="houseToolbar" style="display: none;">
        <shiro:hasPermission name="/house/add">
            <a onclick="addhouseFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
        </shiro:hasPermission>
    </div>
</div>