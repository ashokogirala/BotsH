
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@page import="com.vtfs.dto.appealmgmt.RegAppealVO,com.vtfs.util.VTFSLogger" %>
<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
%>

 <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
 <link href="css/displaytagex.css" rel="stylesheet" type="text/css"/>

<%@ page import="java.io.*" %> 
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.*" %>
<%
    java.util.Calendar currentDate =  java.util.Calendar.getInstance();
    java.text.SimpleDateFormat formatter= 
    new java.text.SimpleDateFormat("dd-MMM-yyyy");
    String dateNow=formatter.format(currentDate.getTime());  
    String username=(String)request.getSession().getAttribute("CUserID");
    
    String noteType=(String)request.getSession().getAttribute("NOTE_TYPE");
   
   
    RegAppealVO regvo=new RegAppealVO();
    String genamount="";
     genamount=regvo.getAmount();
    VTFSLogger.logDebug("Gen amount"+genamount);
    
    ArrayList creditRec=(ArrayList)request.getAttribute("creditRec");
      
        int creditRecList;
       if(creditRec==null){
        creditRecList=0;
        }else{
        creditRecList=creditRec.size();
        }
    
    String searchFlag=  (String)request.getAttribute("searchFlag");
    VTFSLogger.logDebug("Mode Action from Jsp:::"+searchFlag);
        if(searchFlag==null)
        searchFlag="";
%>
 

<script type="text/javascript" language="javascript"> 

modalWin = null;

function loadingGenr(){
    var strResult;
        document.forms[0].creditdate.className='textboxur5'; 
        document.forms[0].dateofAppeal.className='textboxur5'; 
        document.forms[0].vtfregno.className='textboxur5'; 
        document.forms[0].vtfcompname.className='textboxur5';
        document.forms[0].claimrefno.className='textboxur5'; 
        document.forms[0].claimTitle.className='textboxur5'; 
        
    strResult=document.forms[0].htxtDBMessage.value;       
    document.forms[0].btnGenerate.disabled=true;
     document.forms[0].btnDelete.disabled=true;    
    
    if(strResult=="SELECTED_CREDIT_NOTE"){
        document.forms[0].btnGenerate.disabled=false;
         document.forms[0].btnDelete.disabled=false;
    }
    
    
    
}
 function checkFocus()
{
//alert('window.navigator.userAgent.indexOf("Firefox") :' +window.navigator.userAgent.indexOf("Firefox"));
 
 //document.forms[0].elements["searchFlag"].value="";
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
        
        var CredRefno;
        var CredTitle;
        var CredDate;
        var AppRefno;
        var AppDate;
        var noteType;
        
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
        filterFlag='APPROVED';
        
        CredRefno='creditrefno';
        CredTitle='credittitle';
        CredDate='creditdate';
        AppRefno='appealRefNo';
        AppDate='dateofAppeal';
        noteType='<%=noteType %>';

       if(forPop=='CRD'){
         modalWin=showCrediDebitPopUp(330,330,CredRefno,CredTitle,CredDate,AppRefno,AppDate,noteType);
         }else
              modalWin=showAppealPopUp(330,355,AppealRefNo,AppealTitle,Status,StatusDate,ClaimNo,ClaimTitle,VTFNo,VtfComp,AppealDate,AppealReason,PersonAssgnd,filterFlag);
              }



    function applCreditRefNoPopup()
    {
        window.open("appealmgmt/AppealCreditRefNoPopup.jsp?noteType="+"<%= noteType %>",'creditnote','width=700,height=300');
    }
    
 function saveClicked(CreditNote){
           
        if (validateRequired(document.forms[0]))        
      {
            if ((document.forms[0].elements["creditrefno"].value==null) || (document.forms[0].elements["creditrefno"].value=="")){
               
                document.forms[0].elements["htxtMode"].value="SAVE";
                 document.forms[0].btnGenerate.disabled=false;
                 document.forms[0].submit();
            }else{
            
                document.forms[0].elements["htxtMode"].value="UPDATE";
                document.forms[0].btnGenerate.disabled=false;
                document.forms[0].submit();
            } 
          
           }
    }
    //search click js
    function searchClicked(){
        document.forms[0].elements["htxtMode"].value="SEARCH";
        //document.forms[0].action = document.forms[0].action + "?methodToCall=onSearchClasifiType" ;
        document.forms[0].submit();
    }
    //delete click js    
    function delClicked(){
            if (validateRequired(document.forms[0])){
                if (!(!confirm('Are you sure to delete the selected record?')))
                {
                document.forms[0].elements["htxtMode"].value="DELETE";
                //document.forms[0].action = document.forms[0].action + "&mode=d" ;
                //document.forms[0].action = document.forms[0].action + "&mode=d" ;
                //document.forms[0].action = document.forms[0].action + "?methodToCall=onClasifiTypeDelete" ;
                document.forms[0].submit();
                }
            }
    }
    //clear click js
    function clearClicked(){
        document.forms[0].elements["htxtMode"].value="CLEAR";
        document.forms[0].elements["credittitle"].value="";
         document.forms[0].elements["creditrefno"].value="";
        document.forms[0].elements["creditdate"].value="";
        document.forms[0].elements["appealRefNo"].value="";
        document.forms[0].elements["dateofAppeal"].value="";
        document.forms[0].elements["vtfregno"].value="";
        document.forms[0].elements["vtfcompname"].value="";
        document.forms[0].elements["claimrefno"].value="";
        document.forms[0].elements["claimTitle"].value="";
        //document.forms[0].elements["notetype"].value="";
        document.forms[0].elements["amount"].value="";
        document.forms[0].elements["remarks"].value="";  
        document.forms[0].htxtDBMessage.value="";
        document.forms[0].submit();
    }
   
    
   function callPrintRecord() {
       // alert("Call Print()");
        var sOption="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
           sOption+="scrollbars=yes,width=700,height=600,left=100,top=25"; 
     
       var sWinHTML = document.getElementById('print').innerHTML; 
     
       var winprint=window.open("","",sOption); 
           winprint.document.open(); 
           winprint.document.write('<html><LINK  href=css/boto.css rel=Stylesheet><body>'); 
           winprint.document.write(sWinHTML);        
           winprint.document.write('</body><html>'); 
           winprint.document.close(); 
           winprint.focus(); 
    
    }
    

