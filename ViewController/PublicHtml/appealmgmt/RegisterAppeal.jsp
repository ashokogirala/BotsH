<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="com.vtfs.helper.registry.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ page import="java.io.*"%>
<%@ page language="java" import="java.util.*,com.vtfs.util.VTFSLogger"%>
<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
%>
<%
        ArrayList RegApp=(ArrayList)request.getAttribute("RegApp");
      
        int reglist;
       if(RegApp==null){
        reglist=0;
        }else{
        reglist=RegApp.size();
        }
        
        String searchFlag=  (String)request.getAttribute("searchFlag");
         VTFSLogger.logDebug("ActionMode of JSP::"+searchFlag);
        if(searchFlag==null)
        searchFlag="";
  
        %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Application for Registering Appeal</title>
    <link href="styles/boto.css" rel="stylesheet" type="text/css" />
    <link href="styles/menu_home.css" type="text/css" rel="stylesheet"></link>
    <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
    <script language="javascript" type="text/javascript" src="js/menu_home.js"></script>
    <script language="javascript" type="text/javascript"
            src="js/datetimepicker.js"></script>
    <link rel="stylesheet" type="text/css" media="all"
          href="js/skins/aqua/theme.css" title="Aqua"/>
    <script language="javascript" type="text/javascript"
            src="js/RegisterCategory.js"></script>
    <script type="text/javascript" src="js/calendar_inc.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/lang/calendar-en.js"></script>
    <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
    <script type="text/javascript" language="javascript"> 
     
    

