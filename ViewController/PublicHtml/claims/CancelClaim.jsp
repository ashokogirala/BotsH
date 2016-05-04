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
<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>
      <bean:message key="prompt.Common.ApplicationTitle"/>
    </title>
    <link type="text/css" rel="stylesheet" href="styles/boto.css"/>
     <link href="styles/menu_home.css" type="text/css" rel="stylesheet"></link>
      <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
      <link rel="stylesheet" type="text/css" media="all" href="js/skins/aqua/theme.css" title="Aqua" />
     <script language="javascript" type="text/javascript" src="js/menu_home.js"></script>
     <script language="javascript" type="text/javascript" src="js/RegisterCategory.js"></script>
     <script type="text/javascript" src="js/calendar_inc.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/lang/calendar-en.js"></script>
     <script type="text/javascript" language="javascript"> 
       function onClaimLoad(){
   // alert("document.forms[1].curTabNew.value==="+document.forms[1].curTabNew.value);
     checkClearData();       
        if (!(document.forms[0].title.value==""))
         {
         document.forms[1].clmrefno.value=document.forms[0].claimrefno.value;
       
         }else{
         document.forms[1].clmrefno.value="";
         
         }
/*if (document.forms[1].txtTotalBenefit.value!="")
   {   
        if(document.forms[1].txtMaxClmAmt.value==""){
          document.forms[1].trncalculate.disabled=false;
         }else{
          document.forms[1].trncalculate.disabled=true;
       }
  }else{
   document.forms[1].trncalculate.disabled=false;
   }
  */


  
   var calMaxClear='<%=request.getAttribute("CalculateMaxClear") %>';
   if(calMaxClear=="CalculateMaxClear"){
    document.forms[0].claimrefno.value="";
    document.forms[0].title.value="";
    document.forms[0].status.value="";
    document.forms[0].statusdate.value="";
    document.forms[0].vtfRegNum.value="";
    document.forms[0].vtfCompName.value="";
    document.forms[0].claimdate.value="";
    document.forms[0].finyear.value="";
    document.forms[0].vatregno.value="";
    document.forms[0].poboxno.value="";
    document.forms[0].companyregno.value="";
    document.forms[0].city.value="";
    document.forms[0].classification.value="";
    document.forms[0].country.value="";
     document.forms[1].txtClaimRefNum.value="";
    document.forms[1].clmrefno.value="";
     document.forms[1].txtTotalLevyPaid.value="";
    document.forms[1].txtActClmAmt.value="";
    document.forms[1].txtAppTrngCst.value="";
    document.forms[1].txtMaxClmAmt.value="";
    document.forms[1].txtTotalBenefit.value="";
    document.forms[1].txtPenReason.value="";
     document.forms[1].txtTurnOver.value="";
    
    
    
   }
 
     var calMaxAmtStatus='<%=request.getAttribute("calMaxAmountStatus") %>';
        var result='<%=request.getAttribute("result") %>';
     
     if(result=='SUCCESS'){
     
       document.forms[0].status.value="Cancelled";
       alert("Claim Cancelled successfully")
     }
       if(result=='FAIL'){
     
      // document.forms[0].status.value="Cancelled";
       alert("Cannot Cancel Approved claim")
     }
     
     
   /*  var processResult= '<%=request.getAttribute("ProcessResult") %>' ;
      
     
      if(processResult=="PROCESS_SUCCESS"){
         alert("Training cost verified and processed successfully.")
         document.forms[1].cstprocess.disabled=true;   
      }
   if(processResult=="PROCESS_FAIL"){
         alert("Training cost verification process failed.")
         document.forms[1].cstprocess.disabled=true; 
      }
     */
     
     
        
     
     
     
     
     
  }
   
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
  
     function vFindControl(elementRefa)
    {
  var curbut;
  var str_cntlVal;
  curbut= elementRefa.value;
  document.forms[1].operation.value=curbut
   if(curbut=='Clear'){
   
    document.forms[0].claimrefno.value="";
    document.forms[0].title.value="";
    document.forms[0].status.value="";
    document.forms[0].statusdate.value="";
    document.forms[0].vtfRegNum.value="";
    document.forms[0].vtfCompName.value="";
    document.forms[0].claimdate.value="";
    document.forms[0].finyear.value="";
    document.forms[0].vatregno.value="";
    document.forms[0].poboxno.value="";
    document.forms[0].companyregno.value="";
    document.forms[0].city.value="";
    document.forms[0].classification.value="";
    document.forms[0].country.value="";
   <!--document.forms[0].pclaimtitle.value="";-->
    
   
    document.forms[1].clmrefno.value="";
    
       document.forms[1].cancelReason.value="";
  <!-- document.forms[0].claimrefno.focus();-->
  }  
    }
    
    function checkLevyPaid(){
    
       if(document.forms[1].txtTotalLevyPaid.value=="0"){
         alert("No Levy Payments exists for this HRDF Reg No.");
         document.forms[1].txtMaxClmAmt.value="0";
         return false;
       }
    }
    
  function onSubmit()
      {
        if (validateRequired(document.forms[1])){
            var cancelReason  = document.forms[1].elements["cancelReason"].value;
           }
    }
     </script>
    <link href="../css/jdeveloper.css" rel="stylesheet" media="screen"/>
  </head>
  <body onload="onClaimLoad();">
  
                      <table width="100%" border="0" cellspacing="0"
                             cellpadding="1">
                        <tr>
                          <td valign="top" class="head_bgcolor">
