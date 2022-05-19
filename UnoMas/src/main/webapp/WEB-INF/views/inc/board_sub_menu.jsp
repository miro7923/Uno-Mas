<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
    ol,
    ul {
        list-style-type: none
    }

    a {
        background-color: transparent;
        text-decoration: none;
        color: inherit
    }

    a:active,
    a:hover {
        outline: 0
    }

    #snb {
        float: left;
        width: 200px
    }

    #snb .inner_snb {
        border: 1px solid #f2f2f2;
        border-bottom: 0;

    }

    #snb .tit_snb {
        padding: 5px 0 35px 1px;
        font-weight: 700;
        font-size: 28px;
        line-height: 35px;
        color: #333;
        letter-spacing: -1px
    }

    #snb .list_menu li {
        border-bottom: 1px solid #f2f2f2
    }

    #snb .list_menu li a {
        display: block;
        overflow: hidden;
        padding: 14px 0 16px 20px;
        background: #fff;
        background-size: 6px 11px;
        font-size: 14px;
        color: #666;
        line-height: 20px;
        letter-spacing: -.3px
    }

    #snb .list_menu li.on a,
    #snb .list_menu li a:hover {
        background: #fafafa;
        background-size: 6px 11px;
        font-weight: 700;
        color: #5f0080
    }

    #snb .link_inquire {
        display: block;
        overflow: hidden;
        width: 200px;
        height: 60px;
        margin-top: 20px;
        padding: 9px 0 0 22px;
        border-radius: 0 100px 100px 0;
        background: #fafafa;
        background-size: 6px 11px;
        font-size: 12px;
        color: #333;
        line-height: 20px
    }

    #snb .link_inquire .emph {
        display: block;
        padding-bottom: 1px;
        font-weight: 700;
        font-size: 14px
    }

    #snb:after {
        content: "";
        display: block;
        overflow: hidden;
        width: 100%;
        clear: both
    }

    *,
    *:after,
    *:before {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        margin: 0;
        padding: 0
    }
</style>

<div id="snb" class="snb_cc">
    <h2 class="tit_snb">고객센터</h2>
    <div class="inner_snb">
        <ul class="list_menu">
            <li>
                <a href="/board/faq_paging">공지사항</a>
            </li>
            <li>
                <a href="/board/qni_paging">자주하는 질문</a>
            </li>
            <li>
                <a href="/board/inquiry_paging">1:1 문의</a>
            </li>
        </ul>
    </div>
</div>