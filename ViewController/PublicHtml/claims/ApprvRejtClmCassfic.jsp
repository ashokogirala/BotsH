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
<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
%>
    

<%@ page import="java.util.ArrayList,com.vtfs.util.VTFSLogger" %>
<%
        java.util.Calendar currentDate =  java.util.Calendar.getInstance();
        java.text.SimpleDateFormat formatter= 
        new java.text.SimpleDateFormat("dd-MMM-yy@HH:mm");
        String dateNow=formatter.format(currentDate.getTime());   
      
        String fromdate=(String)request.getSession().getAttribute("Fdate");
        String todate=(String)request.getSession().getAttribute("Tdate");
        String classdesc=(String)request.getSession().getAttribute("classdesc");
        VTFSLogger.logDebug("from date==>"+fromdate);
        VTFSLogger.logDebug("todate date==>"+todate);
        VTFSLogger.logDebug("classdesc ==>"+classdesc);
        
        String username=(String)request.getSession().getAttribute("CUserID");
        if(fromdate==null) fromdate="";
        if(todate==null) todate="";
        if(fromdate==null) dateNow="";
       if(classdesc==null) classdesc="";
        if(username==null) username="";
        
        ArrayList getClassificList=(ArrayList)request.getAttribute("getClassificList");
        int getClassificListSize;
        
        if(getClassificList==null){
        getClassificListSize=0;
        }else{
        getClassificListSize=getClassificList.size();
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
    
       function clearClicked(){
            document.forms[0].elements["htxtMode"].value="CLEAR";
            document.forms[0].elements["FDate"].value="";
            document.forms[0].elements["TDate"].value="";
            document.forms[0].elements["classfic"].value="";
            document.forms[0].elements["classdesc"].value="";
          }
      function callGenerate(){
         if (validateRequired(document.forms[0])){
            var classCode=document.forms[0].elements["classfic"].value;
            var classDesc=document.forms[0].elements["classdesc"].value;
            var str1  = document.forms[0].elements["FDate"].value;
            var str2  =document.forms[0].elements["TDate"].value;
          if((comparWithSysDates(str1))&&(comparWithSysDates(str2))){
            if(comparDates(str1,str2)){
            window.open("reportJSP/PrintClaimsBasedOnClassificationCode.jsp?classCode1="+classCode+"&classDesc1="+classDesc+"&FDate="+str1+"&TDate="+str2,'classPop', "location=1,status=1,scrollbars=1,width=900,height=750,left=100,top=150"); 
           // document.getElementById("htxtMode").value="Generate";
         //document.forms[0].submit();
        }
        }
        }
        
    }
     function openPOPClass(){
             window.open("ComPopClasifiCode.jsp",'classPop','width=600,height=250');
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
        var codeTxt;
        var descTxt;
        codeTxt='classfic';
        descTxt='classdesc';
            modalWin=showRegClasifiCode(350,315,"A",codeTxt,descTxt);
    } 
    
     function changeStyle(){
        document.forms[0].elements['classdesc'].className="textboxur5";
        
    }
    
</script>
    <title>ApprvRejtClmCassfic</title>
            <link rel="stylesheet" type="text/css" media="all" href="js/skins/aqua/theme.css" title="Aqua" />
            <script language="javascript" type="text/javascript" src="js/RegisterCategory.js"></script>
            <script type="text/javascript" src="js/calendar_inc.js"></script>
            <script type="text/javascript" src="js/calendar.js"></script>
            <script type="text/javascript" src="js/lang/calendar-en.js"></script>    
  </head>
  <body onload="changeStyle();" onfocus="checkFocus();" >
<html:errors/>
<html:form action="/aprvRejctClmRpt.do?methodToCall=getApprvRejctClmClassfic" method="post" >

<html:javascript formName="apprvrejtclm"/>

  <table width="100%" border="0" cellspacing="0" cellpadding="1">
              <tr>
                <td valign="top" class="head_bgcolor">Claims for a Classification</td>
              </tr>
              <tr>
                <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top" class="padding5px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                                      <td style="height:50px;"><table width="100%" border="0" cellspacing="0" cellpadding="3">
                                           <tr>
                                          <td width="21%">Classification Code&nbsp;:<span class="red12">*</span>&nbsp;&nbsp;&nbsp;&nbsp;<html:text property="classfic"  name="aprvRejctClmRpt" maxlength="5" style="width:110px; hight:14px"/>
                                                             <a href="#" onclick="showModalWindow()"><img src="images/list_img.jpg" border="0"/></a></td>  
                                                              <td><html:text property="classdesc" name="aprvRejctClmRpt" maxlength="30" readonly="true" style="background-color:#c0c0c0;width:180px; hight:14px" /></td>
                                              <tr>
                                                  
                                            <td width="42%">From Date&nbsp;:
                                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <html:text property="FDate" name="aprvRejctClmRpt" style="width:110px;hight:14px" />
                                            <a><img alt="pick a date" align="Center" width="20" height="21" src="images/cal.JPG"  onclick="return showCalendar('FDate','0','%d-%b-%Y',false,false);" class="cursorHand"></img></a>
                                          </td>
                                            <td width="58%">To Date&nbsp;:
                                            <html:text property="TDate" name="aprvRejctClmRpt" style="width:110px;hight:14px"/>
                                           <a><img alt="pick a date" align="Center" width="20" height="21" src="images/cal.JPG"  onclick="return showCalendar('TDate','0','%d-%b-%Y',false,false);" class="cursorHand"></img></a>
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
                                            <html:hidden property="htxtMode" 
                                                         value=""/>
                                             <html:button property="generate"  value="Generate" onclick="callGenerate()" />
                                              <html:button property="btnClear"
                                                           value="Clear" 
                                                           onclick="clearClicked();" />
                                              
                                         
                                            </div></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                </table></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table></td>
                  </tr>
            <!--  <tr>
                    <td valign="top" class="padding5px">
                      <%
                         if(getClassificListSize>0)
                         { %>
                         
                   image end    *****************Grid Logo starts *****************              
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                            <tr>
                            <td valign="middle">
                            <table width="10%" border="0" class="details_table" cellspacing="0" cellpadding="0">
                            <tr>
                        
                            </tr>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr> 
                            <td align="right" width="10%" ><img src="images/bota_logo.jpg" /></td>
                            </td>
                            <td align="left" width="50%"
                            style="color:rgb(0,0,0); font-size:medium;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vocational&nbsp;Training&nbsp;Fund&nbsp;System&nbsp;(VTFS)</b></td>
                            <td>
                            <div align="left">
                            <p>
                            </p><p>
                            </p><p>
                             Printed on:&nbsp;<%=dateNow%></p>
                            <p> Printed&nbsp;by:           <%=username%>
                            </p>
                            </div>       
                            </td>
                            
                            </table>
                            <tr>
                            <td align="left"
                            style="font-size:small; color:rgb(0,0,0);"
                            width="84%">
                            <div align="left"> <u>
                            <h5 align="center">
                            </h5></u>
                            </div>
                            </td>
                            </tr>
                            <tr>
                            <td align="left" colspan="2" height="20" width="50%">
                            Classification&nbsp;:&nbsp;<%=classdesc%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From Date&nbsp;:&nbsp;<%=fromdate%>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To Date&nbsp;:&nbsp;<%=todate%>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            </tr>    
                            </table>
                    *****************Grid Logo ends *****************
                          
                    
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td valign="top">
                                   
                    Approved Grid Started
                    
                    
                       
                        <display:table  name="${getClassificList}" class="dataTable" requestURI="/aprvRejctClmRpt.do" defaultsort="1" export="true" id="clmRow"   pagesize="5">
                           <display:caption title="basedonclassific">Claims Based on ClassificationCode</display:caption>
                            <display:column  title="&nbsp;Claim RefNo."  property="claimRefNo" sortable="true"/>
                            <display:column  title="&nbsp;Tilte"  property="title" sortable="true"/>
                            <display:column  title="&nbsp;HRDF Reg No"  property="vtfRegNo" sortable="true"/>
                            <display:column title="&nbsp;Date Of Claim"  property="dateOfClm" sortable="true"/>
                            <display:column  title="&nbsp;Claim Amount"  property="claimAmt" sortable="true"/>
                            <display:column  title="&nbsp;Max Claimable Amount"  property="grantClmAmt" sortable="true"/>
                            <display:column  title="&nbsp;Claim Status" group="10" sortable="true" property="clmStatus"/>
                            
                                            <display:setProperty name="export.csv" value="false" />
                                            <display:setProperty name="export.xml" value="false" />
                                            <display:setProperty name="export.pdf" value="true" />
                                            <display:setProperty name="export.decorated" value="true"></display:setProperty>
                            
                         <display:setProperty name="paging.banner.placement" value="bottom"  /> 
                                                 <display:setProperty name="paging.banner.full">
                                                                        <span class="pagelinks"><a href="{1}"><img src="images/back_last.jpg" border="0" /></a><a href="{2}"><img src="images/back_btn.jpg" border="0" /></a><a href="{3}"><img src="images/next_btn.jpg" border="0" /></a><a
                                                                        href="{4}"><img src="images/next_last.jpg" border="0" /></a></span>
                                                                        </display:setProperty>                                                                        
                                                                        <display:setProperty name="paging.banner.first">
                                                                        <span class="pagelinks"><img src="images/back_last.jpg" border="0" /><img src="images/back_btn.jpg" border="0" /><a
                                                                        href="{3}"><img src="images/next_btn.jpg" border="0" /></a><a href="{4}"><img src="images/next_last.jpg" border="0" /></a>
                                                                        </span>
                                                                        </display:setProperty>                                                                        
                                                                        <display:setProperty name="paging.banner.last">
                                                                        <span class="pagelinks"><a
                                                                        href="{1}"><img src="images/back_last.jpg" border="0" /></a><a href="{2}"><img src="images/back_btn.jpg" border="0" /></a><img src="images/next_btn.jpg" border="0" /><img src="images/next_last.jpg" border="0" /> </span>
                                                                        </display:setProperty>
                  </display:table>
                
                             Approved Grid Ending
                                
                            <%   }else{
                    if(generateFlag.equalsIgnoreCase("GENERATE")){
                    %>
                   No Record Found
                   
                  <%} }%>
                          <div id="leftMenu">        
                             </div>
                          </td>
                          </tr>  -->
                  <tr>
                    <td valign="top"
                        class="padding5px">&nbsp;</td>
                  </tr>
                </table>
            

</html:form>
  </body>
</html>