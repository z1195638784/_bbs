<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="status" value="${sessionScope.status}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>慕课论坛</title>
    <link rel="stylesheet" href="/css/all-df86af5803.css">
</head>
<body class="forum" data-page="forum">
<div class="header">
    <nav class="navbar navbar-inverse navbar-fixed-top navbar-default">
        <div class="container">
            <div class="navbar-header" id="navbar-header">
                <a href="/post/to_list" class="navbar-brand"><img src="/images/logo.png"> </a>
            </div>
            <div id="main-nav-menu">
                <ul class="nav navbar-nav">
                    <li><a href=""><i class="fa fa-home"></i> <span class="hidden-xs hidden-sm">首页</span></a>
                    </li>
                    <li class="hidden-sm hidden-xs active"><a href="thread.html"><i class="fa fa-comments-o"></i> 话题</a>
                    </li>

                </ul>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="nav-search hidden-xs hidden-sm">
                    <form method="GET" action="thread.html" accept-charset="UTF-8"
                          class="navbar-form form-search active" target="_blank">
                        <div class="form-group">
                            <input placeholder="搜索" class="form-control" name="q" type="search">
                        </div>
                        <i class="fa fa-search"></i>
                    </form>
                </li>
                <c:choose>
                    <c:when test="${user!=null}">
                        <!-- 登录成功后显示的内容 -->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                <!-- 此处显示登录成功后的用户名，如果被冻结也再次显示 -->
                                    ${user.username}
                                <span class="caret"></span></a>
                            <button class="navbar-toggle" type="button" data-toggle="dropdown" role="button" aria-expanded="false">
                                <span class="sr-only">Toggle</span>
                                <i class="fa fa-reorder"></i>
                            </button>
                            <ul class="dropdown-menu" role="menu"><li class=""><a href="#">我的主页</a></li>
                                <li><div class='divider'></div></li>
                                <li><a href="my.html">个人设置</a></li>

                                <li><a href="score.html">我的积分</a></li>
                                <li class='divider'></li>
                                <li><a href="/post/to_list" onclick=" return confirm('你确定要退出吗?')"><i class="fa fa-sign-out"></i> 退出
                                </a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <!-- 未登录显示的内容 -->
                        <li><a href="/to_register" id="signup-btn">注册</a></li>
                        <li><a href="/to_login" id="login-btn">登录</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </nav>
