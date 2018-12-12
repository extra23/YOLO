<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

    <center>
        <form action="naverSearch">
            <input type="text" name="keyword" >
            <input type="submit" value="검색">
        </form>
        
    </center>
    <table>
        <tr>
            <td colspan="7" width="100%" bgcolor="pink"></td>
        </tr>
        <c:forEach items="${naverSearch}" var ="b">
            <tr>
                <td rowspan="2"><img src="${b.cTitle}"></td>
                <td rowspan="4" width="800">"${b.cContent}"</td>
                <td width="200">${b.cSummary}</td>
            </tr>
            <tr>
                <td width="200">${b.cTitle }</td>
                <td width="200">${b.cContent }</td>
                <td width="200">$b.cSummary }</td>
                
            </tr>
            
            <tr>
                <td colspan="7" width="100%" bgcolor="pink"></td>
            </tr>
        </c:forEach>
    </table>
    </body>
<!--         <div class="CourseList">
                <fieldset class="srch">
                        <legend>검색영역</legend>
                        <input type="text" name="query" id="query" accesskey="s" title="검색어" class="keyword" value="네이버">
                        <input type="button" id="search" name="search" alt="검색" value="검색" />
                </fieldset>
                <table cellspacing="0" border="1" summary="백과사전 API 결과" class="tbl_type">
                <caption>백과사전 API 결과</caption>
                        <colgroup>
                                <col width="10%">
                                <col width="20%">
                                <col width="70%">
                        </colgroup>
                        <thead>
                                <tr>
                                <th scope="col">이미지</th>
                                <th scope="col">제목</th>
                                <th scope="col">내용요약</th>
                                </tr>
                        </thead>
                        <tbody id="list">
                                <tr class="__oldlist" style="">
                                        <td colspan="7">검색 결과가 없습니다.</td>
                                </tr>
                        
                                <tr class="__template" style="display: none">
                                        <td><img src="#thumbnail#" width="50px" height="70px" /></td>
                                        <td>#title#</td>
                                        <td><a href="#link#">#description#</a></td>
                                </tr>
                        </tbody>
                </table>
        </div>
</body>
<script type="text/javascript">
$('#search').click( function() {
        if($('#query').val() == ''){
                alert('검색어를 입력해 주세요');
                $('#query').focus();
        }else{
                callAjax($('#query').val());
                $('#name').val("");
        }
});

function callAjax(query) {
        $.ajax({
                url:'encyc_proxy.php',
                dataType:'json',
                type:'POST',
                data:{'query':query},
                success:function(result){
                        $('#result').html('');
                        if(result['channel']['display'] > 0){
                                $('.__oldlist').remove();
                                for(var i in result['channel']['item']){
                                        var item = result['channel']['item'][i];
                                        $html = template('__template', item);
                                        $html.addClass('__oldlist');
                                        $('#list').append($html);
                                        $('.__oldlist').show();
                                }
                                
                        }else{
                                $('#result').html('');
                                $('#result').append("데이터가 없거나 정상적으로 로딩 되지 않았습니다.");
                        }
                }
        });
};

function template(template_id, params){
        var c = $('.' + template_id).clone();
        var html = $('<div>').append(c).html();
        for(var key in params){
                        html = html.replace(new RegExp('#' + key + '#', 'g'), params[key]);
        }
        html = html.replace(/#template_([^#]*)#/g, '$1');
        var $html = $(html).removeClass(template_id).removeClass('__template');
        return $html;
}
</script> -->



</html>