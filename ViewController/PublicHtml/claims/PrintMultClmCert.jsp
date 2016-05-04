<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ page import="com.vtfs.util.VTFSFileReader,com.vtfs.dto.claims.ClaimAppVO,java.util.ArrayList,com.vtfs.util.VTFSLogger"%>

<%
   
         String printStr=(String)request.getSession().getAttribute("printStr");  
        
         String ModeType=(String)request.getAttribute("ModeType");  
        ArrayList printMutliClaimList=(ArrayList)request.getSession().getAttribute("printMutliClaimList");
        ArrayList ReprintMutliClaimList=(ArrayList)request.getSession().getAttribute("ReprintMutliClaimList");
         
%>


<html>
<head>
	<title>Print Multiple Claim Certificates</title>
        
	 <link type="text/css" rel="stylesheet" href="css/boto.css"/>
    
     <link href="styles/menu_home.css" type="text/css" rel="stylesheet"></link>
     <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
     <link rel="stylesheet" type="text/css" media="all" href="js/skins/aqua/theme.css" title="Aqua" />
     <script language="javascript" type="text/javascript" src="js/menu_home.js"></script>
     <script language="javascript" type="text/javascript" src="js/RegisterCategory.js"></script>
     <script type="text/javascript" src="js/calendar_inc.js"></script>
     <script type="text/javascript" src="js/calendar.js"></script>
     <script type="text/javascript" src="js/lang/calendar-en.js"></script>
	
         <script type="text/javascript">
        
          function selectALL(){ 
               document.forms[0].actionMode.value="SELECTALL";
               document.forms[0].submit();
                       
           }
                     
          function callReset(){ 
               document.forms[0].actionMode.value="RESET";
               document.forms[0].submit();
               
             }
             
             
               function callGenerate(){ 
                 document.forms[0].actionMode.value="GENERATE";
                 document.forms[0].submit();
               
               }
             var sWinHTML="";
        
           function callPrint(){ 
              
                    var sOption="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
                    sOption+="scrollbars=yes,width=900,height=900,left=100,top=25"; 
                
                    sWinHTML = "<%= printStr %>";
                    if(sWinHTML!=""){
                        var winprint=window.open("","",sOption); 
                        winprint.document.open(); 
                        winprint.document.write('<html><LINK  href=css/boto.css rel=Stylesheet><body >'); 
                              
                        winprint.document.write('<style type="text/css" media="print">'+
                            '.printbutton {'+
                            'visibility: hidden;'+
                            'display: none;'+
                            '}'+
                            '</style><br><table style="width:800;text-align:right;"  > <tr><td><input align="right" type="button" ' +
                            'onClick="window.print()" '+
                            'class="printbutton"' +
                            'value="Print"/><br><br></td></tr></table>');
                        
                         winprint.document.write(sWinHTML);   
                       
                        winprint.document.write('</body></html>'); 
                        winprint.document.close(); 
                        winprint.focus(); 
                        sWinHTML="";
                   }else{
                   
                   alert("No record selected");
                   }
                   
              
             }
         
            function init(){
          
             
                if("<%=ModeType %>"=="GENERATE"){
               
                  callPrint();
         
                }
            var curbut;
        curbut=document.forms[0].curtab.value ;
       
            if (curbut=="N")
            {
            document.getElementById('tblNewPrint').style.display = 'block'
            document.getElementById('tblRePrint').style.display = 'none'
            document.getElementById('rd1').checked=true;
            }
            else if (curbut=="R")
            {
            document.getElementById('tblNewPrint').style.display = 'none'
            document.getElementById('tblRePrint').style.display = 'block'
            document.getElementById('rd2').checked=true;
            }
            else
            {
            document.getElementById('tblNewPrint').style.display = 'block'
            document.getElementById('tblRePrint').style.display = 'none'
            }
            
         }
             
           function  updateStatus(chkBoxID, indx){
        
                 if(chkBoxID.status){
                         document.getElementById("printStatus"+indx).value="CHECKED";
                     } 
                 else
                      document.getElementById("printStatus"+indx).value="";
              } 
   
     function  updateStatusR(chkBoxID, indx){
        
                 if(chkBoxID.status){
                         document.getElementById("printStatusR"+indx).value="CHECKED";
                     } 
                 else
                      document.getElementById("printStatusR"+indx).value="";
              } 
   
             function ajaxFunc()
             {
                var xmlHttp;
                try
                  {
                  // Firefox, Opera 8.0+, Safari
                  xmlHttp=new XMLHttpRequest();
                  }
                catch (e)
                  {
                  // Internet Explorer
                  try
                    {
                    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                    }
                  catch (e)
                    {
                    try
                      {
                      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                      }
                    catch (e)
                      {
                      alert("Your browser does not support AJAX!");
                      return false;
                      }
                    }
                  }
                
                  xmlHttp.onreadystatechange=function()
                    {
                    if(xmlHttp.readyState==4)
                      {
                     
                       // document.getElementById('print').innerHTML =xmlHttp.responseText;
                       alert("xmlHttp.responseText==="+xmlHttp.responseText);
                       sWinHTML = xmlHttp.responseText;
                   
                      }
                    }
                  xmlHttp.open("GET","claims/printTemplate.jsp",true);
                  xmlHttp.send(null);
                 
                   
              }
  
   
           </script>
        
        <script type="text/javascript" >
        function radiochange(rdclick)
{
var curbut;
curbut= rdclick.value;

    if (curbut=="N")
    {
    document.getElementById('tblNewPrint').style.display = 'block';
    document.getElementById('tblRePrint').style.display = 'none';
    document.forms[0].curtab.value="N";
    
    }
    else if (curbut=="R")
    {
    document.getElementById('tblNewPrint').style.display = 'none';
    document.getElementById('tblRePrint').style.display = 'block';
    document.forms[0].curtab.value="R";
    
    }
    else
    {
    document.getElementById('tblNewPrint').style.display = 'block';
    document.getElementById('tblRePrint').style.display = 'none';
    
    }

}
        </script>
