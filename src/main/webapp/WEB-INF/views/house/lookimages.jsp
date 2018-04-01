<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var lookimageGrid;
    $(function () {
        lookimageGrid = $('#lookimageGrid').datagrid({
            url: '${path }/image/getImgsByLpId?lpId=' +${lpId},
            striped: true,
            idField: 'id',
            sortName: 'sysTime',
            sortOrder: 'asc',
            singleSelect: true,
            nowrap: false,
            fit: true,
            fitColumns: false,
            border: false,
            columns: [[{
                field: 'index',
                title: '编号',
                width: 40,
                formatter: function (v, r, index) {
                    return index + 1;
                }
            }, {
                field: 'imgType',
                title: '图片类型',
                width: 80
            }, {
                width: '120',
                title: '图片路径',
                field: 'imgUrl'
            }, {
                field: 'imgInfo',
                title: '图片描述',
                width: 200
            }, {
                field: 'action',
                title: '操作',
                width: 220,
                formatter: function (value, row, index) {
                    var str = '';
                    <shiro:hasPermission name="/house/deleteImages">
                    str += $.formatString('<a href="javascript:void(0)" class="house-easyui-linkbutton-deleteImages" data-options="plain:true,iconCls:\'fi-trash icon-blue\'" onclick="delImageFun(\'{0}\');" >删除图片</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/house/showImages">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="house-easyui-linkbutton-showImages" data-options="plain:true,iconCls:\'fi-zoom-out icon-blue\'" ' +
                        'onclick="lookImageFun(\'{0}\');" >浏览图片</a>', '${staticPath}/'+row.imgUrl.replace(/\\/g,"\\\\"));
                    </shiro:hasPermission>
                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.house-easyui-linkbutton-deleteImages').linkbutton({text: '删除图片'});
                $('.house-easyui-linkbutton-showImages').linkbutton({text: '查看图片'});
            }
        });
    });

    function delImageFun(id) {
        parent.$.messager.confirm('询问', '您是否要删除当前资源？', function (b) {
            if (b) {
                progressLoad();
                $.post('${path }/image/delete', {
                    id: id
                }, function (result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        lookimageGrid.datagrid('reload');
                    } else {
                        parent.$.messager.alert('提示', result.msg, 'info');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }

    function lookImageFun(url) {
        console.log(url);
        layer.open({
            type: 1 //Page层类型
            ,area: ['860px', '560px']
            ,title: '楼盘图片浏览'
            ,shade: 0.6 //遮罩透明度
            ,anim: 1 //0-6的动画形式，-1不开启
            ,content: '<img src="'+url+'" alt="">'
        });

    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" style="overflow: hidden;">
        <table id="lookimageGrid"></table>
    </div>
</div>