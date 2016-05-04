<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ page import="java.util.*" %>
<%@page import="com.vtfs.dto.appealmgmt.AppealPopVO,com.vtfs.helper.registry.VTFSInterface,com.vtfs.util.VTFSLogger" %>

<%
        VTFSInterface vtfsReg=new VTFSInterface();
        ArrayList list=null;
        
        String AppealRefNo=request.getParameter("AppealRefNo");
        String AppealTitle=request.getParameter("AppealTitle");
        String Status=request.getParameter("Status");
        String StatusDate=request.getParameter("StatusDate");
        String ClaimNo=request.getParameter("ClaimNo");
        String ClaimTitle=request.getParameter("ClaimTitle");
        String VTFNo=request.getParameter("VTFNo");
        String VtfComp=request.getParameter("VtfComp");
        String AppealDate=request.getParameter("AppealDate");
        String AppealReason=request.getParameter("AppealReason");
        String PersonAssgnd=request.getParameter("PersonAssgnd");
        String filterFlag=request.getParameter("filterFlag");
          VTFSLogger.logDebug("filterFlag=="+filterFlag);

        AppealPopVO CoVO=null;
        ArrayList listFiltered=new ArrayList();
        ArrayList appealpopList=vtfsReg.getAppealPopUp(false);
        
        if(appealpopList.size()>0){
        AppealPopVO applPopVO=null;
        if((filterFlag==null) || (filterFlag.equals(""))){
                VTFSLogger.logDebug("appealpopList===>"+appealpopList);  
                request.setAttribute("appealpopList",appealpopList);   
            
            }else{        
            for(int i=0;i<appealpopList.size();i++){
                    applPopVO=(AppealPopVO)appealpopList.get(i);
                    if(applPopVO.getStatus().equalsIgnoreCase(filterFlag)){
                        listFiltered.add(applPopVO);
                         VTFSLogger.logDebug("listFiltered===>"+listFiltered);  
                    }
                }
                request.setAttribute("appealpopList",listFiltered);   
            }
        
        }
 %>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
 <title>Appeal Ref No</title>
    <link href="../css/displaytagex.css" rel="stylesheet" type="text/css" / >
   
    
    <script type="text/javascript">
        
        
        var AppealRefNo='<%=AppealRefNo %>';
        var AppealTitle='<%=AppealTitle %>';
        var Status='<%=Status %>';
        var StatusDate='<%=StatusDate %>';
        var ClaimNo='<%=ClaimNo %>';
        var ClaimTitle='<%=ClaimTitle %>';
        var VTFNo='<%=VTFNo %>';
        var VtfComp='<%=VtfComp %>';
        var AppealDate='<%=AppealDate %>';
        var AppealReason='<%=AppealReason %>';
        var PersonAssgnd='<%=PersonAssgnd %>';
        
    
     function showAppealRefno(){ 
        var objCheckbox;
        var objHidden;
        var selectedRowIndex;
        elementsList=document.forms[0].elements;
        selectedRowIndex=0;
        for(var i=0;i<elementsList.length;i++){
            objCheckbox = elementsList[i];
            if ((objCheckbox.type == 'radio') && (objCheckbox.checked))
            {
      
        
                window.opener.document.forms[0].elements[AppealRefNo].value=objCheckbox.value; 
                window.opener.document.forms[0].elements[AppealTitle].value=objCheckbox.getAttribute('appdes');
                window.opener.document.forms[0].elements[Status].value=objCheckbox.getAttribute('appstatus'); 
                window.opener.document.forms[0].elements[StatusDate].value=objCheckbox.getAttribute('statusdate'); 
                window.opener.document.forms[0].elements[ClaimNo].value=objCheckbox.getAttribute('clmrefnum');
                window.opener.document.forms[0].elements[ClaimTitle].value=objCheckbox.getAttribute('clmtitle'); 
                window.opener.document.forms[0].elements[VTFNo].value=objCheckbox.getAttribute('vtfnum');
                window.opener.document.forms[0].elements[VtfComp].value=objCheckbox.getAttribute('vtfcomp'); 
                window.opener.document.forms[0].elements[AppealDate].value=objCheckbox.getAttribute('appdate');
                window.opener.document.forms[0].elements[AppealReason].value=objCheckbox.getAttribute('appreason');
                window.opener.document.forms[0].elements[PersonAssgnd].value=objCheckbox.getAttribute('perassgnd');
            
            }
        }
        window.close();
}
         
