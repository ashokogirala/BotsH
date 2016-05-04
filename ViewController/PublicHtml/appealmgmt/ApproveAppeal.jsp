
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ page import="java.io.*,com.vtfs.util.VTFSLogger" %> <%@page language="java" import="java.util.*" %>
<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
%>


<%
        ArrayList Approve=(ArrayList)request.getAttribute("Approve");
      
        int reglist;
       if(Approve==null){
        reglist=0;
        }else{
        reglist=Approve.size();
        }
        
        String searchFlag=(String)request.getAttribute("searchFlag");
        VTFSLogger.logDebug("ActionMode of JSP of Approve Appeal::"+searchFlag);
        if(searchFlag==null)
        searchFlag="";
  
        %>

<html>
<head>
	<title>Approve Appeal</title>
	<link href="styles/boto.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="js/menu.js"></script>
<link href="styles/menu.css" type="text/css" rel="stylesheet">
 <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
<script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
<script type="text/javascript" language="javascript"> 	
        

  


    function submitClicked(myBtn){
         if (validateRequired(document.forms[0]))
          {
            document.forms[0].elements["htxtMode"].value=myBtn.value;
        
            document.forms[0].submit();
            }
        }
    
    //search click js
    function searchClicked(){
          document.forms[0].elements["htxtMode"].value="SEARCH";
      
        document.forms[0].submit();
    }

   
    //clear click js
    function clearClicked(){
        document.forms[0].elements["htxtMode"].value="CLEAR";
        document.forms[0].elements["appealRefNo"].value="";
        document.forms[0].elements["appdesc"].value="";
        document.forms[0].elements["status"].value="";
        document.forms[0].elements["sdate"].value="";
        document.forms[0].elements["vtfregno"].value="";
        document.forms[0].elements["vtfcompname"].value="";
        document.forms[0].elements["claimrefno"].value="";
        document.forms[0].elements["claimTitle"].value="";
        document.forms[0].elements["dateofAppeal"].value="";
        document.forms[0].elements["reasonforAppeal"].value="";
        document.forms[0].elements["personAssigned"].value="";
        document.forms[0].elements["actionappl"].value="";
        document.forms[0].elements["remarks"].value="";
        document.forms[0].htxtDBMessage.value=""; 
        document.forms[0].submit();
    }


       function loading(){  
       
       
       
        document.forms[0].appdesc.className='textboxur5'; 
        document.forms[0].status.className='textboxur5'; 
        document.forms[0].sdate.className='textboxur5'; 
        document.forms[0].vtfcompname.className='textboxur5'; 
        document.forms[0].claimTitle.className='textboxur5'; 
        document.forms[0].dateofAppeal.className='textboxur5'; 
        document.forms[0].reasonforAppeal.className='textboxur5'; 
        document.forms[0].personAssigned.className='textboxur5'; 
        
        document.forms[0].btnApprove.disabled=true;
        document.forms[0].btnReject.disabled=true;
        var smode;
        smode=document.forms[0].htxtDBMessage.value;
         if (smode=='SELECTED'){
        document.forms[0].btnApprove.disabled=false;
        document.forms[0].btnReject.disabled=false;
        }
         strDBMsg=document.forms[0].elements['htxtDBMessage'].value;
        document.forms[0].elements["htxtMode"].value='';
        
        var strDBMsg='';
       
          
           if (smode=='NOT_UPDATED'){
         
            alert('The Status is already Approved/Rejected.');
             document.forms[0].elements['htxtDBMessage'].value='';
               }
               if(strDBMsg=='APPROVED'){
               alert("APPROVED Successfully")
                document.forms[0].elements['htxtDBMessage'].value='';
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
        
        modalWin=showAppealPopUp(295,370,AppealRefNo,AppealTitle,Status,StatusDate,ClaimNo,ClaimTitle,VTFNo,VtfComp,AppealDate,AppealReason,PersonAssgnd,filterFlag);
}
    </script>  
        
</head>
<body  onload="loading();" onfocus="checkFocus()" >
<html:errors/>
  
  <html:form  action="/Approveapp.do?methodToCall=getAppInit" method="post">
    <html:javascript formName="Approveapp"/> 


<table width="100%" border="0" cellspacing="0" cellpadding="1">
              <tr>
                <td valign="top" class="head_bgcolor">Approve Appeal</td>
              </tr>
              <tr>
                <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top" class="padding5px">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td valign="top"><table border="0" class="details_table" cellspacing="0" cellpadding="0">
                              <tr>
                                <td>Details</td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td valign="top"><table class="field_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td><table width="100%" border="0" cellspacing="0" cellpadding="3">
                                          <tr>
                                            <td width="18%" valign="top" style="padding-left:7px;"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                                                <tr>
                                                  <td width="100"><bean:message key="app.appregno"/>
                                                   <bean:message key="prompt.Common.LabelSuffix"/><span class="red12">*</span></td>
                                                  <td><table border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td><html:text name="Approveapp"
                                                                       size="15"
                                                                       property="appealRefNo"
                                                                       maxlength="30"/></td>
                                                        <td><a href="#" onClick="showModalWindow();" ><img src="images/list_img.jpg" border="0" /></a></td>
                                                        <td>&nbsp;</td>
                                                        <td><html:text name="Approveapp" size="26" property="appdesc"  readonly="true" style="width:175px;background-color:#c0c0c0"/></td>
                                                      </tr>
                                                  </table></td>
                                                  <td width="30px"><bean:message key="app.status"/>
                                                   <bean:message key="prompt.Common.LabelSuffix"/></td>
                                                  <td><html:text name="Approveapp"
                                                                       size="10"
                                                                       property="status"
                                                                       maxlength="30" readonly="true" style="background-color:#c0c0c0"/></td>
                                                                       
                                                  <td width="30px"><bean:message key="app.statusdate"/>
                                                  <bean:message key="prompt.Common.LabelSuffix"/></td>
                                                  <td><html:text name="Approveapp"
                                                                       size="6"
                                                                       property="sdate"
                                                                       maxlength="30" readonly="true" style="background-color:#c0c0c0;  width:90px;"/></td>
                                                </tr>
                                               <!-- <tr>
                                                  <td><bean:message key="app.unkdate"/>
                                                  <bean:message key="prompt.Common.LabelSuffix"/></td>
                                                  <td><html:text name="Approveapp"
                                                                       size="15"
                                                                       property="appdate"
                                                                       maxlength="30" style="background-color:#c0c0c0"/></td>
                                                  <td colspan="2">&nbsp;</td>
                                                  <td>&nbsp;</td>
                                                  <td>&nbsp;</td>
                                                </tr>-->
                                              </table>
                                                <table border="0" cellspacing="0" cellpadding="2">
                                                  <tr>
                                                    <td width="100"><bean:message key="app.vtfreg"/>
                                                     <bean:message key="prompt.Common.LabelSuffix"/></td>
                                                    <td><table border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                          <td><html:text name="Approveapp"
                                                                       size="15"
                                                                       property="vtfregno"
                                                                       maxlength="30" readonly="true"/></td>
                                                          <td><a href="#"><!--<img src="images/list_img.jpg" border="0" />--></a></td>
                                                        </tr>
                                                    </table></td>
                                                    <td><html:text name="Approveapp"
                                                                       size="28"
                                                                       property="vtfcompname"
                                                                       maxlength="30" readonly="true"  style="background-color:#c0c0c0; width:192px;" /></td>
                                                  </tr>
                                                  <tr>
                                                    <td><bean:message key="app.claimno"/>
                                                     <bean:message key="prompt.Common.LabelSuffix"/></td>
                                                    <td><table border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                          <td><html:text name="Approveapp"
                                                                       size="15"
                                                                       property="claimrefno"
                                                                       maxlength="30" readonly="true"/></td>
                                                          <td><a href="#" onClick="getclmPopDetails()" ><!--<img src="images/list_img.jpg" border="0" />--></a></td>
                                                        </tr>
                                                    </table></td>
                                                    <td><html:text name="Approveapp"
                                                                       size="28"
                                                                       property="claimTitle"
                                                                       maxlength="30" readonly="true"  style="background-color:#c0c0c0; width:192px;" /></td>
                                                  </tr>
                                                  <tr>
                                                    <td><bean:message key="app.appdate"/>
                                                     <bean:message key="prompt.Common.LabelSuffix"/></td>
                                                    <td><html:text name="Approveapp"
                                                                       size="15"
                                                                       property="dateofAppeal"
                                                                       maxlength="30" readonly="true" style="background-color:#c0c0c0" /></td>
                                                    <td>&nbsp;</td>
                                                  </tr>
                                                  <tr>
                                                    <td><bean:message key="app.reason"/>
                                                     <bean:message key="prompt.Common.LabelSuffix"/></td>
                                                    <td colspan="2"><html:text name="Approveapp"
                                                                       size="49"
                                                                       property="reasonforAppeal"
                                                                       maxlength="30" readonly="true" style="background-color:#c0c0c0; width:313px" /></td>
                                                  </tr>
                                                  <tr>
                                                    <td><bean:message key="app.perassgnd"/>
                                                     <bean:message key="prompt.Common.LabelSuffix"/></td>
                                                    <td colspan="2"><html:text name="Approveapp"
                                                                       size="49"
                                                                       property="personAssigned"
                                                                       maxlength="30" readonly="true"  style="background-color:#c0c0c0; width:313px"/></td>
                                                  </tr>
                                                  <tr>
                                                    <td><bean:message key="app.applaction"/>
                                                     <bean:message key="prompt.Common.LabelSuffix"/><span class="red12">*</span></td>
                                                    <td colspan="2"><html:select property="actionappl"  name="Approveapp">
                                                          <html:option value="">--Select--</html:option>
                                                          <html:option value="Credit">Credit</html:option>
                                                          <html:option value="Debit">Debit</html:option>
                                                         <!-- <html:option value="G">Get Approve</html:option>-->
                                                         </html:select></td>
                                                  </tr>
                                                  <tr>
                                                    <td><bean:message key="app.applremarks"/>
                                                     <bean:message key="prompt.Common.LabelSuffix"/></td>
                                                    <td colspan="2"><html:textarea  property="remarks" name="Approveapp" rows="3" style="width:313px" /></td>
                                                  </tr>
                                              </table></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td class="bordertop"><table width="100%" border="0" cellspacing="0" cellpadding="3">
                                          <tr>
                                            <td class="mandatory">* Mandatory Field</td>
                                            <td><div align="right">
                                               <html:hidden property="htxtMode" value=""/>
                                               <html:hidden property="disablemode" value=""/>
                                                <html:hidden property="htxtDBMessage" name= "Approveapp"/>
                                                     <html:button property="btnApprove"
                                                                   value="Approve" onclick="submitClicked(this);" />
                                                       
                                                      <html:button property="btnReject"
                                                                   value="Reject" onclick="submitClicked(this);" />
                                                      
                                                      <html:button property="btnSearch"
                                                                   value="Search" onclick="searchClicked();" />
                                                       
                                                      <html:button property="btnClear"
                                                                   value="Clear" onclick="clearClicked();" />
                                            </div></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                </table></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td valign="top" class="padding5px">
                    
                     <%
                         if(reglist>0)
                         { %>
                    
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
                                <td valign="top" class="height130" style="padding:5px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td valign="top"><table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#00ccff">
                                          <tr>
                <display:table name="Approve"
                                   requestURI="Approveapp.do?methodToCall=setApproveAppl"
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
                                  href="Approveapp.do?methodToCall=setApproveAppl"
                                  paramId="ApplNO"
                                  sortable="true"/>
                  
                
                                  <display:column property="vtfRegNo"
                                  title="HRDF Reg No"
                                  sortable="true"/>
                                  
                                  <display:column property="claimRefNo"
                                  title="Claim Ref No"
                                  sortable="true"/>
                                  
                                   <display:column property="dateofAppeal"
                                  title="Date of Appeal"
                                  sortable="true"/>
                                  
                                  <display:column property="reasonforAppeal"
                                  title="Reason for Appeal"
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
                                     
                                          </tr>
                                      </table></td>
                                    </tr>
                                </table></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table>
                    
                    <%
                    }else{
                    if(searchFlag.equalsIgnoreCase("SEARCH")){
                    %>
                   No record found.
                  <%} }%>        
                    
                   <div id="leftMenu">        
              
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