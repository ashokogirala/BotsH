<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ page import="java.util.*" %>
<%@page import="com.vtfs.dto.claims.ClaimRefNoPopupVO ,com.vtfs.helper.registry.VTFSInterface,com.vtfs.util.VTFSLogger" %>

<%
       VTFSInterface vtfsReg=new VTFSInterface();
      // MyInterface vtfsReg=new MyInterface();
       String comcat=(String)request.getParameter("vcom");
         VTFSLogger.logDebug("Conpany Type  :: >>>> " + comcat);
       ArrayList list=null;
       String ClaimNo=request.getParameter("ClaimNo");
       String ClaimTitle=request.getParameter("ClaimTitle");
       String VTFNo=request.getParameter("VTFNo");
       String VTFCompName=request.getParameter("VTFCompName"); 
       VTFSLogger.logDebug("VTFCompName  :: >>>> " + VTFCompName);
        if((request.getParameter("myFlag")==null) || (request.getParameter("myFlag").equalsIgnoreCase(""))){
       }
       else{
       
       }
          
       ClaimRefNoPopupVO POPvO=null;
         ArrayList listFiltered=new ArrayList();
         
       if (comcat==null){
      comcat="";
      }
       ArrayList claimPopList=vtfsReg.getClaimRefnumdetails(comcat,false);
   //    VTFSLogger.logDebug("claimrefnolist===>"+claimPopList);
       request.setAttribute("claimrefnolist",claimPopList); 
 %>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
 <title>Claim Ref No</title>
    <link href="../css/displaytagex.css" rel="stylesheet" type="text/css" / >
   
    
    <script type="text/javascript">
        
        var ClaimNo='<%=ClaimNo %>';
        var ClaimTitle='<%=ClaimTitle %>';
        var VTFNo='<%=VTFNo %>';
        var VTFCompName='<%=VTFCompName %>';
        
        function showClaimCode(){ 
            var objCheckbox;
            var objHidden;
            var selectedRowIndex;
            elementsList=document.forms[0].elements;
            selectedRowIndex=0;
            for(var i=0;i<elementsList.length;i++){
                objCheckbox = elementsList[i];
                if ((objCheckbox.type == 'radio') && (objCheckbox.checked))
                {
                    window.opener.document.forms[0].elements[ClaimNo].value=objCheckbox.value; 
                    window.opener.document.forms[0].elements[ClaimTitle].value=objCheckbox.getAttribute('claimtitle');
                    window.opener.document.forms[0].elements[VTFNo].value=objCheckbox.getAttribute('vtfnum');
                    window.opener.document.forms[0].elements[VTFCompName].value=objCheckbox.getAttribute('vtfcomp');
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
        selVal=window.opener.document.forms[0].elements[ClaimNo].value;
        if ((selVal!=null) && (selVal!=''))
        { 
            elementsList=document.forms[0].elements;
            var selectedRowIndex;
            for(var i=0;i<elementsList.length;i++){
                objCheckbox = elementsList[i];
                if ((objCheckbox.type == 'radio') &&  (objCheckbox.value==selVal)){                     
                    objCheckbox.checked=true;
                }
            }
        }
        return;
}  
</script>
    
   
  </head>
  <body onload='onPopLoad();'>
  
   <form action="" name="claimref">
                  <br>
                    <table border="0" width="400px" align="center" bgcolor="#CDFFFF">
                     <tr><td align="center" colspan=2><b>Select Claim Ref No:</b></td></tr>
                   </table>
  
   <display:table  name="${claimrefnolist}" class="dataTable" requestURI="/claims/ClaimRefNoPopUp.jsp" id="customerNo" pagesize="25" cellspacing="0">
                        <display:column headerClass="tabel_header" title=""><input class="input_check"  type="radio"   id="claimrefno" name="claimrefno" 
                        value='<bean:write name="customerNo" property="claimrefno"/>'
                        claimtitle='<bean:write name="customerNo" property="title"/>'
                        vtfnum='<bean:write name="customerNo" property="vtfregno"/>'
                        vtfcomp='<bean:write name="customerNo" property="compname"/>'></input>
                         </display:column>
                        <display:column headerClass="tabel_header" title="&nbsp;Claim Ref No"  property="claimrefno"  style="width:100px"/>
                        <display:column headerClass="tabel_header" title="&nbsp;Title"  property="title"  style="width:220px"/>
                     
                        <display:column headerClass="tabel_header" title="&nbsp;HRDF Reg No"  property="vtfregno"  style="width:100px"/>
                        <display:column headerClass="tabel_header" title="&nbsp;Company Name"  property="compname" maxLength="12"  style="width:120px"/>
                        <display:column headerClass="tabel_header" title="&nbsp;Claim Date"  property="claimdate"  style="width:100px"/>
                       
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
           
        
        <!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="button" value="  Ok " onClick="showClaimCode()" />
                <input type="button" value="Close" onClick="cancelPopup()" />  -->               
                 
               <div  align="right">
               <input type="button" value="  Ok " onClick="showClaimCode()" />
                <input type="button" value="Close" onClick="cancelPopup()" />  
                </div>
                  
    </form>
  </body>
</html>