function submitClicked(){
        
       if (validateRequired(document.forms[0]))
      {
      var str1  = document.forms[0].elements["dateofAppeal"].value;
     // alert("str1====="+str1);
        if(comparWithSysDates(str1)){
        document.forms[0].elements["htxtMode"].value="SUBMIT";
        //document.forms[0].action = document.forms[0].action + "?methodToCall=onClasifiTypeSubmit" ;
        
        document.forms[0].submit();}
    }
    }
    
    //search click js
    function searchClicked(){
        document.forms[0].elements["htxtMode"].value="SEARCH";
        //document.forms[0].action = document.forms[0].action + "?methodToCall=onSearchClasifiType" ;
        document.forms[0].submit();
    }

   function delClicked(){
            if (validateRequired(document.forms[0])){
                if (!(!confirm('Are you sure to delete the selected record?')))
                {
                document.forms[0].elements["htxtMode"].value="DELETE";
                
                document.forms[0].submit();
                }
            }
    }
    
    //clear click js
    function clearClicked(){
        document.forms[0].elements["htxtMode"].value="CLEAR";
        document.forms[0].elements["appealRefNo"].value="";
        document.forms[0].elements["appdesc"].value="";
        document.forms[0].elements["status"].value="";
        document.forms[0].elements["sdate"].value="";
        document.forms[0].elements["claimrefno"].value="";
        document.forms[0].elements["claimTitle"].value="";
        document.forms[0].elements["vtfregno"].value="";
        document.forms[0].elements["vtfcompname"].value="";
        document.forms[0].elements["dateofAppeal"].value="";
        document.forms[0].elements["reasonforAppeal"].value="";
        document.forms[0].elements["personAssigned"].value="";       
         document.forms[0].htxtDBMessage.value="";
          document.forms[0].submit();
        
       
    }
    
    var count=0;
    var intval="";
     function loading(){
        document.forms[0].status.className='textboxur5'; 
        document.forms[0].sdate.className='textboxur5';       
        document.forms[0].vtfcompname.className='textboxur5'; 
        document.forms[0].claimTitle.className='textboxur5'; 
        document.forms[0].elements["htxtMode"].value='';
        
        document.forms[0].dateofAppeal.readOnly=false;
        document.forms[0].dateofAppeal.className="";
        
         //document.forms[0].dateofAppeal.disabled=false;
          document.forms[0].elements['calimg'].disabled=false;
              
        window.status="Done.";
         document.forms[0].btnDelete.disabled=true;
        var msg;
      
        msg=document.forms[0].elements['htxtDBMessage'].value;
        
       if (msg=="DELSUCCESS")
        {
            saveMessage ='Appeal record deleted successfully.';
            //alert('delete success');
            //intval=window.setInterval("showStatus()",500);
            alert(saveMessage);
            
        }else if(msg=="DELFAIL"){
        
            alert('Appeal record could not be deleted.');
             document.forms[0].elements['htxtDBMessage'].value='';
        }   else if(msg=="SAVED"){
        
            saveMessage = 'Appeals saved successfully.';
            //intval=window.setInterval("showStatus()",500);
            alert(saveMessage);
        
        }  else if(msg=="NOT_VALID_APP"){
        
           alert('Invalid Appeal Reference Number.');
           document.forms[0].elements['htxtDBMessage'].value='';
        
        } else if(msg=="SELECTED"){
            document.forms[0].btnDelete.disabled=false;
            document.forms[0].dateofAppeal.readOnly=true;
            document.forms[0].dateofAppeal.className="textboxur5";
         //  document.forms[0].dateofAppeal.disabled=true;
            document.forms[0].elements['calimg'].disabled=true;
            
        }else if(msg=="NOT_UPDAT"){
        
           alert('The Record cannot be updated since Staus is already Fixed.');
           document.forms[0].elements['htxtDBMessage'].value='';
        
        }        
    }
     function showStatus(){
    
        window.status=saveMessage ;
        
        count++;
        if (count==20)
        {
            //alert('count= ' + count);
            
            window.clearInterval(intval);

            window.status="Done ";
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
    
 function showModalWindow(forPop){ 
        var ClaimNo;
        var ClaimTitle;
        var VTFNo;
        var VTFCompName;
        
        var AppealRefNo;
        var AppealTitle;
        var Status;
        var StatusDate;
        var ClaimNo;
        var ClaimTitle;
        var VTFNo;
        var VtfComp;
        var AppealDate;
        var AppealReason;
        var PersonAssgnd;
        
        ClaimNo='claimrefno';
        ClaimTitle='claimTitle';
        VTFNo='vtfregno';
        VTFCompName='vtfcompname';
        
        AppealRefNo='appealRefNo';
        AppealTitle='appdesc';
        Status='status';
        StatusDate='sdate';
        ClaimNo='claimrefno';
        ClaimTitle='claimTitle';
        VTFNo='vtfregno';
        VtfComp='vtfcompname';
        AppealDate='dateofAppeal';
        AppealReason='reasonforAppeal';
        PersonAssgnd='personAssigned';
        filterFlag='';
        
        //AppealTitle=ClaimTitle;
        //StatusDate=VtfComp;
          if(forPop=='CLM'){
         modalWin=showClaimPopUp(290,450,ClaimNo,ClaimTitle,VTFNo,VTFCompName);
         }else
              modalWin=showAppealPopUp(290,390,AppealRefNo,AppealTitle,Status,StatusDate,ClaimNo,ClaimTitle,VTFNo,VtfComp,AppealDate,AppealReason,PersonAssgnd,filterFlag);
            
              }




</script>
  </head>
  <body onload="loading()" onfocus="checkFocus()"><html:errors/><html:form action="/AppealReg.do?methodToCall=getInit"
                                                                           method="post">
      <html:javascript formName="AppealReg"/>
      <table width="100%" border="0" cellspacing="0" cellpadding="1">
        <tr>
          <td valign="top" class="head_bgcolor">Application for Registering
                                                Appeal </td>
        </tr>
        <tr>
          <td valign="top" >
            <table width="100%" border="0"
                   cellpadding="0" cellspacing="0">
              <tr>
                <td valign="top" class="padding5px">
                  <table width="100%" border="0" cellspacing="0"
                         cellpadding="0">
                    <tr>
                      <td valign="top">
                        <table border="0" class="details_table" cellspacing="0"
                               cellpadding="0">
                          <tr>
                            <td>Details</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top">
                        <table class="field_table" width="100%" border="0"
                               cellspacing="0" cellpadding="0">
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="0"
                                     cellpadding="0">
                                <tr>
                                  <td>
                                    <table width="100%" border="0"
                                           cellspacing="0" cellpadding="3">
                                      <tr>
                                        <td width="19%" valign="top">
                                        
                                        
                                        
                                         <table width="100%" border="0" cellspacing="0" cellpadding="2">
                                         <tr>
                                         <td><bean:message key="app.appregno"/>
                                                <bean:message key="prompt.Common.LabelSuffix"/></td>
                                         <td><html:text name="AppealReg" size="15" property="appealRefNo" maxlength="30"/>
                                                <a href="#" onclick="showModalWindow('APP');"> <img src="images/list_img.jpg" border="0"/></a></td>
                                         <td><bean:message key="app.title"/> <bean:message key="prompt.Common.LabelSuffix"/> <span class="red12">*</span></td>
                                         <td> <html:text name="AppealReg" size="15" property="appdesc" style="width:142px;" maxlength="30"/></td>
                                         <td><bean:message key="app.status"/>
                                                <bean:message key="prompt.Common.LabelSuffix"/></td>
                                         <td><html:text name="AppealReg" size="15" property="status" style="background-color:#c0c0c0" readonly="true" maxlength="30"/></td>
                                         </tr>
                                         
                                         
                                         <tr>
                                         <td><bean:message key="app.statusdate"/>
                                                <bean:message key="prompt.Common.LabelSuffix"/></td>
                                         <td><html:text name="AppealReg"
                                                                 size="15"
                                                                 property="sdate"
                                                                 readonly="true"
                                                                 style="background-color:#c0c0c0; width:112px;"
                                                                 maxlength="30"/></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         </tr>
                                         
                                         
                                         <tr>
                                         <td><bean:message key="app.claimno"/>
                                                <bean:message key="prompt.Common.LabelSuffix"/><span class="red12">*</span></td>
                                         <td><html:text name="AppealReg"
                                                                 size="15"
                                                                 property="claimrefno"/>
                                         <a href="#"  onclick="showModalWindow('CLM');">
                                                        <img src="images/list_img.jpg" border="0"/>
                                                      </a></td>
                                         <td colspan="4" width="420"><html:text name="AppealReg"
                                                           size="25"
                                                           property="claimTitle"
                                                           maxlength="30"
                                                           readonly="true"
                                                           style="background-color:#c0c0c0; width:188px;"/></td>
                                     
                                         </tr>
                                         
                                         
                                         <tr>
                                         <td><bean:message key="app.vtfreg"/>
                                                <bean:message key="prompt.Common.LabelSuffix"/><span class="red12">*</span></td>
                                         <td><html:text name="AppealReg"
                                                                 size="15"
                                                                 property="vtfregno"
                                                                 maxlength="30"
                                                                 readonly="true"/> <a href="#"
                                                         onclick="openRegPopup()">
                                                        <!--  <img src="images/list_img.jpg" border="0"/>-->
                                                      </a></td>
                                         <td colspan="4"><html:text name="AppealReg"
                                                           size="25"
                                                           property="vtfcompname"
                                                           maxlength="30"
                                                           readonly="true"
                                                           style="background-color:#c0c0c0; width:188px;"/></td>
                                       </tr>
                                        
                                         <tr>
                                         <td><bean:message key="app.appdate"/>
                                                <bean:message key="prompt.Common.LabelSuffix"/><span class="red12">*</span></td>
                                         <td><html:text name="AppealReg"
                                                                 size="15"                                                                 
                                                                 property="dateofAppeal"
                                                                 maxlength="30"/> <a>
                                                        <img alt="calender"
                                                             src="images/cal.JPG"
                                                              id="calimg"
                                                             onclick="return showCalendar('dateofAppeal','0','%d-%b-%Y',false,false);"
                                                             class="cursorHand"></img>
                                                      </a></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         </tr>
                                         
                                         <tr>
                                         <td><bean:message key="app.reason"/>
                                                <bean:message key="prompt.Common.LabelSuffix"/><span class="red12">*</span></td>
                                         <td colspan="5"><html:text name="AppealReg"
                                                           size="48"
                                                           property="reasonforAppeal"
                                                           maxlength="30" style="width:335px;"/></td>
                                         </tr>
                                         
                                         <tr>
                                         <td><bean:message key="app.perassgnd"/>
                                                <bean:message key="prompt.Common.LabelSuffix"/></td>
                                         <td colspan="5"><html:text name="AppealReg"
                                                           size="48"
                                                           property="personAssigned"
                                                           maxlength="30" style="width:335px;"/></td>
                                         </tr>
                                    
                                         </table>
                                        
                                       </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="bordertop">
                                    <table width="100%" border="0"
                                           cellspacing="0" cellpadding="3">
                                      <tr>
                                        <td class="mandatory">* Mandatory Field</td>
                                        <td>
                                          <div align="right">
                                            <html:hidden property="htxtMode"
                                                         value=""/>
                                             
                                            <html:hidden property="htxtDBMessage"
                                                         name="AppealReg"/>
                                             
                                            <html:button property="btnSave"
                                                         value="Save"
                                                         onclick="submitClicked();"/>
                                             
                                            <html:button property="btnDelete"
                                                         value="Delete"
                                                         onclick="delClicked();"/>
                                             
                                            <html:button property="btnSearch"
                                                         value="Search"
                                                         onclick="searchClicked();"/>
                                             
                                            <html:button property="btnClear"
                                                         value="Clear"
                                                         onclick="clearClicked();"/>
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
                  <%
                         if(reglist>0)
                         { %>
                  <table width="100%" border="0" cellspacing="0"
                         cellpadding="0">
                    <tr>
                      <td valign="top">
                        <table border="0" class="details_table" cellspacing="0"
                               cellpadding="0">
                          <tr>
                            <td>List</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top">
                        <table class="field_table" width="100%" border="0"
                               cellspacing="0" cellpadding="0">
                          <tr>
                            <td valign="top" class="height130"
                                style="padding:5px;">
                              <table width="100%" border="0" cellspacing="0"
                                     cellpadding="0">
                                <tr>
                                  <td valign="top">
                                    <table width="100%" border="0"
                                           cellpadding="2" cellspacing="1"
                                           bgcolor="#00ccff">
                                      <tr>
                                        <display:table name="RegApp"
                                                       requestURI="AppealReg.do?methodToCall=setRegAppeal"
                                                       id="row"
                                                       class="dataTable"
                                                       defaultsort="1"
                                                       defaultorder="ascending"
                                                       pagesize="7"
                                                       cellspacing="0"
                                                       decorator="org.displaytag.decorator.TotalTableDecorator">
                                          <display:column property="apprefno"
                                                          title="Appeal Ref No"
                                                          autolink="true"
                                                          href="AppealReg.do?methodToCall=setRegAppeal"
                                                          paramId="regNo"
                                                          sortable="true"/>
                                          <display:column property="vtfRegNo"
                                                          title="HRDF Reg No "
                                                          sortable="true"/>
                                          <display:column property="claimRefNo"
                                                          title="Claim Ref No"
                                                          sortable="true"/>
                                          <display:column property="dateofAppeal"
                                                          title="Date of Appeal"
                                                          sortable="true"/>
                                          <display:column property="reasonforAppeal"
                                                          title="Reason for Appeal"/>
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
                  <%
                    }else{
                    if(searchFlag.equalsIgnoreCase("SEARCH")){
                    %>
                  No record found.
                  <%} }%>
                </td>
              </tr>
            
            </table>
             <div id="leftMenu"></div>
          </td>
        </tr>
         
        <tr>
          <td valign="top" class="padding5px">&nbsp;</td>
        </tr>
      </table>
    </html:form></body>
</html>