</div>
<div id="main" class="main-container container">
    <!-- 首页通栏(4个推荐位) -->
    <div class="col-md-9 threads-index main-col">
        <div class="panel panel-default">

            <div class="panel-heading">
                <div class="pull-left hidden-sm hidden-xs">
                    <i class="fa fa-list"></i> 首页
                </div>
                <ul class="pull-right list-inline remove-margin-bottom thread-filter">
                    <li>
                        <a href="thread.html">
                            <i class="fa fa-history"></i> 最新话题
                        </a>
                    </li>
                    <li>
                        <a href="thread.html">
                            <i class="fa fa-diamond"> </i> 优质帖子
                        </a>
                    </li>
                    <li>
                        <a href="thread.html">
                            <i class="fa fa-thumbs-o-up"> </i> 最多按赞
                        </a>
                    </li>
                    <li>
                        <a href="thread.html">
                            <i class="fa fa-eye"></i> 等待回复
                        </a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>


            <div class="panel-body remove-padding-horizontal">
                <ul class="list-group row thread-list">
                    <!-- 显示帖子，每个li显示一个帖子的内容 -->
                    <c:forEach items="${list}" var="post">
                    <li class="list-group-item media " style="margin-top: 0px;">
                        <a class="pull-right" href="post.html"><span class="badge badge-reply-count"> 25 </span>
                        </a>
                        <div class="avatar pull-left">
                            <a href="post.html">
                                <img class="media-object img-thumbnail avatar-48" alt="imooc" src="/images/avatar.jpg"/>
                            </a>
                        </div>
                        <div class="infos">
                            <div class="media-heading">
                                <i class="fa fa-thumb-tack text-danger"></i>
                                <a href="/post/to_post?id=${post.id}" title="${post.title}">
                                        ${post.title}
                                </a>
                            </div>
                            <div class="media-body meta">
                                <a href="post.html">
                                    <span class="fa fa-thumbs-o-up"> 10 </span>
                                </a>
                                <span> • </span>
                                <span>回复</span>
                                <a href="post.html">
                                    用户名
                                </a>
                                <span> • </span>
                                <span class="timeago " data-toggle="tooltip" data-placement="top"
                                      ><fmt:formatDate value="${post.createTime}" pattern="yyyy-MM-dd HH:mm:SS"/> </span>
                            </div>
                        </div>
                    </li>
                    </c:forEach>


                </ul>
            </div>

            <div class="panel-footer text-right remove-padding-horizontal pager-footer">
                <!-- Pager -->
                <!-- 如有需要可以在此处添加分页，本次作业不要求完成 -->
                <ul class="pagination">

                    <li> <a href=""><span></span></a></li>

                </ul>
            </div>


        </div>
    </div>

    <div class="col-md-3 side-bar">
        <div class="panel panel-default corner-radius">
            <div class="panel-heading">
                <h3 class="panel-title">BBS</h3>
            </div>

            <c:choose>
                <c:when test="${sessionScope.user!=null}">
                    <!-- 登录后显示的内容 -->
                    <div class="panel-body text-center">
                        <c:choose>
                            <c:when test="${sessionScope.user.userstatus==0}">
                                <a href="/post/to_add_post" class="btn btn-primary">
                                    <i class="fa fa-user"> </i> 发帖
                                </a>
                            </c:when>
                            <c:when test="${sessionScope.user.userstatus==1}">
                                <div class="panel-body text-center">
                                    <font color="red" >用户已被锁定,请联系管理员解锁</font>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="panel-body text-center">
                                    <font color="red" >用户已被删除,请联系管理员还原</font>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- 未登录显示的内容 -->
                    <div class="panel-body text-center">
                        <a href="/to_register" class="btn btn-primary">
                            <i class="fa fa-user"> </i> 注册
                        </a>
                    </div>
                    <div class="panel-footer text-center">
                        已注册用户请 <a href="/to_login">登录</a>
                    </div>

                </c:otherwise>
            </c:choose>




        </div>

        <div class="panel panel-default corner-radius">
            <div class="panel-heading">
                <h3 class="panel-title">热门标签</h3>
            </div>
            <div class="panel-body">
                <div class="badge badge-tag-cloud">
                    <a href="">Java</a> &nbsp;&nbsp; <a href="">Python</a>
                </div>
            </div>
        </div>
        <div class="panel panel-default corner-radius">
            <div class="panel-heading">
                <h3 class="panel-title">小贴士</h3>
            </div>
            <div class="panel-body">
                猪有猪的思想，人有人的思想。如果猪有人的思想，那它就不是猪了——是八戒!
            </div>
        </div>

        <div class="panel panel-default corner-radius">
            <div class="panel-heading">
                <h3 class="panel-title">统计信息</h3>
            </div>
            <ul class="list-group">
                <li class="list-group-item">社区会员: 747</li>
                <li class="list-group-item">主题数: 95</li>
                <li class="list-group-item">回帖数: 218</li>
            </ul>
        </div>


    </div>
    <div class="clearfix"></div>

</div>

<footer class="footer">
    <div class="container">
        <div class="copyright">
            <blockquote class="pull-left">
                <p>慕课论坛</p>
                <p>Copyright &copy; 2015-2016 <a href="index.html">weiyuan</a> 1.0.0-rc2 <span class="pipe">|</span><span class="pipe">|</span></p>
            </blockquote>
        </div>
        <div class="pull-right hidden-sm hidden-xs">
            <p>
                <a href="###">关于我们</a>
                <span class="pipe">|</span>
                <a href="###">联系我们</a>
                <span class="pipe">|</span>
                <a href="###">常见问题解答</a>
            </p>
            <p>
                <a href="index.html" target="_blank"><img src="/images/imooc-logo.png" border="0" height="40"
                                                          data-toggle="tooltip" data-placement="top"
                                                          title="Powered by imooc"/></a>
            </p>
        </div>
    </div>
</footer>
</body>
</html>