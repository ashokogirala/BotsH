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
   if (document.forms[1].txtTotalBenefit.value!="")
   {
        if(document.forms[1].txtMaxClmAmt.value==""){
          document.forms[1].trncalculate.disabled=false;
         }else{
          document.forms[1].trncalculate.disabled=true;
         }
   }else{
    document.forms[1].trncalculate.disabled=true;
   }
   
   
   
   
   
   
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
    
    
   }
 
     var calMaxAmtStatus='<%=request.getAttribute("calMaxAmountStatus") %>';
     
     if(calMaxAmtStatus=='Validated'){
     
       document.forms[0].status.value="Validated";
      
     }
     
     
  }
     function vFindControl(elementRefa)
    {
  var curbut;
  var str_cntlVal;
  curbut= elementRefa.value;
  document.forms[1].operation.value=curbut
   if(curbut=='Clear'){
    //alert(1);
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
    
  //  document.forms[0].claimrefno.focus();
  }  
    }
    
    function checkLevyPaid(){
    
       if(document.forms[1].txtTotalLevyPaid.value=="0"){
         alert("No Levy Payments exists for this HRDF Reg No.");
         document.forms[1].txtMaxClmAmt.value="0";
         return false;
       }
    }
     </script>
  </head>
  <body onload="onClaimLoad();">
  
                      <table width="100%" border="0" cellspacing="0"
                             cellpadding="1">
                        <tr>
                          <td valign="top" class="head_bgcolor">
                            <bean:message key="Cmca.title"/>
                          </td>
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
                                    <html:form action="/CalculateMaxAmt.do?methodToCall=getCalculateMaxAmt"
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
                                                <td><bean:message key="Cmca.title"/></td>
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
                                                    <tr>
                                                      <td style="padding-right: 5px;">
                                                        <table width="100%"
                                                               border="0"
                                                               cellspacing="2"
                                                               cellpadding="2">
                                                               
                                                          <tr>
                                                            <td width="25%"><bean:message key="Cmca.TotalBenefit"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                            <html:text property="txtTotalBenefit"  name="CalculateMaxAmt" 
                                                            readonly="true"
                                                            style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/> 
                                                            </td>
                                                          </tr>     
                                                          <tr>
                                                            <td width="25%"><bean:message key="Cmca.Totlevypaid"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                            <html:text property="txtTotalLevyPaid"  name="CalculateMaxAmt" 
                                                            readonly="true"
                                                            style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/> 
                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td><bean:message key="Cmca.Actclmamt"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                               <html:text property="txtActClmAmt"  name="CalculateMaxAmt" 
                                                               readonly="true"
                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/> 
                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td><bean:message key="Cmca.AppTrngcst"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                             <html:text property="txtAppTrngCst"  name="CalculateMaxAmt" 
                                                             readonly="true"
                                                             style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/> 
                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td>
                                                              <bean:message key="Cmca.Maxclmamt"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                            </td>
                                                            <td>
                                                              <html:text property="txtMaxClmAmt"  name="CalculateMaxAmt" 
                                                              readonly="true"
                                                              style="background-color:#c0c0c0;border:1px solid #8f8e8e; height:15px; "/> 
                                                            </td>
                                                          </tr>
                                                         
                                                           <tr>
                                                       <td>
                                                                     Status Reason:
                                                           </td>
                                                                        <td>
                                                                          <html:text property="txtPenReason"   name="CalculateMaxAmt"  readonly="true" 
                                                                           style="background-color:#c0c0c0;border:1px solid #8f8e8e;width:375px; "/>
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
                                                  <html:hidden property="clmrefno"  name="CalculateMaxAmt"  value="add"/> 
                                                   <input type="hidden"  name="txtClaimRefNum" id="txtClaimRefNum" >
                                                   <html:hidden property="operation"  name="CalculateMaxAmt"  value="add"/> 
                                                   <html:hidden property="mode"  name="CalculateMaxAmt" /> 
                                                   <html:submit  property="trncalculate" disabled="false"  onclick="vFindControl(this); return checkLevyPaid();" > Calculate </html:submit>
                                                   <html:submit  property="trnsearch" disabled="false"  onclick="vFindControl(this);" > Search </html:submit>
                                                   <html:button  property="trnclear" disabled="false"  onclick="vFindControl(this);" > Clear </html:button>
                                                  </div>
                                                </td>
                                              </tr>
                                            </table>
                                          </td>
                                        </tr>
                                      </table>
                                    </html:form>
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                   
    </body>
</html>