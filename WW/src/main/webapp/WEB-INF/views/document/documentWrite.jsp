<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />


<%@include file="../common/header.jsp"%>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
<style>
	#wriedTadle {
	  width: 600px;
	  margin: auto;
	  margin-top: 150px;
	}
	.wriedTadle th, td {
	  height: 40px;
	}
	
	.center{
	    width: 10%;
	}
	
	.side{
	    width: 40%;
	    padding-left: 5%;
	}
	
	.documentTextContent{
	    height: 300px;
	    padding: 3%;
	    vertical-align: top;
	}
	
	.separation{
	    height: 20px;
	}
	
	.title{
	    font-size: 0.9em;
	}
	
	.text_center{
	    text-align: center;
	}
	
	.button{
	    background-color: #2A3D72;
	    color: white;
	    
	    margin: 0;
	    padding: 0.5rem 1rem;
	    
	    font-family: 'Noto Sans KR', sans-serif;
	    font-size: 1rem;
	    font-weight: 400;
	    text-align: center;
	    text-decoration: none;
	    
	    border: none;
	    border-radius: 4px;
	    
	    display: inline-block;
	    width: auto;
	    
	    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
	    
	    cursor: pointer;
	    
	    transition: 0.5s;
	}
	
	.content_border{
	    border: 1px solid #aaaaaa;
	  background-color: rgb(255, 255, 255);
	}
	
	
	        #my_modal{
            display: none;
            background-color: rgb(255, 255, 255);
            width: 600px;
            border-radius: 15px;
            text-align: center;
        }
    
        .logout-button{
                white-space: nowrap;
                text-transform: uppercase;
                font-weight: 800;
                font-size: 0.8rem;
                text-align: center;
                display: block;
                padding: 0.5rem;
                margin: 0 0.5rem;
                color: white;
                background-color: #2A3D72;
                border-radius: 0.35rem;
            }
    
            .logout-button:hover {
                background-color: #b7c5eb;
                color: #2A3D72;
                text-decoration: none;
            }
    
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

            .board-list-body tr{
                height: 40px;
            }

            .board-list-body th{
                width: 100px;
            }


            .board-list-body td{
                width: 150px;
            }
            
            #tableId{
                display: block;
            }

            #example-table-1{
                height: 200px;
                display: block;
                overflow: auto;
            }
    
            #my_modal2{
                display: none;
                width: 600px;
                height: 350px;
                border-radius: 15px;
                background-color: rgb(255, 255, 255);
                text-align: center;
            }

            #ex1_Result2{
                height: 295px;
            }
            

</style>
                      
<!-- Begin Page Content -->
<div class="container-fluid">
<form action="${ pageContext.request.contextPath }/document/write" method="post"
				enctype="multipart/form-data">
		<!-- Page Heading -->
	<div class="h3 mb-4 text-gray-800 "> ?????? ?????? </div>

                    


                    <table id="wriedTadle">
                        <tr>
                            <td class="title" colspan="2">????????????</td>
                            <td class="center"></td>
                            <td colspan="2"></td>
                        </tr>

                        <tr>
                            <td class="side content_border" colspan="2"><input style="border:none;" name="writer" placeholder="?????????" value="<c:out value="${ loginMember.name }"/>" readonly></td>
                            <td></td>
                            <td class="side content_border" colspan="2"><input style="border:none;" name="deptTitle" placeholder="?????????" value="<c:out value="${ loginMember.deptCode }"/>" readonly></td>
                        </tr>

                        <tr>
                            <td colspan="5" class="separation"></td>
                        </tr>

                        <tr>
                            <td class="title" colspan="2">?????????</td>
                            <td></td>
                            <td colspan="2" ></td>
                        </tr>

                        <tr>
                            <td  class="side content_border" colspan="5" ><input style="width:550px;border:none;"  id="title" type="text" name="Doc_titile" placeholder="????????? ???????????????."></td>
                        </tr>

                        <tr>
                            <td colspan="5" class="separation"></td>
                        </tr>

                        <tr>
                            <td class="side" colspan="4" ><input type="file" name="upfile"></td>
                            <td class="text_center" ></td>
                        </tr>

                        <tr>
                            <td colspan="5" class="separation"></td>
                        </tr>

                        <tr>
                        	<td colspan="5" > <textarea cols="70" rows="15" id="content" type="text" name="doc_content" placeholder="????????? ???????????????."></textarea></td>
                        </tr>

                        <tr>
                            <td colspan="5" class="separation"></td>
                        </tr>

                        <tr>
                            <td  colspan="1"><button type="button" class="button" onclick="history.back(-1)" >??????</button></td>
                            <td  colspan="4"><button type="button" class="button" id="chatBot">???  ???</button></td>

                        </tr>
                    </table>
                    
                    
                    
                    
                    
                    
                    
                    
                    
        <div id="my_modal">
        <br>
        <div class="h3 mb-4 text-gray-800 "> ?????? ?????? </div>

            <table style="margin: 15px; width: 90%; margin-bottom: 20px;">
                <tr>
                    <td>
                        <div class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                             style="width: 100%;box-shadow: 0 0 3px #333 ; border-radius: 5px;">
                            <div class="input-group">
                                <input type="text" class="form-control bg-white border-0 " id="mykeyword" name="search" placeholder="??????">

                            </div>
                        </div>
                    </td>
             </tr>
        </table>







        <div id="board-list-container"
        style=" margin: auto; width: 90%; padding-bottom: 1px; text-align: center; box-shadow: 0 0 3px #333 ; border-radius: 15px; margin-bottom: 10px;">

    
            <table id="tableId" style="margin: auto; " >
                <thead style="background-color: #2A3D72; ">
                    <tr style="height: 50px; color: white;" >
                        <th style="border-top-left-radius: 15px; width: 100px;">??????</th>
                        <th style="width: 150px;">??????</th>
                        <th style="width: 150px;">?????????</th>
                        <th style="border-top-right-radius: 15px; width: 150px;">?????????</th>
                    </tr>
                </thead>

                <tbody class="board-list-body" id="example-table-1" >
					<c:forEach var="MemberMinList" items="${ MemberMinList }">
					    <tr onclick="javascript:modal('my_modal2')" >
					        <th><c:out value="${ MemberMinList.rownum }"/></th>
					        <td><c:out value="${ MemberMinList.emp_name }"/></td>
					        <td><c:out value="${ MemberMinList.dept_code }"/></td>
					        <td><c:out value="${ MemberMinList.job_code }"/></td>
					        <td hidden><c:out value="${ MemberMinList.emp_no}"/></td>
					    </tr>
					</c:forEach>
                </tbody>
                
            </table>



	</div>
        <button class="modal_close_btn" type="button" >??????</button>
        <br><br>
    </div>



    <div id="my_modal2">
        <div id="ex1_Result2">
            ?????????
 
        </div>
        <button type="button" class="modal_close_btn">??????</button>
        <button type="submit">??????</button>
        <input id="push" type="hidden" name="no">
    </div>

