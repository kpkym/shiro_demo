<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        * {
            text-align: center;
            text-decoration: none;
        }
    </style>
    <title>shiro-demo</title>
</head>
<body>
<div style="text-align: left">
    <a href="/logout">退出</a>
</div>
Hello, <shiro:principal property="username"/>!
<h2>开通会员自动点亮前两个图标 || 开通超级会员全部点亮</h2>
<table style="width: 100%">
    <tr>
        <td colspan="2"><a href=""><b>会员(15点)</b></a></td>
        <td colspan="3"><a href=""><b>超级会员(30点)</b></a></td>
    </tr>
    <tr>
        <td>黄钻</td>
        <td>绿钻</td>
        <td>红钻</td>
        <td>蓝钻</td>
        <td>黑钻</td>
    </tr>
    <tr height="300px">
        <shiro:hasPermission name="yellow:read">
            <td style="background-color: yellow">
                <button onclick="get('yellow')">click</button>
            </td>
        </shiro:hasPermission>
        <shiro:lacksPermission name="yellow:read">
            <td>你没有黄钻权限</td>
        </shiro:lacksPermission>
        <shiro:hasPermission name="green:read">
            <td style="background-color: green">
                <button onclick="get('green')">click</button>
            </td>
        </shiro:hasPermission>
        <shiro:lacksPermission name="green:read">
            <td>你没有绿钻权限</td>
        </shiro:lacksPermission>
        <shiro:hasPermission name="red:read">
            <td style="background-color: red">
                <button onclick="get('red')">click</button>
            </td>
        </shiro:hasPermission>
        <shiro:lacksPermission name="red:read">
            <td>你没有红钻权限</td>
        </shiro:lacksPermission>
        <shiro:hasPermission name="blue:read">
            <td style="background-color: blue">
                <button onclick="get('blue')">click</button>
            </td>
        </shiro:hasPermission>
        <shiro:lacksPermission name="blue:read">
            <td>你没有蓝钻权限</td>
        </shiro:lacksPermission>
        <shiro:hasPermission name="black:read">
            <td style="background-color: black">
                <button onclick="get('black')">click</button>
            </td>
        </shiro:hasPermission>
        <shiro:lacksPermission name="black:read">
            <td>你没有黑钻权限</td>
        </shiro:lacksPermission>
    </tr>
    <tr>
        <td><a href="">开通黄钻(10点)</a></td>
        <td><a href="">开通绿钻(10点)</a></td>
        <td><a href="">开通红钻(10点)</a></td>
        <td><a href="">开通蓝钻(10点)</a></td>
        <td><a href="">开通黑钻(10点)</a></td>
    </tr>
</table>

<br/>

当前拥有点数(0点):<input type="text"><a href="">充值</a>

<script>
    function get(permission) {
        let xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                // 如果没有权限会后台会抛异常
                try {
                    let data = JSON.parse(xmlhttp.responseText);
                    alert("你有该权限");
                } catch(err) {
                    alert("你没有该权限");
                }

            }
        };
        xmlhttp.open("GET", permission, true);
        xmlhttp.send();
    }
</script>
</body>
</html>
