<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@page language="java" import="java.sql.*" %>
 <%@page language="java" import="java.util.*" %>
 <%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@page import="com.vtfs.helper.registry.VTFSInterface,com.vtfs.dto.claims.LearnerListVO,com.vtfs.util.VTFSLogger" %>
<%@page import="com.vtfs.helper.registry.VTFSInterface,com.vtfs.dto.claims.LearnerListVO,com.vtfs.util.VTFSLogger" %>
<%
        java.util.Calendar currentDate =  java.util.Calendar.getInstance();
        java.text.SimpleDateFormat formatter= 
        new java.text.SimpleDateFormat("dd-MMM-yy@HH:mm");
        String dateNow=formatter.format(currentDate.getTime());   
      String claimrefno=(String)request.getSession().getAttribute("claimrefno");
       
        String chq_amt=(String)request.getSession().getAttribute("chq_amt");
        
         String chq_date=(String)request.getSession().getAttribute("chq_date");
       
        String chq_no=(String)request.getSession().getAttribute("chq_no");
        
        
        // String claimrefno=request.getParameter("claimrefno");
       // String chq_amt=request.getParameter("chequeamt");
       //  String chq_date=request.getParameter("chequedate");
        //  String chq_no=request.getParameter("chequeno");
        String username=(String)request.getSession().getAttribute("CUserID");
        
        if(dateNow==null) dateNow="";
        if(username==null) username="";
         
         
           ArrayList learnRpt=(ArrayList)request.getAttribute("learnerslist");
        request.getSession().setAttribute("learnerslist",learnRpt);
        int learnerslist;
        //Learners
        if(learnRpt==null){
        learnerslist=0;
        }else{
        learnerslist=learnRpt.size();
        }
       
       String checkRecord=(String)request.getAttribute("checkRecordForGivenDate");
         
         if(checkRecord==null)checkRecord="";
        
        %>
         
         















<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
     <title>Register Claim Application</title>
     <link type="text/css" rel="stylesheet" href="css/boto.css"/>
    
     <link href="styles/menu_home.css" type="text/css" rel="stylesheet"></link>
     <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
     <link rel="stylesheet" type="text/css" media="all" href="js/skins/aqua/theme.css" title="Aqua" />
     <script language="javascript" type="text/javascript" src="js/menu_home.js"></script>
     <script language="javascript" type="text/javascript" src="js/RegisterCategory.js"></script>
     <script type="text/javascript" src="js/calendar_inc.js"></script>
     <script type="text/javascript" src="js/calendar.js"></script>
     <script type="text/javascript" src="js/lang/calendar-en.js"></script>
     <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
