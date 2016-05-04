<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template"
           prefix="template"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>

<%@ page import="java.util.ArrayList" %>
<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
    
     ArrayList calClmList=(ArrayList)request.getSession().getAttribute("AppCalClmList");
     ArrayList printClmList=(ArrayList)request.getSession().getAttribute("AppCalClmList");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title><bean:message key="prompt.Common.ApplicationTitle"/></title>
    <link type="text/css" rel="stylesheet" href="styles/boto.css"/>
    <link href="styles/menu_home.css" type="text/css" rel="stylesheet"></link>
    <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
    <link rel="stylesheet" type="text/css" media="all"
          href="js/skins/aqua/theme.css" title="Aqua"/>
    <script language="javascript" type="text/javascript" src="js/menu_home.js"></script>
    <script language="javascript" type="text/javascript"
            src="js/RegisterCategory.js"></script>
    <script type="text/javascript" src="js/calendar_inc.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/lang/calendar-en.js"></script>
     <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
    <script type="text/javascript" language="javascript"> 
     
     function vFindControl(elementRefa)
    {
  var curbut;
  var str_cntlVal;
  curbut= elementRefa.value;
  document.forms[0].operation.value=curbut
    }
    
    
 
    
   
        function  updateStatus(chkBoxID, indx){
       if(chkBoxID.status){
                 document.getElementById("printStatus"+indx).value="CHECKED";
                } 
             else
                 document.getElementById("printStatus"+indx).value=="";
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
  
     
     
     
      function showMessage(){
    
      if  (document.forms[0].allottedfundamount.value!="")
        {
        document.forms[0].trnapprove.disabled=false; 
         document.forms[0].button.disabled=false; 
         
        }
        else
        {
        document.forms[0].trnapprove.disabled=true; 
           document.forms[0].button.disabled=true; 
        }
          if (document.forms[0].result.value!="")
          {
          alert(document.forms[0].result.value);
          document.forms[0].result.value="";
          }
     document.forms[0].printbutton.disabled = false; 
    }
    
    
    
    
    
    
    
           modalWin = null;

 

function checkFocus()
{
//alert('window.navigator.userAgent.indexOf("Firefox") :' +window.navigator.userAgent.indexOf("Firefox"));
   if (window.navigator.userAgent.indexOf("Firefox")==-1)
    {
        if (modalWin!=null && !modalWin.closed)
        {
            self.blur();
            modalWin.focus();
        }
    }
    else{
        if (modalWin!=null && !modalWin.closed)
        {
            self.blur();
            //modalWin.focus();
        }
    }
    
}

     <% 
                                           if(printClmList!=null){
                                        
                                           
                                        %>  
                                          
     
      
     
                                
                                      
 function CallPrint()
    {
   
        var sOption="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
        sOption+="scrollbars=yes,width=850,height=700,left=100,top=25"; 
    
        var sWinHTML = document.getElementById('print').innerHTML; 
     
        var winprint=window.open("","",sOption); 
        winprint.document.open(); 
        winprint.document.write('<html><LINK  href=css/boto.css rel=Stylesheet><body>'); 
        winprint.document.write(sWinHTML);          
        winprint.document.write('</body></html>'); 
        winprint.document.close(); 
        winprint.focus(); 
    
    }
    
    <% 
                                          }
                                        %>     
  function showModalWindow(){
        var codeTxt;
        var descTxt;
        var vtfNo;
        var vtfComp;
        codeTxt='classificationcode';
        descTxt='classificationdesc';
        var vcomcat="OTHERS";   
        
        modalWin=showRegClasifiCode(535,360,"A",codeTxt,descTxt,vcomcat);
            
    } 
     </script>
  </head>
  <body onload="showMessage();" onfocus="checkFocus()"><html:form action="/ApproveClaimAppOthers.do?methodToCall=getApproveClaimAppOthers"
                   method="post">
     
                        <table width="100%" border="0" cellspacing="0"
                               cellpadding="1">
                          <tr>
                            <td valign="top" class="head_bgcolor"><bean:message key="ACPO.title"/></td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%"
                                     border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td valign="top" class="padding5px">
                                    <table width="100%" border="0"
                                           cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td valign="top">
                                          <table border="0"
                                                 class="details_table"
                                                 cellspacing="0"
                                                 cellpadding="0">
                                            <tr>
                                              <td>Details</td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td valign="top">
                                          <table class="field_table"
                                                 width="100%" border="0"
                                                 cellspacing="0"
                                                 cellpadding="0">
                                            <tr>
                                              <td valign="top">
                                                <table width="100%" border="0"
                                                       cellspacing="0"
                                                       cellpadding="0">
                                                  <tr>
                                                    <td valign="top">
                                                      <table width="100%"
                                                             border="0"
                                                             cellspacing="0"
                                                             cellpadding="3">
                                                        <tr>
                                                          <td width="120">
                                                            <bean:message key="ACPO.ClassificationCode"/>:
                                                            <span class="red12">*</span>
                                                          </td>
                                                          <td>
                                                            <table border="0"
                                                                   cellspacing="0"
                                                                   cellpadding="0">
                                                              <tr>
                                                                <td>
                                                                  <html:text property="classificationcode"
                                                                         name="ApproveClaimAppOthers"
                                                                         />
                                                                </td>
                                                                <td>
                                                                 <a href="#" onclick="showModalWindow()"><img src="images/list_img.jpg" border="0"></img></a>
                                                                </td>
                                                                </tr>
                                                            </table>
                                                          </td>
                                                          <td colspan="2" width="400">
                                                          <html:text property="classificationdesc"
                                                                         name="ApproveClaimAppOthers"
                                                                         readonly="true"
                                                                         style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:210px; "/>
                                                          </td>
                                                        </tr>
                                                        <tr>
                                                          <td><bean:message key="financial"/></td>
                                                          <td width="160">
                                                          <html:select property="finyear"
                                                                         name="ApproveClaimAppOthers" tabindex="5" style="width:145px;">
                                                            <html:options name="yearlist" labelName="yearlist" />
                                                            </html:select>
                                                              
                                                          </td>
                                                          <td colspan="2" width="300"> &nbsp; </td>
                                                         
                                                        </tr>
                                                        <tr>
                                                        <td><bean:message key="ACPO.AllottedFundAmount"/>:
                                                        </td>
                                                        <td><html:text property="allottedfundamount"
                                                                         name="ApproveClaimAppOthers"
                                                                         readonly="true"
                                                                         style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        </tr>
                                                        <tr>
                                                          <td colspan="4"
                                                              class="bordertop">
                                                            <table width="100%"
                                                                   border="0"
                                                                   cellspacing="0"
                                                                   cellpadding="3">
                                                              <tr>
                                                                <td class="mandatory"><bean:message key="Mandatory"/></td>
                                                                <td>
                                                                  <div align="right">
                                                                  
                                                                   <html:hidden property="operation"  name="ApproveClaimAppOthers"  value="add"/> 
                                                                   <html:hidden property="mode"  name="ApproveClaimAppOthers" />
                                                                 <html:hidden property="result"  name="ApproveClaimAppOthers" /> 
                                                                 
                                                   <html:submit  property="trnsearch" disabled="false"  onclick="vFindControl(this);" > Search </html:submit>
                                                    <html:submit  property="trnselall" disabled="false"  onclick="vFindControl(this);" > Select  All</html:submit>
                                                     <html:submit  property="trnreset" disabled="false"  onclick="vFindControl(this);" > Reset </html:submit>
                                                      <html:submit  property="trnapprove" disabled="false"  onclick="vFindControl(this);" > Approve </html:submit>
                                                   <html:submit property="button"  disabled="false" onclick="vFindControl(this);">Extend Claim Details</html:submit>  
                                                   <html:submit  property="trnclear" disabled="false"  onclick="vFindControl(this);" > Clear </html:submit>
                                                                 
                                                                  
                                                                    
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
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td valign="top" class="padding5px">
                                    <table width="100%" border="0"
                                           cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td valign="top">
                                        
                                        <% 
                                           if(calClmList!=null){
                                        %>
                                          <table border="0"
                                                 class="details_table"
                                                 cellspacing="0"
                                                 cellpadding="0">
                                            <tr>
                                              <td>Claims</td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td valign="top">
                                          <table class="field_table"
                                                 width="100%" border="0"
                                                 cellspacing="0"
                                                 cellpadding="0">
                                            <tr>
                                              <td valign="top"
                                                  class="padding5px">
                                                    <% int cnt=0;
                                     int indx=0;
                                     %> 
                                                <div id="Dgrid"
                                                     style="overflow:auto;height:170px"
                                                     align="left">
                                              <display:table name="AppCalClmList"
                                                requestURI="/ApproveClaimAppOthers.do?methodToCall=getApproveClaimAppOthers"
                                                               id="row"
                                                               class="dataTable"
                                                               defaultsort="1"
                                                               defaultorder="ascending"
                                                               pagesize="5"
                                                               cellspacing="0"
                                                               decorator="org.displaytag.decorator.TotalTableDecorator">
                                                  <display:column property="clmrefno"
                                                                  title="Claim Reg No"
                                                                  
                                                                  paramId="claimno"
                                                                  sortable="true" >
                                                   </display:column>
                                                  <display:column property="vtfregno"
                                                                  title="HRDF Reg No"
                                                                  sortable="true"/>
                                                  <display:column property="title"
                                                                  title="Title"
                                                                  sortable="true"/>
                                                 <display:column property="maxclaimableamt"
                                                                  title="Claim Amount"
                                                                 sortable="true"/>
                                                 <display:column property="approvedclaimamt"
                                                                  title="Approved Amount"
                                                                  sortable="true"/>
                                                   <display:column headerClass="tabel_header" title="Approve" style="width:1px;"><input class="input_check" type="checkbox" onClick="updateStatus(this,'<%=cnt %>')"  <bean:write name="row" property="approve"/> >   <input type="hidden" name="printStatus<%=cnt %>" value="<bean:write name="row" property="approve"/>" /></display:column>      
                          <display:column headerClass="tabel_header" title="Print" style="width:1px;">
                         <!-- <input class="printbutton" type="button" onClick="CallPrint()" value="Print Claim Certificate" disabled="true" > -->
                           <html:submit property="printbutton"   onclick="CallPrint();"  disabled="true">Print Claim Certificate </html:submit>  
                         
                          </display:column>     
                                                 
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
                                                
                                                  <% cnt++; %>
                                                </display:table>
                                                     </div>
                                              </td>
                                            </tr>
                                            <tr>
                                              <td valign="top"
                                                  class="padding5px">&nbsp;</td>
                                            </tr>
                                          </table>
                                          
                                          <%
                                             }
                                          
                                          %>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                     
                                        
                                      <tr>
                                      
                                     
              <!-- private String classificationcode;
    private String classificationdesc;
    private String allottedfundamount;
   
    private String vtfregno;
    private String clmrefno;
    private String title;
    private String approvedclaimamt;
    private String maxclaimableamt;
    private String classcode;
    private String clmstatus;
    private String result;
    private String finyear;
    private String approve;-->                        
                                      
                
  <td style="display: none;padding:20px" >
      <div id="print" style="display: none;" >
      <table  cellspacing="0" cellpadding="0" id="TblPrint" style="width:800px;border: 1px solid #000000;" border="0" align="center">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100" rowspan="3"><img src="images/bota_logo.jpg" alt="HRDC" /></td>
        <td><b> <div align="center">
                                <span class="nw_header_font">
                                  <bean:message key="VTFS"/>
                                </span>
                              </div></b></td>
      </tr>
      <tr>
        <td><div align="center"><Strong>Claim Certificate for Special Groups </strong></div></td>
      </tr>
      <tr>
        <td><div align="center"><Strong>(under Vocational Training(Reimbursement) Regulations Act SL_2008)</strong></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="3">
      <tr>
        <td width="85"><strong>Claimant:</strong></td>
        
        <td width="85">Vtfs No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</td>
        <td> <html:text property="vtfregno" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
        <td width="85">Vat No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</td>
        <td> <html:text property="vatregno" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</td>
        <td><html:text property="vtfCompName" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF;width:300px " /></td>
        <td>Claim Ref No&nbsp;&nbsp;&nbsp;:</td>
        <td><html:text property="claimrefno" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF;"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Address&nbsp;&nbsp;&nbsp;:</td>
        <td>
        <html:text property="pobox" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF;width:200px"/>
        <html:text property="city" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF;width:200px"/>
        <html:text property="pcountry" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF;width:200px"/></td>
        <td valign="top">Title of Claim&nbsp;&nbsp;&nbsp;:</td>
        <td valign="top"><html:text property="title" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF;"/></td>
      </tr>
      
     
      <tr>
    <td>&nbsp;</td>
  </tr>
      <tr>
        <td>Date of Claim&nbsp;&nbsp;&nbsp;&nbsp;:</td>
        <td><html:text property="claimdate" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="3">
      <tr>
       <td width="200">Classification Code</td>
        <td>:<html:text property="classificationdesc" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
       <!-- <td width="200">Annual Levy Paid(BWP)</td>
        <td>:<html:text property="txtTotalLevyPaid" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
      </tr>-->
      <tr>
        <td width="200">Claim Fy Year</td>
        <td>:<html:text property="finyear" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
        <td width="200">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
     <!-- <tr>
       <td width="200">Annual Turnover(BWP)</td>
        <td>:<html:text property="txtTurnOver" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
        <td width="200">Annual Levy Paid(BWP)</td>
        <td>:<html:text property="txtTotalLevyPaid" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
      </tr>-->
      <tr>
        <td>Total Training Costs Claimed(BWP)</td>
        <td>:<html:text property="maxclaimableamt" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
        <td>Amount Approved(BWP)</td>
        <td>:<html:text property="approvedclaimamt" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
        <td>(upto Previous Claim)</td>
        <td>&nbsp;</td>
        <td>(upto Previous Claim)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <!--<td>Levy Amount Eligible for Claim(BWP)</td>
        <td>:<html:text property="txtMaxClmAmt" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>-->
        <td>Actual Amount(BWP)</td>
        <td>:<html:text property="maxclaimableamt" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table  style="width:800px;border: 1px solid #000000;" cellspacing="0" cellpadding="3">
      <!--<tr>
        <td width="320" >Credit Available to Claimant from Previous claims(BWP)</td>
        <td>:<html:text property="creditavail" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
        <td>Amount Owed by Claimant from Previous claims(BWP)</td>
        <td>:<html:text property="amtowned" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
      </tr>-->
      <tr>
        <td>Claim Approved (BWP)</td>
        <td>:<html:text property="approvedclaimamt" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="border-top: 1px solid #000000; ">Total Amount payable for this claim(BWP): <html:text property="approvedclaimamt" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF"/></td>
  </tr>
  <tr>
    <td style="border-top: 1px solid #000000; ">&nbsp;</td>
  </tr>
 <tr>
    <td>&nbsp;</td>
   
  </tr>
  <tr>
    <td><table  style="width:800px;border: 1px solid #000000;"  cellspacing="0" cellpadding="3">
      <tr>
        <td width="85" style="border: 1px solid #000000">&nbsp;</td>
        <td width="150" style="border: 1px solid #000000">Prepared by</td>
        <td width="150" style="border: 1px solid #000000">Checked by</td>
        <td width="150" style="border: 1px solid #000000">Approved by</td>
        <td width="150" style="border: 1px solid #000000"> &nbsp;</td>
        <td width="150" style="border: 1px solid #000000">&nbsp;</td>
      </tr>
      <tr>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">Signature</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-top: 1px solid #000000;">&nbsp;</td>
      </tr>
      <tr>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">Designation</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
         <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
          <td style="border-top: 1px solid #000000;">&nbsp;</td>
      </tr>
      <tr>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">Date:</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
         <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-top: 1px solid #000000;">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="border-top: 1px solid #000000; ">Remarks: <html:textarea  property="remarks" readonly="true" name="ApproveClaimAppOthers"  style="border: 1px solid #FFFFFF" cols="100" rows="4"/></td>
  </tr>
    <td>&nbsp;</td>
  </tr>
</table>   
    
     <table> 
     <div class="centeraln" style="padding-top:3%"  >
        <style type="text/css" media="print">
        .printbutton {
        visibility: hidden;
        display: none;
        }
        
        </style>
        <input type="button" value="Print" align="middle"  class="printbutton" onclick="window.print()";/>
      
        </div>
       </table>
  
      </div>
      </td>
      </tr>
    </html:form></body>
                      
   
</html>
                   
    