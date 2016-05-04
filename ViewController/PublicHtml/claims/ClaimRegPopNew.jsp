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
       String Status=request.getParameter("Status"); 
       String StatusDate=request.getParameter("StatusDate"); 
       String ClaimDate=request.getParameter("ClaimDate"); 
       String FinYear=request.getParameter("FinYear"); 
       String VatRegNo=request.getParameter("VatRegNo"); 
       String PoBox=request.getParameter("PoBox"); 
       String CompReg=request.getParameter("CompReg"); 
       String City=request.getParameter("City"); 
       String Classifi=request.getParameter("Classifi"); 
       String Country=request.getParameter("Country"); 
       

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
       VTFSLogger.logDebug("claimrefnolist===>"+claimPopList);
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
        
        var Status='<%=Status %>';
        var StatusDate='<%=StatusDate %>';
        var ClaimDate='<%=ClaimDate %>';
        var FinYear='<%=FinYear %>';
        var VatRegNo='<%=VatRegNo %>';
        var PoBox='<%=PoBox %>';
        var CompReg='<%=CompReg %>';
        var City='<%=City %>';
        var Classifi='<%=Classifi %>';
        var Country='<%=Country %>';
       
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
                    
                    
                    window.opener.document.forms[0].elements[Status].value=objCheckbox.getAttribute('clmstatus');
                    window.opener.document.forms[0].elements[StatusDate].value=objCheckbox.getAttribute('statusDate');
                    window.opener.document.forms[0].elements[ClaimDate].value=objCheckbox.getAttribute('claimDate');
              //      window.opener.document.forms[0].elements[FinYear].value=objCheckbox.getAttribute('finYear');
                    window.opener.document.forms[0].elements[VatRegNo].value=objCheckbox.getAttribute('vatRegNo');
                    window.opener.document.forms[0].elements[PoBox].value=objCheckbox.getAttribute('poBox');
                    window.opener.document.forms[0].elements[CompReg].value=objCheckbox.getAttribute('compReg');
                    window.opener.document.forms[0].elements[City].value=objCheckbox.getAttribute('city');
                    window.opener.document.forms[0].elements[Classifi].value=objCheckbox.getAttribute('classifi');
                    window.opener.document.forms[0].elements[Country].value=objCheckbox.getAttribute('country');
                   
                   
                    
                     window.opener.document.forms[0].claimOperation.value="Search";
                   
                    window.opener.document.forms[0].submit();
                    
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
  
   <form action="" name="claimref">
                  <br>
                    <table border="0" width="400px" align="center" bgcolor="#CDFFFF">
                     <tr><td align="center" colspan=2><b>Select Claim Ref No:</b></td></tr>
                   </table>
  
   <display:table  name="${claimrefnolist}" class="dataTable" requestURI="/claims/ClaimRegPopNew.jsp" id="customerNo" pagesize="20" cellspacing="0">
                        <display:column headerClass="tabel_header" title=""><input class="input_check"  type="radio"   id="claimrefno" name="claimrefno" 
                        value='<bean:write name="customerNo" property="claimrefno"/>'
                        claimtitle='<bean:write name="customerNo" property="title"/>'
                        vtfnum='<bean:write name="customerNo" property="vtfregno"/>'
                        vtfcomp='<bean:write name="customerNo" property="compname"/>'
                        clmstatus='<bean:write name="customerNo" property="clmstatus"/>'
                        statusDate='<bean:write name="customerNo" property="statusdate"/>'
                        claimDate='<bean:write name="customerNo" property="claimdate"/>'
                        finYear='<bean:write name="customerNo" property="finyear"/>'
                        vatRegNo='<bean:write name="customerNo" property="vatregno"/>'
                        poBox='<bean:write name="customerNo" property="box"/>'
                        compReg='<bean:write name="customerNo" property="compregno"/>'
                        city='<bean:write name="customerNo" property="city"/>'
                        classifi='<bean:write name="customerNo" property="classifi"/>'
                        country='<bean:write name="customerNo" property="country"/>'
                        ></input>
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
   
               <div  align="right">
               <input type="button" value="  Ok " onClick="showClaimCode();" />
                <input type="button" value="Close" onClick="cancelPopup()" />  
                </div>
                  
    </form>
  </body>
</html>