</form>    
</div>
	
	
<script>
    $(document).ready(function() {
        $("#mykeyword").keyup(function() {
            var value = $(this).val().toLowerCase();
            $("#example-table-1 tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
            // $("#myTable > tbody > tr").hide();
            // var temp = $("#myTable > tbody > tr > td:nth-child(5n+4):contains('" + value + "')");
            // $(temp).parent().show();
        });
    });
    </script>
    

<script> // ???????????? Row ????????? ??? ???????????? 
    $("#example-table-1 tr").click(function(){ 
        var str = "" ;
        var push = "" ;
        var tdArr = new Array(); 

        // ?????? ?????? 
        // ?????? ????????? Row(<tr>) 

        var tr = $(this);
        var td = tr.children(); 

        // tr.text()??? ????????? Row ??? tr??? ?????? ?????? ?????? ????????????. 
        console.log("????????? Row??? ?????? ????????? : "+tr.text()); 

        // ???????????? ???????????? ????????? ?????? ?????? ????????? ??? ??? ??????. 
        td.each(function(i){ tdArr.push(td.eq(i).text()); }); 
        console.log("????????? ?????? ??? : "+tdArr); 

        // td.eq(index)??? ?????? ?????? ????????? ?????? ??????. 

        var name = td.eq(1).text(); 
        var job_name = td.eq(2).text(); 
        var dept_name = td.eq(3).text(); 
        var no = td.eq(4).text(); //???????????? ???????????? ?????? ????????? ????????????
        str += " <font size = 6px>  ?????? ?????? " + "<br>" + "<br>" 
        + job_name + " " + name + " " + dept_name + "??????" + "<br>" + "????????? ?????????????????????????" + "<br>" + "<br>" 
        + "????????? : " + job_name + " " + name + " " + dept_name + "</font>"; 
		
        
        $("#push").attr("value",no);
        $("#ex1_Result2").html(str); }); 
    </script>



<script>
    function modal(id) {
        var zIndex = 9999;
        var modal = document.getElementById(id);
    
        // ?????? div ?????? ??????????????? ?????????
        var bg = document.createElement('div');
        bg.setStyle({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // ????????? ????????? ????????? ????????? ???
            backgroundColor: 'rgba(0,0,0,0.4)'
        });
        document.body.append(bg);
    
        // ?????? ?????? ??????, ????????? ???????????? ?????? div ?????????
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {

            bg.remove();
            modal.style.display = 'none';
        });
    
        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
    
            // ????????? ????????? ?????? ?????? ?????? ?????????
            zIndex: zIndex + 1,
    
            // div center ??????
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // Element ??? style ????????? ??????????????? ???????????? ?????? ??????
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };
    
    document.getElementById('chatBot').addEventListener('click', function() {
        // ????????? ?????????
        modal('my_modal');
    });

</script>
 
<%@include file="../common/footer.jsp"%>