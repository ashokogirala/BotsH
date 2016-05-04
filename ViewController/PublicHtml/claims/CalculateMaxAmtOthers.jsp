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
    
    
     ArrayList calClmList=(ArrayList)request.getSession().getAttribute("CalClmList");
     
     
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
    function showMessage(){
   
        if  (document.forms[0].totalvtfundbalance.value!="")
        {
        
        document.forms[0].trnsubmit.disabled=false; 
        }
        else
        {
        document.forms[0].trnsubmit.disabled=true; 
        }
          if (document.forms[0].result.value!="")
          {
          alert(document.forms[0].result.value);
          document.forms[0].result.value="";
          }
    
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
  <body onload="showMessage();" onfocus="checkFocus()"><html:form action="/CalculateMaxAmtOthers.do?methodToCall=getCalculateMaxAmtOthers"
                   method="post">
      
                        <table width="100%" border="0" cellspacing="0"
                               cellpadding="1">
                          <tr>
                            <td valign="top" class="head_bgcolor"><bean:message key="CMAO.title"/></td>
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
                                                          <td ><bean:message key="CMAO.ClassificationCode"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                          <td width="150">
                                                            <table border="0"
                                                                   cellspacing="0"
                                                                   cellpadding="0">
                                                              <tr>
                                                                <td width="80%">
                                                                   <html:text property="classificationcode"
                                                                         name="CalculateMaxAmtOthers"
                                                                         />
                                                                </td>
                                                                <td width="20%">
                                                                <a href="#" onclick="showModalWindow()"><img src="images/list_img.jpg" border="0"></img></a>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                          </td>
                                                          <td colspan="2" width="350">
                                                            <html:text property="classificationdesc"
                                                                         name="CalculateMaxAmtOthers"
                                                                         readonly="true"
                                                                         style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:200px; "/>
                                                          </td>
                                                        </tr>
                                                            <tr>
                                                          <td><bean:message key="financial"/></td>
                                                          <td>
                                                           <html:select property="finyear"
                                                                         name="CalculateMaxAmtOthers" tabindex="5" style="width:145px;">
                                                            <html:options name="yearlist" labelName="yearlist" />
                                                            </html:select>
                                                          </td>
                                                          <td >&nbsp;</td>
                                                          <td>&nbsp;</td>
                                                        </tr>
                                                        
                                                        
                                                        <tr>
                                                          <td><bean:message key="CMAO.TotalVTFundBalance"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                          <td>
                                                           <html:text property="totalvtfundbalance"
                                                                         name="CalculateMaxAmtOthers"
                                                                         readonly="true"
                                                                         style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                          </td>
                                                          <td >&nbsp;</td>
                                                          <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><bean:message key="CMAO.AllottedFundAmount"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                          <td>
                                                           <html:text property="allottedfundamount"
                                                                         name="CalculateMaxAmtOthers"
                                                                         readonly="true"
                                                                         style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                          </td>
                                                          <td colspan="2">&nbsp; </td>
                                                         
                                                        </tr>
                                                      </table>
                                                    </td>
                                                  </tr>
                                                  <tr>
                                                    <td valign="top"
                                                        class="bordertop">
                                                      <table width="100%"
                                                             border="0"
                                                             cellspacing="0"
                                                             cellpadding="3">
                                                        <tr>
                                                          <td class="mandatory"><bean:message key="Mandatory"/></td>
                                                          <td>
                                                            <div align="right">
                                                            <html:hidden property="operation"  name="CalculateMaxAmtOthers"  value="0"/> 
                                                           <html:hidden property="mode"  name="CalculateMaxAmtOthers" /> 
                                                           <html:hidden property="result"  name="CalculateMaxAmtOthers" /> 
                                                   <html:submit  property="trnsubmit" disabled="false"  onclick="vFindControl(this);" > Process Claim Amount </html:submit>
                                                   <html:submit  property="trnsearch" disabled="false"  onclick="vFindControl(this);" > Search </html:submit>
                                                   
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
                                          <div id="Dgrid"
                                                     style="overflow:auto;height:170px"
                                                     align="left">
                                              <display:table name="CalClmList"
                                                requestURI="/CalculateMaxAmtOthers.do?methodToCall=getCalculateMaxAmtOthers"
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
                                                                  title="Processed Claim Amount"
                                                                  sortable="true"/>
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
                                             </td>
                                           
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
                     
    </html:form></body>
</html>