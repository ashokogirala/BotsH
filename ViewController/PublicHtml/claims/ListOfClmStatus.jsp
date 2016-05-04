<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>



<%@ page import="java.io.*" %> 
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.*,com.vtfs.util.VTFSLogger" %>
<%
String claimsStatus=(String)request.getSession().getAttribute("ClAIM_STATUS");
 String clmStatus=(String)request.getSession().getAttribute("clmStatus");

%>
<%
     
          
        java.util.Calendar currentDate =  java.util.Calendar.getInstance();
        java.text.SimpleDateFormat formatter= 
        new java.text.SimpleDateFormat("dd-MMM-yy@HH:mm");
        String dateNow=formatter.format(currentDate.getTime());   
      
        String fromdate=(String)request.getSession().getAttribute("Fdate");
        String todate=(String)request.getSession().getAttribute("Tdate");
        VTFSLogger.logDebug("from date==>"+fromdate);
        VTFSLogger.logDebug("todate date==>"+todate);
        String username=(String)request.getSession().getAttribute("CUserID");
        if(fromdate==null) fromdate="";
        if(todate==null) todate="";
        if(dateNow==null) dateNow="";
        if(username==null) username="";
        
        ArrayList totalList=(ArrayList)request.getAttribute("totalList");
        
        /*
        ArrayList approveList=(ArrayList)request.getAttribute("approveList");
        ArrayList rejectList=(ArrayList)request.getAttribute("rejectList");
        ArrayList pendingList=(ArrayList)request.getAttribute("pendingList");
        ArrayList confirmedList=(ArrayList)request.getAttribute("confirmedList");
        ArrayList registeredList=(ArrayList)request.getAttribute("registeredList"); */
        
        int totalListSize;
        /*
        int approvedSize;
        int rejectedSize;
        int pendingSize;
        int registeredSize;
        int confirmedSize;
            */
        /*
        if(approveList==null){
        approvedSize=0;
        }else{
        approvedSize=approveList.size();
        }
        
        if(rejectList==null){
        rejectedSize=0;
        }else{
        rejectedSize=rejectList.size();
        }
        
        if(pendingList==null){
        pendingSize=0;
        }else{
        pendingSize=pendingList.size();
        }
        
         if(registeredList==null){
        registeredSize=0;
        }else{
        registeredSize=registeredList.size();
        }
       
        if(confirmedList==null){
        confirmedSize=0;
        }else{
        confirmedSize=confirmedList.size();
        }
        */
         
         if(totalList==null){
            totalListSize=0;
            }else{
            totalListSize=totalList.size();
        }
         
         String generateFlag=  (String)request.getSession().getAttribute("generateFlag");
        if(generateFlag==null)
        generateFlag="";
        %>
<html>
  <head>
    <link href="styles/boto.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="js/menu.js"></script>