Cancel Claim                          </td>
                        </tr>
                        <tr>
                          <td valign="top">
                            <table width="100%"
                                   border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td valign="top" class="padding5px">
                                  <table width="100%" border="0" cellspacing="0"
                                         cellpadding="0">
                                    <tr>
                                      <td valign="top">
                                        <table border="0" class="details_table"
                                               cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>
                                              <bean:message key="prompt.Common.DetailsSecTitle"/>
                                            </td>
                                          </tr>
                                        </table>
                                      </td>
                                    </tr>
                                   
                                    <tr>
                                      <td>
                                        <%@ include file="/claims/ClmRegCommon.jsp"%>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                              <tr>
                                <td valign="top" class="padding5px">
                                  <div id="first" style="display:block;">
                                    <html:form action="/CancelClaim.do?methodToCall=getCancelClaim"
                                               method="post">
                                      <table width="100%" border="0"
                                             cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td valign="top">
                                            <table border="0"
                                                   class="details_table"
                                                   cellspacing="0"
                                                   cellpadding="0">
                                              <tr>
                                                <td>Cancelling Claim</td>
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
                                                    class="height130">
                                                  <table width="100%" border="0"
                                                         cellspacing="0"
                                                         cellpadding="0">
<!--                                                   <tr>
//                                                      <td style="padding-right: 5px;">Cancel Reason:</td>
//                                                    </tr>-->
                                                     <tr>
    <td style="border-top: 1px solid #000000; ">Cancel Reason:<span class="red12">*</span> <html:textarea  property="cancelReason"  name="CancelClaim"   cols="100" rows="4"/></td>
  </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                            </table>
                                          </td>
                                          </tr>
                                   
                                          <tr>
                                          
                                          
                                          <td valign="top" style="padding-top:8px;">
                                            <table 
                                                   width="100%"
                                                   border="0"
                                                   cellspacing="0"
                                                   cellpadding="3" class="field_table" >
                                              <tr>
                                                <td class="mandatory"><bean:message key="Mandatory"/></td>
                                                <td>
                                                  <div align="right">
                                                  <html:hidden property="clmrefno"  name="CancelClaim"  value="add"/> 
                                                   <input type="hidden"  name="txtClaimRefNum" id="txtClaimRefNum" >
                                                   <html:hidden property="operation"  name="CancelClaim"  value="add"/> 
                                                   <html:hidden property="mode"  name="CancelClaim" /> 
                                                   <html:submit  property="trncancel" disabled="false"  onclick="vFindControl(this),onSubmit();"> Cancel </html:submit>
                                                   <html:submit  property="trnsearch" disabled="false"  onclick="vFindControl(this);" > Search </html:submit>
                                                   <html:button  property="trnclear" disabled="false"  onclick="vFindControl(this),v_clear();" > Clear </html:button>
                                                  <!-- <input type="button" name="button" id="button" onClick="vFindControl(this);CallPrint();" value="Print Claim Details" />                -->                             </div>
                                                </td>
                                              </tr>
                                            </table>
                                          </td>
                                        </tr>
                                      </table>
                                      <tr>
 
</tr></html:form></div></td></tr></table></td></tr></table></body>

   </html> 