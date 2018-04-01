<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var imageTreeGrid;
    $(function() {
        imageTreeGrid = $('#imageTreeGrid').datagrid({
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
                width : 160
            },{
                field : 'action',
                title : '操作',
                width : 220,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/house/editImages">
                            str += $.formatString('<a href="javascript:void(0)" class="house-easyui-linkbutton-editImages" data-options="plain:true,iconCls:\'fi-plus icon-blue\'" onclick="edithouseFun1(\'{0}\');" >添加图片</a>', row.id);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/house/lookImages">
                        str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                        str += $.formatString('<a href="javascript:void(0)" class="house-easyui-linkbutton-lookImages" data-options="plain:true,iconCls:\'fi-eye icon-blue\'" onclick="lookhouseFun(\'{0}\');" >浏览图片</a>', row.id);
                        </shiro:hasPermission>
                    return str;
                }
            } ] ],
            onLoadSuccess:function(data){
                $('.house-easyui-linkbutton-editImages').linkbutton({text:'添加图片'});
                $('.house-easyui-linkbutton-lookImages').linkbutton({text:'浏览图片'});
            }
        });
    });
    
    function edithouseFun1(id) {
        parent.$.modalDialog({
            title : '添加楼盘图片',
            width : 700,
            height : 300,
            href : '${path }/image/getImage/add?lpId=' + id,
            buttons : [ {
                text : '添加图片',
                handler : function() {
                    parent.$.modalDialog.openner_treeGrid = imageTreeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#houseImgForm');
                    f.submit();
                }
            } ]
        });
    }

    function lookhouseFun(id){
        parent.$.modalDialog({
            title : '浏览楼盘图片',
            width : 700,
            height : 500,
            href : '${path }/image/getImage/look?lpId=' + id,
            buttons : [ {
                text : '关 闭',
                handler : function() {
                    parent.$.modalDialog.handler.dialog('close');
                }
            } ]
        });
    }

    function searchHouseFun() {
        console.log($.serializeObject($('#searchHouseForm1')));
        $('#imageTreeGrid').datagrid('load', $.serializeObject($('#searchHouseForm1')));
    }

    function cleanHouseFun() {
        $('#searchHouseForm1 input').val('');
        imageTreeGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchHouseForm1">
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
        <table id="imageTreeGrid"></table>
    </div>
</div>