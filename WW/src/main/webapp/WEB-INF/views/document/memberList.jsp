<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${ pageContext.request.contextPath }" /><%@ taglib
	uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@include file="../common/header.jsp"%>

    <style>
        .profile-nav{
            white-space: nowrap;
            text-transform: uppercase;
            font-weight: 800;
            font-size: 0.8rem;
            text-align: center;
            display: block;
            padding: 0.5rem;
            margin: 0 0.5rem;
            color: #3a3b45;
            border-radius: 0.35rem;
        }

        .profile-nav:hover {
            background-color: #eaecf4;
            color: #3a3b45;
            text-decoration: none;
        }

        .bg-base-color {background-color: #2A3D72;}

        .listButton{
            width: 30px; height: 30px;
            font-size: 14px; color:#2A3D72;
            box-shadow: 0px 1px 1px rgb(202, 202, 202),0px -1px 1px rgb(202, 202, 202);
        }

        .listButton:hover {
            background-color: #2A3D72;
            color: white;
            cursor:pointer;
        }

    </style>
    
<!-- Begin Page Content -->
<div class="container-fluid">

                        <!-- Page Heading -->

                    <div class="h3 mb-4 text-gray-800 "> 사원 검색 </div>


                    <table style="width: 100%; ; margin-bottom: 20px;">

                        <tr>
                            <td>
                                <select>
                                    <option value="10">10개씩</option>
                                    <option value="20">20개씩</option>
                                    <option value="30">30개씩</option>
                                    <option value="40">40개씩</option>
                                    <option value="50">50개씩</option>
                                </select>
                            </td>
                            <td style="width: 10%;">
                                <select>
                                    <option value="">번호</option>
                                    <option value="">사원번호</option>
                                    <option value="">부서</option>
                                    <option value="">직급</option>
                                    <option value="">전화번호</option>
                                    <option value="">이메일</option>
                                </select>
                            </td>
                            <td>
                                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="width: 97%;">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-white border-0 " placeholder="검색">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    </table>





                        <div id="board-list-container"
                        style="padding-bottom: 1px; text-align: center; box-shadow: 0 0 3px #333 ; border-radius: 15px;">
    
                    
                            <table style="margin: auto; width: 100%; ">
                                <thead style="background-color: #2A3D72; ">
                                    <tr style="height: 50px; color: white;" >
                                        <th style="border-top-left-radius: 15px;">번호</th>
                                        <th>사원번호</th>
                                        <th>부서</th>
                                        <th>직급</th>
                                        <th>전화번호</th>
                                        <th style="border-top-right-radius: 15px;">이메일</th>
                                    </tr>
                                </thead>
    
                                <tbody class="board-list-body">
                                    <tr>
                                        <td>01</td>
                                        <td>0101</td>
                                        <td>영업 1부</td>
                                        <td>부장</td>
                                        <td>070-1234-5678</td>
                                        <td>부장@1234com</td>
                                    </tr>
        
                                    <tr>
                                        <td>02</td>
                                        <td>0101</td>
                                        <td>영업 1부</td>
                                        <td>부장</td>
                                        <td>070-1234-5678</td>
                                        <td>부장@1234com</td>
                                    </tr>
        
                                    <tr>
                                        <td>03</td>
                                        <td>0101</td>
                                        <td>영업 1부</td>
                                        <td>부장</td>
                                        <td>070-1234-5678</td>
                                        <td>부장@1234com</td>
                                    </tr>
        
                                    <tr>
                                        <td>04</td>
                                        <td>0101</td>
                                        <td>영업 1부</td>
                                        <td>부장</td>
                                        <td>070-1234-5678</td>
                                        <td>부장@1234com</td>
                                    </tr>
        
                                    <tr>
                                        <td>05</td>
                                        <td>0101</td>
                                        <td>영업 1부</td>
                                        <td>부장</td>
                                        <td>070-1234-5678</td>
                                        <td>부장@1234com</td>
                                    </tr>
        
                                    <tr>
                                        <td>06</td>
                                        <td>0101</td>
                                        <td>영업 1부</td>
                                        <td>부장</td>
                                        <td>070-1234-5678</td>
                                        <td>부장@1234com</td>
                                    </tr>
        
                                    <tr>
                                        <td>07</td>
                                        <td>0101</td>
                                        <td>영업 1부</td>
                                        <td>부장</td>
                                        <td>070-1234-5678</td>
                                        <td>부장@1234com</td>
                                    </tr>
        
                                    <tr>
                                        <td>08</td>
                                        <td>0101</td>
                                        <td>영업 1부</td>
                                        <td>부장</td>
                                        <td>070-1234-5678</td>
                                        <td>부장@1234com</td>
                                    </tr>
        
                                    <tr>
                                        <td>09</td>
                                        <td>0101</td>
                                        <td>영업 1부</td>
                                        <td>부장</td>
                                        <td>070-1234-5678</td>
                                        <td>부장@1234com</td>
                                    </tr>
        
                                    <tr>
                                        <td>10</td>
                                        <td>0101</td>
                                        <td>영업 1부</td>
                                        <td>부장</td>
                                        <td>070-1234-5678</td>
                                        <td>부장@1234com</td>
                                    </tr>
        
                                </tbody>
    
                            </table>
                            

                            <table  style="margin: 15px; text-align: center; margin-left: auto;">
                                <tr>
                                    <td style="
                                    border-top-left-radius: 10px; border-bottom-left-radius: 10px;
                                    box-shadow: 0px 1px 1px rgb(202, 202, 202),0px -1px 1px rgb(202, 202, 202), -1px 0px 1px rgb(202, 202, 202)  ;"
                                    class="listButton"
                                    > &lt; </td>

                                    <td class="listButton"> &lt;&lt; </td>
                                    <td class="listButton"> 1 </td>
                                    <td class="listButton">2</td>
                                    <td class="listButton">3</td>
                                    <td class="listButton">4</td>
                                    <td class="listButton">5</td>
                                    <td class="listButton">&gt;</td>

                                    <td 
                                    onclick="location.href='페이지 주소'"
                                    style="
                                    border-top-right-radius: 10px; border-bottom-right-radius: 10px;
                                    box-shadow: 0px 1px 1px rgb(202, 202, 202),0px -1px 1px rgb(202, 202, 202), 1px 0px 1px rgb(202, 202, 202)  ;"
                                    class="listButton">&gt;&gt;</td>
                                </tr>
                            </table>

                        </div>
    

</div>
<%@include file="../common/footer.jsp" %>