</script>   

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>GenerateCreditNote</title>
        <link href="styles/boto.css" rel="stylesheet" type="text/css" />
        <script language="javascript" type="text/javascript" src="js/menu.js"></script>
        <link href="styles/menu.css" type="text/css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="styles/boto.css"/>        
</head>
<body onload="loadingGenr();" onfocus="checkFocus()">
<html:errors/>
 <html:form action="/CreditNote.do?methodToCall=getInit" method="post"  >
<html:javascript formName="CreditNote"/>

 
    <table width="800" border="0" cellspacing="0" cellpadding="1">
              <tr>
                <td valign="top" class="head_bgcolor"><%if(noteType.equalsIgnoreCase("CREDIT")){   %><bean:message key="prompt.CreditAppTitle"/>
                <%}else{%> <bean:message key="prompt.DebitAppTitle"/>
                <%}%>
                </td>
              </tr>
              <tr>
                <td valign="top" class="padding5px">
                
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td valign="top"><table border="0" class="details_table" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><bean:message key="prompt.DetailsSetTitle"/></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td valign="top"><table class="field_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                                          <tr>
                                            <td>
                                            <%if(noteType.equalsIgnoreCase("CREDIT")){   %>
                                            <bean:message key="prompt.CreditRefNo"/>:</td>
                                            <%}else {%>
                                            <bean:message key="prompt.DebitRefNo"/>:</td>
                                            <%}%>
                                            <td><table border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td><html:text property="creditrefno"  name="CreditNote"  style="width:110px;hight:14px" /></td>
                                                  <td><a href="#" onclick="showModalWindow('CRD');"><img src="images/list_img.jpg" border="0" /></a></td>
                                                </tr>
                                            </table></td>
                                            <td><bean:message key="prompt.Title"/>:<span class="red12">*</span></td>
                                            <td><html:text property="credittitle" name="CreditNote" maxlength="20" style="width:110px;hight:14px" /></td>
                                            <td><bean:message key="prompt.Date"/>:</td>
                                            <td><html:text property="creditdate" name="CreditNote" style="background-color:#c0c0c0;width:110px;hight:14px" readonly="true" /></td>
                                          </tr>
                                          <tr>
                                            <td width="18%"><bean:message key="prompt.AppealRefNo"/>:<span class="red12">*</span></td>
                                            <td width="22%"><table border="0" cellspacing="0" cellpadding="0">
                                                <tr>                   
                                                  <td><html:text property="appealRefNo"  name="CreditNote" readonly="true" style="width:110px;hight:14px" /></td>
                                                  <td><a href="#" onClick="showModalWindow('APP');"><img src="images/list_img.jpg" border="0" /></a></td>
                                                </tr>
                                            </table></td>
                                            <td width="15%"><bean:message key="prompt.DateofAppeal"/>:</td>
                                            <td width="20%"><html:text property="dateofAppeal"  name="CreditNote"  style="background-color:#c0c0c0;width:110px;hight:14px" readonly="true"/></td>
                                            <td width="8%">&nbsp;</td>
                                            <td width="17%">&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td><bean:message key="prompt.VTFRegNo"/>:</td>
                                            <td colspan="5"><html:text property="vtfregno"  name="CreditNote"  style="background-color:#c0c0c0;width:110px;hight:14px" readonly="true" />
                                            <html:text property="vtfcompname" name="CreditNote" style="background-color:#c0c0c0;width:260px;hight:14px" readonly="true" />
                                          </tr>
                                          <tr>
                                            <td><bean:message key="prompt.ClaimRefNo"/>:</td>
                                            <td colspan="5"><html:text property="claimrefno"  name="CreditNote"  style="background-color:#c0c0c0;width:110px;hight:14px" readonly="true" />
                                                <html:text property="claimTitle" name="CreditNote" style="background-color:#c0c0c0;width:260px;hight:14px" readonly="true" />
                                          </tr>
                                         
                                          <tr>
                                            <td><bean:message key="prompt.Amt"/>:<span class="red12">*</span></td>
                                            <td colspan="5"><html:text property="amount"  name="CreditNote"  onkeypress="return isNumeric();" style="width:110px;hight:14px" maxlength="15"/>
                                          </tr>
                                          <tr>
                                            <td><bean:message key="prompt.Remarks"/>:</td>
                                            <td colspan="5"><html:textarea property="remarks" name="CreditNote" style="width:372px;hight:50px"/>
                                            
                                            </td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td valign="top" class="bordertop"><table width="100%" border="0" cellspacing="0" cellpadding="3">
                                          <tr>
                                            <td class="mandatory"><bean:message key="prompt.Mandatorytitle"/></td>
                                            <td><div align="right">
                                            
                                             
                                            <%if(noteType.equalsIgnoreCase("CREDIT")){   %>
                                            <input type="hidden" name="noteType"  value="Credit"/>
                                            
                                               <%}else{%>
                                           <input type="hidden" name="noteType" value="Debit"/>
                                             <%}%>
                                             
                                           <html:button property="btnGenerate"
                                                            value="Generate" onclick="callPrintRecord();" />
                                               <!-- <html:submit  property="btnGenerate" onclick="CallPrint(); " disabled="false">Generate</html:submit>-->
                                             
                                           <html:button property="btnSave"
                                                            value="Save" onclick="saveClicked(CreditNote);" />
                           
                                         <html:button property="btnDelete"
                                                         value="Delete" onclick="delClicked();" />
                           
                                         <html:button property="btnSearch"
                                                        value="Search" onclick="searchClicked();" />
                           
                                        <html:button property="btnClear"
                                                        value="Clear" onclick="clearClicked();" />
                                                        
                                         <html:hidden property="htxtMode" name="CreditNote" value=""/>
                                         <html:hidden property="htxtDBMessage" name="CreditNote" />
                                         
                                        
                                        <html:hidden property="appdesc"  value="" />
                                        <html:hidden property="status" value="" />
                                        <html:hidden property="sdate" value="" />
                                        <html:hidden property="reasonforAppeal" value="" />
                                        <html:hidden property="personAssigned" value="" />
                                       
                                            
                                            </div></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                </table></td>
                              </tr>
                          </table>
                </td>
                  </tr>
                  <tr>
                    <td valign="top" style="padding-top:10px;">
                       <%
                         if(creditRecList>0)
                         { %>
                    
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr><td>
                       <table border="0" class="details_table" cellspacing="0" cellpadding="0">
                              <tr>
                                <td>List</td>
                              </tr>
                          </table>
                          </td></tr>
                        <tr>
                          <td valign="top"><table class="field_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td valign="top" class="padding5px"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#00ccff">
                                 <display:table name="creditRec"   
                                        requestURI="" 
                                        id="row"
                                        class="dataTable"
                                        defaultorder="ascending"
                                        pagesize="5" 
                                        export="false" 
                                       cellspacing="0"
                                    decorator="org.displaytag.decorator.TotalTableDecorator" >
                                   
                    <%if(noteType.equalsIgnoreCase("CREDIT")){   %>
                                      <display:column 
                                        property="creditrefno" 
                                        title="Credit Ref No" 
                                        sortable="true" 
                                        autolink="true"
                                         href="CreditNote.do?methodToCall=setCreditNoteRecord"
                                         paramId="creditref"
                                        />
                                         
                        <%}else {%>
                                        <display:column 
                                        property="creditrefno" 
                                        title="Debit Ref No" 
                                        sortable="true" 
                                        autolink="true"
                                         href="CreditNote.do?methodToCall=setCreditNoteRecord"
                                         paramId="creditref"
                                        />
                                            
                            <%}%>
                                    <display:column 
                                        property="apprefno" 
                                        title="Appeal Ref No" 
                                        sortable="true"
                                        />
                                    <display:column 
                                        property="vtfRegNo" 
                                        title="VTF Registration No" 
                                        sortable="true" 
                                        />
                                    <display:column 
                                        property="claimRefNo" 
                                        title="Claim Ref No" 
                                        sortable="true"
                                        />
                                    <display:column 
                                        property="amount" 
                                        title="Amount" 
                                        sortable="true"
                                        
                                    />
                                           
                                         
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
                                </table></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table>
                     <%
                    }else{
                    if(searchFlag.equalsIgnoreCase("SEARCH")){
                    %>
                   No record found
                  <%} }%>    
                  
                  
                    <div id="leftMenu">  
                             </div>         </td>
                                                  </tr>
                                                  <tr>
                                                    <td valign="top"
                                                        class="padding5px">&nbsp;</td>
                                                  </tr>
                                                </table>

              
      <tr>
        <td style="display: none;" >
      <div style="display: none;" id="print" >

      <table id="TblPrint"  border="0" style="width:300px">
       <tr>
            <td width="50%"><div align="center"><span class="vocational_head">Human Resource Developement Fund System</span></div></td>
            <td>
            <table border="0" cellspacing="0" cellpadding="3" >
              <tr>
               <td width="5%" align="left" ><img src="images/bota_logo.jpg" alt="HRDC"  />
              </tr>
              </table>
              </td>
              </tr>
              <tr style="height:10px">
              <td colspan="2">
              </td>
              
              </tr>
              <tr>
              <td colspan="2" style="border-top:1px solid #000000; padding-top:10px; padding-bottom:15px; ">
              <table style="width:600px"  border="0"  >
               <tr>
                <td width=80% ><div align="center"><span class="App_head"><% if(noteType.equalsIgnoreCase("CREDIT")){ %> <bean:message key="print.CreditTitle"/>
                <%}else{%>
                <bean:message key="print.DebitTitle"/>
                <%}%>
                </span></div></td>
               <td width="400px"  align="left"><b>Date:</b> <%=dateNow%></td>
               <tr><td></td><td  width="300px" align="left"><b>Printed By :</b>&nbsp;<%=username%></td></tr>
              </tr>
             </table>
             
             <table border="0" width="500px">
           
             <tr>
              <td style="padding-top:50px;"><Strong><bean:message key="vtfregno"/></Strong> </td>
              <td style="width:7%;padding-top:50px;"><html:text property="pvtfregno" readonly="true" name="CreditNote"  style="border: 1px solid #FFFFFF"/></td>
              </tr>
               <tr>
              <td ><Strong><bean:message key="vatregno"/></Strong> </td>
              <td style="width:7%"><html:text property="pvatNo" readonly="true" name="CreditNote"  style="border: 1px solid #FFFFFF"/></td>
              </tr>
               <tr>
              <td style="padding-bottom:50px;"><Strong><bean:message key="companyname"/></Strong> </td>
              <td style="width:7%;padding-bottom:50px;"><html:text property="pvtfcompname" readonly="true" name="CreditNote"  style=" width=300px;border: 1px solid #FFFFFF"/></td>
              </tr>
             <tr>
            <tr>
            </tr>
            </table>
            <table>
            <tr>
            </tr>
            </table>
            <table width="540px" border="0" style=" padding-top:100px; padding-bottom:25px; ">
                <% if(noteType.equalsIgnoreCase("CREDIT")){ %>
                <tr>
                <td style="border: 1px solid #FFFFFF; overflow:hidden;" class="report_generate" ><bean:message key="prompt.certify"/>&nbsp;<html:text property="pamount" readonly="true" name="CreditNote"  style=" border: 1px solid #FFFFFF"/>&nbsp;&nbsp;<bean:message key="prompt.Credit"/></td>
                </tr>
                <%}else{%>
                <tr>
                <td style="border: 1px solid #FFFFFF; overflow:hidden;" class="report_generate" ><bean:message key="prompt.certify"/>&nbsp;<html:text property="pamount" readonly="true" name="CreditNote"  style=" border: 1px solid #FFFFFF"/>&nbsp;&nbsp;<bean:message key="prompt.Debit"/></td>
                </tr>
                <%}%>
                
            </table>
              <td colspan="10%" style="border-top:1px solid #000000; padding-top:25px; padding-bottom:25px; ">
              </td>
              </tr>
               <td>
              <table border="0" width="450px">
              <tr style="padding-top:50px;">
              <td align="left" colspan="5">
               
              <b> Signature    :</b>
                
              </td> 
              <td align="right">
              <b> Date:</b>
              </td>
             
              <td></td>
              </tr>
              <tr><td><b>Designation  :</b></td><td></td></tr>
              </table>

            
      </table>
            <div align="center" style="width:600;text-align:right;">
             <style type="text/css" media="print">
                            .printbutton {
                            visibility: hidden;
                            display: none;
                            }
                            
        </style>

           <input type="button" value="Print"  class="printbutton" onclick="window.print()";/>
            </div>
      </div>
     
      </td>
      </tr>
    </table></td>
  </tr>
</table>
</html:form>
</body>
</html>

         
              
              