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
       String maxAmount=null;
        if(dateNow==null) dateNow="";
        if(username==null) username="";
           VTFSInterface vtfs=new VTFSInterface();
          ArrayList paylist=(ArrayList)vtfs.getPayTrackInCert(clmRefNo);
           // maxSeq=vtfs.getPayMaxTrackInCert(clmRefNo);
         //  maxSeq=vtfs.getPayMaxAmountInCert(clmRefNo);
            
          // String maxSeq=vtfs.getPayMaxTrackInCert(clmRefNo);
            long RptLearnSize;
            if(paylist==null){
            RptLearnSize=0;
            }else{
            RptLearnSize=paylist.size();
             request.getSession().setAttribute("paylist",paylist);
              request.setAttribute("paylist",paylist);
            }
%>
<%
          
        String clmRefNo1=request.getParameter("claimno");
       System.out.println("clmRefNo"+clmRefNo);
       
         if(clmRefNo1==null) clmRefNo1="";
      
        if(dateNow==null) dateNow="";
        if(username==null) username="";
           VTFSInterface vtf=new VTFSInterface();
          String outlist=vtf.getPayMaxAmountInCert(clmRefNo);
            long RptLearnSize1;
            if(outlist==null){
            RptLearnSize1=0;
            }else{
          
             request.getSession().setAttribute("outlist",outlist);
              request.setAttribute("outlist",outlist);
            }
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
     function vFindControl(elementRefa)
    {
  var curbut;
  var str_cntlVal;
  curbut= elementRefa.value;
  document.forms[0].operation.value=curbut
    }
     function showMessage(){
      
      if  (document.forms[0].claimstatus.value!="")
        {
            if ((document.forms[0].claimstatus.value=="Approved") || (document.forms[0].claimstatus.value=="Rejected"))
            {
           // document.forms[0].trnsubmit.disabled=true; 
           // document.forms[0].trnreject.disabled=true; 
            }else
            {
           // document.forms[0].trnsubmit.disabled=false; 
           // document.forms[0].trnreject.disabled=false; 
            }
        document.forms[0].button.disabled=false;
        }
        else
        {
      
        document.forms[0].button.disabled=true;
        }
        
        
        /*  if (document.forms[0].result.value!="")
          {
          alert(document.forms[0].result.value);
          document.forms[0].result.value="";
          }*/
    
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
        var vcomcat="<%= request.getAttribute("comcat") %>";
        
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
     
        var winprint=window.open("","",sOption); 
        winprint.document.open(); 
        winprint.document.write('<html><LINK  href=css/boto.css rel=Stylesheet><body>'); 
        winprint.document.write(sWinHTML);          
        winprint.document.write('</body></html>'); 
        winprint.document.close(); 
        winprint.focus(); 
    
    }  
    
    </script>
  </head>
  <body  onfocus="checkFocus();" onload="showMessage()">
  <html:form action="/CertClaimApp.do?methodToCall=getCertClaimApp"
                   method="post">
                         <table width="100%" border="0" cellspacing="0"
                               cellpadding="1">
                          <tr>
                            <td valign="top" class="head_bgcolor">
                              Print Claim Certificate
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%"
                                     border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td valign="top" class="padding5px">
                                    <table width="100%" border="0"
                                           cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td valign="top">
                                          <table border="0"
                                                 class="details_table"
                                                 cellspacing="0"
                                                 cellpadding="0">
                                            <tr>
                                              <td>Details</td>
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
                                              <td valign="top">
                                                <table width="100%" border="0"
                                                       cellspacing="0"
                                                       cellpadding="0">
                                                  <tr>
                                                    <td>
                                                      <table width="100%"
                                                             border="0"
                                                             cellspacing="0"
                                                             cellpadding="3">
                                                        <tr>
                                                          <td>
                                                            <bean:message key="ACP.ClaimNo"/>
                                                            <bean:message key="prompt.Common.LabelSuffix"/>
                                                            <span class="red12">*</span>
                                                          </td>
                                                          <td>
                                                            <table border="0"
                                                                   cellspacing="0"
                                                                   cellpadding="0">
                                                              <tr>
                                                                <td>
                                                                  <html:text property="claimno"
                                                                             name="CertClaimApp"
                                                                             style="height:15px;"/>
                                                                </td>
                                                                <td>
                                                                 <a href="#" onClick="showModalWindow('CLM');" ><img src="images/list_img.jpg" border="0" /></a>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                          </td>
                                                          <td colspan="2">
                                                            <html:text property="claimtitle"
                                                                       name="CertClaimApp"
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
                                                                       name="CertClaimApp"
                                                                       readonly="true"
                                                                       style="background-color:#c0c0c0;border:1px solid #8f8e8e;"/>
                                                          </td>
                                                          <td colspan="2">
                                                            <html:text property="vtfname"
                                                                       name="CertClaimApp"
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
                                                                       name="CertClaimApp"
                                                                       readonly="true"
                                                                       style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                          </td>
                                                          <td>
                                                            <bean:message key="ACP.ClaimDate"/>
                                                            <bean:message key="prompt.Common.LabelSuffix"/>
                                                          </td>
                                                          <td>
                                                            <html:text property="claimdate"
                                                                       name="CertClaimApp"
                                                                       readonly="true"
                                                                       style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                          </td>
                                                        </tr>
                                                        
                                                        
                                                        
                                                        </table>
                                                   </td>
                                                   </tr>
                                                  <tr>
                                                    <td class="bordertop">
                                                      <table width="100%"
                                                             border="0"
                                                             cellspacing="0"
                                                             cellpadding="3">
                                                        <tr>
                                                          <td class="mandatory">
                                                            <bean:message key="Mandatory"/>
                                                          </td>
                                                          <td>
                                                            <div align="right">
                                                             <html:hidden property="comcat" name="CertClaimApp" value="VAT" />
                                                              <html:hidden property="operation"
                                                                           name="CertClaimApp"
                                                                           value="add"/>
                                                               
                                                              <html:hidden property="mode"
                                                                           name="CertClaimApp"/>
                                                              <input type="button" name="button" id="button" onClick="vFindControl(this);CallPrint();" value="Print Claim Certificate" /> 
                                                             
                                                         
                                                           
                                                         
                                                               
                                                              <html:submit property="trnsearch"
                                                                           disabled="false"
                                                                           onclick="vFindControl(this);">Search</html:submit>
                                                                
                                                               
                                                              <!--  <html:submit  property="trnsave" disabled="false"  onclick="vFindControl(this);" > Save </html:submit>-->
                                                               
                                                              <html:submit property="trnclear"
                                                                           disabled="false"
                                                                           onclick="vFindControl(this);">Clear</html:submit>
                                                               
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
  <td style="display: none;padding:20px" >
      <div id="print" style="display: none;" >
        
 <table  cellspacing="0" cellpadding="0" id="TblPrint" style="width:800px;border: 1px solid #000000;" border="0" align="center">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100" rowspan="3"><img src="images/bota_logo.jpg" alt="Boto" /></td>
        <td><b> <div align="center">
                                <span class="nw_header_font">
                                  <bean:message key="VTFS"/>
                                </span>
                              </div></b>
                             </td>
      </tr>
      <tr>
        <td><div align="center"><Strong>Certificate of claim </strong></div></td>
      </tr>
      <tr>
        <td><div align="center"><Strong>(under Vocational Training(Reimbursement) Regulations Act SL_2008</strong></div></td>
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
        <td width="85">Vat No:</td>
        <td> <html:text property="vatregno" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
        <td width="85">Vtfs No:</td>
        <td> <html:text property="pvtfregno" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Name:</td>
        <td><html:text property="pvtfname" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF;width:300px " /></td>
        <td>Claim Ref No:</td>
        <td><html:text property="pclaimno" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF;"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Address:</td>
        <td>&nbsp;</td>
        <td>Title of Claim:</td>
        <td><html:text property="pclaimtitle" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF;"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>Date of Claim:</td>
        <td><html:text property="claimdate" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="3">
      <tr>
        <td width="200">Claim Fy Year</td>
        <td>:<html:text property="annualtax" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
        <td width="150">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Annual Turnover(BWP)</td>
        <td>: <html:text property="annualturnover" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
        <td>Annual Levy Paid(BWP)</td>
        <td>:<html:text property="annuallevypaid" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
       <tr>
       <td width="200">Override Amount(BWP)</td>
        <td>:<html:text property="overrideAmtforCert" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
       </tr>
          
      <tr>
        <td>Total Training Costs Claimed(BWP)</td>
        <td>:<html:text property="tottrngcost" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
        <td>Amount Approved(BWP)</td>
        <td>:<html:text property="trngcostamtapp" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
        <td>(upto Previous Claim)</td>
        <td>&nbsp;</td>
        <td>(upto Previous Claim)</td>
        <td>&nbsp;</td>
      </tr><!--maxAmount-->
      <tr>
        <td>Levy Amount Eligible for Claim(BWP)</td>
        <td>:<html:text property="maximumclaimableamount" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
        <!--maxAmount-->
        <td>Claim Amount(BWP)</td>
        <td>:<html:text property="trngcostamtapp" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      
         <tr>
        <td>Payment status</td>
        <td>:<html:text property="payDetails" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
        <td>Outstanding Balance(BWP)</td>
        <td>:<html:text property="outStandingAmt" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
        <td></td>
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
        <td>: <html:text property="creditavail" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
        <td>Amount Owed by Claimant from Previous claims(BWP)</td>
        <td>:<html:text property="amtowned" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
      <tr>
      <!-- maxAmount-->
        <td>Claim Approved(BWP)</td>
        <td>:<html:text property="trngcostamtapp" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
 <!-- <tr>
    <td style="border-top: 1px solid #000000; ">Total Amount payable for this claim(BWP) <html:text property="maxAmount" readonly="true" name="CertClaimApp"  style="border: 1px solid #FFFFFF"/></td>
  </tr>-->
   
     <td>Total Amount payable for this claim(BWP): <%=outlist%> </td>                   
  
  
  
  
    
  
    <tr>
      
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="border-top: 1px solid #000000; ">  <display:table name="${paylist}" style="font-size: 10px;"       
                                               class="dataTable"
                                               defaultsort="1"
                                               defaultorder="ascending">
                                                           
                                 
                                  <display:column property="seqNo"
                                           title="Sequence No"
                                                 />
                                  <display:column title="Approved Date" 
                                                 property="processDate"
                                                  />
                                 <display:column property="calMaxAmt"
                                                 title ="Maximum Claimable Amt"
                                                  />
                                  <display:column property="totPaid"
                                                  title="Total Paid"
                                                  />
                                                
                              
                        
        
                    </display:table></td>
  </tr>
  <tr> </tr>
 
 
  <tr><td>&nbsp;</td></tr>
  <tr>
  
  <tr>
    <td style="border-top: 1px solid #000000; "></td>
  </tr>
  <tr>
     <td><table  style="width:800px;border: 1px solid #000000;"  cellspacing="0" cellpadding="3">
      <tr>
       <td width="150" style="border: 1px solid #000000">Approved by</td>
        <td width="150" style="border: 1px solid #000000">&nbsp;</td>
       
       
        <td width="150" style="border: 1px solid #000000"> &nbsp;</td>
        <td width="150" style="border: 1px solid #000000">&nbsp;</td>
      </tr>
      <tr>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">Signature</td>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-top: 1px solid #000000;">&nbsp;</td>
      </tr>
      <tr>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">Designation</td>
        
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
         <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
          <td style="border-top: 1px solid #000000;">&nbsp;</td>
      </tr>
      <tr>
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">Date:</td>
       
        <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
         <td style="border-right: 1px solid #000000;border-top: 1px solid #000000;">&nbsp;</td>
        <td style="border-top: 1px solid #000000;">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
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
        <input type="button" value="Print"  class="printbutton" onclick="window.print()";/>
      
        </div>
       </table>
   
  
      
      </div>
      </td>
      
      </tr>                 
                                                 
                                                 
                                                   </table>
  
  </td>
  </tr>
  

  </table>
  
</html:form ></body>
</html>