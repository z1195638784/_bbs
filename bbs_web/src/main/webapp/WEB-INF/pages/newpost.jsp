<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Battle
  Date: 2020/4/30
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="GBK" %>
<c:set var="username" value="${sessionScope.user.username}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ľ����̳</title>
    <link rel="stylesheet" href="/css/all-df86af5803.css">
</head>
<body class="forum" data-page="forum">
<div class="header">
    <nav class="navbar navbar-inverse navbar-fixed-top navbar-default">
        <div class="container">
            <div class="navbar-header" id="navbar-header">
                <a href="" class="navbar-brand"><img src="/images/logo.png">
                </a>
            </div>
            <div id="main-nav-menu">
                <ul class="nav navbar-nav">
                    <li ><a href=""><i class="fa fa-home"></i> <span class="hidden-xs hidden-sm">��ҳ</span></a></li>
                    <li class="hidden-sm hidden-xs active"><a href="thread.html"><i class="fa fa-comments-o"></i> ����</a></li>

                </ul>
            </div>
            <ul class="nav user-bar navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        ${username}
                        <span class="caret"></span></a>
                    <button class="navbar-toggle" type="button" data-toggle="dropdown" role="button" aria-expanded="false">
                        <span class="sr-only">Toggle</span>
                        <i class="fa fa-reorder"></i>
                    </button>
                    <ul class="dropdown-menu" role="menu"><li class=""><a href="my.html">�ҵ���ҳ</a></li>
                        <li><div class='divider'></div></li>
                        <li><a href="my.html">��������</a></li>

                        <li><a href="score.html">�ҵĻ���</a></li>
                        <li class='divider'></li>
                        <li><a href="###" onclick=" return confirm('��ȷ��Ҫ�˳���?')"><i class="fa fa-sign-out"></i> �˳�
                        </a></li>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="nav-search hidden-xs hidden-sm">
                    <form method="GET" action="###/thread/create" accept-charset="UTF-8" class="navbar-form form-search active" target="_blank">
                        <div class="form-group">
                            <input placeholder="����" class="form-control" name="q" type="search">
                        </div>
                        <i class="fa fa-search"></i>
                    </form>
                </li>
                <li class="notification">
                    <a href="message.html" class="notification-count "><i class="fa fa-bell"></i><span class="count"></span></a>
                </li>
            </ul>
        </div>
    </nav>
</div>		<div id="main" class="main-container container">
    <div class="row max-width">
        <div class="col-xs-12">
            <ul class="breadcrumb">
                <li>
                    <a href="index.html">��ҳ</a>
                </li>
                <li>
                    <strong>��������</strong>
                </li>
            </ul>
        </div>
    </div>


    <div class="thread_create">

        <div class="col-md-9 main-col">
            <div class="panel panel-default corner-radius">
                <div class="panel-heading">��������</div>
                <div class="panel-body">
                    <div class="reply-box form box-block">
                        <form method="POST" action="/post/add_post" accept-charset="UTF-8" id="thread_create_form" class="create_form">

                            <div class="form-group">
                                <input class="form-control" id="title" placeholder="����" name="title" type="text">
                            </div>

                            <div class="form-group">
                                <select class="form-control selectpicker" name="category">
                                    <option value="����">����</option>
                                    <option value="ʹ��ָ��">ʹ��ָ��</option>
                                </select>
                            </div>
                            <!-- editor start -->
                            <div class="editor-toolbar">

                                <ul class="nav nav-pills" style="clear:none;">
                                    <li class="edit active"><a href="#">�༭</a></li>

                                </ul>
                            </div>                    <!-- end -->
                            <div class="form-group">
                                <textarea class="post-editor form-control" rows="15" style="overflow:hidden" id="body_field" placeholder="��ʹ��Markdown׫д����" name="content" cols="50"></textarea>
                            </div>

                            <div class="form-group">
                                <select class="form-control js-tag-tokenizer" name="tag">

                                    <option value="Java">Java</option>
                                    <option value="Python">Python</option>
                                </select>
                                <small>
                                    ����д��ǩ
                                </small>
                            </div>


                            <div class="form-group status-post-submit">
                                <input class="btn btn-primary col-xs-2" id="thread-create-submit" type="submit" value="����">

                            </div>

                            <div class="box preview markdown-body" id="preview-box" style="display:none;"></div>

                        </form>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-md-3 side-bar">


            <div class="panel panel-default corner-radius help-box">
                <div class="panel-heading text-center">
                    <h3 class="panel-title">������ʾ</h3>
                </div>
                <div class="panel-body">
                    <ul class="list">
                        <li>�������
                            <p>���ڱ�������������Ҫ�㡣</p>
                        </li>
                        <li>ѡ��ڵ�
                            <p>��Ϊ�������ѡ��һ���ڵ㡣ǡ���Ĺ�������㷢������Ϣ�����á�</p>
                        </li>
                        <li>����
                            <p>imooc ֧�� <span style="font-family: Consolas, 'Panic Sans', mono"><a href="https://help.github.com/articles/github-flavored-markdown" target="_blank">GitHub Flavored Markdown</a></span> �ı�����﷨���������ҳ���·�ʵʱԤ�����ĵ�ʵ����ȾЧ����</p>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="panel panel-default corner-radius help-box">
                <div class="panel-heading text-center">
                    <h3 class="panel-title">����ָ��ԭ��</h3>
                </div>
                <div class="panel-body">
                    <ul class="list">
                        <li>����ԭ��
                            <p>�벻Ҫ�� imooc �����κε������ӣ�������������֡���Ӱ�ȡ�</p>
                        </li>
                        <li>�Ѻû���
                            <p>���ֶ�İ���˵����ơ���֪ʶȥ�������ˡ�</p>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>


</div>

<footer class="footer">
    <div class="container">
        <div class="copyright">
            <blockquote class="pull-left">
                <p>Ľ����̳</p>
                <p>Copyright &copy; 2015-2016 <a href="index.html">imooc</a>  1.0.0-rc2 <span class="pipe">|</span><span class="pipe">|</span></p>
            </blockquote>
        </div>
        <div class="pull-right hidden-sm hidden-xs">
            <p>
                <a href="###">��������</a>
                <span class="pipe">|</span>
                <a href="###">��ϵ����</a>
                <span class="pipe">|</span>
                <a href="###">����������</a>
            </p>
            <p>
                <a href="index.html" target="_blank"><img src="/images/imooc-logo.png" border="0" height="40" data-toggle="tooltip" data-placement="top" title="Powered by imooc" /></a>
            </p>
        </div>
    </div>
</footer>
</body>
</html>