function cancelPopup()
        {
        window.close();
        }
        
        function onPopLoad()
        {
            var selVal='';
            selVal=window.opener.document.forms[0].elements[AppealRefNo].value;
            if ((selVal!=null) && (selVal!=''))
            { 
                elementsList=document.forms[0].elements;
                var selectedRowIndex;
                for(var i=0;i<elementsList.length;i++){
                    objCheckbox = elementsList[i];
                    if ((objCheckbox.type == 'radio') &&  (objCheckbox.value==selVal))
                    {                     
                        objCheckbox.checked=true;
                    }
                }
            }
            return;
        }     
           </script>

  </head>
  <body onload='onPopLoad();'>
               <form action="" name="appealref">
                  <br><br>
                    <table border="0" width="400px" align="center" bgcolor="#CDFFFF">
                     <tr><td align="center" colspan=2><b>Select Appeal Ref No:</b></td></tr>
                     </table>
         
        
    <display:table name="${appealpopList}"  class="dataTable" requestURI="/appealmgmt/AppealPopUp.jsp"  id="AppealRefnum" pagesize="20" cellspacing="0">
    <display:column headerClass="tabel_header" title=""><input class="input_check" type="radio"   id="appealRefNo" name="appealRefNo"
    value='<bean:write name="AppealRefnum" property="appealRefNo"/>'
    appdes='<bean:write name="AppealRefnum" property="appdesc"/>'
    appstatus='<bean:write name="AppealRefnum" property="status"/>'
    statusdate='<bean:write name="AppealRefnum" property="sdate"/>'   
    clmrefnum='<bean:write name="AppealRefnum" property="claimrefno"/>'
    clmtitle='<bean:write name="AppealRefnum" property="claimTitle"/>'
    vtfnum='<bean:write name="AppealRefnum" property="vtfregno"/>'
    vtfcomp='<bean:write name="AppealRefnum" property="vtfcompname"/>'
    appdate='<bean:write name="AppealRefnum" property="dateofAppeal"/>'
    appreason='<bean:write name="AppealRefnum" property="reasonforAppeal"/>'
    perassgnd='<bean:write name="AppealRefnum" property="personAssigned"/>'></input>
    </display:column>
    <display:column headerClass="tabel_header" title="&nbsp;Appeal Ref No"  property="appealRefNo" style="width:90px"/>
    <display:column headerClass="tabel_header" title="&nbsp;Status"  property="status" style="width:90px"/>
    <display:column headerClass="tabel_header" title="&nbsp;Claim No"  property="claimrefno" style="width:100px"/>
    <display:column headerClass="tabel_header" title="&nbsp;Claim Title"    property="claimTitle" maxLength="13" style="width:100px"/>
    <display:column headerClass="tabel_header" title="&nbsp;HRDF Reg No"  property="vtfregno" style="width:100px"/>
    <display:column headerClass="tabel_header" title="&nbsp;Name"  property="vtfcompname" maxLength="25" style="width:200px"/>
     
   
       
                     <display:setProperty name="paging.banner.placement" value="bottom"  /> 
                     <display:setProperty name="paging.banner.some_items_found" value='<span class="pagebanner">Records {2} to {3} of {0}</span>'  /> 
                     <display:setProperty name="paging.banner.full">
                        
                        <span class="pagelinks" style="padding-left:75px;"><a href="{1}"><img src="../images/back_last.jpg" border="0" /></a><a href="{2}"><img src="../images/back_btn.jpg" border="0" /></a><a href="{3}"><img src="../images/next_btn.jpg" border="0" /></a><a
                        href="{4}"><img src="../images/next_last.jpg" border="0" /></a></span>
                        </display:setProperty>                                                                        
                        <display:setProperty name="paging.banner.first">
                        <span class="pagelinks" style="padding-left:75px;"><img src="../images/back_last.jpg" border="0" /><img src="../images/back_btn.jpg" border="0" /><a
                        href="{3}"><img src="../images/next_btn.jpg" border="0" /></a><a href="{4}"><img src="../images/next_last.jpg" border="0" /></a>
                        </span>
                        </display:setProperty>                                                                        
                        <display:setProperty name="paging.banner.last">
                        <span class="pagelinks" style="padding-left:75px;"><a
                        href="{1}"><img src="../images/back_last.jpg" border="0" /></a><a href="{2}"><img src="../images/back_btn.jpg" border="0" /></a><img src="../images/next_btn.jpg" border="0" /><img src="../images/next_last.jpg" border="0" /> </span>
                        </display:setProperty>
      
    
    
    </display:table>
         <div  align="right">
                <input type="button" value="  Ok " onClick="showAppealRefno()" />
                <input type="button" value="Close" onClick="cancelPopup()" />  
                </div>     
    
    </form>
  </body>
</html>
