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
      <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
 <script language="javascript" type="text/javascript" src="datetimepicker1.js"></script>
     <script type="text/javascript" src="js/calendar_inc.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/lang/calendar-en.js"></script>
     <script type="text/javascript" language="javascript"> 
     
    
   
     
     
       function onClaimLoad(){
       var vcomcat="PP";
   // alert("document.forms[1].curTabNew.value==="+document.forms[1].curTabNew.value);
     checkClearData();       
        if (!(document.forms[0].title.value==""))
         {
         document.forms[1].clmrefno.value=document.forms[0].claimrefno.value;
       
         }else{
         document.forms[1].clmrefno.value="";
         
         }
        
  var DBMSG='<%=request.getAttribute("userDBMes") %>';
        var result='<%=request.getAttribute("strMes") %>';
     
     if(result=='SUCCESS'){
     
      // document.forms[0].status.value="Cancelled";
       alert(DBMSG);
     }
       if(result=='FAIL'){
     
      // document.forms[0].status.value="Cancelled";
       alert(DBMSG);
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
    document.forms[0].refdate.value="";
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
  if(calMaxAmtStatus=='Validated'){
     
       document.forms[0].status.value="Validated";
      
     }

      
    
     
    
    
     
    
  }

 function overrideClicked(){
        document.forms[1].action='<%=request.getContextPath()%>'+'/CalculateMaxAmt.do?methodToCall=lp_Override_pp';
          document.forms[1].submit();
     
        document.forms[1].trncalculate.disabled=false;
    
    }  
    
   function calPartpaidClicked(){
        document.forms[1].action='<%=request.getContextPath()%>'+'/CalculateMaxAmt.do?methodToCall=lp_Partpaid';
          document.forms[1].submit();
     
        document.forms[1].trncalculate.disabled=false;
    
    }  
      
    function searchClicked(){
        document.forms[1].action='<%=request.getContextPath()%>'+'/CalculateMaxAmt.do?methodToCall=lp_Search_pp';
          document.forms[1].submit();
     
        document.forms[1].trncalculate.disabled=false;
    
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

     function vFindControl(elementRefa)
     
    {
  var curbut;
  var str_cntlVal;
  curbut= elementRefa.value;
  document.forms[1].operation.value=curbut
 
   if(curbut=='Clear'){
     document.forms[1].txtTotalLevyPaid.value="";
    document.forms[1].txtActClmAmt.value="";
    document.forms[1].txtActClmAmt.value=""; 
    document.forms[1].txtAppTrngCst.value="";
    document.forms[1].txtMaxClmAmt.value="";
    document.forms[1].txtTotalBenefit.value="";
    document.forms[1].txtPenReason.value="";
    document.forms[1].txtTurnOver.value="";
     document.forms[1].txtTotalLevyPaid.value="";
     document.forms[1].refNo.value="";
    document.forms[1].refdate.value="";
    document.forms[1].overrideAmt.value="";
    document.forms[1].overrideReason.value="";
    document.forms[1].refFilePath.value="";
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
  
    
  
     
  <!--  document.forms[1].cstprocess.disabled=false;   -->
  } 
    
    }
    
    function checkLevyPaid(){
  
       if(document.forms[1].txtTotalLevyPaid.value=="0"){
         alert("No Levy Payments exists for this HRDF Reg No.");
         document.forms[1].txtMaxClmAmt.value="0";
         return false;
       }
    }
    
   function checkNull(){
   
     if((document.forms[1].overrideAmt.value=="0")||(document.forms[1].overrideAmt.value=="")){
    
        document.forms[1].refNo.value="";
        document.forms[1].refdate.value="";
        document.forms[1].overrideAmt.value="";
        document.forms[1].overrideReason.value="";
        document.forms[1].refFilePath.value="";
     
   }
   else if((document.forms[1].overrideAmt.value!="0")||(document.forms[1].overrideAmt.value!="")){
    
   document.forms[1].trncalculate.disabled=true;
  } 
   }
     </script>
    <link href="../css/jdeveloper.css" rel="stylesheet" media="screen"/>
  </head>
  <body onload="onClaimLoad();">


  
                      <table width="100%" border="0" cellspacing="0"
                             cellpadding="1">
                        <tr>
                          <td valign="top" class="head_bgcolor">
                            <bean:message key="Cmca.titlepp"/>
                          </td>
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
                                      <td>
                                        <%@ include file="/claims/ClmRegCommonforPartpaidClaims.jsp"%>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                              <tr>
                                <td valign="top" class="padding5px">
                                  <div id="first" style="display:block;">
                                    <html:form action="/CalculateMaxAmt.do?methodToCall=getCalculateMaxAmt"
                                               method="post">
                                               
                                                  
     
                                      <table width="100%" border="0"
                                             cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td valign="top">
                                            <table border="0"
                                                   class="details_table"
                                                   cellspacing="0"
                                                   cellpadding="0">
                                              <tr>
                                                <td><bean:message key="Cmca.titlepp"/></td>
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
                                                    class="height130">
                                                  <table width="100%" border="0"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td style="padding-right: 5px;">
                                                        <table width="100%"
                                                               border="0"
                                                               cellspacing="0"
                                                               cellpadding="3">
                                                               
                                                          <tr>
                                                            <td><bean:message key="Cmca.TotalBenefit"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                            <html:text property="txtTotalBenefit"  name="CalculateMaxAmt" 
                                                            readonly="true"
                                                            style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/> 
                                                            </td>
                                                             <td><bean:message key="Cmca.OverrideAmt"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                            <html:text property="overrideAmt"  name="CalculateMaxAmt"  
                                                           /> 
                                                            </td>
                                                          </tr>     
                                                          <tr>
                                                            <td><bean:message key="Cmca.Totlevypaid"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                            <html:text property="txtTotalLevyPaid"  name="CalculateMaxAmt" 
                                                            readonly="true"
                                                            style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/> 
                                                            </td>
                                                             <td><bean:message key="Cmca.RefNo"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                            
                                                            <html:text property="refNo"  name="CalculateMaxAmt" 
                                                            /> 
                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td><bean:message key="Cmca.Actclmamt"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                               <html:text property="txtActClmAmt"  name="CalculateMaxAmt" 
                                                               readonly="true"
                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/> 
                                                            </td>
                                                           
                                                 <td  style="width:175px;" ><bean:message key="Cmca.Date"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                        
                                          
                                         </td>
                                           
                                    <td><html:text property="refdate" name="CalculateMaxAmt"  /> 
                                      <img alt="calender" id="calimg" align="Center" src="images/cal.JPG" 
                                      onclick="return showCalendar('refdate','1','%d-%b-%Y',false,false);"  class="cursorHand">
                                     </img>
                                      </td>
                                     
                               
                                                            
                                                            
                                                            
                                                            
                                                          </tr>
                                                          <tr>
                                                            <td><bean:message key="Cmca.AppTrngcst"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                             <html:text property="txtAppTrngCst"  name="CalculateMaxAmt" 
                                                             readonly="true"
                                                             style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/> 
                                                            </td>
                                                             <td><bean:message key="Cmca.filepath"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                            <!-- <html:text property="txtAppTrngCst"  name="CalculateMaxAmt"   /> -->
                                                             <html:text  property="refFilePath"  name="CalculateMaxAmt"   /></td>
                                                            </td>
                                                           
                                                          </tr>
                                                          <tr>
                                                            <td>
                                                              <bean:message key="Cmca.Maxclmamt"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                            </td>
                                                            <td>
                                                              <html:text property="txtMaxClmAmt"  name="CalculateMaxAmt" 
                                                              readonly="true"
                                                              style="background-color:#c0c0c0;border:1px solid #8f8e8e;  "/> 
                                                            </td>
                                                             <td><bean:message key="Cmca.reason"/><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                            <td>
                                                            <!-- <html:text property="txtAppTrngCst"  name="CalculateMaxAmt"   /> -->
                                                             <html:textarea  property="overrideReason"  name="CalculateMaxAmt"   cols="26" rows="3"/></td>
                                                            </td>
                                                          </tr>
                                                         
                                                           <tr>
                                                      <td>
                                                                     Status Reason:
                                                           </td>
                                                                        <td>
                                                                          <html:text property="txtPenReason"   name="CalculateMaxAmt"  readonly="true" 
                                                                           style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                        
                                                           
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
                                          
                                          
                                          <td valign="top" style="padding-top:8px;">
                                            <table 
                                                   width="100%"
                                                   border="0"
                                                   cellspacing="0"
                                                   cellpadding="3" class="field_table" >
                                              <tr>
                                                <td class="mandatory"><bean:message key="Mandatory"/></td>
                                                <td>
                                                  <div align="right">
                                                  <html:hidden property="clmrefno"  name="CalculateMaxAmt"  value="add"/> 
                                                   <input type="hidden"  name="txtClaimRefNum" id="txtClaimRefNum" >
                                                   <html:hidden property="operation"  name="CalculateMaxAmt"  value="add"/> 
                                                   <html:hidden property="mode"  name="CalculateMaxAmt" /> 
                                                <!-- <html:submit  property="trncalculate" disabled="false"   onclick="calPartpaidClicked(); return checkLevyPaid();" > Calculate </html:submit>-->
                                                    <html:button property="trncalculate" disabled="false" 
                                                                           value="Calculate"  onclick="calPartpaidClicked(); return checkLevyPaid();"  />
                                                                           
                                                      <html:button property="trnsearch" disabled="false" 
                                                                           value="Search"  onclick="searchClicked();"/>                       
                                                   
                                                  <!-- <html:submit  property="trnsearch" disabled="false"  onclick="vFindControl(this);" > Search </html:submit>-->
                                                    <!--<html:submit  property="trnovrride" disabled="false"  onclick="vFindControl(this);" > Override </html:submit>-->
                                                      <html:button property="btnOverride" disabled="false" 
                                                                           value="Override" onclick="overrideClicked();" />
                                                   
                                                   <html:button  property="trnclear" disabled="false"  onclick="vFindControl(this),v_clear();" > Clear </html:button>
                                                   
                                                 
                                                   <input type="button" name="button" id="button" onClick="vFindControl(this);CallPrint();" value="Print Claim Details" />                                             </div>
                                                </td>
                                              </tr>
                                            </table>
                                          </td>
                                        </tr>
                                      </table>
                                      <tr>
  <td style="display: none;padding:20px" >
      <div id="print" style="display: none;" >
      <table  cellspacing="0" cellpadding="0" id="TblPrint" style="width:800px;border: 1px solid #000000;" border="0" align="center">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100" rowspan="3"><img src="images/bota_logo.jpg" alt="HRDC" /></td>
        <td><b> <div align="center">
                                <span class="nw_header_font">
                                  <bean:message key="VTFS"/>
                                </span>
                              </div><b></td>
      </tr>
      <tr>
        <td><div align="center"><Strong>Claim Details For Partpaid Claims</strong></div></td>
      </tr>
      <tr>
        <td><div align="center"><Strong>(under Vocational Training(Reimbursement) Regulations Act SL_2008)</strong></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="3">
      <tr>
        <td width="85"><strong>Claimant:</strong></td>
        <td width="85">Vat No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</td>
        <td> <html:text property="vatregno" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
        <td width="85">Vtfs No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</td>
        <td> <html:text property="vtfRegNum" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</td>
        <td><html:text property="vtfCompName" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF;width:300px " /></td>
        <td>Claim Ref No&nbsp;&nbsp;&nbsp;:</td>
        <td><html:text property="txtClaimRefNum" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF;"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Address&nbsp;&nbsp;&nbsp;:</td>
        <td>
        <html:text property="pobox" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF;width:200px"/>
        <html:text property="city" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF;width:200px"/>
        <html:text property="pcountry" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF;width:200px"/></td>
        <td valign="top">Title of Claim&nbsp;&nbsp;&nbsp;:</td>
        <td valign="top"><html:text property="title" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF;"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>Date of Claim&nbsp;&nbsp;&nbsp;:</td>
        <td><html:text property="claimdate" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="3">
      <tr>
        <td width="200">Claim Fy Year</td>
        <td>:<html:text property="finyear" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
        <td width="200">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
       <td width="200">Annual Turnover(BWP)</td>
        <td>:<html:text property="txtTurnOver" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
        <td width="200">Annual Levy Paid(BWP)</td>
        <td>:<html:text property="txtTotalLevyPaid" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
      <td width="200">Override Amount(BWP)</td>
        <td>:<html:text property="overrideAmt" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>

    </tr>
      <tr>
        <td>Total Training Costs Claimed(BWP)</td>
        <td>:<html:text property="txtActClmAmt" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
        <td>Amount Approved(BWP)</td>
        <td>:<html:text property="txtAppTrngCst" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
        <td>(upto Previous Claim)</td>
        <td>&nbsp;</td>
        <td>(upto Previous Claim)</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Levy Amount Eligible for Claim(BWP)</td>
        <td>:<html:text property="txtMaxClmAmt" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
        <td>Claim Amount(BWP)</td>
        <td>:<html:text property="txtActClmAmt" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
     
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table  style="width:800px;border: 1px solid #000000;" cellspacing="0" cellpadding="3">
      <tr>
        <td width="320" >Credit Available to Claimant from Previous claims(BWP)</td>
        <td>:<html:text property="creditavail" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
        <td>Amount Owed by Claimant from Previous claims(BWP)</td>
        <td>:<html:text property="amtowned" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
        <td>Claim Approved (BWP)</td>
        <td>:<html:text property="txtAppTrngCst" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td style="border-center: 1px solid #000000; ">Total Amount payable for this claim(BWP): <html:text property="txtAppTrngCst" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF"/></td>
  </tr>
   <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="border-top: 1px solid #000000; ">&nbsp;</td>
  </tr>
 <tr>
    <td>&nbsp;</td>
   
  </tr>
  <tr>
    <td><table  style="width:800px;border: 1px solid #000000;"  cellspacing="0" cellpadding="3">
      <tr>
        <td width="85" style="border: 1px solid #000000">&nbsp;</td>
        <td width="150" style="border: 1px solid #000000">Prepared by</td>
        <td width="150" style="border: 1px solid #000000">Checked by</td>
       <!-- <td width="150" style="border: 1px solid #000000">Approved by</td>-->
        <td width="150" style="border: 1px solid #000000">&nbsp;</td>
      </tr>
      <tr>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">Signature</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
         <!-- <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>-->
        <td style="border-top: 1px solid #000000;">&nbsp;</td>
      </tr>
      <tr>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">Designation</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
         <!-- <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>-->
          <td style="border-top: 1px solid #000000;">&nbsp;</td>
      </tr>
      <tr>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">Date:</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
         <!-- <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>-->
        <td style="border-top: 1px solid #000000;">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="border-top: 1px solid #000000; ">Remarks: <html:textarea  property="remarks" readonly="true" name="CalculateMaxAmt"  style="border: 1px solid #FFFFFF" cols="100" rows="4"/></td>
  </tr>
    <td>&nbsp;</td>
  </tr>
</table>   
    
     <table> 
     <div class="centeraln" style="padding-top:3%"  >
        <style type="text/css" media="print">
        .printbutton {
        visibility: hidden;
        display: none;
        }
        
        </style>
        <input type="button" value="Print" align="middle"  class="printbutton" onclick="window.print()";/>
      
        </div>
       </table>
  
      </div>
      </td>
      </tr>
    </div>
      </td>
      </tr>
                        </table>
                      
    </html:form></body>
</html>
                   
    </body>

   </html> 
