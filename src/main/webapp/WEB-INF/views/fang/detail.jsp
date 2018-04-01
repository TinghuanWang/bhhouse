<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>东莞小产权房直售网</title>
<meta name="description" content="Enter Your Website Description Here">
<meta name="keywords" content="website, business, store" />
<meta name="robots" content="index, follow" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="shortcut icon" href="${staticPath }/static/style/images/favicon.ico" />
<link href="${staticPath }/static/fang/css/style.css?_=1231321" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${staticPath }/static/fang/css/layout.css">
<link rel="stylesheet" href="${staticPath }/static/fang/css/skeleton.css">
<link rel="stylesheet" type="text/css" href="${staticPath }/static/fang/css/menusm.css?_=3333" />
<script type="text/javascript" src="${staticPath }/static/fang/js/jquery.min.js"></script>
<script type="text/javascript" src="${staticPath }/static/fang/js/menusm.js"></script>
<!-- PrettyPhoto Starts -->
<link rel="stylesheet" type="text/css" href="${staticPath }/static/fang/css/prettyPhoto.css" />
<script type="text/javascript" src="${staticPath }/static/fang/js/jquery.prettyPhoto.js"></script>
<!-- PrettyPhoto Ends -->
<!-- Preloader Starts -->
<link href="${staticPath }/static/fang/css/preloader.css" rel="stylesheet" />
<script src="${staticPath }/static/fang/js/jquery.preloader.js" charset="utf-8"></script>
<!-- Preloader Ends -->
<!-- Ui To Top Starts -->
<link href="${staticPath }/static/fang/css/ui.totop.css" rel="stylesheet" />
<script src="${staticPath }/static/fang/js/jquery.ui.totop.js" charset="utf-8"></script>
<!-- Ui To Top Ends -->
<!-- DC Twitter Starts -->
<link href="${staticPath }/static/fang/css/jquery.tweet.css" rel="stylesheet" />
<script src="${staticPath }/static/fang/js/jquery.tweet.js" charset="utf-8"></script>
<!-- DC Twitter End -->

<script type="text/javascript" src="${staticPath }/static/fang/js/scripts.js"></script>
<!-- Config User Intarface Box Import START -->
<script type="text/javascript" src="${staticPath }/static/fang/js/head_html_default_block.js"></script>
<script type="text/javascript" src="${staticPath }/static/fang/js/head_html_block.js"></script>
<!-- Config User Intarface Box Import END -->

<!-- Config Slider : SLIDER START -->
<link rel="stylesheet" id="camera-css"  href="${staticPath }/static/fang/css/camera.css" type="text/css" media="all">
<link rel="stylesheet" href="${staticPath }/static/fang/css/detail.css?_=<%=System.currentTimeMillis()%>" type="text/css"/>
<script type="text/javascript" src="${staticPath }/static/fang/js/jquery.mobile.customized.min.js"></script>
<script type="text/javascript" src="${staticPath }/static/fang/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${staticPath }/static/fang/js/camera.min.js"></script>
<script type="text/javascript">
  jQuery(function(){     
    jQuery('#camera_wrap_1').camera({
      thumbnails: true,
      height: '380px',
      loader: 'pie', // bar,pie
      pieDiameter: 38,
      piePosition: "rightTop",               
      time: 1500, // ms (1500 = 1.5 seconds)
      pagination: true               
    });
  });
</script>
<!-- Config Slider : SLIDER END -->

<!-- START slider1 -->
<link rel="stylesheet" href="${staticPath }/static/fang/css/website.css" type="text/css" media="screen"/>
  <link href="${staticPath }/static/fang/css/weixin.css?_=44444" rel="stylesheet">
<script type="text/javascript" src="${staticPath }/static/fang/js/jquery.tinycarousel.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $('#slider1').tinycarousel();
  $('#slider2').tinycarousel({interval: true});
  $('#slider3').tinycarousel();
});
</script>
<!-- END slider1 -->
<script type="text/javascript" src="${staticPath }/static/fang/js/tinynav.min.js"></script>
<script type="text/javascript">
  $(function () {
    $('#menu-top-menu').tinyNav({
      active: 'selected',
      header: 'Navigation'
    });

      // 悬浮窗口
      $(".yb_conct").css("right", "5px");
      $(".liuyan").css("left", "5px");
      $(".yb_bar .yb_ercode").css('height', '200px');

      // 返回顶部
      $(".yb_top").click(function() {
          $("html,body").animate({
              'scrollTop': '0px'
          }, 300)
      });

      $('.liuyan').hide();
  });

  function wykf() {
      $('.liuyan').toggle();
      $(".liuyan").css("left", "5px");
  }