</head>
<body onload="init()">


<html:form action="printClaimCertVat.do?methodToCall=getMultiClaimCertDetails" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="1">
              <tr>
                <td valign="top" class="head_bgcolor">Print Multiple Claim Certificates</td>
              </tr>
              <tr>
                <td valign="top" class="padding5px">
                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td valign="top"><table border="0" class="details_table" cellspacing="0" cellpadding="0">
                              <tr>
                                <td>List</td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td valign="top"><table class="field_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                              <td align="center">
                               <input type="radio" id="rd1" name="rd1" checked value="N" onclick="radiochange(this);"/>Print
                                  
                                  <input type="radio" id="rd2" name="rd1"  value="R" onclick="radiochange(this);"/>Re-print
                              </td>
                              </tr>
                              <tr>
                                <td valign="top" style="padding:5px;">
                                
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                     <% int cnt=0;
                                     int indx=0;
                                   
                                     %>
                                      <td valign="top">
                                      
                                      <table id="tblNewPrint" width="100%" border="0" cellpadding="0" cellspacing="0">
                                          <tr>    
                                          <td>
                                          <div id="DGrid" style="overflow:auto;height;450px " > 
                                           <display:table  name="${printMutliClaimList}" cellpadding="3" cellspacing="0" class="dataTable" requestURI="/printClaimCertVat.do?methodToCall=PrintMultipleClaimCertificates" id="printClaimVO" >
                                           
                                           
                                               <display:column headerClass="tabel_header" title="&nbsp;Name of employeer"  property="vtfcompname"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;HRDF Reg No"  property="vtfregno"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;Claim No."  property="clmrefnum"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;Date of Submission"  property="clmdate"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;Amount Claimed"  property="totalTrainCostApprv"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;Amount Approved"  property="totalClmAmtAprv"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;Claim Amount"  property="totalAmtPayable"/>
                                               
                                               <display:column headerClass="tabel_header" title="Print"><input class="input_check" type="checkbox" onClick="updateStatus(this,'<%=cnt %>')"  <bean:write name="printClaimVO" property="print"/> >   <input type="hidden" name="printStatus<%=cnt %>" value="<bean:write name="printClaimVO" property="print"/>" /></display:column>
                                                 
                                               <% cnt++; %>
                                               <display:setProperty name="paging.banner.placement" value="bottom"  /> 
                                                    <display:setProperty name="paging.banner.some_items_found" value='<span class="pagebanner">Records {2} to {3} of {0}</span>'  /> 
                                                    <display:setProperty name="paging.banner.full">
                                                <span class="pagelinks" style="padding-left:75px;"><a href="{1}"><img src="images/back_last.jpg" border="0" /></a>&nbsp;<a href="{2}"><img src="images/back_btn.jpg" border="0" /></a>&nbsp;<a href="{3}"><img src="images/next_btn.jpg" border="0" /></a>&nbsp;<a
                                                href="{4}"><img src="images/next_last.jpg" border="0" /></a></span>
                                                </display:setProperty>                                                                        
                                                <display:setProperty name="paging.banner.first">
                                                <span class="pagelinks" style="padding-left:75px;"><img src="images/back_last.jpg" border="0" />&nbsp;<img src="images/back_btn.jpg" border="0" /><a
                                                href="{3}">&nbsp;<img src="images/next_btn.jpg" border="0" /></a>&nbsp;<a href="{4}"><img src="images/next_last.jpg" border="0" /></a>
                                                </span>
                                                </display:setProperty>                                                                        
                                                <display:setProperty name="paging.banner.last">
                                                <span class="pagelinks" style="padding-left:75px;"><a
                                                href="{1}"><img src="images/back_last.jpg" border="0" /></a><a href="{2}">&nbsp;<img src="images/back_btn.jpg" border="0" /></a>&nbsp;<img src="images/next_btn.jpg" border="0" />&nbsp;<img src="images/next_last.jpg" border="0" /> </span>
                                              </display:setProperty>
                    
                                       </display:table>
                                      </div>
                                       <td>
                                       </tr>
                                   
                                          <tr>
                                            <td colspan="6" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td width="150" valign="top">&nbsp;</td>
                                                  <td valign="top"><table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
                                                      <tr>
                                                 <!--       <td><div align="center"><img src="images/back_last.jpg" /> <img src="images/back_btn.jpg" /> <img src="images/next_btn.jpg" /> <img src="images/next_last.jpg" /></div></td> -->
                                                      </tr>
                                                  </table></td>
                                              <!--    <td width="150" valign="top" class="padding_right10"><div align="right">Records 1 to 2 of 2</div></td>  -->
                                                </tr>
                                            </table></td>
                                          </tr>
                                      </table>
                                      
                                       <table id="tblRePrint" width="100%" border="0" cellpadding="0" cellspacing="1" style="display:none;">
                                          <tr>
                                           <% 
                                     int rcnt=0;
                                     int rindx=0;
                                     %>
                                          <td>
                                          <div id="DREGrid" style="overflow:auto;height;450px " > 
                                               <display:table  name="${ReprintMutliClaimList}" cellpadding="3" cellspacing="0" class="dataTable" requestURI="/printClaimCertVat.do?methodToCall=PrintMultipleClaimCertificates" id="printClaimVO" >
                                           
                                           
                                               <display:column headerClass="tabel_header" title="&nbsp;Name of employeer"  property="vtfcompname"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;HRDF Reg No"  property="vtfregno"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;Claim No."  property="clmrefnum"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;Date of Submission"  property="clmdate"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;Amount Claimed"  property="totalTrainCostApprv"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;Amount Approved"  property="totalClmAmtAprv"/>
                                                <display:column headerClass="tabel_header" title="&nbsp;Claim Amount"  property="totalAmtPayable"/>
                                               
                                               <display:column headerClass="tabel_header" title="Print"><input class="input_check" type="checkbox"  onClick="updateStatusR(this,'<%=rcnt %>')"  <bean:write name="printClaimVO" property="print"/> >   <input type="hidden" name="printStatusR<%=rcnt %>" value="<bean:write name="printClaimVO" property="print"/>" /></display:column>
                                                 
                                               <% rcnt++; %>
                                               <display:setProperty name="paging.banner.placement" value="bottom"  /> 
                                                    <display:setProperty name="paging.banner.some_items_found" value='<span class="pagebanner">Records {2} to {3} of {0}</span>'  /> 
                                                    <display:setProperty name="paging.banner.full">
                                                <span class="pagelinks" style="padding-left:75px;"><a href="{1}"><img src="images/back_last.jpg" border="0" /></a>&nbsp;<a href="{2}"><img src="images/back_btn.jpg" border="0" /></a>&nbsp;<a href="{3}"><img src="images/next_btn.jpg" border="0" /></a>&nbsp;<a
                                                href="{4}"><img src="images/next_last.jpg" border="0" /></a></span>
                                                </display:setProperty>                                                                        
                                                <display:setProperty name="paging.banner.first">
                                                <span class="pagelinks" style="padding-left:75px;"><img src="images/back_last.jpg" border="0" />&nbsp;<img src="images/back_btn.jpg" border="0" /><a
                                                href="{3}">&nbsp;<img src="images/next_btn.jpg" border="0" /></a>&nbsp;<a href="{4}"><img src="images/next_last.jpg" border="0" /></a>
                                                </span>
                                                </display:setProperty>                                                                        
                                                <display:setProperty name="paging.banner.last">
                                                <span class="pagelinks" style="padding-left:75px;"><a
                                                href="{1}"><img src="images/back_last.jpg" border="0" /></a><a href="{2}">&nbsp;<img src="images/back_btn.jpg" border="0" /></a>&nbsp;<img src="images/next_btn.jpg" border="0" />&nbsp;<img src="images/next_last.jpg" border="0" /> </span>
                                              </display:setProperty>
                                       </display:table>
                                     </div>
                                       <td>
                                       </tr>
                                   
                                          <tr>
                                            <td colspan="6" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td width="150" valign="top">&nbsp;</td>
                                                  <td valign="top"><table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
                                                      <tr>
                                                 <!--       <td><div align="center"><img src="images/back_last.jpg" /> <img src="images/back_btn.jpg" /> <img src="images/next_btn.jpg" /> <img src="images/next_last.jpg" /></div></td> -->
                                                      </tr>
                                                  </table></td>
                                              <!--    <td width="150" valign="top" class="padding_right10"><div align="right">Records 1 to 2 of 2</div></td>  -->
                                                </tr>
                                            </table></td>
                                          </tr>
                                      </table>
                                      
                                      </td>
                                    </tr>
                                </table></td>
                              </tr>
                              <tr>
                                <td valign="top" class="padding5px"><div align="right">
                                <table>
                                <tr>
                                <td>
                                  <input type="button" value="Select All" onClick="selectALL()"/>
                                   <input type="hidden" name="actionMode"  />
                                   </td>
                                  
                                  <!--   <input type="submit" name="button2" id="button2" value="Select All" class="btn" />  -->
                                   <td>
                                    <input type="button"  value="Reset" onClick="callReset()" />
                                    </td>
                                   
                                    <td>
                                    <input type="button"  value="Generate" onClick="callGenerate()"/>
                                     <html:hidden property="curtab"  name="printClaimCertVat" /> 
                                    </td>
                                    </tr>
                                    </table>
                                    </div>
                               </td>
                              </tr>
                          </table>
                         
                          
                          </td>
                        </tr>
                    </table>
                </td>
              </tr>
            </table>
            
    


</html:form>

	
</body>
</html>