<script type="text/javascript" language="javascript"> 
    
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
  function searchClicked(){
        document.forms[0].action='<%=request.getContextPath()%>'+'/printClaimCertVat.do?methodToCall=searchClicked';
          document.forms[0].submit();
   
    } 
    
    
    function addNewClicked(){
    document.forms[0].action='<%=request.getContextPath()%>'+'/printClaimCertVat.do?methodToCall=addNewClicked';
    document.forms[0].submit();
//     document.forms[0].chequedate.value="";
//      document.forms[0].chequeno.value="";
//       document.forms[0].chequeamt.value="";    
    
    }
  
    
   function detailsClicked()
      {
      
            var claimrefno  = document.forms[0].elements["claimrefno"].value;
            var chequedate =document.forms[0].elements["chequedate"].value;
            var chequeno  = document.forms[0].elements["chequeno"].value;
            var chequeamt =document.forms[0].elements["chequeamt"].value;
            window.open("reportJSP/PrintPaymentDetailsHistory.jsp?claimrefno="+claimrefno+"&chequeamt="+chequeamt+"&chequedate="+chequedate+"&chequeno="+chequeno,'classPop', "location=1,status=1,scrollbars=1,width=900,height=750,left=100,top=150"); 
        
      }
  
      
 function showModalWindow(forPop){ 
        var vtfNo;
        var vtfComp;
        var ClaimNo;
        var ClaimTitle;
        var VTFNo;
        var VTFCompName;
 
        vtfNo='vtfRegNum';
        vtfComp='vtfCompName';
    
        ClaimNo='claimrefno';
        ClaimTitle='title';
        VTFNo='vtfRegNum';
        VTFCompName='vtfCompName';
    
         if(forPop=='CLM'){
         modalWin=showClaimPopUp(350,400,ClaimNo,ClaimTitle,VTFNo,VTFCompName);
        
         }
         else
          modalWin=showVTFPopUp(350,300,vtfNo,vtfComp);
            
    }
    
    
    function getClmDetails()
    {
        //alert("getClmDetails called");
        document.forms[0].submit();
    }
    
    
    function vFindControl(elementRefa)
    {
        var curbut;
        var str_cntlVal;
        curbut= elementRefa.value;
        document.forms[0].claimMode.value=curbut;
    }
   
   var DBMSG='<%=request.getAttribute("userDBMes") %>';
        var result='<%=request.getAttribute("strMes") %>';
     
     if(DBMSG=='SUCCESS'){
     
      // document.forms[0].status.value="Cancelled";
       alert(result);
     }
       if(DBMSG=='FAIL'){
     
      // document.forms[0].status.value="Cancelled";
       alert(result);
     }   
    
     function CallPrint()
    {
    document.forms[0].claimMode.value="Generate";
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
    

</script>    
  <script type="text/javascript" language="javascript"> 
    var sub=0;
     function onClaimLoad()
     {
 
     if (!(document.forms[0].title.value==""))
     {
      document.forms[0].trnsave.disabled=false;
    //document.forms[0].button.disabled=false;
   
    }else{
    document.forms[0].trnsave.disabled=true;
  //  document.forms[0].button.disabled=true;
    }
    
   
    
    
 
}

 
 
function getRowID(){
}
//search function is added on 19.04.2012 on the request of vtfs users

</script>
  </head>
<body onload="onClaimLoad();" onfocus="checkFocus()">
<html:form  action="/printClaimCertVat.do?methodToCall=getClaimCertDetailsVat" method="post" >
 <html:javascript formName="printClaimCertVat"/>
<table width="100%" border="0" cellspacing="0" cellpadding="1">
              <tr>
                <td valign="top" class="head_bgcolor">Claim Payment Details </td>
              </tr>
              <tr>
                <td valign="top" class="padding5px">
                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td valign="top">
                          <table border="0" class="details_table" cellspacing="0" cellpadding="0">
                              <tr>
                                <td>Details</td>
                              </tr>
                          </table>
                          </td>
                        </tr>
                        <tr>
                          <td valign="top">
                          <table class="field_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td valign="top">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td>
                                      <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                          <tr>
                                            <td width="125">Claim Ref No:<span class="red12">*</span></td>
                                            <td width="165"><table border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td>
                                                  <html:text property="claimrefno" maxlength="15"  name="printClaimCertVat" style="height:15px;"/>
                                                  </td>
                                                <!--  <td><a href="#" onClick="showModalWindow('CLM');" ><img src="images/list_img.jpg" border="0" /></a></td>-->
                                                 <!-- <td> <a href="#" onClick="showModalWindow('CLM');" ><img src="images/list_img.jpg" border="0" /></a></td>-->
                                                </tr>
                                            </table></td>
                                            <td>
                                            <html:text property="title" maxlength="30"  name="printClaimCertVat" readonly="true" style="background-color:#c0c0c0;border:1px solid #8f8e8e;height:15px; width:250px; "/>
                                            </td>
                                          </tr>
                                          <tr>
                                            <td>HRDF Reg No:</td>
                                            <td>
                                            <table border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td>
                                                 <html:text property="vtfRegNum" maxlength="10"  name="printClaimCertVat" readonly="true" style="background-color:#c0c0c0;border:1px solid #8f8e8e;height:15px;"/>
                                                  </td>
                                                  <!--<td><a href="#" onClick="showModalWindow()" ><img src="images/list_img.jpg" border="0" /></a></td> -->
                                                </tr>
                                            </table></td>
                                            <td>
                                            <html:text property="vtfCompName" maxlength="50" name="printClaimCertVat" readonly="true" style="background-color:#c0c0c0;border:1px solid #8f8e8e;height:15px; width:250px; "/>
                                            </td>
                                          </tr>
                                          <tr>
                                            <td>Claim Status:</td>
                                            <td >
                                              <html:text property="claimStatus" maxlength="15"  name="printClaimCertVat" readonly="true" style="background-color:#c0c0c0;border:1px solid #8f8e8e;height:15px;"/>
                                            </td>
                                            
                                              <td >
                                              <html:hidden property="comcat" name="printClaimCertVat" value="VAT" />
                                            </td>
                                            
                                            <td >
                                              <html:hidden property="vatregno" name="printClaimCertVat"/>
                                              </td>
                                          </tr>
                                          <tr>
                                          <td>Status Date:</td>
                                          <td colspan="3"><html:text property="statusDate" name="printClaimCertVat" readonly="true" style="background-color:#c0c0c0;border:1px solid #8f8e8e;height:15px;" /></td>
                                          </tr>
                                          <tr>
                                          <td>Payment Date:<span class="red12">*</span></td>
                                          <td colspan="3"><html:text property="chequedate" name="printClaimCertVat" readonly="true" style="border:1px solid #8f8e8e;height:15px;" /><span style="padding-left:3px"><img alt="calender" id="calimg" align="Center" src="images/cal.JPG"  onclick="return showCalendar('chequedate','0','%d-%b-%Y',false,false);" class="cursorHand"></img></span></td>
                                          </tr>
                                           <tr>
                                          <td>Payment Ref:<span class="red12">*</span></td>
                                          <td colspan="3"><html:text property="chequeno" name="printClaimCertVat" readonly="false" style="border:1px solid #8f8e8e;height:15px;" /></td>
                                          </tr>
                                           <tr>
                                          <td>Payment Amount:<span class="red12">*</span></td>
                                          <td colspan="3"><html:text property="chequeamt" name="printClaimCertVat" readonly="false" onkeypress="return isNumeric();" style="border:1px solid #8f8e8e;height:15px;" /></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td class="bordertop">
                                      <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                          <tr>
                                              <td class="mandatory"><bean:message key="Mandatory"/></td>
                                            <td><div align="right">
                                              <html:hidden property="claimMode" name="printClaimCertVat"/>
                                              <!--<input type="submit" name="button" id="button" onClick="vFindControl(this);CallPrint();" value="Print Claim Certificate" />-->
                                              <html:submit property="trnsave"
                                                                       disabled="false"
                                                                       onclick="vFindControl(this);return validateRequired(printClaimCertVat);">Save</html:submit>
                                                 <html:button property="trnsearch" disabled="false" 
                                                                           value="Search" onclick="searchClicked();" />                
                                                   <html:button property="trndetails" disabled="false" 
                                                                           value="List Payments" onclick="detailsClicked();" />    
                                                                           
                                                    <html:button property="trnaddnew" disabled="false" 
                                                                           value="Add New" onclick="addNewClicked();" />                                     
                                              <html:submit property="trnclear"
                                                                       disabled="false"
                                                                       onclick="vFindControl(this);">Clear</html:submit>
                                            </div></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                </table></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table>
                </td>
              </tr>
            
  <tr>
  <td style="display: none;padding:20px" >
  
      </td>
      </tr>
      
</table>


</html:form>

</body>
</html>