</script>
</head>
<body>
<div class="body_pattern">
  <div class="index_page">
    <div class="main">
      <div class="header">
        <div class="header_pic_bg">
          <div class="header_bg">
            <div class="container">
              <div class="header_resize"> 
                <!-- logo -->
                <div class="logo">
                  <div><a href="${staticPath}/fang"><span><em class="logo_2_color">东莞小产权房</em>直售网</span></a></div>
                  <!--<p>Premium Creative/Agency </p>--> 
                </div>
                <!-- logo --> 
                <!-- menu edit in file "js/menu_html_block.js" -->
                <div class="menu">
                  <ul class="menusm" id="menu-top-menu">
                    <li><a href="${staticPath}/fang"><span>首页</span></a>
                    </li>
                    <li><a href="#" class="menu_navigation"><span>楼盘区域</span></a>
                      <ul>
                        <c:forEach items="${dictLparea}" var="area" varStatus="id">
                          <li><a href="${staticPath}/fang/list?type=lparea&id=${area.id}"
                                 target="_blank"
                                 class="menu_navigation"><span>${area.dictName}</span></a>
                          </li>
                        </c:forEach>
                      </ul>
                    </li>
                    <li><a href="${staticPath}/fang/list?type=lphot" target="_blank" class="menu_navigation"><span>热门楼盘</span></a>
                                        </li>
                                        <li><a href="${staticPath}/fang/list?type=lpnew" target="_blank" class="menu_navigation"><span>最新楼盘</span></a>
                                        </li>
                                        <li><a href="#" class="menu_navigation"><span>房产资讯</span></a></li>
                                        <li><a href="#" class="menu_navigation"><span>联系我们</span></a></li>
                  </ul>
                  <div class="clr"></div>
                </div>
                <!-- /menu -->
                <div class="clr"></div>
              </div>
            </div>
          </div>
          <div class="container">
            <div id="now_slider"> 
              <!-- DC Camera Slider Start -->
              <div style="margin:0 auto; "> <!-- define slider container width (strict enforce) -->
                <div class="camera_wrap camera_azure_skin" id="camera_wrap_1"> 
                  <!-- Slide 1 -->
                  <c:forEach items="${indexImg}" var="index" varStatus="id" end="10">
                    <div data-src="${staticPath}/${index.imgUrl}"
                         data-link="${staticPath}/fang/detail?id=${index.lpId}"
                         data-target="_new">
                      <div class="camera_caption fadeFromBottom">
                        <em>${index.lpInfo}</em>
                      </div>
                    </div>

                  </c:forEach>
                </div>
                <!-- /camera_wrap --> 
              </div>
              <!-- DC Camera Slider End -->
              <div class="clr"></div>
            </div>
          </div>
          <div class="clr"></div>
        </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
      <div class="content">
        <div class="container" style="padding-top: 20px;padding-bottom: 45px;">
          <!--lp detai informations start -->
          <div class="lpdetail">
            <div class="lptitle">
              <p class="lptitle1">${house.lpName}</p>
              <p style="padding-top: 8px;color: black;">浏览量：${house.looktimes}&nbsp;&nbsp;发布时间：<fmt:formatDate value="${house.sysTime}" pattern="yyyy-MM-dd HH:mm" /></p>
            </div>
            <div class="clr"></div>
            <div class="lpinfo">
              <div class="lpinfo1">
                <div class="lpinfo2"><span><img src="${staticPath }/static/fang/images/info_list.png" alt="" />&nbsp;楼盘基础属性</span></div>
              </div>
              <div class="lpinfo3">
                <div class="lpinfo3a">
                  <table class="lpinfo3atab">
                    <tr>
                      <th>楼盘名称：</th>
                      <td>${house.lpName}</td>
                    </tr>
                    <tr>
                      <th>位置：</th>
                      <td>${house.lpDizhi}</td>
                    </tr>
                    <tr>
                      <th>类型：</th>
                      <td>${house.lpType}</td>
                    </tr>
                    <tr>
                      <th>区域：</th>
                      <td>${house.lparea}</td>
                    </tr>
                  </table>
                </div>
                <div class="lpinfo3b">
                  <table class="lpinfo3atab">
                    <tr>
                      <th>房型：</th>
                      <td>${house.huxing}</td>
                    </tr>
                    <tr>
                      <th>销售状态：</th>
                      <td>${house.payState}</td>
                    </tr>
                    <tr>
                      <th>开盘日期：</th>
                      <td><fmt:formatDate value="${house.kptime}" pattern="yyyy-MM-dd HH:mm" /></td>
                    </tr>
                    <tr>
                      <th>交房日期：</th>
                      <td><fmt:formatDate value="${house.jftime}" pattern="yyyy-MM-dd HH:mm" /></td>
                    </tr>
                  </table>
                </div>
                <div class="lpinfo3c">
                  <table class="lpinfo3atab">
                    <tr>
                      <th>参考价格：</th>
                      <td>${house.lpPrice}/㎡</td>
                    </tr>
                    <tr>
                      <th>发布日期：</th>
                      <td><fmt:formatDate value="${house.sysTime}" pattern="yyyy-MM-dd HH:mm" /></td>
                    </tr>
                    <tr>
                      <th><span style="color: red;font-size: 18px;">咨询人：</span></th>
                      <td><span style="color: red;font-size: 20px;font-weight: bold;"><u>${house.zxUser}</u></span></td>
                    </tr>
                    <tr>
                      <th><span style="color: red;font-size: 18px;">咨询电话：</span></th>
                      <td><span style="color: red;font-size: 20px;font-weight: bold;"><u>${house.zxPhone}</u></span></td>
                    </tr>
                  </table>
                </div>
              </div>
              <div class="clr"></div>
              <div class="lpinfo1">
                <div class="lpinfo2"><span><img src="${staticPath }/static/fang/images/info_list.png" alt="" />&nbsp;楼盘信息描述</span></div>
              </div>
              <div class="clr"></div>
              <div class="houseinfo">
                <p>&nbsp;&nbsp;${house.lpInfo}</p>
              </div>

              <div class="clr"></div>
              <div class="lpinfo1">
                <div class="lpinfo2"><span><img src="${staticPath }/static/fang/images/info_list.png" alt="" />&nbsp;楼盘详细介绍</span></div>
              </div>
              <div class="clr"></div>
              <div class="lpxxinfo" id="lpxxinfo">

                <c:forEach items="${detailImg}" var="detail" varStatus="id">
                <div class="xqimgDiv">
                  <img src="${staticPath}/${detail.imgUrl}" alt="">
                  <p>${detail.imgInfo}</p>
                </div>
                <div class="clr"></div>
                </c:forEach>
              </div>
              
              <div class="clr"></div>
              <div class="lpinfo1">
                <div class="lpinfo2"><span><img src="${staticPath }/static/fang/images/info_list.png" alt="" />&nbsp;您可能感兴趣的房源</span></div>
              </div>
              <div class="clr"></div>
              <div id="slider2" style="height: 360px;">
                <div class="h2_background">
                  <div class="h2_arrows"> <a class="buttons prev" href="#">left</a><a class="buttons next" href="#">right</a> </div>
                  <div class="clr"></div>
                </div>
                <div class="viewport">
                  <ul class="overview">
                    <c:forEach items="${tuijianhouse}" var="tuijian" varStatus="id" end="10">
                    <li>
                      <div class="col3">
                        <h3><a href="#">${tuijian.lpName} </a><span>均价${tuijian.lpPrice}/㎡</span></h3>
                        <div class="pic img_hover_box">
                          <a href="${staticPath}/fang/detail?id=${hot.lpId}" target="_blank"
                             class="prettyPhoto" rel="prettyPhoto[id1]">
                          <img src="${staticPath }/${tuijian.imgUrl}"/>
                          <img src="${staticPath }/static/fang/images/spacer.gif" width="1" height="1" class="r_plus_overlay" />
                          <img src="${staticPath }/static/fang/images/img_hover.png" width="16" height="16" alt="Image" class="r_plus" />
                        </a></div>
                        <p style="height: 60px;width: 290px;display:block;overflow: hidden;">${tuijian.lpInfo}</p>
                      </div>
                    </li>
                    </c:forEach>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!--lp detai informations end -->
          <div class="clr"></div>
        </div>
      </div>
      <div class="clr"></div>
      <!-- /content -->
      <div class="clr"></div>
      <!-- prefooter -->
      <div class="prefooter">
        <div class="prefooter_bg">
          <div class="container">
            <div class="prefooter_resize">
              <div class="one-third column alpha">
                <div class="fcol">
                  <div class="dark small">
                    <h2><span class="h2_small"><em class="dark">我要分享</em></span></h2>
                  </div>
                  <!-- DC webchat Start -->
                  <!-- <div id="ticker" class="query"></div> -->
                  <!-- DC webchat End --> 
                </div>
              </div>
              <div class="one-third column">
                <div class="fcol">
                  <div class="dark small">
                    <h2><span class="h2_small"><em class="dark">关于我们</em></span></h2>
                  </div>
                  <p>我们业务专注小产权房开发，收购，代理楼盘为主是一支有文化，有战斗力，团结，感恩的团队，由房地产互联网产行业精英组成。。我们的团队年轻而富有激情，具有超强的凝聚力，</p>
                    <br/>
                    汇聚着众多具有互联网和房地产及相关行业工作经验的专业人才，协力联盟于战略联盟机构的结成、在市场竞争中寻求企业发展与项目开发的适宜之路，以产品和服务创造价值，提升公司的市场竞争力。</p>
                </div>
              </div>
              <div class="one-third column omega">
                <div class="fcol last">
                  <div class="dark small">
                    <h2><span class="h2_small"><em class="dark">联系我们</em></span></h2>
                  </div>
                  <p> 地址:<br />
                    公司介绍：<br />
                    <br />
                    电话: 18520991068（王先生）<br />
                    邮件&#64;513358294@qq.com <br />
                  </p>
                  <div class="clr"></div>
                </div>
              </div>
              <div class="clr"></div>
            </div>
          </div>
          <div class="clr"></div>
          <div class="prefooter_resize_bottom"></div>
          <div class="clr"></div>
        </div>
        <div class="clr"></div>
      </div>
      <!-- /prefooter --> 
      <!-- footer -->
      <div class="footer">
        <div class="container">
          <div class="footer_resize">
            <p>&copy;2018-2019 Copyright <a href="#">东莞小产权房直售网</a>. All Rights Reserved. 
              Design by <a href="#" target="_blank" title="Dream Templates">东莞小产权房直售网</a>. </p>
          </div>
        </div>
        <div class="clr"></div>
      </div>
      <!-- footer -->
      <div class="clr"></div>
    </div>
  </div>
