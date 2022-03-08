<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${ pageContext.request.contextPath }" /><%@ taglib
	uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

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

        .board-list-body tr:hover, .listButton:hover {
            background-color: #2A3D72;
            color: white;
            cursor:pointer;
        }

    </style>
    
<!-- Begin Page Content -->
<div class="container-fluid">


                    <!-- Page Heading -->

                    <div class="h3 mb-4 text-gray-800 "> 문서 검색 </div>


                    <table style="width: 100%; ; margin-bottom: 20px;">

                        <tr>
                            <td>
                                <select>
                                <select onchange="window.open(value,'_self')">
                                    <option value="10">10개씩</option>
                                    <option value="20">20개씩</option>
                                    <option value="30">30개씩</option>
                                    <option value="40">40개씩</option>
                                    <option value="50">50개씩</option>
                                </select>
                            </td>
                            <td style="width: 10%;">
                                <select>
                                    <option value="DOC_ID">번호</option>
                                    <option value="DOC_TITLE">제목</option>
                                    <option value="EMP_NO">발신자</option>
                                    <option value="LINK_ID">수신자</option>
                                    <option value="DOC_DATE">작성일</option>
                                    <option value="ATTACH_NUM">첨부파일</option>
                                    <option value="DOC_STATUS">처리상황</option>
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
                                        <th>제목</th>
                                        <th>발신자</th>
                                        <th>수신자</th>
                                        <th>작성일</th>
                                        <th>첨부파일</th>
                                        <th style="border-top-right-radius: 15px;">처리상황</th>
                                    </tr>
                                </thead>
    
                                <tbody class="board-list-body">
                                    <tr onclick="location.href='www.naver.com'" >
                                        <td>01</td>
                                        <td>연말 보고서</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td>pdf</td>
                                        <td>처리 대기중</td>
                                    </tr>
        
                                    <tr>
                                        <td>02</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>03</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>04</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>05</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>06</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>07</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>08</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>09</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>10</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>11</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>12</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>13</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>14</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>15</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>16</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>17</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>18</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>19</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>

                                    <tr>
                                        <td>20</td>
                                        <td>연말 121343465</td>
                                        <td>김대리</td>
                                        <td>이부장</td>
                                        <td>22.02.14</td>
                                        <td></td>
                                        <td>처리 대기중</td>
                                    </tr>
									<c:if test="${ empty documentLest }">			
										<tr>
											<td colspan="7">
												조회된 문서가 없습니다.
											</td>
										</tr>	
									</c:if>
									
									<c:if test="${ !empty documentList }">
										<c:forEach var="document" items="${ documentList }">
		                                    <tr onclick="location.href='www.naver.com'" >
		                                        <td>${ document.no }</td>
		                                        <td>${ document.title }</td>
		                                        <td>${ document.writer }</td>
		                                        <td>${ document.reader }</td>
		                                        <td>${ document.writ_date }</td>
		                                        <td>${ document.type }</td>
		                                        <td>${ document.doc_status }</td>
		                                    </tr>
	                                    </c:forEach>
	        						</c:if>
                                </tbody>
    
                            </table>


                            <table  style="margin: 15px; text-align: center; margin-left: auto;">
                                <tr>
                                    <td style="
                                    border-top-left-radius: 10px; border-bottom-left-radius: 10px;
                                	<!-- 처음 페이지로 -->
                                    <td 
                                    onclick="location.href='${ path }/document/list?page=1'"
                                    style="border-top-left-radius: 10px; border-bottom-left-radius: 10px;
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

                                    > &lt;&lt; </td>
									
									<!-- 이전 페이지로 -->
                                    <td class="listButton" onclick="location.href='${ path }/document/list?page=${ pageInfo.prevPage }'"> &lt; </td>
									
									<!--  10개 페이지 목록 -->
									<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">
									<td class="listButton">선택</td>
									</c:if>
                                    
                                    <c:if test="${ status.current != pageInfo.currentPage }">
                                    <td class= "listButton" onclick="location.href='${ path }/document/list?page=${ status.current }&count=${ pageInfo.listLimit }'">${ status.current }</td>
                                    </c:if>
                                    </c:forEach>
                                    
                                    <!-- 다음 페이지로 -->
                                    <td class="listButton" onclick="location.href='${ path }/document/list?page=${ pageInfo.nextPage }'">&gt;</td>
									
									<!-- 마지막 페이지로 -->
                                    <td 
                                    onclick="location.href='페이지 주소'"
                                    style="
                                    border-top-right-radius: 10px; border-bottom-right-radius: 10px;
                                    onclick="location.href='${ path }/board/list?page=${ pageInfo.maxPage }'"
                                    style="border-top-right-radius: 10px; border-bottom-right-radius: 10px;
                                    box-shadow: 0px 1px 1px rgb(202, 202, 202),0px -1px 1px rgb(202, 202, 202), 1px 0px 1px rgb(202, 202, 202)  ;"
                                    class="listButton">&gt;&gt;</td>
                                    
                                </tr>
                            </table>

                        </div>

</div>
<%@include file="../common/footer.jsp" %>