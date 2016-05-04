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
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ page import="com.vtfs.helper.registry.VTFSInterface,com.vtfs.dto.claims.LearnerListVO,com.vtfs.util.VTFSLogger"%>
<%
        java.util.Calendar currentDate =  java.util.Calendar.getInstance();
        java.text.SimpleDateFormat formatter= 
        new java.text.SimpleDateFormat("dd-MMM-yy@HH:mm");
        String dateNow=formatter.format(currentDate.getTime());   
        String clmRefNo=request.getParameter("claimno");
       System.out.println("clmRefNo"+clmRefNo);
        String username=(String)request.getSession().getAttribute("CUserID");
         if(clmRefNo==null) clmRefNo="";
      String maxSeq=null;
        if(dateNow==null) dateNow="";
        if(username==null) username="";
           VTFSInterface vtfs=new VTFSInterface();
          ArrayList paylist=(ArrayList)vtfs.getPayTrackInCert(clmRefNo);
            maxSeq=vtfs.getPayMaxTrackInCert(clmRefNo);
            ArrayList trainingDet=(ArrayList)vtfs.getTrainingDetails(clmRefNo);
          // String maxSeq=vtfs.getPayMaxTrackInCert(clmRefNo);
             long RptLearnSize;
            if(paylist==null|| trainingDet==null){
            RptLearnSize=0;
            }else{
            RptLearnSize=paylist.size();
             request.getSession().setAttribute("trainingDet",trainingDet);
              request.setAttribute("trainingDet",trainingDet);
             request.getSession().setAttribute("paylist",paylist);
              request.setAttribute("paylist",paylist);
            }