</div>
<!--提示开始信息 -->
<div class="yb_conct">
  <div class="yb_bar">
    <ul>
      <li class="yb_top">返回顶部</li>
      <li class="yb_phone" title="欢迎您来电咨询">18520991068</li>
      <li class="yb_QQ">
        <a href="javascript:void(0)" onclick="wykf()"
           title="我要看房">我要看房</a>
      </li>
      <li class="yb_ercode" style="height:53px;">微信二维码 <br>
        <img class="hd_qr" src="${staticPath}/static/fang/images/erweima.png" width="125" title="扫描二维码、获取更多房源信息"> </li>
    </ul>
  </div>
</div>
<!--提示信息结束 -->
<div class="liuyan">
  <div class="liuyan1">
    <form action="" method="post" class="white-pink">
      <h1>我要看房
        <span>留下您的联系方式，我们会尽快联系您.</span>
      </h1>
      <label>
        <span>电话:</span>
        <input id="phone" type="number" name="name" placeholder="您的联系方式..."/>
      </label>
      <label>
        <span>留言 :</span>
        <textarea id="message" name="message" placeholder="任何您想咨询的信息..."></textarea>
      </label>
      <label>
        <span>&nbsp;</span>
        <input type="button" class="button" onclick="qrkf()" value="确认看房"/>
      </label>
    </form>
  </div>
</div>
</body>
<script>
    function qrkf() {
        var phone = $('#phone').val();
        if (phone == null || phone == "") {
            alert("请您输入联系方式！");
            $('#phone').focus();
        }
        var message = $('#message').val();
        $.ajax({
            url: '${path }/phone/add',
            type: 'POST',
            data: {
                phone: phone, message: message
            },
            dataType: 'json',
            success: function (rec) {
                alert("您的联系方式已经预留成功，我们将第一时间与您联系！");
                $('#phone').val("");
                $('#message').val("");
                $('.liuyan').hide();
            }, error: function () {
                alert("您的联系方式已经预留成功，我们将第一时间与您联系！");
                $('#phone').val("");
                $('#message').val("");
                $('.liuyan').hide();
            }
        });
    }
</script>
</html>
