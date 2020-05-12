<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="user" value="${sessionScope.user}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>


<!DOCTYPE html>
<html >
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
                <a href="index.html" class="navbar-brand"><img src="/images/logo.png"> </a>
            </div>
            <div id="main-nav-menu">
                <ul class="nav navbar-nav">
                    <li><a href="/post/to_list"><i class="fa fa-home"></i> <span class="hidden-xs hidden-sm">首页</span></a>
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
                            <ul class="dropdown-menu" role="menu"><li class=""><a href="my.html">我的主页</a></li>
                                <li><div class='divider'></div></li>
                                <li><a href="my.html">个人设置</a></li>

                                <li><a href="score.html">我的积分</a></li>
                                <li class='divider'></li>
                                <li><a href="###" onclick=" return confirm('你确定要退出吗?')"><i class="fa fa-sign-out"></i> 退出
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
    <div class="row max-width">
        <div class="col-xs-12">
            <ul class="breadcrumb">
                <li>
                    <a href="/post/to_list">首页</a>
                </li>
                <li>
                    <strong>${post.title}</strong>
                </li>
            </ul>
        </div>
    </div>

    <div class="col-md-9 threads-show main-col">

        <!-- Thread Detial -->
        <div class="thread panel panel-default">
            <div class="infos panel-heading">

                <div class="pull-right avatar">
                    <a href="/post/to_list"> <img src="/images/avatar.jpg" class="media-object img-thumbnail avatar-64"/> </a>
                </div>

                <h1 class="panel-title thread-title">${post.title}</h1>

                <div class="likes">
                    <a href="javascript:void(0);" data-action="like" data-type="Thread" data-url="#" title="赞"
                       class="fa fa-chevron-up likeable like" data-id="10"> 10</a> <a href="javascript:void(0);"
                                                                                      data-action="unlike"
                                                                                      data-type="Thread" data-url="#"
                                                                                      title="踩"
                                                                                      class="fa fa-chevron-down likeable like"
                                                                                      data-id="10"></a>
                </div>

                <div class="meta inline-block">

                    <a href="my.html"> ${post.username}</a>

                    • 于 <abbr title="2016-06-10 02:28:36" class="timeago">2016-06-10 02:28:36</abbr>

                    回复 <a href="my.html"> memory </a> 于 <abbr title="2017-02-08 21:47:25"
                                                              class="timeago">2017-02-08 21:47:25</abbr> •

                    4050 阅读
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="panel-body content-body">

                <div class="markdown-body" id="emojify">
                    <ul>
                        <li>${post.content}</li>
                    </ul>
                </div>

            </div>

            <div class="panel-footer operate">

                <div class="pull-left" style=" font-size:15px;">
                    <a class=""
                       href="http://service.weibo.com/share/share.php?url=http%3A%2F%2Fimooc.com%2Fthread%2F10&type=3&pic=&title=imooc 接下来需要完善的功能"
                       target="_blank" title="分享到微博"> <i class="fa fa-weibo"></i> </a> <a
                        href="https://twitter.com/intent/tweet?url=http%3A%2F%2Fimooc.com%2Fthread%2F10&text=imooc 接下来需要完善的功能&via=imooc.com"
                        class="" target="_blank" title="分享到 Twitter"> <i class="fa fa-twitter"></i> </a> <a
                        href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fimooc.com%2Fthread%2F10" class=""
                        target="_blank" title="分享到 Facebook"> <i class="fa fa-facebook"></i> </a> <a
                        href="https://plus.google.com/share?url=http%3A%2F%2Fimooc.com%2Fthread%2F10" class=""
                        target="_blank" title="分享到 Google Plus"> <i class="fa fa-google-plus"></i> </a>
                </div>

                <div class="pull-right">
          <span class="tag-list hidden-xs">
      Tags:
            <a href="tag.html"><span class="tag">imooc</span></a>
            </span>

                </div>
                <div class="clearfix"></div>
            </div>

            <div class="modal fade" id="exampleModal" tabindex="-1" role="" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel">备注内容</h4>
                        </div>

                        <form method="POST" action="" accept-charset="UTF-8">


                            <div class="modal-body">

                                <div class="alert alert-warning">
                                    附加备注, 使用此功能的话, 会给所有参加过讨论的人发送通知.
                                </div>

                                <div class="form-group">
                                    <textarea class="form-control" style="min-height:20px" placeholder="请使用Markdown撰写内容"
                                              name="content" cols="50" rows="10"></textarea>

                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>

        <!-- Reply List -->
        <div class="replies panel panel-default list-panel replies-index">
            <div class="panel-heading">
                <div class="total">回复总数: <b>1</b></div>
            </div>

            <div class="panel-body">

                <ul class="list-group row">
                            <c:forEach items="${commentList}" var="comment" varStatus="loop">
                                <li class="list-group-item media " id="reply11">
                                    <div class="avatar pull-left">
                                        <a href="my.html"> <img class="media-object img-thumbnail avatar" alt="strdemo"
                                                                src="/images/avatar_small.jpg" style="width:48px;height:48px;"/>
                                        </a>
                                    </div>
                                    <div class="infos">

                                        <div class="media-heading meta">
                                            <a href="my.html" title="strdemo" class="remove-padding-left author">${comment.username}</a>
                                            <abbr class="timeago" title="create_time"><fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd HH:mm:SS"/></abbr> <a
                                                name="reply1" class="anchor" href="#reply1" aria-hidden="true">#${loop.count}</a>
                                        </div>

                                        <div class="media-body markdown-reply content-body">
                                                ${comment.content}
                                        </div>

                                    </div>
                                </li>
                            </c:forEach>
                </ul>
                <!-- Pager -->
                <div class="pull-right" style="padding-right:20px">

                </div>
            </div>
        </div>

        <!-- Reply Box -->
        <div class="panel panel-default">
            <div class="panel-heading">
                发表回复
            </div>
            <div class="panel-body">
                <div class="reply-box form">
                    <c:choose>
                        <c:when test="${user!=null}">
                            <!-- 已经登录的情况 -->
                            <form method="POST" action="/post/add_comment" accept-charset="UTF-8" id="thread_create_form" class="create_form">
                                <input type="hidden" name="postId" value="${post.id}">
                                <input type="hidden" name="userId" value="${user.id}">
                                <input type="hidden" name="username" value="${user.username}">
                                <div class="form-group">
                                    <textarea class="post-editor form-control" rows="5" style="overflow:hidden" id="content" placeholder="请使用Markdown撰写内容" name="content" cols="50"></textarea>
                                </div>
                                <div class="form-group status-post-submit">
                                    <input class="btn btn-primary col-xs-2" id="thread-create-submit" type="submit" value="回复">
                                </div>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <!-- 未登录的情况 -->
                            <div style="padding:20px;">
                                需要 <a class="btn btn-success" href="/to_login">登录</a> 后方可回复, 如果你还没有账号请点击这里 <a
                                    class="btn btn-primary" href="/to_register">注册</a>。
                            </div>
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>
        </div>

    </div>

    <div class="col-md-3 side-bar">
        <div class="panel panel-default corner-radius">
            <div class="panel-heading">
                <h3 class="panel-title">BBS</h3>
            </div>

            <c:choose>
                <c:when test="${user!=null}">
                    <!-- 登录后显示的内容 -->
                    <div class="panel-body text-center">
                        <c:choose>
                            <c:when test="${user.userstatus==0}">
                                <a href="/post/to_add_post" class="btn btn-primary">
                                    <i class="fa fa-user"> </i> 发帖
                                </a>
                            </c:when>
                            <c:when test="${user.userstatus==1}">
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
