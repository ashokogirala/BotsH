<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@page language="java" import="java.util.*,com.vtfs.util.VTFSLogger" %>
<%
        java.util.Calendar currentDate =  java.util.Calendar.getInstance();
        java.text.SimpleDateFormat formatter= 
        new java.text.SimpleDateFormat("dd-MMM-yy@HH:mm");
        String dateNow=formatter.format(currentDate.getTime());   
      
        String fromdate=(String)request.getAttribute("Fdate");
        String todate=(String)request.getAttribute("Tdate");
        VTFSLogger.logDebug("from date==>"+fromdate);
        VTFSLogger.logDebug("todate date==>"+todate);
        String username=(String)request.getSession().getAttribute("CUserID");
        if(fromdate==null) fromdate="";
        if(todate==null) todate="";
        if(fromdate==null) dateNow="";
        if(username==null) username="";
        
        ArrayList registerRpt=(ArrayList)request.getAttribute("");
        int registerRptSize;
        
        if(registerRpt==null){
        registerRptSize=0;
        }else{
        registerRptSize=registerRpt.size();
        }
       
        
        %>
          <script type="text/javascript">
    
    //clear click js
    function clearClicked(){
          document.forms[0].elements["htxtmode"].value="CLEAR";
        //document.forms[0].action = document.forms[0].action + "?methodToCall=initSession" ;
       document.forms[0].elements["txtFinStYear"].value="";        
        document.forms[0].elements["txtFinEndYear"].value="";
        document.forms[0].elements["vtfRegNum"].value="";        
        document.forms[0].elements["vtfCompName"].value="";
        
    }
    function submitClicked()
    {
        if (validateRequired(document.forms[0])){
            var vtfRegno  = document.forms[0].elements["vtfRegNum"].value;
            var desc=document.forms[0].elements["vtfCompName"].value;
            var fromyear  = document.forms[0].elements["txtFinStYear"].value;            
            var toyear  =document.forms[0].elements["txtFinEndYear"].value;              
           document.forms[0].elements["htxtmode"].value="Generate";
            window.open("reportJSP/PrintClaimsLevyStatement.jsp?vtfRegno="+vtfRegno+"&desc="+desc+"&fromyear="+fromyear+"&toyear="+toyear,'classPop', "location=1,status=1,scrollbars=1,width=900,height=750,left=100,top=150"); 
           //window.open("reportJSP/PrintClaimsBasedonStatus.jsp?fromdate="+str1+"&todate="+str2+"&finYr1="+finYr1+"&finYr2="+finYr2+"&claimsStatus="+status+"&VTFRegNo="+VTFRegNo+"&VTFCompName="+VTFCompName,'classPop', "location=1,status=1,scrollbars=1,width=900,height=750,left=100,top=150"); 
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
       modalWin=showVTFPopUp(350,300,vtfNo,vtfComp,vtfCompVal,"VAT");
            
    }
  
    function changeStyle(){
     //document.forms[0].elements['vtfCompName'].className="textboxur5";
     document.forms[0].elements['txtFinEndYear'].className="textboxur5";
     
    }
    
    
    
  
    </script>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>RptPrintLevyStatement</title>
    
   <link type="text/css" rel="stylesheet" href="styles/menu.css"/>
    <link type="text/css" rel="stylesheet" href="styles/boto.css"/>
    <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
    <script language="javascript" type="text/javascript" src="js/menu.js"></script>
    <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
  </head>
  
  <body onload="changeStyle();"  onfocus="checkFocus()"><html:errors/>
  <html:form action="/printLevyStatement.do?methodToCall=onRptPrintLevyStatment"
                   method="post" >
 <html:javascript formName="Rptprintlevy" />
         
     
                        <table width="100%" border="0" cellspacing="0"
                               cellpadding="1">
                          <tr>
                            <td valign="top" class="head_bgcolor">
                              <bean:message key="prompt.printlevy.Heading"/>
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
                                              <td>
                                                <bean:message key="prompt.printlevy.Details"/>
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                     <tr>
                          <td valign="top"><table class="field_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td style="height:60px;"><table width="100%" border="0" cellspacing="0" cellpadding="3">
                                      <tr> 
                                        <td>
                                        <table border="0">
                                       <td> <bean:message key="Statement.VTFRegNo"/>:<span class="red12">*</span>   </td>                                    
                                       <td align="left" style="width:400px;padding-left:15px"> <html:text property="vtfRegNum"
                                                   name="printLevyStatement" style="width:90px;hight:14px;"/>
                                        <a href="#" onclick="showModalWindow()">
                                          <img src="images/list_img.jpg"
                                               border="0"
                                               alt="Select VTF Registration No."></img>
                                        </a>
                                        &nbsp;
                                        <html:text property="vtfCompName"
                                                   name="printLevyStatement" style="width:260px; "/>
                                         </td>
                                         </table>
                                         </td>
                                        </tr>   
                                       
                                        <tr>   
                                             <td style="padding-top:10px">
                                                    <bean:message key="Statement.FinYear"/>
                                                    <bean:message key="prompt.Common.LabelSuffix"/>
                                                    <span class="red12">
                                                      <bean:message key="prompt.Common.ManSym"/>
                                                    </span>
                                            <html:text property="txtFinStYear"
                                                       name="printLevyStatement"
                                                       maxlength="4"
                                                        onkeypress="isNumeric();"
                                                       onblur="finYearChk(this,document.forms[0].elements['txtFinEndYear']);"
                                                       style="width:110px; font-size:12px;"
                                                       />
                                            -
                                            <html:text property="txtFinEndYear"
                                                       name="printLevyStatement"
                                                       maxlength="4"
                                                       style="width:110px;background-color:#c0c0c0;"
                                                       readonly="true" />
                                              
                                                    </td>
                                             </tr>     
                                              </table>
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
                                            <div align="right">
                                            <html:hidden property="htxtmode"   value=""/>
                                                <html:button  value="Generate" property="btngenerate" onclick="submitClicked();"/>
                                                <html:button property="btnClear" value="Clear" 
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
                      </table>
                      </td>
                      </tr>
                      </table>
                      
    </html:form>
   
    
    </body>
  
</html>




