<link href="styles/menu.css" type="text/css" rel="stylesheet">
<link href="styles/menu_home.css" type="text/css" rel="stylesheet"></link>
 <link href="css/displaytagex.css" rel="stylesheet" type="text/css" / >
    <script language="javascript" type="text/javascript" src="js/datetimepicker.js"></script>
    <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
    
    <script type="text/javascript">
    function openPOP(){
             window.open("ComPopVTFReg.jsp",'classPop','width=600,height=400');
       }
       function clearClicked(){
       
        document.forms[0].elements["htxtMode"].value="CLEAR"
        document.forms[0].elements["FDate"].value="";
        document.forms[0].elements["TDate"].value="";
        document.forms[0].elements["claimsStatus"].value="All";
        document.forms[0].elements["vtfRegNum"].value="";
        document.forms[0].elements["vtfCompName"].value="";
        document.forms[0].elements["finYear1"].value="";
        document.forms[0].elements["finYear2"].value="";
        
       // document.forms[0].submit();
     }
    
    function submitClicked()
    {           
         if (validateRequired(document.forms[0])){
                var str1  = document.forms[0].elements["FDate"].value;
                var str2  =document.forms[0].elements["TDate"].value;
                var status=document.forms[0].elements["claimsStatus"].value;                
                var VTFRegNo  = document.forms[0].elements["vtfRegNum"].value;
                var VTFCompName  =document.forms[0].elements["vtfCompName"].value;
                var finYr1=document.forms[0].elements["finYear1"].value;
                var finYr2=document.forms[0].elements["finYear2"].value; 
                 if((comparWithSysDates(str1))&&(comparWithSysDates(str2))){              
                          window.open("reportJSP/PrintClaimsBasedonStatus.jsp?fromdate="+str1+"&todate="+str2+"&finYr1="+finYr1+"&finYr2="+finYr2+"&claimsStatus="+status+"&VTFRegNo="+VTFRegNo+"&VTFCompName="+VTFCompName,'classPop', "location=1,status=1,scrollbars=1,width=900,height=750,left=100,top=150"); 
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
    
 function showModalWindow(){ 
        var vtfNo;
        var vtfComp;
        var vtfCompVal;
        vtfNo='vtfRegNum';
        vtfComp='vtfCompName';
        vtfCompVal=document.forms[0].vtfCompName.value;
         modalWin=showVTFPopUp(350,300,vtfNo,vtfComp,vtfCompVal,null);
         }
          
    
     function changeStyle(){       
        document.forms[0].elements['finYear2'].className="textboxur5";
    }
   function getVtfdetails()
{
 txtfocus=1;
 var vtf=document.forms[0].vtfRegNum.value;
 if (!(vtf=='')){
 document.forms[0].submit();
 }
} 
    
</script>

    <title>ListOfClmStatus</title>
            <link rel="stylesheet" type="text/css" media="all" href="js/skins/aqua/theme.css" title="Aqua" />
            <script language="javascript" type="text/javascript" src="js/RegisterCategory.js"></script>
            <script type="text/javascript" src="js/calendar_inc.js"></script>
            <script type="text/javascript" src="js/calendar.js"></script>
            <script type="text/javascript" src="js/lang/calendar-en.js"></script>     
  </head>
  <body onload="changeStyle();" onfocus="checkFocus();">
<html:errors/>

<html:form action="/listOfClmStatus.do?methodToCall=getListOfClaimStatus" method="post" >

<html:javascript formName="ListofClaims"/>

   
         <table width="100%" border="0" cellspacing="0" cellpadding="1">
              <tr>
                <td valign="top" class="head_bgcolor">Claims based on Status</td>
              </tr>
              <tr>
                <td valign="top" class="padding5px">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td valign="top"><table border="0" class="details_table" cellspacing="0" cellpadding="0">
                              <tr>
                                <td>Parameters</td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td valign="top"><table class="field_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                    <td><table width="100%" border="0" cellspacing="2" cellpadding="3">
                                    <tr>
                                    <td width="120px;">FinancialYear:<span class="red12">*</span></td>
                                    <td><html:text property="finYear1"
                                                           name="ListOfClaimStatus"
                                                           maxlength="4"
                                                           onkeypress="return isNumeric();"
                                                           style="width:110px;height:14px; font-size:12px;"
                                                           onblur="finYearChk(this,document.forms[0].elements['finYear2']);"/>
                                               <td width="420"><html:text property="finYear2"
                                                           name="ListOfClaimStatus"
                                                           maxlength="4"
                                                           style="width:173px;height:15px;,background-color:#c0c0c0;"
                                                           readonly="true" /></td></td>
                                                            </tr>
                                        <tr><td width="120px;">HRDF Reg No:</td>
                                        <td><html:text property="vtfRegNum"  onblur="getVtfdetails();" name="ListOfClaimStatus"  style="width:110px; height:14px;" maxlength="10"/>
                                            <a href="#" onclick="showModalWindow()"><img src="images/list_img.jpg" border="0"  alt="Select VTFSRegNo" /></a> 
                                            <td>
                                            <html:text property="vtfCompName" name="ListOfClaimStatus" maxlength="50" style="width:170px; height:15px" /></td></td>
                                        </tr>
                                        <tr>
                                        <td width="120px;">Status:</td>
                                        <td><html:select property="claimsStatus"
                                                                         name="ListOfClaimStatus">
                                                                    <html:option value="All"
                                                                        key="1"/>
                                                                    <html:option value="Registered"
                                                                        key="2"/>
                                                                    <html:option value="Data Captured"
                                                                        key="3"/>
                                                                    <html:option value="Confirmed"
                                                                        key="4"/>
                                                                     <html:option value="Verified Training Cost"
                                                                    key="5"/>
                                                                    <html:option value="Validated"
                                                                        key="6"/>
                                                                    <html:option value="Pending" 
                                                                        key="7"/>
                                                                    <html:option value="Approved"
                                                                        key="8"/>
                                                                    <html:option value="Rejected"
                                                                        key="9"/>
                                        </html:select></td>
                                        </tr>
                                        <tr>
                                        <td  width="120px;">From Date:<span class="red12">*</span></td>
                                        <td><html:text property="FDate" name="ListOfClaimStatus" style="width:110px; height:14px;" />
                                            <a><img alt="Calender" align="Center" width="21" height="22" src="images/cal.JPG"  onclick="return showCalendar('FDate','0','%d-%b-%Y',false,false);" class="cursorHand"></img></a>
                                        </td>
                                        </tr>
                                        <tr>
                                        <td  width="120px;">To Date:<span class="red12">*</span></td>
                                        <td><html:text property="TDate"  name="ListOfClaimStatus" style="width:110px; height:14px;" />
                                            <a><img alt="Calender" align="Center" width="21" height="22" src="images/cal.JPG"  onclick="return showCalendar('TDate','0','%d-%b-%Y',false,false);" class="cursorHand"></img></a></td>
                                        </tr>
                                    
                                      
                                                </td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td class="bordertop">
                                      <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                          <tr>
                                            <td class="mandatory">* Mandatory Field</td>
                                            <td>
                                            <div align="center">
                                            <html:hidden property="htxtMode" 
                                                         value=""/>
                                            <html:hidden property="htxDBmode" 
                                                         value=""/>
                                            <html:button  value="Generate" property="btnGenerate" onclick="submitClicked();"/>
                                            <html:button property="btnClear"
                                                           value="Clear" 
                                                           onclick="clearClicked();" />
                                              
                                         
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
                    <td valign="top"
                        class="padding5px">&nbsp;</td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
        </tr>
        </table>

</html:form>
  </body>
</html>