%>
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
    <link rel="stylesheet" type="text/css" media="all"
          href="js/skins/aqua/theme.css" title="Aqua"/>
    <script language="javascript" type="text/javascript" src="js/menu_home.js"></script>
    <script language="javascript" type="text/javascript"
            src="js/RegisterCategory.js"></script>
    <script type="text/javascript" src="js/calendar_inc.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/lang/calendar-en.js"></script>
    <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
    <script type="text/javascript" language="javascript"> 
     function vFindControl(elementRefa)
     {
  
          var curbut;
          curbut= elementRefa.value;          
          
          if(curbut=='SearchNL'){
            document.forms[0].operation.value=curbut;
            document.forms[0].submit();
          }else if(curbut=='ClearNL'){
            document.forms[0].operation.value=curbut;
            document.forms[0].submit();
          }         
         
     }
 var DBMSG='<%=request.getAttribute("userDBMes") %>';
        var result='<%=request.getAttribute("strMes") %>';
      //alert(DBMSG);
      
     if(result=='SUCCESS'){
        
       alert(DBMSG);
     }
       if(result=='FAIL'){
    
       alert(DBMSG);
     }   
    function onSubmit(elementRefa){
        
       if(document.forms[0].grantclaimamount.value==""){
         alert("Approved claim amount is blank. Cannot be processed.");
       }else{
    
          var curbut;
          curbut= elementRefa.value;
          document.forms[0].operation.value=curbut;
          if(confirm('Are you sure to Submit the Claim?')){
            document.forms[0].submit();
          }
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
        var vtfNo;
        var vtfComp;
        var ClaimNo;
        var ClaimTitle;
        var VTFNo;
        var VTFCompName;
        //var vcomcat="<%= request.getAttribute("comcat") %>";
        var vcomcat="OTHERS";
        VTFNo='vtfregno';
        VTFCompName='vtfname';
        
        ClaimNo='claimno';
        ClaimTitle='claimtitle';
      //  VTFNo='vtfRegNum';
      //  VTFCompName='vtfCompName';
        
         if(forPop=='VTF'){
         modalWin=showVTFPopUp(350,300,vtfNo,vtfComp,vcomcat);
         }
         else
         modalWin=showClaimPopUp(350,400,ClaimNo,ClaimTitle,VTFNo,VTFCompName,vcomcat);
            
    }
 
 
    
    
     function CallPrint()
    {
   
        var sOption="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
        sOption+="scrollbars=yes,width=850,height=700,left=100,top=25"; 
    
        var sWinHTML = document.getElementById('print').innerHTML; 
         var clmRefNo  = document.forms[0].elements["claimno"].value;
        var winprint=window.open("","",sOption); 
        winprint.document.open(); 
        winprint.document.write('<html><LINK  href=css/boto.css rel=Stylesheet><body>'); 
        winprint.document.write(sWinHTML);          
        winprint.document.write('</body></html>'); 
        winprint.document.close(); 
        winprint.focus(); 
    
    }</script>
  </head>
</html>

<body onfocus="checkFocus();" onload="showMessage()"><html:form action="/ApproveClaimApp.do?methodToCall=getApproveClaimApp"
                                                                method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="1">
      <tr>
        <td valign="top" class="head_bgcolor">Claim Certificate For Non Levy
                                              Payyers</td>
      </tr>
      <tr>
        <td valign="top">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td valign="top" class="padding5px">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                                  <table width="100%" border="0" cellspacing="0"
                                         cellpadding="3">
                                    <tr>
                                      <td>
                                        <bean:message key="ACP.ClaimNo"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                        <span class="red12">*</span>
                                      </td>
                                      <td>
                                        <table border="0" cellspacing="0"
                                               cellpadding="0">
                                          <tr>
                                            <td>
                                              <html:text property="claimno"
                                                         name="ApproveClaimApp"
                                                         style="height:15px;"/>
                                            </td>
                                            <td>
                                              <a href="#"
                                                 onclick="showModalWindow('CLM');">
                                                <img src="images/list_img.jpg"
                                                     border="0"/>
                                              </a>
                                            </td>
                                          </tr>
                                        </table>
                                      </td>
                                      <td colspan="2">
                                        <html:text property="claimtitle"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:308px;"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <bean:message key="ACP.VTFRegNo"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="vtfregno"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e;"/>
                                      </td>
                                      <td colspan="2">
                                        <html:text property="vtfname"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:308px;"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <bean:message key="ACP.ClaimStatus"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="claimstatus"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                      <td>
                                        <bean:message key="ACP.ClaimDate"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="claimdate"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td width="25%">
                                        <bean:message key="ACP.TotalLevyPaid"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td width="20%">
                                        <html:text property="totallevypaid"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                      <td>
                                        <bean:message key="ACP.ApprovedTrainingCost"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="approvedtrainingcost"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <bean:message key="ACP.ActualClaimAmount"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="actualclaimamount"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                      <td>
                                        <bean:message key="ACP.GrantClaimAmount"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="grantclaimamount"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <bean:message key="ACP.MaximumClaimableAmount"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="maximumclaimableamount"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                      <td>
                                        <bean:message key="ACP.TotalPayableAmount"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="totalpayableamount"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <bean:message key="ACP.PreviousClaimDue"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="previousclaimdue"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                      <td>
                                        <bean:message key="Cmca.OverrideAmt"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="overrideAmt"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <bean:message key="Cmca.RefNo"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="refNo"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                      <td>
                                        <bean:message key="Cmca.Date"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="refDate"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <bean:message key="Cmca.filepath"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="refFilePath"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                      <td>
                                        <bean:message key="Cmca.paydetails"/>
                                        <bean:message key="prompt.Common.LabelSuffix"/>
                                      </td>
                                      <td>
                                        <html:text property="payDetails"
                                                   name="ApproveClaimApp"
                                                   readonly="true"
                                                   style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                              <!--start -->
                              <tr>
                                <td>
                                  <bean:message key="Cmca.reason"/>
                                  <bean:message key="prompt.Common.LabelSuffix"/>
                                  <html:text property="overrideReason" size="94"
                                             readonly="true"
                                             name="ApproveClaimApp"/>
                                </td>
                                <td>&nbsp;</td>
                              </tr>
                              <!--end -->
                              <!--start -->
                              <tr>
                                <td>
                                  <bean:message key="ACP.Remarks"/>
                                  <bean:message key="prompt.Common.LabelSuffix"/>
                                  <html:text property="remarks" size="103"
                                             name="ApproveClaimApp"/>
                                </td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td class="bordertop">
                                  <table width="100%" border="0" cellspacing="0"
                                         cellpadding="3">
                                    <tr>
                                      <td class="mandatory">
                                        <bean:message key="Mandatory"/>
                                      </td>
                                      <td>
                                        <div align="right">
                                          <html:hidden property="operation"
                                                       name="ApproveClaimApp"
                                                       value="add"/>
                                           
                                          <html:hidden property="mode"
                                                       name="ApproveClaimApp"/>
                                           
                                          <html:hidden property="htxtRejectReason"
                                                       name="ApproveClaimApp"/>
                                           
                                          <input type="button" name="button"
                                                 id="button"
                                                 onclick="vFindControl(this);CallPrint();"
                                                 value="Print Claim Details"/>
                                           
                                          <html:button property="trnsearch"
                                                       disabled="false"
                                                       onclick="vFindControl(this);"
                                                       value="SearchNL"/>
                                           
                                          <!--  <html:submit  property="trnsave" disabled="false"  onclick="vFindControl(this);" > Save </html:submit>-->
                                           
                                          <html:button property="trnclear"
                                                       disabled="false"
                                                       onclick="vFindControl(this);"
                                                       value="ClearNL">Clear</html:button>
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
              <td valign="top" class="padding5px">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td style="display: none;padding:20px">
          <div id="print" style="display: none;">
            <table cellspacing="0" cellpadding="0" id="TblPrint"
                   style="width:800px;border: 1px solid #000000;" border="0"
                   align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0"
                         cellpadding="0">
                    <tr>
                      <td width="100" rowspan="3">
                        <img src="images/bota_logo.jpg" alt="HRDC"/>
                      </td>
                      <td>
                        <b><div align="center">
                            <span class="nw_header_font">
                              <bean:message key="VTFS"/>
                            </span>
                          </div></b>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div align="center">
                          <strong>Claim Details</strong>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div align="center">
                          <strong>(under Vocational Training(Reimbursement)
                                  Regulations Act SL_2008)</strong>
                        </div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0"
                         cellpadding="3">
                    <tr>
                      <td width="85">
                        <strong>Claimant:</strong>
                      </td>
                      <td width="75">Vat No</td>
                      <td width="200">: Non Levy Payer</td>
                      <td width="100">Vtfs No</td>
                      <td>:<html:text property="pvtfregno" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>Name</td>
                      <td>:<html:text property="pvtfname" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF;width:190px"/>
                      </td>
                      <td>Claim Ref No</td>
                      <td>:<html:text property="pclaimno" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF;"/>
                      </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="top">Address</td>
                      <td width="200">:<html:text property="pobox" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF;"/>,
                                &nbsp;&nbsp;<html:text property="pcity" readonly="true"  name="ApproveClaimApp" style="border: 1px solid #FFFFFF;"/>,
                                &nbsp;&nbsp;<html:text property="pcountry" readonly="true" name="ApproveClaimApp" style="border: 1px solid #FFFFFF;"/>.
                      </td>
                      <td valign="top">Title of Claim</td>
                      <td valign="top">:
                        <html:text property="pclaimtitle" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF;"/>
                      </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>Date of Claim</td>
                      <td>: <html:text property="claimdate" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0"
                         cellpadding="3">
                    <tr>
                      <td width="200">Claim Fy Year</td>
                      <td>
                        :
                        <html:text property="annualtax" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                      <td width="200">&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="200">Annual Turnover(BWP)</td>
                      <td>
                        :
                        <html:text property="annualturnover" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                      <td width="200">Annual Levy Paid(BWP)</td>
                      <td>
                        :
                        <html:text property="annuallevypaid" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                    </tr>
                    <tr>
                      <td width="200">Override Amount(BWP)</td>
                      <td>
                        :
                        <html:text property="overrideAmt" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                    </tr>
                    <tr>
                      <td>Total Training Costs Claimed(BWP)</td>
                      <td>
                        :
                        <html:text property="tottrngcost" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                      <td>Amount Approved(BWP)</td>
                      <td>
                        :
                        <html:text property="trngcostamtapp" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                    </tr>
                    <tr>
                      <td>(upto Previous Claim)</td>
                      <td>&nbsp;</td>
                      <td>(upto Previous Claim)</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>Levy Amount Eligible for Claim(BWP)</td>
                      <td>
                        :
                        <html:text property="maximumclaimableamount"
                                   readonly="true" name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                      <td>Claim Amount(BWP)</td>
                      <!--<td>:<html:text property="clmamount" readonly="true" name="ApproveClaimApp"  style="border: 1px solid #FFFFFF"/></td>-->
                      <td>
                        :
                        <html:text property="trngcostamtapp" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                    </tr>
                    <tr>
                      <td>Payment status</td>
                      <td>
                        :
                        <html:text property="payDetails" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                      <td>Outstanding Balance(BWP)</td>
                      <td>
                        :
                        <html:text property="outStandingAmt" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>
                  <table style="width:800px;border: 1px solid #000000;"
                         cellspacing="0" cellpadding="3">
                    <tr>
                      <td width="320">Credit Available to Claimant from Previous
                                      claims(BWP)</td>
                      <td>
                        :
                        <html:text property="creditavail" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                    </tr>
                    <tr>
                      <td>Amount Owed by Claimant from Previous claims(BWP)</td>
                      <td>
                        :
                        <html:text property="amtowned" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                    </tr>
                    <tr>
                      <!--   trngcostamtapp  -->
                      <td>Claim Approved (BWP)</td>
                      <td>
                        :
                        <html:text property="trngcostamtapp" readonly="true"
                                   name="ApproveClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td style="border-center: 1px solid #000000; ">
                  Total Amount payable for this claim(BWP): 
                  <html:text property="totalpayableamount" readonly="true"
                             name="ApproveClaimApp"
                             style="border: 1px solid #FFFFFF"/>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>
                  <table style="width:800px;border: 1px solid #000000;"
                         cellspacing="0" cellpadding="3">
                    <tr>
                      <td width="85" style="border: 1px solid #000000">&nbsp;</td>
                      <td width="150" style="border: 1px solid #000000">Prepared
                                                                        by</td>
                      <td width="150" style="border: 1px solid #000000">Checked
                                                                        by</td>
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
                  </table>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td style="border-top: 1px solid #000000; ">
                  Remarks: 
                  <html:textarea property="remarks" readonly="true"
                                 name="ApproveClaimApp"
                                 style="border: 1px solid #FFFFFF" cols="100"
                                 rows="4"/>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
             
            <table>
              <div class="centeraln" style="padding-top:3%">
                <style type="text/css" media="print">
													.printbutton {
													visibility: hidden;
													display: none;
													}
													
													</style>
                 
                <input type="button" value="Print" align="middle"
                       class="printbutton" onclick='window.print()";'/>
              </div>
            </table>
          </div>
        </td>
      </tr>
    </table>
  </html:form></body>