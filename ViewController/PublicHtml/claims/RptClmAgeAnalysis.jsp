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
     document.forms[1].txtTurnOver.value="";
   }
 
     var calMaxAmtStatus='<%=request.getAttribute("calMaxAmountStatus") %>';
        var result='<%=request.getAttribute("result") %>';
     
     if(result=='SUCCESS'){
     
       document.forms[0].status.value="Cancelled";
       alert("Claim Cancelled successfully")
     }
       if(result=='FAIL'){
     
      // document.forms[0].status.value="Cancelled";
       alert("Cannot Cancel Approved claim")
     }
     
  }
   function clearClicked()
    {         
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
  }  
    
    
    function checkLevyPaid(){
    
       if(document.forms[1].txtTotalLevyPaid.value=="0"){
         alert("No Levy Payments exists for this HRDF Reg No.");
         document.forms[1].txtMaxClmAmt.value="0";
         return false;
       }
    }
    function submitClicked()
    {    
           // var clmRegno  = document.forms[0].elements["claimrefno"].value; 
            var fromdate  = document.forms[0].elements["FDate"].value;
            alert(fromdate);
        // var todate =document.forms[0].elements["TDate"].value;
           if (!fromdate==""){           
            window.open("reportJSP/PrintClaimAgeAnalysis.jsp?fromdate="+fromdate,'classPop', "location=1,status=1,scrollbars=1,width=900,height=750,left=100,top=150"); 
           //window.open("reportJSP/PrintClaimsBasedonStatus.jsp?fromdate="+str1+"&todate="+str2+"&finYr1="+finYr1+"&finYr2="+finYr2+"&claimsStatus="+status+"&VTFRegNo="+VTFRegNo+"&VTFCompName="+VTFCompName,'classPop', "location=1,status=1,scrollbars=1,width=900,height=750,left=100,top=150"); 
      }
     }
     function CallPrint()
    {
   
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
    <link href="../css/jdeveloper.css" rel="stylesheet" media="screen"/>
  </head>
  <body onload="onClaimLoad();"><html:form action="/ListOfPpaidClaimsAction.do?methodToCall=showPpaidClaimDetails"
                                 method="post">
      <html:javascript formName="ListOfPpaidClaims"/>                        
                      <table width="100%" border="0" cellspacing="0"
                             cellpadding="1">
                        <tr>
                          <td valign="top" class="head_bgcolor">Age Analysis Report                          </td>
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
                                  <td style="height:50px;">
                                    <table width="100%" border="0"
                                           cellspacing="0" cellpadding="3">
                                           <tr>
                                      <td width="11%">
                                        From Date:
                                        <span class="red12">*</span>
                                        <html:text property="FDate"
                                                   name="ListOfPpaidClaims"
                                                   style="width:110px;hight:14px"
                                                   readonly="true"/>
                                        <a>
                                          <img alt="pick a date" align="Center"
                                               width="20" height="21"
                                               src="images/cal.JPG"
                                               onclick="return showCalendar('FDate','0','%d-%b-%Y',false,false);"
                                               class="cursorHand"></img>
                                        </a>
                                      </td>
                                      
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                  </table>
                                   <table      width="100%"
                                                   border="1"
                                                   cellspacing="0"
                                                   cellpadding="3" class="field_table" >
                                              <tr>                                               
                                                <td>
                                                  <div align="right">                                                     
                                                  <html:button  property="btngenerate" onclick="submitClicked();">Generate</html:button>                                          
                                                  <html:button  property="trnclear" disabled="false"  onclick="clearClicked();" > Clear </html:button>
                                                            </div>
                                                </td>
                                              </tr>
                                     </table>
                                </td>
                              </tr>
                              </table></td></tr></table></html:form></body>
   </html> 