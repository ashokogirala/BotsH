<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ page import="java.util.*" %>
<%@page import="com.vtfs.dto.appealmgmt.AppealCreditRefNoPopupVO ,com.vtfs.helper.registry.VTFSInterface,com.vtfs.util.VTFSLogger" %>

<%
       VTFSInterface vtfsReg=new VTFSInterface();
      // MyInterface vtfsReg=new MyInterface();
        String noteType=request.getParameter("noteType");
        VTFSLogger.logDebug("test noteType =="+noteType);
      
        
       String CredRefno=request.getParameter("CredRefno");
       String CredTitle=request.getParameter("CredTitle");
       String CredDate=request.getParameter("CredDate");
       String AppRefno=request.getParameter("AppRefno");
       String AppDate=request.getParameter("AppDate");
       
      
         AppealCreditRefNoPopupVO CoVO=null;
        ArrayList listFiltered=new ArrayList();
       ArrayList creditrefnolist=vtfsReg.getCreditPopUp(noteType);
  
        request.setAttribute("creditrefnolist",creditrefnolist);   
      VTFSLogger.logDebug("creditrefnolist===>"+creditrefnolist);   
        
        
 %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Credit/Debit Ref No</title>
   <link href="../css/displaytagex.css" rel="stylesheet" type="text/css" / >
    
              <script type="text/javascript">
              
              
                     var CredRefno='<%=CredRefno %>';
                    var CredTitle='<%=CredTitle %>';
                    var CredDate='<%=CredDate %>';
                    var AppRefno='<%=AppRefno %>';
                    var AppDate='<%=AppDate %>';
                           
              
function showCreditRefno(){ 
        var objCheckbox;
        var objHidden;
        var selectedRowIndex;
        elementsList=document.forms[0].elements;
        selectedRowIndex=0;
        for(var i=0;i<elementsList.length;i++){
        objCheckbox = elementsList[i];
        if ((objCheckbox.type == 'radio') && (objCheckbox.checked))
        {
            window.opener.document.forms[0].elements[CredRefno].value=objCheckbox.value; 
            window.opener.document.forms[0].elements[CredTitle].value=objCheckbox.getAttribute('credttitle');
            window.opener.document.forms[0].elements[CredDate].value=objCheckbox.getAttribute('credtdate'); 
            window.opener.document.forms[0].elements[AppRefno].value=objCheckbox.getAttribute('apprefnum');
            window.opener.document.forms[0].elements[AppDate].value=objCheckbox.getAttribute('appdate');
            
        
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
        selVal=window.opener.document.forms[0].elements[CredRefno].value;
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
  <body  onload='onPopLoad();'>
  
  
   <form action="" name="CreditNote">
                  <br><br>
                    <table border="0" width="400px" align="center" bgcolor="#CDFFFF">
                     <tr><td align="center" colspan=2><%if(noteType.equalsIgnoreCase("CREDIT")){   %>
                                            <b>Select Credit Ref No:</b>
                                            <%}else {%>
                                            <b>Select Debit Ref No:</b></td>
                                            <%}%></tr>
                   </table>
  
    <display:table  name="${creditrefnolist}" class="dataTable" requestURI="/appealmgmt/AppealCreditRefNoPopup.jsp" id="customerNo" pagesize="20" cellspacing="0">
                        <display:column headerClass="tabel_header" title=""><input class="input_check" type="radio"  id="creditrefno" name="creditrefno" 
                        value='<bean:write name="customerNo" property="creditrefno"/>'
                        credttitle='<bean:write name="customerNo" property="credittitle"/>'
                        credtdate='<bean:write name="customerNo" property="creditdate"/>'
                        apprefnum='<bean:write name="customerNo" property="appealRefNo"/>'
                        appdate='<bean:write name="customerNo" property="dateofAppeal"/>' ></input>
                        
                       </display:column>
                        <%if(noteType.equalsIgnoreCase("CREDIT")){   %>
                        <display:column headerClass="tabel_header" title="&nbsp;Credit Ref No"  property="creditrefno"/>  
                        <%}
                        else 
                        {%>
                        <display:column headerClass="tabel_header" title="&nbsp;Debit Ref No"  property="creditrefno"/>   
                        <%}
                        %>
                        <display:column headerClass="tabel_header" title="&nbsp;Title" maxLength="30" style="width:200px"  property="credittitle"/>
                        <%if(noteType.equalsIgnoreCase("CREDIT")){  
                        %>
                        <display:column headerClass="tabel_header" title="&nbsp;Credit Date"  property="creditdate"/>
                        <%}else 
                        {%>
                        <display:column headerClass="tabel_header" title="&nbsp;Debit Date"  property="creditdate"/>
                        <%}
                        %>
                        <display:column headerClass="tabel_header" title="&nbsp;Appeal Ref No"  property="appealRefNo"/>
                        <display:column headerClass="tabel_header" title="&nbsp;Date of Appeal"  property="dateofAppeal"/>
                        
               
                
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
     <br></br>
            <div  align="right">
            <input type="button" value="  Ok " onClick="showCreditRefno()" />
            <input type="button" value="Close" onClick="cancelPopup()" />  
            </div>     
    </form>
   

  </body>
</html>


                                            